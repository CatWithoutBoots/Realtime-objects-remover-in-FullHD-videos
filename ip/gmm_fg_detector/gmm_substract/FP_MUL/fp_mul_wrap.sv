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
`ifndef FP_MUL_WRAP_SV
`define FP_MUL_WRAP_SV

module fp_mul_wrap (
    input clk, rst,

    input snk_valid,
    input[31:0] snk_dataa, snk_datab,
    output logic snk_ready,

    input src_ready,
    output logic src_valid,
    output logic[31:0] src_data
);
    localparam FP_MUL_LATENCY = 11;

    backpressure_machine #(
        .LATENCY (FP_MUL_LATENCY)
    ) bp_inst (
        .clk, .rst,

        .snk_valid, .snk_ready,
        .snk_data(),

        .src_ready, .src_valid,
        .src_data()
    );
    fp_mul_base fp_mul ( 
	    .aclr(rst),
	    .clk_en(snk_ready),
	    .clock(clk),
	    .dataa(snk_dataa),
        .datab(snk_datab),
	    .result(src_data)
    );
endmodule : fp_mul_wrap

`endif