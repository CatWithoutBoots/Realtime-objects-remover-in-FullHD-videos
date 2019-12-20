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
module lpm_sqrt_wrap(
    input clk, rst,

    input snk_valid,
    input[15:0] snk_data,
    output logic snk_ready,

    input src_ready,
    output logic src_valid,
    output logic[7:0] src_data
);
    
    logic[8:0] step_1_q;


    // **************** Step 2 ****************
    /*
    logic step_1_valid, step_1_ready;
    assign step_1_ready = src_ready | ~src_valid;
    always_ff @(posedge clk or posedge rst)
        if (rst) begin
            src_valid <= '0;
            src_data <= '0;
        end
        else begin
            if (step_1_valid)
                src_valid <= '1;
            else if (src_ready)
                src_valid <= '0;
            
            if (step_1_valid && step_1_ready) begin
                if ((1'b0 == step_1_q[0]) || (8'd255 == step_1_q[8:1]))
                    src_data <= step_1_q[8:1];
                else
                    src_data <= step_1_q[8:1] + 8'd1;
            end
        end
    */

    always_ff @(posedge clk or posedge rst)
        if (rst) begin
            src_data <= '0;
        end
        else if (snk_ready) begin
            if ((1'b0 == step_1_q[0]) || (8'd255 == step_1_q[8:1]))
                src_data <= step_1_q[8:1];
            else
                src_data <= step_1_q[8:1] + 8'd1;
        end

    lpm_sqrt lpm_sqrt_0 (
	    .aclr(rst),
	    .clk,
	    .ena(snk_ready),
	    .radical({snk_data, 2'b0}), // [17:0]
	    .q(step_1_q), // [8:0]
	    .remainder()
    );

    backpressure_machine #(
        .LATENCY(7),
        .DATA_EN(0),
        .DATA_WIDTH(1)
    ) bpm_0 (
        .clk, .rst,

        .snk_valid, .snk_ready,
        .snk_data(),

        .src_valid, .src_ready,
        .src_data()
    );
endmodule : lpm_sqrt_wrap