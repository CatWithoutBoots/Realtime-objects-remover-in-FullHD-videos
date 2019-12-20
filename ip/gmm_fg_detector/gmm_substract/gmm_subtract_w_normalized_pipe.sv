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
*/
`ifndef _GMM_SUBTRACT_W_NORMALIZED_PIPE_SV_
`define _GMM_SUBTRACT_W_NORMALIZED_PIPE_SV_

`include "gmm_structures.svh"

import gmm_structures::*;

/*
The precence of signal 
typedef struct packed {
	Type                 | Name        | In  | Out |
	---------------------|-------------|-----|-----|
	data_t               | in          | old | old |
	logic[2:0][15:0]     | mem_var     | old | new |
	logic[2:0][7:0]      | mem_w       | old | new |
	logic[2:0][2:0][7:0] | mem_color   | old | old |
	logic[2:0][19:0]     | vars        | old | old |
	logic[2:0][18:0]     | w_sum       | old | new |
	logic[2:0][18:0]     | c_sum       | old | old |
	logic[2:0][18:0]     | v_sum       | old | old |
	logic[2:0][18:0]     | w0          | old | old |
	logic[19:0]          | var_min     | old | old |
	logic[19:0]          | var_max     | old | old |
	logic[1:0]           | var_min_idx | old | old |
	logic[1:0]           | var_max_idx | old | old |
	logic                | is_matched  | old | old |
	logic[31:0]          | p_max_idx   | x   | x   |
	logic[31:0]          | B           | x   | x   |
} mega_data_t;
*/
module gmm_subtract_w_normalized_pipe #(
    DATA_WIDTH = 153
)(
    input clk, rst,

    input snk_valid,
    input mega_data_t snk_data,
    output logic snk_ready,

    input src_ready,
    output logic src_valid,
    output mega_data_t src_data
);  
    logic[2:0][16:0] w_new, w_new2;
	logic[15:0] w_sum, w_sum2;

	logic step_1_valid, step_1_ready;
	logic step_2_valid, step_2_ready;
	logic step_3_valid, step_3_ready;

	mega_data_t data, data2, data3;

    assign snk_ready = step_1_ready | ~step_1_valid;
	assign step_1_ready = step_2_ready | ~step_2_valid;
	//assign step_2_ready = step_3_ready | ~step_3_valid;
	assign step_3_ready = src_ready | ~src_valid;
	
	// **************** Stage 1 ****************	
    // Pipeline
	always_ff @(posedge clk or posedge rst)
		if (rst) begin
			step_1_valid <= '0;
			w_sum <= '0;

			data.in <= '0;
			data.var_min <= '0;
			data.var_max <= '0;
			data.var_min_idx <= '0;
			data.var_max_idx <= '0;
			data.is_matched <= '0;
			data.B <= '0;
			data.p_max_idx <= '0;

			data.mem_color <= '0;
			data.vars <= '0;
		end
		else begin
			if (snk_valid)
				step_1_valid <= '1;
			else if (step_1_ready)
				step_1_valid <= '0;
			
			if (snk_valid && snk_ready) begin
				data.in <= snk_data.in;
				data.mem_color <= snk_data.mem_color;
				data.vars <= snk_data.vars;
				w_sum <= w_sum_get(snk_data.mem_w, snk_data.in.clusters_num);
			end
		end
	
	// Calculation
	genvar k;
	generate
		for (k = 0; k < 3; ++k) begin : k_idx
			always_ff @(posedge clk or posedge rst) 
				if (rst) begin
					data.mem_var[k] <= '0;
                    data.mem_w[k] <= '0;
				end
				else if (snk_valid && snk_ready) begin
					if (k < snk_data.in.clusters_num) begin
						if ('0 == snk_data.mem_var[k]) 
							data.mem_var[k] <= 16'd1;
						else
							data.mem_var[k] <= snk_data.mem_var[k];

						if ('0 == snk_data.mem_w[k])
							data.mem_w[k] <= 8'd1;
						else
							data.mem_w[k] <= snk_data.mem_w[k];			
					end
					else begin
						data.mem_var[k] <= snk_data.mem_var[k];
						data.mem_w[k] <= snk_data.mem_w[k];
					end
				end
		end : k_idx
	endgenerate

	// **************** Stage 2 ****************
	always_ff @(posedge clk or posedge rst)
		if (rst) begin
			step_2_valid <= '0;
			data2 <= '0;
			w_sum2 <= '0;
		end
		else begin
			if (step_1_valid)
				step_2_valid <= '1;
			else if (step_2_ready)
				step_2_valid <= '0;

			if (step_1_valid && step_1_ready) begin
				data2 <= data;
				w_sum2 <= w_sum;
			end
		end
	
	// Calculation
    generate
		for (k = 0; k < 3; ++k) begin : k_idx2
			always_ff @(posedge clk or posedge rst) 
				if (rst)
					w_new[k] <= '0;
				else if (step_1_valid && step_1_ready)
					w_new[k] <= (17'd510 * data.mem_w[k]);
		end : k_idx2
	endgenerate

	// **************** Stage 3 ****************
	/*always_ff @(posedge clk or posedge rst)
		if (rst) begin
			step_3_valid <= '0;
			data3 <= '0;
		end
		else begin
			if (step_2_valid)
				step_3_valid <= '1;
			else if (step_3_ready)
				step_3_valid <= '0;

			if (step_2_valid && step_2_ready)
				data3 <= data2;
		end
	
	// Calculation
    generate
		for (k = 0; k < 3; ++k) begin : k_idx3
			always_ff @(posedge clk or posedge rst) 
				if (rst)
					w_new2[k] <= '0;
				else if (step_2_valid && step_2_ready) begin
					if (k < data2.in.clusters_num)
						w_new2[k] <= w_new[k] / w_sum2;
					else
						w_new2[k] <= '0;
				end
		end : k_idx3
	endgenerate*/

	// **************** Stage 4 ****************
	always_ff @(posedge clk or posedge rst)
		if (rst) begin
			src_valid <= '0;

			src_data.in <= '0;
			src_data.var_min <= '0;
			src_data.var_max <= '0;
			src_data.var_min_idx <= '0;
			src_data.var_max_idx <= '0;
			src_data.is_matched <= '0;
			src_data.B <= '0;
			src_data.p_max_idx <= '0;

			src_data.mem_color <= '0;
			src_data.mem_var <= '0;
			src_data.vars <= '0;
		end
		else begin
			if (step_3_valid)
				src_valid <= '1;
			else if (src_ready)
				src_valid <= '0;
			if (step_3_valid && step_3_ready) begin
				src_data.in <= data3.in;
				src_data.mem_var <= data3.mem_var;
				src_data.mem_color <= data3.mem_color;
				src_data.vars <= data3.vars;
			end
		end
	// Calculation
    generate
		for (k = 0; k < 3; ++k) begin : k_idx4
			always_ff @(posedge clk or posedge rst) 
				if (rst) begin
                    src_data.mem_w[k] <= '0;
				end
				else if (step_3_valid && step_3_ready) begin
					if (k < data3.in.clusters_num) begin
						if ('0 != w_new2[k][0]) 
							src_data.mem_w[k] <= 8'd1 + (w_new2[k][8:1]);
						else 
							src_data.mem_w[k] <= w_new2[k][8:1];
					end
					else begin
						src_data.mem_w[k] <= data3.mem_w[k];
					end
				end
		end : k_idx4
	endgenerate

	// **************** Functions ****************
	function logic[15:0] w_sum_get(logic[2:0][7:0] mem_w, logic[1:0] n);
		w_sum_get = '0;
		for (int k = 0; k < 3; ++k) begin
			if (k < n) begin
				if ('0 == mem_w[k])
					w_sum_get = w_sum_get + 16'd1;
				else
					w_sum_get = w_sum_get + mem_w[k];
			end
		end
	endfunction : w_sum_get

	// **************** Modules ****************
	generate 
		for (k = 0; k < 3; ++k) begin : div_idx
			lpm_div_wrap div_0(
				.clk, .rst,

				.snk_valid(step_2_valid),
				.snk_numer(w_new[k]),
				.snk_denom(w_sum2),
				.snk_ready(),

				.src_ready(step_3_ready),
				.src_valid(),
				.src_data(w_new2[k])
			);
		end : div_idx
	endgenerate

	backpressure_machine #(
        .LATENCY(14),
        .DATA_EN(1),
        .DATA_WIDTH($bits(data2))
    ) bpm_0 (
        .clk, .rst,

        .snk_valid(step_2_valid), .snk_ready(step_2_ready),
        .snk_data(data2),

        .src_valid(step_3_valid), .src_ready(step_3_ready),
        .src_data(data3)
    );

endmodule : gmm_subtract_w_normalized_pipe

`endif