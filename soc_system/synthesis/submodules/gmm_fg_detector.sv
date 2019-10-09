/*
	-------------------------------------------------------------------------------------
	The MIT License.
	Copyright © 2019 Andrei Kalshchikov /KalshchikovAA@gmail.com/.
	National Research University "Moscow Power Engineering Institute"
	
	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in
	all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	THE SOFTWARE.
	-------------------------------------------------------------------------------------
	
	This module receives video sequence from camera and processes one by GaussianMixtureModel (GMM) algorithm to determine which pixel is foregroung (FG) or background (BG).
	
	Interfaces:
	Input_1: Avalon-ST "snk_video", video sequence from camera.
	Input_2: Avalon-ST "snk_mem", video sequence of GMM data from memory.
	Output_1: Avalon-ST "src_video", result from GMM algorithm and also foreground and background video streams.
	Output_2: Avalon-ST "src_mem", updated sequence of GMM data to memory.
*/

// memory buffer must be cleared to zero before work 
// gaussian_mixture_model_foreground_detector
module gmm_fg_detector( 
	// **************** Clocks & Resets Wires ****************
	input clk, rst,
	
	// **************** CPU Avalon-MM ****************
	input cpu_write, cpu_read, cpu_cs,
	input[3:0] cpu_addr,
	input[31:0] cpu_writedata,
	output logic[31:0] cpu_readdata,

	// **************** Input Avalon-ST ****************
	input snk_video_valid, snk_video_sop, snk_video_eop,
	input[23:0] snk_video_data,
	output logic snk_video_ready,
	
	input snk_mem_valid, snk_mem_sop, snk_mem_eop,
	input[127:0] snk_mem_data,
	input[3:0] snk_mem_empty,
	output logic snk_mem_ready,
	
	// **************** Output Avalon-ST ****************
	input src_video_ready,
	output logic src_video_valid, src_video_sop, src_video_eop,
	output logic[48:0] src_video_data,
	
	input src_mem_ready,
	output logic src_mem_valid, src_mem_sop, src_mem_eop,
	output logic[127:0] src_mem_data,
	output logic[3:0] src_mem_empty
);
	// **************** User types ****************
	typedef enum logic[1:0] {IDLE, CONTROL, VIDEO} packet_t;

	// RGB888 data format
	typedef struct packed {
		logic[7:0] r, g, b;
	} rgb888_t;

	// Output data format
	typedef struct packed {
		logic is_fg; // It indices 1, if the new_pixel is foreground and 0 otherwise
		rgb888_t mem_pixel; // It's the a pixel from "mem" sequence
		rgb888_t new_pixel; // It's a pixel from "video" sequence
	} out_t;

	// Control status register map
	typedef struct {
		logic[7:0] d, bg_th, s;
		logic[9:0] alpha;
	} csr_t;

	// Cluster data format, 
	typedef struct packed {
		logic[5:0] rgb_std; // Standart deviation of color's distribution
		logic[7:0] w; // Distribution's weight
		rgb888_t rgb_mean; // Mean color
	} cluster_t;

	// Memory data format
	typedef struct packed {
		logic[1:0] clusters_num; // 2 bits
		logic[5:0] chm; // A number of times when the pixel was foreground
		logic[5:0] u; // A number of times when the pixel was previously distribution
		cluster_t[2:0] cluster; // 96 bits
	} mem_t;

	typedef struct packed {
		packet_t packet;
		logic[15:0] width, height;
	} cmd_t;

	typedef struct {
		logic sop, eop, valid, ready;
		rgb888_t data;
	} video_bus_t;

	typedef struct {
		logic sop, eop, valid, ready;
		mem_t data;
	} mem_bus_t;

	typedef struct {
		logic valid, ready;
		cmd_t data;
	} cmd_bus_t;

	// **************** HLS Structures ****************
	typedef struct packed {
		logic [7:0] data;
	} class_ac_int_3;

	typedef struct packed {
		logic [7:0] data;
	} class_ac_int_6;

	typedef struct packed {
		rgb888_t  data;
	} struct_rgb_t;

	typedef struct packed {
		logic [7:0] data;
	} class_ac_int_9;

	typedef struct packed {
		logic[7:0] w;
		logic[7:0] rgb_std;
		rgb888_t rgb_mean;
	} struct_cluster_t;

	typedef struct packed {
		class_ac_int_9  is_fg;
		struct_rgb_t  rgb_new;
		struct_cluster_t [2:0]  cluster;
		class_ac_int_6  u;
		class_ac_int_6  chm;
		class_ac_int_3  clusters_num;
	} struct_data_t;

	typedef struct {
		logic valid, sop, eop, ready;
		struct_data_t data;
	} gmm_bus_t;

	// **************** Global variables ****************
	packet_t reader_state, reader_next;
	packet_t writer_state, writer_next;

	
	video_bus_t in_control, out_control, in_video;
	mem_bus_t in_mem;
	cmd_bus_t in_cmd, out_cmd;
	gmm_bus_t in_gmm, out_gmm;

	out_t out_video_data;
	mem_t out_mem_data;

	// CSR
	csr_t CSR;

	// writer
	logic writer_is_video_sop = '1;
	logic[15:0] writer_width_save;
	logic[15:0] writer_width_cnt, writer_height_cnt;

	logic is_mem_control_gen;
	logic[15:0] mem_h, mem_w;

	logic is_first_packet = '1;
	logic[1:0] video_stop;

	logic[15:0] width, height;
	logic[2:0] control_cnt;

	// **************** Register Map ****************
	always_ff @(posedge clk or posedge rst)
		if (rst) begin
			CSR.d <= 8'd9;
			CSR.bg_th <= 8'd178; // 0.7
			CSR.s <= 8'd2;
			CSR.alpha <= 10'd3;
		end
		else begin
			if (cpu_write && cpu_cs) begin
				case (cpu_addr)
				4'd0: {CSR.d, CSR.bg_th, CSR.s} <= cpu_writedata[23:0];
				4'd1: CSR.alpha <= cpu_writedata[9:0];
				endcase
			end
		end
	
	always_comb begin
		if (cpu_read && cpu_cs)
			case (cpu_addr)
			4'd0: cpu_readdata = {8'd0, CSR.d, CSR.bg_th, CSR.s};
			4'd1: cpu_readdata = {22'd0, CSR.alpha};
			default: cpu_readdata = 'z;
			endcase
		else
			cpu_readdata = 'z;
	end

	// **************** Main logics ****************
	always_ff @(posedge clk or posedge rst)
		if (rst)
			is_first_packet <= '1;
		else if (in_gmm.eop && in_gmm.valid && in_gmm.ready)
			is_first_packet <= '0;

	// **************** Descriptors logics ****************
	always_ff @(posedge clk or posedge rst)
		if (rst)
			control_cnt <= '0;
		else begin
			if (snk_video_valid && snk_video_ready && (CONTROL == reader_next)) begin
				if (snk_video_sop)
					control_cnt <= 3'd1;
				else if (control_cnt < 3'd7)
					control_cnt <= control_cnt + 3'd1;
				
				case(control_cnt)
				3'd1: begin
					width[15:12] <= snk_video_data[3:0];
					width[11:8] <= snk_video_data[11:8];
					width[7:4] <= snk_video_data[19:16];
				end
				3'd2: begin
					width[3:0] <= snk_video_data[3:0];
					height[15:12] <= snk_video_data[11:8];
					height[11:8] <= snk_video_data[19:16];
				end
				3'd3: begin
					height[7:4] <= snk_video_data[3:0];
					height[3:0] <= snk_video_data[11:8];
				end
				endcase
			end
		end

	always_ff @(posedge clk or posedge rst)
		if (rst) begin
			in_cmd.valid <= '0;
			in_cmd.data.packet <= IDLE;
		end
		else begin
			if (snk_video_sop && snk_video_valid && snk_video_ready && ((CONTROL == reader_next) || (VIDEO == reader_next)))
				in_cmd.valid <= '1;
			else if (in_cmd.ready)
				in_cmd.valid <= '0;

			if (VIDEO == reader_next) begin
				if (snk_video_sop && snk_video_valid && snk_video_ready) begin
					in_cmd.data.packet <= reader_next;
					in_cmd.data.width <= width;
					in_cmd.data.height <= height;
				end
			end
			else if (CONTROL == reader_next) begin
				if (snk_video_sop && snk_video_valid && snk_video_ready) begin
					in_cmd.data.packet <= reader_next;
					in_cmd.data.width <= '0;
					in_cmd.data.height <= '0;
				end	
			end
		end

	// **************** Reader FSM ****************
	always_comb begin
		reader_next = IDLE;
		case (reader_state)
		IDLE:
			if (snk_video_sop && snk_video_valid && snk_video_ready && (4'hF == snk_video_data[3:0]))
				reader_next = CONTROL;
			else if (snk_video_sop && snk_video_valid && snk_video_ready && (4'h0 == snk_video_data[3:0]))
				reader_next = VIDEO;
			else
				reader_next = IDLE;
		CONTROL:
			if (in_control.eop && in_control.valid && in_control.ready)
				reader_next = IDLE;
			else
				reader_next = CONTROL;
		VIDEO:
			if (in_gmm.eop && in_gmm.valid && in_gmm.ready)
				reader_next = IDLE;
			else
				reader_next = VIDEO;
		default: reader_next = IDLE;
		endcase
	end

	always_ff @(posedge clk or posedge rst)
		if (rst)
			reader_state <= IDLE;
		else
			reader_state <= reader_next;

	always_comb begin
		in_video.ready = in_cmd.ready;
		in_mem.ready = '0; 

		case (reader_state)
		IDLE: begin
			in_video.ready = in_cmd.ready;
			in_mem.ready = '0;
		end
		CONTROL: begin
			in_video.ready = in_cmd.ready & (in_control.ready | ~in_control.valid);
			in_mem.ready = '0;
		end
		VIDEO: begin
			in_video.ready = in_cmd.ready & ((in_gmm.ready & in_video.valid & (in_mem.valid | is_first_packet)) | (~in_gmm.ready & ~in_video.valid & ~(in_mem.valid | is_first_packet)));
			in_mem.ready = in_cmd.ready & (((in_gmm.ready & in_video.valid & (in_mem.valid | is_first_packet)) | (~in_gmm.ready & ~in_video.valid & ~(in_mem.valid | is_first_packet))) | is_first_packet);
		end
		default: begin
			in_video.ready = in_cmd.ready;
			in_mem.ready = '0;
		end
		endcase
	end

	always_ff @(posedge clk or posedge rst)
		if (rst) begin
			in_control.valid <= '0;
			in_control.sop <= '0;
			in_control.eop <= '0;
			in_control.data <= '0;

			in_gmm.valid <= '0;
			in_gmm.data <= '0;
		end
		else begin
			if (in_control.ready)
				in_control.valid <= '0;
			if (in_gmm.ready)
				in_gmm.valid <= '0;

			case (reader_state)
			CONTROL: begin
				if (in_video.valid)
					in_control.valid <= '1;
				else if (in_control.ready)
					in_control.valid <= '0;

				if (in_video.valid && in_video.ready) begin
					in_control.sop <= in_video.sop;
					in_control.eop <= in_video.eop;
					in_control.data <= in_video.data;
				end
			end
			VIDEO: begin
				if (!in_video.sop && in_video.valid && (in_mem.valid | is_first_packet) && in_video.ready && in_mem.ready)
					in_gmm.valid <= '1;
				else if (in_gmm.ready)
					in_gmm.valid <= '0;
				
				if (in_video.valid && (in_mem.valid | is_first_packet) && in_video.ready && in_mem.ready) begin
					in_gmm.sop <= in_video.sop;
					in_gmm.eop <= in_video.eop;
					in_gmm.data <= gmm_data_set(in_video.data, in_mem.data, is_first_packet);
				end
			end
			default: begin
				if (in_control.ready)
					in_control.valid <= '0;
				if (in_gmm.ready)
					in_gmm.valid <= '0;
			end
			endcase
		end

	// **************** Writer FSM ****************
	always_comb begin
		writer_next = IDLE;
		case (writer_state)
		IDLE:
			if (out_cmd.valid && out_cmd.ready) begin
				if (CONTROL == out_cmd.data.packet)
					writer_next = CONTROL;
				else if (VIDEO == out_cmd.data.packet)
					writer_next = VIDEO;
				else
					writer_next = IDLE;
			end
			else 
				writer_next = IDLE;
		CONTROL:
			if (src_video_eop && src_video_valid && src_video_ready)
				writer_next = IDLE;
			else 
				writer_next = CONTROL;
		VIDEO:
			if (2'b11 == video_stop)
				writer_next = IDLE;
			else 
				writer_next = VIDEO;
		default: writer_next = IDLE;
		endcase
	end

	always_ff @(posedge clk or posedge rst)
		if (rst)
			writer_state <= IDLE;
		else 
			writer_state <= writer_next;

	always_comb begin
		out_control.ready = '0;
		out_gmm.ready = '0;
		out_cmd.ready = '0;

		case (writer_state)
		IDLE: begin
			out_control.ready = '0;
			out_gmm.ready = '0;
			out_cmd.ready = '1;
		end
		CONTROL: begin
			out_control.ready = src_video_ready | ~src_video_valid;
			out_gmm.ready = '0;
			out_cmd.ready = '0;
		end
		VIDEO: begin
			out_control.ready = '0;
			out_gmm.ready = ~is_mem_control_gen & ~writer_is_video_sop & (src_video_ready & src_mem_ready) & (((16'd0 != writer_height_cnt) || (16'd0 != writer_width_cnt)));
			out_cmd.ready = '0;
		end
		default: begin
			out_control.ready = '0;
			out_gmm.ready = '0;
			out_cmd.ready = '0;
		end
		endcase
	end

	assign src_video_data = out_video_data;
	assign src_mem_data = out_mem_data;
	assign src_mem_empty = '0;
	assign {out_gmm.sop, out_gmm.eop} = 2'b0;

	always_ff @(posedge clk or posedge rst)
		if (rst) begin
			src_video_valid <= '0;
			src_video_sop <= '0;
			src_video_eop <= '0;
			out_video_data <= '0;

			src_mem_valid <= '0;
			src_mem_sop <= '0;
			src_mem_eop <= '0;
			
			writer_height_cnt <= '0;
			writer_width_cnt <= '0;
			writer_width_save <= '0;
			
			writer_is_video_sop <= '1;
			out_mem_data <= '0;

			video_stop <= '0;

			is_mem_control_gen <= '0;
			mem_h <= '0;
			mem_w <= '0;
		end
		else begin
			if (src_video_ready) begin
				src_video_valid <= '0;
				src_video_sop <= '0;
				src_video_eop <= '0;
			end
			if (src_mem_ready) begin
				src_mem_valid <= '0;
				src_mem_sop <= '0;
				src_mem_eop <= '0;
			end

			if (out_cmd.valid && out_cmd.ready && (VIDEO == out_cmd.data.packet)) begin
				writer_height_cnt <= (out_cmd.data.height > 16'd0) ? out_cmd.data.height-16'd1 : '0 ;
				writer_width_cnt <= out_cmd.data.width;
				writer_width_save <= out_cmd.data.width;
				writer_is_video_sop <= '1;

				is_mem_control_gen <= '1;
				mem_h <= out_cmd.data.height;
				mem_w <= out_cmd.data.width;

				video_stop <= '0;
			end

			case (writer_state)
			CONTROL: begin
				if (out_control.valid)
					src_video_valid <= '1;
				else if (src_video_ready)
					src_video_valid <= '0;

				if (out_control.valid && out_control.ready) begin
					src_video_sop <= out_control.sop;
					src_video_eop <= out_control.eop;
					out_video_data.new_pixel <= out_control.data;
					out_video_data.mem_pixel <= '0;
					out_video_data.is_fg <= '0;
				end
			end
			VIDEO: begin
				if (is_mem_control_gen) begin
					src_mem_valid <= '1;

					if (src_mem_sop && src_mem_valid && src_mem_ready) begin
						out_mem_data <= {56'b0, 4'b0, 4'h3, 4'b0, mem_h[3:0], 4'b0, mem_h[7:4], 4'b0, mem_h[11:8], 4'b0, mem_h[15:12], 4'b0, mem_w[3:0], 4'b0, mem_w[7:4], 4'b0, mem_w[11:8], 4'b0, mem_w[15:12]};
						src_mem_eop <= '1;
						is_mem_control_gen <= '0;
					end
					else begin
						src_mem_sop <= '1;
						out_mem_data <= {124'b0, 4'hF};
					end
				end
				else if (writer_is_video_sop) begin
					if (src_video_ready && src_mem_ready) begin
						src_video_valid <= '1;
						src_video_sop <= '1;
						src_video_eop <= '0;
						out_video_data <= '0;

						src_mem_valid <= '1;
						src_mem_sop <= '1;
						src_mem_eop <= '0;
						out_mem_data <= '0;

						writer_is_video_sop <= '0;
					end
				end
				else begin
					if (src_video_eop && src_video_valid && src_video_ready)
						video_stop[0] <= '1;
					if (src_mem_eop && src_mem_valid && src_mem_ready)
						video_stop[1] <= '1;

					if (out_gmm.valid & out_gmm.ready) begin
						src_video_valid <= '1;
						src_mem_valid <= '1;
					end
					else begin
						if (src_video_ready)
							src_video_valid <= '0;
						if (src_mem_ready)
							src_mem_valid <= '0;
					end

					if (out_gmm.valid && out_gmm.ready) begin
						if (writer_width_cnt > 16'd0)
							writer_width_cnt <= writer_width_cnt - 16'd1;
						else begin
							if (writer_height_cnt > 16'd0) begin
								writer_width_cnt <= writer_width_save - 16'd1;
								writer_height_cnt <= writer_height_cnt - 16'd1;
							end
						end

						src_video_sop <= '0;
						src_mem_sop <= '0;
						if ((16'd0 == writer_height_cnt) && (16'd1 == writer_width_cnt)) begin
							src_video_eop <= '1;
							src_mem_eop <= '1;
						end

						out_video_data.new_pixel <= out_gmm.data.rgb_new;
						out_video_data.mem_pixel <= out_gmm.data.cluster[0].rgb_mean;
						out_video_data.is_fg <= out_gmm.data.is_fg;

						out_mem_data <= mem_data_get(out_gmm.data);
					end
				end
			end
			default: begin
					src_video_valid <= '0;
					src_mem_valid <= '0;
			end
			endcase
		end

	// **************** Functions ****************
	function mem_t mem_data_get(struct_data_t in);
		mem_data_get.clusters_num = in.clusters_num.data[1:0];
		mem_data_get.chm = in.chm.data[5:0];
		mem_data_get.u = in.u.data[5:0];
		for (int i = 0; i < 3; ++i) begin
			mem_data_get.cluster[i].w = in.cluster[i].w;
			mem_data_get.cluster[i].rgb_mean = in.cluster[i].rgb_mean;
			mem_data_get.cluster[i].rgb_std = in.cluster[i].rgb_std[5:0];
		end
	endfunction : mem_data_get

	function struct_data_t gmm_data_set(rgb888_t rgb_new, mem_t mem, logic is_first_packet);
		gmm_data_set.is_fg = '0;
		gmm_data_set.rgb_new = rgb_new;
		if ((1'b1 == is_first_packet) || (2'd0 == mem.clusters_num)) begin
			gmm_data_set.u = '0;
			gmm_data_set.chm = '0;
			gmm_data_set.clusters_num = 8'd1;
			for (int i = 0; i < 3; ++i) begin
				gmm_data_set.cluster[i].w = 8'd3;
				gmm_data_set.cluster[i].rgb_std = 8'd17;
				gmm_data_set.cluster[i].rgb_mean = rgb_new;
			end
		end
		else begin
			gmm_data_set.u = {2'd0, mem.u};
			gmm_data_set.chm = {2'd0, mem.chm};
			gmm_data_set.clusters_num = {6'd0, mem.clusters_num};
			for (int i = 0; i < 3; ++i) begin
				gmm_data_set.cluster[i].w = mem.cluster[i].w;
				gmm_data_set.cluster[i].rgb_std = {2'd0, mem.cluster[i].rgb_std};
				gmm_data_set.cluster[i].rgb_mean = mem.cluster[i].rgb_mean;
			end
		end
	endfunction : gmm_data_set

	// **************** Modules ****************
	gmm_substract_internal gmm_substract_inst (
		// Interface: clock (clock end)
		.clock    (clk), // 1-bit clk input
		// Interface: reset (reset end)
		.resetn   (~rst), // 1-bit reset_n input
		// Interface: snk (avalon_streaming sink)
		.snk_data (in_gmm.data), // 176-bit data input
		.snk_ready(in_gmm.ready), // 1-bit ready output
		.snk_valid(in_gmm.valid), // 1-bit valid input
		// Interface: src (avalon_streaming source)
		.src_data (out_gmm.data), // 176-bit data output
		.src_ready(out_gmm.ready), // 1-bit ready input
		.src_valid(out_gmm.valid), // 1-bit valid output
		// Interface: d (conduit sink)
		.d        (CSR.d), // 8-bit data input
		// Interface: bg_th (conduit sink)
		.bg_th    (CSR.bg_th), // 8-bit data input
		// Interface: in_alpha (conduit sink)
		.in_alpha (CSR.alpha), // 10-bit data input
		// Interface: s (conduit sink)
		.s        (CSR.s)  // 8-bit data input
	);

	video_pipeline video_pipeline_inst (
		.*, 
		.src_ready(in_video.ready),
		.src_valid(in_video.valid), .src_sop(in_video.sop), .src_eop(in_video.eop),
		.src_data(in_video.data)
	);

	mem_control_cutoff mem_control_cutoff_inst(
		.*,
		.en(~is_first_packet),
		.src_ready(in_mem.ready),
		.src_valid(in_mem.valid), .src_sop(in_mem.sop), .src_eop(in_mem.eop),
		.src_data(in_mem.data)
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     ($bits(in_control.data)),
		.FIFO_DEPTH          (64),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (3),
		.USE_MEMORY_BLOCKS   (1),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) control_fifo (
		.clk               (clk),                              //       clk.clk
		.reset             (rst),                            // clk_reset.reset
		.in_data           (in_control.data),                             //        in.data
		.in_valid          (in_control.valid),                            //          .valid
		.in_ready          (in_control.ready),                            //          .ready
		.in_startofpacket  (in_control.sop),                    //          .startofpacket
		.in_endofpacket    (in_control.eop),                      //          .endofpacket
		.out_data          (out_control.data),                             //       out.data
		.out_valid         (out_control.valid),                            //          .valid
		.out_ready         (out_control.ready),                            //          .ready
		.out_startofpacket (out_control.sop),                    //          .startofpacket
		.out_endofpacket   (out_control.eop),                      //          .endofpacket
		.csr_address       (2'b00),                                // (terminated)
		.csr_read          (1'b0),                                 // (terminated)
		.csr_write         (1'b0),                                 // (terminated)
		.csr_readdata      (),                                     // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000), // (terminated)
		.almost_full_data  (),                                     // (terminated)
		.almost_empty_data (),                                     // (terminated)
		.in_empty          (1'b0),                                 // (terminated)
		.out_empty         (),                                     // (terminated)
		.in_error          (1'b0),                                 // (terminated)
		.out_error         (),                                     // (terminated)
		.in_channel        (1'b0),                                 // (terminated)
		.out_channel       ()                                      // (terminated)
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     ($bits(in_cmd.data)),
		.FIFO_DEPTH          (32),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (0),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (3),
		.USE_MEMORY_BLOCKS   (1),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) cmd_fifo (
		.clk               (clk),                              //       clk.clk
		.reset             (rst),                            // clk_reset.reset
		.in_data           (in_cmd.data),                             //        in.data
		.in_valid          (in_cmd.valid),                            //          .valid
		.in_ready          (in_cmd.ready),                            //          .ready
		.in_startofpacket  (),                    //          .startofpacket
		.in_endofpacket    (),                      //          .endofpacket
		.out_data          (out_cmd.data),                             //       out.data
		.out_valid         (out_cmd.valid),                            //          .valid
		.out_ready         (out_cmd.ready),                            //          .ready
		.out_startofpacket (),                    //          .startofpacket
		.out_endofpacket   (),                      //          .endofpacket
		.csr_address       (2'b00),                                // (terminated)
		.csr_read          (1'b0),                                 // (terminated)
		.csr_write         (1'b0),                                 // (terminated)
		.csr_readdata      (),                                     // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000), // (terminated)
		.almost_full_data  (),                                     // (terminated)
		.almost_empty_data (),                                     // (terminated)
		.in_empty          (1'b0),                                 // (terminated)
		.out_empty         (),                                     // (terminated)
		.in_error          (1'b0),                                 // (terminated)
		.out_error         (),                                     // (terminated)
		.in_channel        (1'b0),                                 // (terminated)
		.out_channel       ()                                      // (terminated)
	);

endmodule : gmm_fg_detector

module video_pipeline (
	input clk, rst,

	input snk_video_valid, snk_video_sop, snk_video_eop,
	input[23:0] snk_video_data,
	output logic snk_video_ready,

	input src_ready,
	output logic src_valid, src_sop, src_eop,
	output logic[23:0] src_data
);
	assign snk_video_ready = src_ready | ~src_valid;

	always_ff @(posedge clk or posedge rst)
		if (rst) begin
			src_valid <= '0;
			src_sop <= '0;
			src_eop <= '0;
			src_data <= '0;
		end
		else begin
			if (snk_video_valid)
				src_valid <= '1;
			else if (src_ready)
				src_valid <= '0;

			if (snk_video_valid && snk_video_ready) begin
				src_sop <= snk_video_sop;
				src_eop <= snk_video_eop;
				src_data <= snk_video_data;
			end
		end
endmodule : video_pipeline

module mem_control_cutoff(
    input clk, rst, en,

    input snk_mem_valid, snk_mem_sop, snk_mem_eop,
    input[127:0] snk_mem_data,
    output logic snk_mem_ready,

    input src_ready,
    output logic src_valid, src_sop, src_eop,
    output logic[127:0] src_data
);
    typedef enum logic[1:0] {IDLE, VIDEO} state_t;
    state_t state, next;
	logic in_valid;

    always_comb begin
        next = IDLE;
        case (state) 
        IDLE:
            if (snk_mem_sop && snk_mem_valid && snk_mem_ready && ('0 == snk_mem_data[3:0]))
                next = VIDEO;
            else
                next = IDLE;
        VIDEO: 
			if (src_eop && src_valid && src_ready)
            	next = IDLE;
			else
				next = VIDEO;
        default: next = IDLE;
        endcase
    end

    always_ff @(posedge clk or posedge rst)
        if (rst)
            state <= IDLE;
        else
            state <= next;

    assign snk_mem_ready = en & (src_ready | ~src_valid);
	assign in_valid = en & snk_mem_valid;

    always_ff @(posedge clk or posedge rst)
        if (rst) begin
            src_valid <= '0;
            src_sop <= '0;
            src_eop <= '0;
        end
        else begin
			if (src_ready) begin
				src_eop <= '0;
				src_sop <= '0;
			end

            if (in_valid && (VIDEO == next))
                src_valid <= '1;
            else if (src_ready) 
                src_valid <= '0;
            
            if (in_valid && snk_mem_ready) begin
                src_sop <= snk_mem_sop;
                src_eop <= snk_mem_eop;
                src_data <= snk_mem_data;
            end
        end
endmodule