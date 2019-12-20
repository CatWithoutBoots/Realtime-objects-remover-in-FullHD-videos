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
`ifndef _GMM_SUBTRACT_FG_DETECTOR_PIPE_SV_
`define _GMM_SUBTRACT_FG_DETECTOR_PIPE_SV_

`include "gmm_structures.svh"

import gmm_structures::*;

/*
The precence of signal 
typedef struct packed {
	Type                 | Name        | In  | Out |
	---------------------|-------------|-----|-----|
	data_t               | in          | old | new |
	logic[2:0][15:0]     | mem_var     | old | old |
	logic[2:0][7:0]      | mem_w       | old | old |
	logic[2:0][2:0][7:0] | mem_color   | old | old |
	logic[2:0][19:0]     | vars        | old | old |
	logic[2:0][18:0]     | w_sum       | old | old |
	logic[19:0]          | var_min     | old | old |
	logic[19:0]          | var_max     | old | old |
	logic[1:0]           | var_min_idx | old | old |
	logic[1:0]           | var_max_idx | old | old |
	logic                | is_matched  | old | old |
	logic[1:0]           | p_max_idx   | old | old |
	logic[1:0]           | B           | old | old |
} mega_data_t;
*/
module gmm_subtract_fg_detector_pipe (
    input clk, rst, 

    input snk_valid,
    input mega_data_t snk_data,
    output logic snk_ready,

    input src_ready,
    output logic src_valid,
    output mega_data_t src_data
);
    logic sqrt_valid, sqrt_ready;
    mega_data_t sqrt_data;
    logic[2:0][7:0] rgb_std;

    assign sqrt_ready = src_ready | ~src_valid;

    // Pipeline
	always_ff @(posedge clk or posedge rst)
		if (rst) begin
			src_valid <= '0;

			src_data.var_min <= '0;
			src_data.var_max <= '0;
			src_data.var_min_idx <= '0;
			src_data.var_max_idx <= '0;
			src_data.is_matched <= '0;
			src_data.p_max_idx <= '0;
			src_data.B <= '0;
        end
		else begin
			if (sqrt_valid)
				src_valid <= '1;
			else if (src_ready)
				src_valid <= '0;
			
            if (sqrt_valid && sqrt_ready) begin

                src_data.in.clusters_num <= sqrt_data.in.clusters_num;
                src_data.in.chm <= sqrt_data.in.chm;
                src_data.in.u <= sqrt_data.in.u;
                src_data.in.rgb_new <= sqrt_data.in.rgb_new;
                src_data.in.is_fg <= (sqrt_data.p_max_idx > sqrt_data.B) ? '1 : '0;
            end            
		end

    // Calculation
    genvar k;
    generate
		for ( k = 0; k < 3; ++k) begin : k_idx
			always_ff @(posedge clk or posedge rst) 
                if (rst) begin
                    src_data.in.cluster[k].w <= '0;
                    src_data.in.cluster[k].rgb_std <= '0;
                    src_data.in.cluster[k].rgb_mean.color <= '0;
                    src_data.mem_w[k] <= '0;
                    src_data.mem_var[k] <= '0;
                    src_data.mem_color[k] <= '0;
                    src_data.vars[k] <= '0;
                end
                else if (sqrt_valid && sqrt_ready) begin
                    src_data.mem_var[k] <= sqrt_data.mem_var[k];
                    if (k < sqrt_data.in.clusters_num) begin
                        src_data.in.cluster[k].w <= sqrt_data.mem_w[k];
                        src_data.in.cluster[k].rgb_mean.color <= sqrt_data.mem_color[k];
                        if (sqrt_data.mem_var[k] > 12'd3969)
                            src_data.in.cluster[k].rgb_std <= 8'd63;
                        else if (sqrt_data.mem_var[k] < 4'd9) 
                            src_data.in.cluster[k].rgb_std <= 8'd3;
                        else
                            src_data.in.cluster[k].rgb_std <= rgb_std[k];
                    end
                    else
                        src_data.in.cluster[k] <= sqrt_data.in.cluster[k];
                end 
		end : k_idx
    endgenerate

    // **************** Modules ****************
    generate 
        for (k = 0; k < 3; ++k) begin : sqrt_idx
            lpm_sqrt_wrap mem_var0 (
                .clk, .rst,
                .snk_valid,
                .snk_data(snk_data.mem_var[k]),
                .snk_ready(),
                
                .src_ready(sqrt_ready),
                .src_valid(),
                .src_data(rgb_std[k])
            );
        end : sqrt_idx
    endgenerate

    backpressure_machine #(
        .LATENCY(7),
        .DATA_EN(1),
        .DATA_WIDTH($bits(snk_data))
    ) bpm_0 (
        .clk, .rst,

        .snk_valid, .snk_ready,
        .snk_data(snk_data),

        .src_valid(sqrt_valid), .src_ready(sqrt_ready),
        .src_data(sqrt_data)
    );
endmodule : gmm_subtract_fg_detector_pipe

`endif