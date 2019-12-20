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
`ifndef _GMM_SUBTRACT_SV_
`define _GMM_SUBTRACT_SV_

//`include "gmm_structures.svh"

import gmm_structures::*;

module gmm_subtract(
	input[7:0] d, 
	input[7:0] bg_th,  
	input[9:0] in_alpha, 
	input[7:0] s,
	input[7:0] u_max,

	input clk, rst,
	
	input snk_valid,
	input[152:0] snk_data,
	output logic snk_ready,
	
	input src_ready,
	output logic src_valid,
	output logic[152:0] src_data
);	
	mega_data_t in_mega_data, out_mega_data;
	mega_bus_t color, vars, update, norm, sort, Bcalc, p;

	always_comb begin
		in_mega_data = '0;
		in_mega_data.in = snk_data;
		src_data = out_mega_data.in;	
	end

	// **************** Logical ****************

	// **************** Modules ****************
	// Color pipe
	gmm_subtract_color_pipe color_pipe(
		.clk, .rst,

		.snk_valid,
		.snk_data(in_mega_data),
		.snk_ready,

		.src_ready(color.ready),
		.src_valid(color.valid),
		.src_data(color.data)
	);
	// Vars pipe
	gmm_subtract_vars_pipe vars_pipe(
		.clk, .rst,

		.d,

		.snk_valid(color.valid),
		.snk_data(color.data),
		.snk_ready(color.ready),

		.src_ready(vars.ready),
		.src_data(vars.data),
		.src_valid(vars.valid)
	);
	// Params update pipe
	gmm_subtract_params_update_pipe params_update_pipe(
		.clk, .rst, 

		.in_alpha, 
		.s,

		.snk_valid(vars.valid),
		.snk_data(vars.data),
		.snk_ready(vars.ready),

		.src_ready(update.ready),
		.src_data(update.data),
		.src_valid(update.valid)
	);
	// W normalized pipe
	gmm_subtract_w_normalized_pipe w_normalized_pipe(
		.clk, .rst,

		.snk_valid(update.valid),
		.snk_data(update.data),
		.snk_ready(update.ready),

		.src_ready(norm.ready),
		.src_data(norm.data),
		.src_valid(norm.valid)
	);
	// Sort pipe
	gmm_subtract_sort_pipe sort_pipe(
		.clk, .rst,

		.snk_valid(norm.valid),
		.snk_data(norm.data),
		.snk_ready(norm.ready),

		.src_ready(sort.ready),
		.src_data(sort.data),
		.src_valid(sort.valid)
	);
	// B calc pipe
	gmm_subtract_B_calc_pipe B_calc_pipe(
		.clk, .rst,

		.bg_th,
		
		.snk_valid(sort.valid),
		.snk_data(sort.data),
		.snk_ready(sort.ready),

		.src_ready(Bcalc.ready),
		.src_data(Bcalc.data),
		.src_valid(Bcalc.valid)
	);
    // probability calc
	gmm_subtract_fp_probability_pipe fp_p_pipe0 (
		.clk, .rst,

		.snk_valid(Bcalc.valid),
		.snk_data(Bcalc.data),
		.snk_ready(Bcalc.ready),
		
		.src_ready(p.ready),
		.src_valid(p.valid),
		.src_data(p.data)
	);
	// fg detector
	gmm_subtract_fg_detector_pipe fg_detector0 (
		.clk, .rst, 

		.snk_valid(p.valid),
		.snk_data(p.data),
		.snk_ready(p.ready),

		.src_ready,
		.src_valid,
		.src_data(out_mega_data)
	);
endmodule : gmm_subtract

`endif