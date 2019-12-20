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
`ifndef _GMM_SUBTRACT_VARS_PIPE_SV_
`define _GMM_SUBTRACT_VARS_PIPE_SV_

`include "gmm_structures.svh"

import gmm_structures::*;

/*
The precence of signal 
typedef struct packed {
	Type                 | Name        | In  | Out |
	---------------------|-------------|-----|-----|
	data_t               | in          | old | old |
	logic[2:0][15:0]     | mem_var     | old | old |
	logic[2:0][7:0]      | mem_w       | old | old |
	logic[2:0][2:0][7:0] | mem_color   | old | old |
	logic[2:0][19:0]     | vars        | x   | new |
	logic[2:0][18:0]     | w_sum       | x   | x   |
	logic[2:0][18:0]     | c_sum       | x   | x   |
	logic[2:0][18:0]     | v_sum       | x   | x   |
	logic[2:0][18:0]     | w0          | x   | x   |
	logic[19:0]          | var_min     | x   | new |
	logic[19:0]          | var_max     | x   | new |
	logic[1:0]           | var_min_idx | x   | new |
	logic[1:0]           | var_max_idx | x   | new |
	logic                | is_matched  | x   | new |
	logic[31:0]          | p_max_idx   | x   | x   |
	logic[31:0]          | B           | x   | x   |
} mega_data_t;
*/
module gmm_subtract_vars_pipe (
    input clk, rst, 

	input[7:0] d, 

    input snk_valid,
    input mega_data_t snk_data,
    output logic snk_ready,

    input src_ready,
    output logic src_valid,
    output mega_data_t src_data
);
    typedef struct packed {
		logic[19:0] data;
		logic[1:0] idx;
	} extra_t;

	typedef struct packed {
		logic[19:0] data;
		logic[1:0] idx;
		logic is_matched;
	} match_t;

	logic step_1_valid, step_1_ready;
	logic step_2_valid, step_2_ready;
	logic step_3_valid, step_3_ready;
	logic[2:0][19:0] vars_lim, vars_lim_d, vars_lim_d2;
	logic[2:0][2:0][19:0] u;
	logic[4:0] var_lim_coef;

	mega_data_t data, data_2, data_3;

	assign var_lim_coef = d[4:0];

	assign snk_ready = step_1_ready | ~step_1_valid;
	assign step_1_ready = step_2_ready | ~step_2_valid;
	assign step_2_ready = step_3_ready | ~step_3_valid; 
	assign step_3_ready = src_ready | ~src_valid; 

	// **************** Stage 1 ****************
	// Pipeline
	always_ff @(posedge clk or posedge rst)
		if (rst) begin
			step_1_valid <= '0;
			data.in <= '0;
			data.mem_var <= '0;
			data.mem_w <= '0;
			data.mem_color <= '0;

			data.var_max <= '0;
			data.var_min <= '0;
			data.var_max_idx <= '0;
			data.var_min_idx <= '0;
			data.B <= '0;
			data.p_max_idx <= '0;
			data.is_matched <= '0;
		end
		else begin
			if (snk_valid)
				step_1_valid <= '1;
			else if (step_1_ready)
				step_1_valid <= '0;

			if (snk_valid && snk_ready) begin
				data.in <= snk_data.in;
				data.mem_var <= snk_data.mem_var;
				data.mem_w <= snk_data.mem_w;
				data.mem_color <= snk_data.mem_color;
			end
		end
	
	genvar k;
	generate
		for (k = 0; k < 3; ++k) begin : k_idx	
			always_ff @(posedge clk or posedge rst) 
				if (rst) begin
					vars_lim[k] <= '0;
					data.vars[k] <= '0;
					u[k] <= '0;
				end
				else begin
					if (snk_valid && snk_ready) begin	
						vars_lim[k] <= var_lim_coef * {4'b0, snk_data.mem_var[k]};  
						u[k][0] <= u_get(snk_data.in.rgb_new.color[0], snk_data.mem_color[k][0]);   					
						u[k][1] <= u_get(snk_data.in.rgb_new.color[1], snk_data.mem_color[k][1]);   					
						u[k][2] <= u_get(snk_data.in.rgb_new.color[2], snk_data.mem_color[k][2]);   					
						//data.vars[k] <= vars_get(snk_data.in.rgb_new, snk_data.mem_color[k]);
					end
				end	
		end : k_idx
	endgenerate
	
	// **************** Stage 2 ****************
	// Pipeline
	always_ff @(posedge clk or posedge rst)
		if (rst) begin
			step_2_valid <= '0;
			data_2.in <= '0;
			data_2.mem_var <= '0;
			data_2.mem_w <= '0;
			data_2.mem_color <= '0;

			data_2.var_max <= '0;
			data_2.var_min <= '0;
			data_2.var_max_idx <= '0;
			data_2.var_min_idx <= '0;
			data_2.B <= '0;
			data_2.p_max_idx <= '0;
			data_2.is_matched <= '0;

			vars_lim_d <= '0;
		end
		else begin
			if (step_1_valid)
				step_2_valid <= '1;
			else if (step_2_ready)
				step_2_valid <= '0;

			if (step_1_valid && step_1_ready) begin
				data_2.in <= data.in;
				data_2.mem_var <= data.mem_var;
				data_2.mem_w <= data.mem_w;
				data_2.mem_color <= data.mem_color;
				
				vars_lim_d <= vars_lim;
			end	
		end
	
	generate
		for (k = 0; k < 3; ++k) begin : k_idx2
			always_ff @(posedge clk or posedge rst)
				if (rst) begin
					data_2.vars[k] <= '0;
				end
				else begin
					if (step_1_valid && step_1_ready)
						data_2.vars[k] <= 20'd1 + u[k][0] + u[k][1] + u[k][2];
				end
		end : k_idx2

	endgenerate

	// **************** Stage 3 ****************
	// Pipeline
	always_ff @(posedge clk or posedge rst)
		if (rst) begin
			step_3_valid <= '0;
			data_3 <= '0;
		end
		else begin
			if (step_2_valid)
				step_3_valid <= '1;
			else if (step_3_ready)
				step_3_valid <= '0;
			
			if (step_2_valid && step_2_ready) begin
				data_3 <= data_2;

				{data_3.var_max, data_3.var_max_idx} <= max_get(data_2.vars, data_2.in.clusters_num);
				{data_3.var_min, data_3.var_min_idx} <= min_get(data_2.vars, vars_lim_d, data_2.in.clusters_num);

				vars_lim_d2 <= vars_lim_d;
			end
		end

	// **************** Stage 4 ****************
	// Pipeline 
	always_ff @(posedge clk or posedge rst)
		if (rst) begin
			src_valid <= '0;
			src_data.in <= '0;
			src_data.mem_var <= '0;
			src_data.mem_w <= '0;
			src_data.mem_color <= '0;
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
				src_data.in <= data_3.in;
				src_data.mem_var <= data_3.mem_var;
				src_data.mem_w <= data_3.mem_w;
				src_data.mem_color <= data_3.mem_color;
				src_data.vars <= data_3.vars;

				src_data.var_max <= data_3.var_max;
				src_data.var_min <= data_3.var_min;
				src_data.var_max_idx <= data_3.var_max_idx;
				src_data.var_min_idx <= data_3.var_min_idx;

				if ('0 == data_3.in.clusters_num) begin
					src_data.is_matched <= '0;
				end
				else begin
					if (data_3.vars[data_3.var_min_idx] <= vars_lim_d2[data_3.var_min_idx])
						src_data.is_matched <= '1;
					else
						src_data.is_matched <= '0;
				end
			end	
		end

	// **************** Functions ****************
	function extra_t min_get(logic[2:0][19:0] vars, logic[2:0][19:0] vars_lim, logic[1:0] n);
		{min_get.data, min_get.idx} = {vars[0], 2'd0};

		if (2'd2 == n) begin
			if ((vars[0] <= vars_lim[0]) && (vars[1] <= vars_lim[1])) begin
				if (vars[1] < vars[0])
					{min_get.data, min_get.idx} = {vars[1], 2'd1};
			end
			else if (vars[1] <= vars_lim[1])
				{min_get.data, min_get.idx} = {vars[1], 2'd1};
		end
		else if (2'd3 == n) begin
			if ((vars[0] <= vars_lim[0]) && (vars[1] <= vars_lim[1]) && (vars[2] <= vars_lim[2])) begin
				if ((vars[1] < vars[0]) && (vars[1] <= vars[2]))
					{min_get.data, min_get.idx} = {vars[1], 2'd1};
				else if ((vars[2] < vars[0]) && (vars[2] < vars[1]))
					{min_get.data, min_get.idx} = {vars[2], 2'd2};
			end
			else if ((vars[0] <= vars_lim[0]) && (vars[1] <= vars_lim[1])) begin
				if (vars[1] < vars[0])
					{min_get.data, min_get.idx} = {vars[1], 2'd1};
			end
			else if ((vars[0] <= vars_lim[0]) && (vars[2] <= vars_lim[2])) begin
				if (vars[2] < vars[0])
					{min_get.data, min_get.idx} = {vars[2], 2'd2};
			end
			else if ((vars[1] <= vars_lim[1]) && (vars[2] <= vars_lim[2])) begin
				if (vars[1] <= vars[2])
					{min_get.data, min_get.idx} = {vars[1], 2'd1};
				else 
					{min_get.data, min_get.idx} = {vars[2], 2'd2};
			end
			else if (vars[2] <= vars_lim[2])
				{min_get.data, min_get.idx} = {vars[2], 2'd2};
			else if (vars[1] <= vars_lim[1])
				{min_get.data, min_get.idx} = {vars[1], 2'd1};
		end
		
		/*logic key;
		key = '0;
		min_get.data = vars[0];
		min_get.idx = 0;
		for (int k = 0; k < 3; ++k) begin
			if ((vars[k] < vars_lim[k]) && (k < n)) begin
				if ('0 == key) begin
					key = '1;
					min_get.data = vars[k];
					min_get.idx = k;
				end
				else if (vars[k] < min_get.data) begin
					min_get.data = vars[k];
					min_get.idx = k;
				end
			end
		end*/
	endfunction : min_get

	function extra_t max_get(logic[2:0][19:0] vars, logic[1:0] n);
		max_get.data = vars[0];
		max_get.idx = '0;

		if (2'd1 == n) begin
			max_get.data = vars[0];
			max_get.idx = 0;
		end
		else if (2'd2 == n) begin
			if (vars[0] < vars[1]) begin
				max_get.data = vars[1];
				max_get.idx = 1;
			end
		end
		else if (2'd3 == n) begin
			if ((vars[1] > vars[0]) && (vars[1] >= vars[2])) begin
				max_get.data = vars[1];
				max_get.idx = 1;
			end
			else if ((vars[2] > vars[0]) && (vars[2] > vars[1])) begin
				max_get.data = vars[2];
				max_get.idx = 2;
			end
		end
	endfunction : max_get


	function logic [19:0] u_get(input[7:0] c1, c2);
		logic[19:0] u;
		u = (c1 > c2) ? (c1 - c2) : (c2 - c1); 
		u_get = u * u;
	endfunction : u_get

	function logic unsigned[19:0] vars_get(input rgb_t color1, color2);
		logic[19:0] c1, c2, u;
		vars_get = 20'b1;
		for (int j = 0; j < 3; ++j) begin
			c1 = color1.color[j];
			c2 = color2.color[j];
			u = (c1 > c2) ? (c1 - c2) : (c2 - c1); 				
			vars_get = vars_get + u * u;
		end
	endfunction : vars_get

endmodule : gmm_subtract_vars_pipe

`endif