`ifndef _GMM_SUBTRACT_PARAMS_UPDATE_PIPE_SV_
`define _GMM_SUBTRACT_PARAMS_UPDATE_PIPE_SV_

`include "gmm_structures.svh"

import gmm_structures::*;

/*
The precence of signal 
typedef struct packed {
	Type                 | Name        | In  | Out |
	---------------------|-------------|-----|-----|
	data_t               | in          | old | new |
	logic[2:0][15:0]     | mem_var     | old | new |
	logic[2:0][7:0]      | mem_w       | old | new |
	logic[2:0][2:0][7:0] | mem_color   | old | new |
	logic[2:0][19:0]     | vars        | old | new |
	logic[2:0][18:0]     | w_sum       | x   | new |
	logic[2:0][18:0]     | c_sum       | x   | new |
	logic[2:0][18:0]     | v_sum       | x   | new |
	logic[2:0][18:0]     | w0          | x   | new |
	logic[19:0]          | var_min     | old | old |
	logic[19:0]          | var_max     | old | old |
	logic[1:0]           | var_min_idx | old | old |
	logic[1:0]           | var_max_idx | old | old |
	logic                | is_matched  | old | old |
	logic[31:0]          | p_max_idx   | x   | x   |
	logic[31:0]          | B           | x   | x   |
} mega_data_t;
*/
module gmm_subtract_params_update_pipe (
    input clk, rst, 

	input[9:0] in_alpha, 
	input[7:0] s,

    input snk_valid,
    input mega_data_t snk_data,
    output logic snk_ready,

    input src_ready,
    output logic src_valid,
    output mega_data_t src_data
);
	logic[2:0][18:0] ww0, ww1, w_sum;//[cluster_idx]
	logic[2:0][2:0][18:0] c0, c1, c_sum;//[cluster_idx]
	logic[2:0][30:0] v0, v1, v_sum;//[cluster_idx]
	logic[2:0][18:0] w0, w0_d;//[cluster_idx]
	
    logic[9:0] alpha, alpha_n;		  

	logic step_1_valid, step_1_ready;
	logic step_2_valid, step_2_ready;
	logic step_3_valid, step_3_ready;
	
	mega_data_t data, data2, data3;

	assign snk_ready = step_1_ready | ~step_1_valid;
	assign step_1_ready = step_2_ready | ~step_2_valid;
	assign step_2_ready = step_3_ready | ~step_3_valid;
	assign step_3_ready = src_ready | ~src_valid;

	// **************** Stage 1 ****************
	// Pipeline
	always_ff @(posedge clk or posedge rst)
		if (rst) begin
			step_1_valid <= '0;
			data <= '0;
			alpha <= '0;
			alpha_n <= '0;
		end
		else begin
			if (snk_valid)
				step_1_valid <= '1;
			else if (step_1_ready)
				step_1_valid <= '0;

			if (snk_valid && snk_ready) begin
				alpha <= in_alpha + (s * snk_data.in.u); 
				alpha_n <= 11'd1024 - (in_alpha + (s * snk_data.in.u));
				data <= snk_data;
			end
		end

	// **************** Stage 2 ****************
    // Pipeline
	always_ff @(posedge clk or posedge rst)
		if (rst) begin
			step_2_valid <= '0;

			data2.in <= '0;
			data2.var_min <= '0;
			data2.var_max <= '0;
			data2.var_min_idx <= '0;
			data2.var_max_idx <= '0;
			data2.is_matched <= '0;
			data2.B <= '0;
			data2.p_max_idx <= '0;
		end
		else begin
			if (step_1_valid)
				step_2_valid <= '1;
			else if (step_2_ready)
				step_2_valid <= '0;

			if (step_1_valid && step_1_ready) begin
				data2.in <= data.in;
				data2.var_min <= data.var_min;
				data2.var_max <= data.var_max;
				data2.var_min_idx <= data.var_min_idx;
				data2.var_max_idx <= data.var_max_idx;
				data2.is_matched <= data.is_matched;

				if (data.is_matched) begin
					data2.in.u <= (data.in.u < 6'd63) ? (data.in.u + 1'b1) : 6'd63;
				end
				else begin
					data2.in.u <= '0;
					if (data.in.clusters_num < 2'd3) begin
						data2.in.clusters_num <= data.in.clusters_num + 1'b1;
					end
				end 
			end	
		end
        
	// New parameters calculation
	genvar k;
	generate
		for (k = 0; k < 3; ++k) begin : k_idx
			always_ff @(posedge clk or posedge rst) 
				if (rst) begin
					w0[k] <= '0;
					{ww1[k], ww0[k]} <= '0;
					{v1[k], v0[k]} <= '0;
					{c1[k], c0[k]} <= '0;
					data2.mem_color[k] <= '0;
					data2.mem_var[k] <= '0;
					data2.mem_w[k] <= '0;
					data2.vars[k] <= '0;
				end
				else if (step_1_valid && step_1_ready) begin
					data2.mem_color[k] <= data.mem_color[k];
					data2.mem_var[k] <= data.mem_var[k];
					data2.mem_w[k] <= data.mem_w[k];

					if (data.is_matched) begin
						data2.vars[k] <= data.vars[k];
						if (k < data.in.clusters_num) begin
							if (data.var_min_idx == k) begin
								{ww1[k], ww0[k]} <= w_get(alpha, alpha_n, data.mem_w[k]);
								{v1[k], v0[k]} <= v_get(alpha, alpha_n, data.mem_var[k], data.vars[k]);
								{c1[k][0], c0[k][0]} <= c_get(alpha, alpha_n, data.mem_color[k][0], data.in.rgb_new.color[0]);
								{c1[k][1], c0[k][1]} <= c_get(alpha, alpha_n, data.mem_color[k][1], data.in.rgb_new.color[1]);
								{c1[k][2], c0[k][2]} <= c_get(alpha, alpha_n, data.mem_color[k][2], data.in.rgb_new.color[2]);

								/*c_sum[k] <= c_calc(alpha, alpha_n, snk_data2.mem_color[k], snk_data2.in.rgb_new.color);
								v_sum[k] <= v_calc(alpha, alpha_n, snk_data2.mem_var[k], snk_data2.vars[k]);
								w_sum[k] <= w_calc(alpha, alpha_n, snk_data2.mem_w[k]);*/
							end
							else begin
								w0[k] <= w0_calc(alpha_n, data.mem_w[k]);
							end
						end
					end
					else begin
						data2.vars[k] <= data.vars[k];
						if (data.in.clusters_num < 2'd3) begin
							if (data.in.clusters_num == k) begin
								data2.mem_color[k] <= data.in.rgb_new.color;
								data2.mem_w[k] <= 8'd3;
								data2.mem_var[k] <= data.var_max[19:3];
								data2.vars[k] <= 20'd0;
							end
						end
						else begin
							if (data.var_max_idx == k) begin
								data2.mem_color[k] <= data.in.rgb_new.color;
								data2.mem_w[k] <= 8'd3;
								data2.mem_var[k] <= data.var_max[19:3];
								data2.vars[k] <= 20'd0;
							end
						end
					end
				end
		end : k_idx
	endgenerate			

	// **************** Stage 3 ****************
	always_ff @(posedge clk or posedge rst)
		if (rst) begin
			step_3_valid <= '0;
			data3.in <= '0;
			data3.var_min <= '0;
			data3.var_max <= '0;
			data3.var_min_idx <= '0;
			data3.var_max_idx <= '0;
			data3.is_matched <= '0;
			data3.B <= '0;
			data3.p_max_idx <= '0;
		end
		else begin
			if (step_2_valid)
				step_3_valid <= '1;
			else if (step_3_ready)
				step_3_valid <= '0;
			
			if (step_2_valid && step_2_ready) begin
				data3.in <= data2.in;
				data3.var_min <= data2.var_min;
				data3.var_max <= data2.var_max;
				data3.var_min_idx <= data2.var_min_idx;
				data3.var_max_idx <= data2.var_max_idx;
				data3.is_matched <= data2.is_matched;
			end 
		end

	generate 
		for (k = 0; k < 3; ++k) begin : k_idx2
			always_ff @(posedge clk or posedge rst) 
				if (rst) begin
					c_sum[k] <= '0;
					v_sum[k] <= '0;
					w_sum[k] <= '0;
					w0_d[k] <= '0;
					data3.mem_color[k] <= '0;
					data3.mem_var[k] <= '0;
					data3.mem_w[k] <= '0;
					data3.vars[k] <= '0;
				end
				else if (step_2_valid && step_2_ready) begin
					data3.mem_color[k] <= data2.mem_color[k];
					data3.mem_var[k] <= data2.mem_var[k];
					data3.mem_w[k] <= data2.mem_w[k];
					data3.vars[k] <= data2.vars[k];

					if (data2.is_matched) begin
						if (k < data2.in.clusters_num) begin
							if (data2.var_min_idx == k) begin
								w_sum[k] <= ww1[k] + ww0[k];
								v_sum[k] <= v1[k] + v0[k];
								c_sum[k][0] <= c1[k][0] + c0[k][0];
								c_sum[k][1] <= c1[k][1] + c0[k][1];
								c_sum[k][2] <= c1[k][2] + c0[k][2];
							end
							else begin
								w0_d[k] <= w0[k];
							end
						end
					end
				end
		end : k_idx2
	endgenerate
	// **************** Stage 3 ****************
	// Pipeline
	always_ff @(posedge clk or posedge rst)
		if (rst) begin
			src_valid <= '0;

			src_data.in <= '0;
			src_data.vars <= '0;

			src_data.var_max <= '0;
			src_data.var_min <= '0;
			src_data.var_max_idx <= '0;
			src_data.var_min_idx <= '0;
			src_data.B <= '0;
			src_data.p_max_idx <= '0;
			src_data.is_matched <= '0;
		end
		else begin
			if (step_3_valid)
				src_valid <= '1;
			else if (src_ready)
				src_valid <= '0;
			
			if (step_3_valid && step_3_ready) begin
				src_data.in <= data3.in;
				src_data.vars <= data3.vars;
			end
		end
	
	// Parameters rounding
	generate
		for (k = 0; k < 3; ++k) begin : k_idx3
			always_ff @(posedge clk or posedge rst) 
				if (rst) begin
					src_data.mem_color[k] <= '0;
					src_data.mem_var[k] <= '0;
					src_data.mem_w[k] <= '0;
				end
				else if (step_3_valid && step_3_ready) begin
					if ((k < data3.in.clusters_num) && (data3.is_matched)) begin
						if (data3.var_min_idx == k) begin
							// Rounding
							src_data.mem_color[k] <= c_round(c_sum[k]);
							
							// Rounding
							if (v_sum[k][9:0] > 10'd511)
								src_data.mem_var[k] <= 16'd1 + (v_sum[k] >> 31'd10);
							else 
								src_data.mem_var[k] <= v_sum[k] >> 31'd10;
			
							// Rounding
							if (w_sum[k][9:0] > 10'd511)
								src_data.mem_w[k] <= 8'd1 + (w_sum[k] >> 19'd10);
							else
								src_data.mem_w[k] <= w_sum[k] >> 19'd10;
						end
						else begin
							src_data.mem_color[k] <= data3.mem_color[k];
							src_data.mem_var[k] <= data3.mem_var[k];
							if (w0_d[k][9:0] > 10'd511)
								src_data.mem_w[k] <= 8'd1 + (w0_d[k] >> 18'd10);
							else
								src_data.mem_w[k] <= w0_d[k] >> 18'd10;
						end
					end
					else begin
						src_data.mem_color[k] <= data3.mem_color[k];
						src_data.mem_var[k] <= data3.mem_var[k];
						src_data.mem_w[k] <= data3.mem_w[k];
					end
				end
		end : k_idx3
	endgenerate

	// **************** Functions ****************
	function logic[61:0] v_get(logic[9:0] alpha, alpha_n, logic[15:0] mem_var, logic[19:0] vars);
		logic[30:0] v0, v1;
		v0 = {21'b0, alpha_n} * {15'b0, mem_var};
		v1 = {21'b0, alpha} * {11'b0, vars};
		v_get = {v1, v0};
	endfunction : v_get

	function logic[30:0] v_calc(logic[9:0] alpha, alpha_n, logic[15:0] mem_var, logic[19:0] vars);
		logic[30:0] v0, v1, var_calc;
		v0 = {21'b0, alpha_n} * {15'b0, mem_var};
		v1 = {21'b0, alpha} * {11'b0, vars};
		v_calc = v0 + v1;
	endfunction : v_calc

	function logic[37:0] c_get(logic[9:0] alpha, alpha_n, logic[7:0] mem_color, logic[7:0] new_color);
		logic[18:0] c0, c1;
		c0 = {9'b0, alpha_n} * {11'b0, mem_color};
		c1 = {9'b0, alpha} * {11'b0, new_color};
		c_get = {c1, c0};
	endfunction : c_get

	function logic[2:0][18:0] c_calc(logic[9:0] alpha, alpha_n, logic[2:0][7:0] mem_color, logic[2:0][7:0] new_color);
		logic[18:0] c0, c1;
		for (int j = 0; j < 3; ++j) begin
			c0 = {9'b0, alpha_n} * {10'b0, mem_color[j]};
			c1 = {9'b0, alpha} * {10'b0, new_color[j]};
			c_calc[j] = c0 + c1;
		end
	endfunction : c_calc

	function logic[37:0] w_get(logic[9:0] alpha, alpha_n, logic[7:0] mem_w);
		logic[18:0] w0, w1;
		w0 = {9'b0, alpha_n} * {11'b0, mem_w};
		w1 = {9'b0, alpha} * 19'd255;
		w_get = {w1, w0};
	endfunction : w_get

	function logic[18:0] w_calc(logic[9:0] alpha, alpha_n, logic[7:0] mem_w);
		logic[18:0] w0, w1;
		w0 = {9'b0, alpha_n} * {11'b0, mem_w};
		w1 = {9'b0, alpha} * 19'd255;
		w_calc = w0 + w1;
	endfunction : w_calc

	function logic[2:0][7:0] c_round(logic[2:0][18:0] in);
		// Rounding
		for (int j = 0; j < 3; ++j)
			if (in[j][9:0] > 10'd511)
				c_round[j] = 9'd1 + (in[j] >> 19'd10);
			else
				c_round[j] = in[j] >> 19'd10;
	endfunction : c_round

	function logic[18:0] w0_calc(logic[9:0] alpha_n, logic[7:0] mem_w);
		w0_calc = {9'b0, alpha_n} * {11'b0, mem_w};
	endfunction : w0_calc

endmodule : gmm_subtract_params_update_pipe

`endif