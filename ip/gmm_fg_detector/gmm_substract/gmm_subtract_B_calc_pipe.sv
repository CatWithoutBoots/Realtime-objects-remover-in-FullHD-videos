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
`ifndef _GMM_SUBTRACT_B_CALC_PIPE_SV_
`define _GMM_SUBTRACT_B_CALC_PIPE_SV_

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
	logic[2:0][19:0]     | vars        | old | old |
	logic[19:0]          | var_min     | old | old |
	logic[19:0]          | var_max     | old | old |
	logic[1:0]           | var_min_idx | old | old |
	logic[1:0]           | var_max_idx | old | old |
	logic                | is_matched  | old | old |
	logic[1:0]           | p_max_idx   | x   | x   |
	logic[1:0]           | B           | x   | new |
} mega_data_t;
*/
module gmm_subtract_B_calc_pipe #(
    DATA_WIDTH = 153
)(
    input clk, rst,

	input[7:0] bg_th,

    input snk_valid,
    input mega_data_t snk_data,
    output logic snk_ready,

    input src_ready,
    output logic src_valid,
    output mega_data_t src_data
);	
    assign snk_ready = src_ready | ~src_valid;

    // Pipeline
	always_ff @(posedge clk or posedge rst)
		if (rst) begin
			src_valid <= '0;
			src_data <= '0;
		end	
		else begin
			if (snk_valid)
				src_valid <= '1;
			else if (src_ready)
				src_valid <= '0;
			
			if (snk_valid && snk_ready) begin
				src_data.in <= snk_data.in;
				src_data.mem_var <= snk_data.mem_var;
				src_data.mem_w <= snk_data.mem_w;
				src_data.mem_color <= snk_data.mem_color;
				src_data.vars <= snk_data.vars;
				src_data.B <= B_get(snk_data.mem_w, snk_data.in.clusters_num, bg_th);
			end		
		end
	
	function logic[1:0] B_get(logic[2:0][7:0] mem_w, logic[1:0] n, logic[7:0] bg_th);
		B_get = '0;

		if (2'd3 == n) begin
			if (mem_w[0] + mem_w[1] < bg_th)
				B_get = 2'd2;
			else if (mem_w[0] < bg_th)
				B_get = 2'd1;
		end
		else if (2'd2 == n) begin
			if (mem_w[0] < bg_th)
				B_get = 2'd1;
		end
	endfunction : B_get

endmodule : gmm_subtract_B_calc_pipe

`endif