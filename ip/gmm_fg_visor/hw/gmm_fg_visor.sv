/*
	-------------------------------------------------------------------------------------
	The MIT License.
	Copyright Â© 2019 Andrei Kalshchikov /KalshchikovAA@gmail.com/.
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
	
	This module receives video sequence from gmm_fg_arbiter and selects user's data.
*/

module gmm_fg_visor(
    input clk, rst,

    input[1:0] sw,

    input snk_valid, snk_sop, snk_eop,
    input[48:0] snk_data,
    output logic snk_ready,

    input src_ready,
    output logic src_valid, src_sop, src_eop,
    output logic[23:0] src_data
);
    typedef enum logic[1:0] {IDLE, VIDEO} state_t;
    // RGB888 data format
	typedef struct packed {
		logic[7:0] r, g, b;
	} rgb888_t;
    // Input data format
	typedef struct packed {
		logic is_fg; // It indices 1, if the new_pixel is foreground and 0 otherwise
		rgb888_t mem_pixel; // It's the a pixel from "mem" sequence
		rgb888_t new_pixel; // It's a pixel from "video" sequence
    } in_t;

    state_t state, next;
    in_t in;

    always_comb begin
        next = IDLE;
        case (state) 
        IDLE:
            if (snk_sop && snk_valid && snk_ready && ('0 == snk_data[3:0]))
                next = VIDEO;
            else
                next = IDLE;
        VIDEO: 
            if (src_eop && src_valid && src_ready)
                next = IDLE;
            else
                next = VIDEO;
        default: next = IDLE;
        endcase
    end

    always_ff @(posedge clk or posedge rst)
        if (rst)
            state <= IDLE;
        else
            state <= next;

    assign snk_ready = src_ready | ~src_valid;
    assign in = snk_data;

    always_ff @(posedge clk or posedge rst)
        if (rst) begin
            src_valid <= '0;
            src_sop <= '0;
            src_eop <= '0;
        end
        else begin
            if (src_ready) begin
                src_eop <= '0;
                src_sop <= '0;
            end

            if (snk_valid)
                src_valid <= '1;
            else if (src_ready) 
                src_valid <= '0;
            
            if (snk_valid && snk_ready) begin
                src_sop <= snk_sop;
                src_eop <= snk_eop;

                if (((VIDEO) == next) && !snk_sop)
                    case (sw)
                    2'b00: src_data <= in.new_pixel;
                    2'b01: src_data <= in.is_fg ? 24'hFFFFFF : 24'h000000;
					2'b10: src_data <= in.mem_pixel;
                    2'b11: src_data <= {in.new_pixel.b, in.new_pixel.g, in.new_pixel.r}; // for future
                    endcase
                else
                    src_data <= in.new_pixel;
            end
        end
endmodule : gmm_fg_visor