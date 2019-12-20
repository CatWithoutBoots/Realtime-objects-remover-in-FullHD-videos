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
module gmm_substract
(
   input logic clock,
   input logic resetn,
   // AVST snk
   input logic snk_valid,
   output logic snk_ready,
   input logic [175:0] snk_data,
   // AVST src
   output logic src_valid,
   input logic src_ready,
   output logic [175:0] src_data,
   input logic [7:0] d,
   input logic [7:0] bg_th,
   input logic [9:0] in_alpha,
   input logic [7:0] s,
   input logic start,
   output logic busy,
   output logic done
);
   always_comb begin
       busy = '0;
       done = '0;
       snk_ready = src_ready | ~src_valid;
   end 

    always_ff @(posedge clock or negedge resetn) 
        if (!resetn) begin
            src_valid <= '0;
            src_data <= '0;
        end
        else begin
            if (snk_valid)
                src_valid <= '1;
            else if (src_ready)
                src_valid <= '0;

            if (snk_valid && snk_ready)
                src_data <= snk_data;
        end
endmodule : gmm_substract