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
module lpm_div_wrap(
    input clk, rst,

    input snk_valid,
	input[16:0] snk_numer,
    input[15:0] snk_denom,
    output logic snk_ready,

    input src_ready,
    output logic src_valid,
    output logic[16:0] src_data
);
    lpm_div lpm_div_0 (
        .aclr(rst),
	    .clken(snk_ready),
	    .clock(clk),
	    .denom(snk_denom),
	    .numer(snk_numer),
	    .quotient(src_data),
	    .remain()
    );

    backpressure_machine #(
        .LATENCY(14),
        .DATA_EN(0),
        .DATA_WIDTH(1)
    ) bpm_0 (
        .clk, .rst,

        .snk_valid, .snk_ready,
        .snk_data(),

        .src_valid, .src_ready,
        .src_data()
    );
endmodule : lpm_div_wrap