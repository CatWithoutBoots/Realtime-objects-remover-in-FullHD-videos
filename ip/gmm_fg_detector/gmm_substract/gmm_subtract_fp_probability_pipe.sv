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
`ifndef _GMM_SUBTRACT_FP_PROBABLITY_PIPE_SV_
`define _GMM_SUBTRACT_FP_PROBABLITY_PIPE_SV_

`include "gmm_structures.svh"

import gmm_structures::*;

/*
mem_w   -> | ()^2 | -> | int2fp | -> | div  | -> | pipe | -\                |             |
---------------------------------------/                    \               |             |
vars    -> | pipe | -> | int2fp | ----<                      >- | mul  | -> | max_idx_get | 
---------------------------------------\                    /               |             |
mem_var -> | pipe | -> | int2fp | -> | div  | -> | exp  | -/                |             |
-------       1             6           33          17             11       |             |
data    -> | pipe | -> | int2fp | -> | pipe | -> | pipe | ----> | pipe | -> |             |
*/

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
	logic[2:0][18:0]     | w_sum       | old | old |
	logic[19:0]          | var_min     | old | old |
	logic[19:0]          | var_max     | old | old |
	logic[1:0]           | var_min_idx | old | old |
	logic[1:0]           | var_max_idx | old | old |
	logic                | is_matched  | old | old |
	logic[31:0]          | p_max_idx   | x   | new |
	logic[31:0]          | B           | old | old |
} mega_data_t;
*/
module gmm_subtract_fp_probability_pipe(
    input clk, rst,

    input snk_valid,
    input mega_data_t snk_data,
    output logic snk_ready,

    input src_ready,
    output logic src_valid,
    output mega_data_t src_data
);
    localparam INT_TO_FP_CONVERT_LATENCY = 6;
    localparam FP_DIV_LATENCY = 33;
    localparam FP_EXP_LATENCY = 17;
    localparam FP_MUL_LATENCY = 11;
    localparam FP_COMP_LATENCY = 3;

    typedef struct {
        logic ready, valid;
        mega_data_t data;
    } data_t;
    
    // Converter
    data_t pre_converter, converter;
    logic[2:0][15:0] mem_w_sqr;
    logic[2:0][31:0] mem_w_fp, mem_var_fp, vars_fp;
    // Divider
    data_t divider;
    logic[2:0][31:0] div1, div2;
    // Exper
    data_t exper;
    logic[2:0][31:0] div1_d;
    logic[2:0][31:0] exp1;
    // Muler
    data_t muler;
    logic[2:0][31:0] mul1;
    // Comparer
    data_t comparer;
    logic comp_1g0, comp_2g1, comp_2g0;

    // **************** Convert INT to FP ****************
    assign snk_ready = pre_converter.ready | ~pre_converter.valid;
    assign comparer.ready = src_ready | ~src_valid;
    
    // pipeline
    always_ff @(posedge clk or posedge rst)
        if (rst) begin
            pre_converter.valid <= '0;
            pre_converter.data <= '0;
            mem_w_sqr <= '0;
        end
        else begin
            if (snk_valid)
                pre_converter.valid <= '1;
            else if (pre_converter.ready)
                pre_converter.valid <= '0;

            if (snk_valid && snk_ready) begin
                pre_converter.data <= snk_data;
                mem_w_sqr[0] <= snk_data.mem_w[0] * snk_data.mem_w[0];
                mem_w_sqr[1] <= snk_data.mem_w[1] * snk_data.mem_w[1];
                mem_w_sqr[2] <= snk_data.mem_w[2] * snk_data.mem_w[2];
            end
        end

    always_ff @(posedge clk or posedge rst)
        if (rst) begin
            src_valid <= '0;
            src_data <= '0;
        end
        else begin
            if (comparer.valid)
                src_valid <= '1;
            else if (src_ready)
                src_valid <= '0;

            if (comparer.valid && comparer.ready) begin
                src_data.in <= comparer.data.in;
                src_data.B <= comparer.data.B;
                src_data.mem_w <= comparer.data.mem_w;
                src_data.mem_var <= comparer.data.mem_var;
                src_data.mem_color <= comparer.data.mem_color;

                case (comparer.data.in.clusters_num)
                2'd0:
                    src_data.p_max_idx <= '0;
                2'd1:
                    src_data.p_max_idx <= '0;
                2'd2:
                    if (comp_1g0)
                        src_data.p_max_idx <= 2'd1;
                    else
                        src_data.p_max_idx <= 2'd0;
                2'd3:
                    if (comp_1g0) begin
                        if (comp_2g1)
                            src_data.p_max_idx <= 2'd2;
                        else 
                            src_data.p_max_idx <= 2'd1;
                    end
                    else begin
                        if (comp_2g0)
                            src_data.p_max_idx <= 2'd2;
                        else
                            src_data.p_max_idx <= 2'd0;
                    end
                endcase
            end
        end

    // **************** Modules ****************
    // Convert mem_var to fp
    genvar k;
    generate 
        for (k = 0; k < 3; ++k) begin : converter_idx
            // mem_w
            int_convert_to_fp_wrap mem_w_converter (
                .clk, .rst,

                .snk_valid(pre_converter.valid),
                .snk_data({5'b0, mem_w_sqr[k]}),
                .snk_ready(),

                .src_ready(converter.ready),
                .src_valid(),
                .src_data(mem_w_fp[k])
            );

            // mem_var
            int_convert_to_fp_wrap mem_var_converter (
                .clk, .rst,

                .snk_valid(pre_converter.valid),
                .snk_data({5'b0, pre_converter.data.mem_var[k]}),
                .snk_ready(),

                .src_ready(converter.ready),
                .src_valid(),
                .src_data(mem_var_fp[k])
            );

            // vars
            int_convert_to_fp_wrap vars_converter (
                .clk, .rst,

                .snk_valid(pre_converter.valid),
                .snk_data({1'b0, pre_converter.data.vars[k]}),
                .snk_ready(),

                .src_ready(converter.ready),
                .src_valid(),
                .src_data(vars_fp[k])
            );
        end : converter_idx
    endgenerate

    backpressure_machine #(
        .LATENCY (INT_TO_FP_CONVERT_LATENCY),
        .DATA_EN(1),
        .DATA_WIDTH($bits(pre_converter.data))
    ) bp_converter (
        .clk, .rst,

        .snk_valid(pre_converter.valid), .snk_ready(pre_converter.ready),
        .snk_data(pre_converter.data),

        .src_ready(converter.ready), .src_valid(converter.valid),
        .src_data(converter.data)
    );

    // Divide
    generate 
        for (k = 0; k < 3; ++k) begin : divider_idx
            // Calculate (mem_w_sqr / mem_var)
            fp_div_wrap divider1 (
                .clk, .rst,

                .snk_valid(converter.valid),
                .snk_dataa(mem_w_fp[k]),
                .snk_datab(mem_var_fp[k]),
                .snk_ready(),

                .src_ready(divider.ready),
                .src_valid(),
                .src_data(div1[k])
            );

            // Calculate (vars / mem_var)
            fp_div_wrap divider2 (
                .clk, .rst,

                .snk_valid(converter.valid),
                .snk_dataa(vars_fp[k]),
                .snk_datab(mem_var_fp[k]),
                .snk_ready(),

                .src_ready(divider.ready),
                .src_valid(),
                .src_data(div2[k])
            );
        end : divider_idx
    endgenerate

    backpressure_machine #(
        .LATENCY (FP_DIV_LATENCY),
        .DATA_EN(1),
        .DATA_WIDTH($bits(converter.data))
    ) bp_div (
        .clk, .rst,

        .snk_valid(converter.valid), .snk_ready(converter.ready),
        .snk_data(converter.data),

        .src_ready(divider.ready), .src_valid(divider.valid),
        .src_data(divider.data)
    );

    // Exp
    generate 
        for (k = 0; k < 3; ++k) begin : exp_idx
            fp_exp_wrap exper1(
                .clk, .rst,

                .snk_valid(divider.valid),
                .snk_data({1'b1, div2[k][30:0]}),
                .snk_ready(),

                .src_ready(exper.ready),
                .src_valid(),
                .src_data(exp1[k])
            );
        end : exp_idx
    endgenerate

    backpressure_machine #(
        .LATENCY (FP_EXP_LATENCY),
        .DATA_EN(1),
        .DATA_WIDTH($bits(div1))
    ) bp_exp1 (
        .clk, .rst,

        .snk_valid(divider.valid), .snk_ready(),
        .snk_data(div1),

        .src_ready(exper.ready), .src_valid(),
        .src_data(div1_d)
    );

    backpressure_machine #(
        .LATENCY (FP_EXP_LATENCY),
        .DATA_EN(1),
        .DATA_WIDTH($bits(divider.data))
    ) bp_exp (
        .clk, .rst,

        .snk_valid(divider.valid), .snk_ready(divider.ready),
        .snk_data(divider.data),

        .src_ready(exper.ready), .src_valid(exper.valid),
        .src_data(exper.data)
    );

    // Mul
    generate
        for (k = 0; k < 3; ++k) begin : mul_idx
            fp_mul_wrap muler1 (
                .clk, .rst,

                .snk_valid(exper.valid),
                .snk_dataa(div1_d[k]), .snk_datab(exp1[k]),
                .snk_ready(),

                .src_ready(muler.ready),
                .src_valid(),
                .src_data(mul1[k])
            );
        end : mul_idx
    endgenerate

    backpressure_machine #(
        .LATENCY (FP_MUL_LATENCY),
        .DATA_EN(1),
        .DATA_WIDTH($bits(exper.data))
    ) bp_mul (
        .clk, .rst,

        .snk_valid(exper.valid), .snk_ready(exper.ready),
        .snk_data(exper.data),

        .src_ready(muler.ready), .src_valid(muler.valid),
        .src_data(muler.data)
    );

    // Comp (1 > 0)
    fp_comp_wrap comparer_1g0 (
        .clk, .rst,

        .snk_valid(muler.valid),
        .snk_dataa(mul1[1]), .snk_datab(mul1[0]),
        .snk_ready(),

        .src_ready(comparer.ready),
        .src_valid(),
        .src_agb(comp_1g0)
    );

    // Comp (2 > 1)
    fp_comp_wrap comparer_2g1 (
        .clk, .rst,

        .snk_valid(muler.valid),
        .snk_dataa(mul1[2]), .snk_datab(mul1[1]),
        .snk_ready(),

        .src_ready(comparer.ready),
        .src_valid(),
        .src_agb(comp_2g1)
    );

    // Comp (2 > 0)
    fp_comp_wrap comparer_2g0 (
        .clk, .rst,

        .snk_valid(muler.valid),
        .snk_dataa(mul1[2]), .snk_datab(mul1[0]),
        .snk_ready(),

        .src_ready(comparer.ready),
        .src_valid(),
        .src_agb(comp_2g0)
    );

    backpressure_machine #(
        .LATENCY (FP_COMP_LATENCY),
        .DATA_EN(1),
        .DATA_WIDTH($bits(muler.data))
    ) bp_comp (
        .clk, .rst,

        .snk_valid(muler.valid), .snk_ready(muler.ready),
        .snk_data(muler.data),

        .src_ready(comparer.ready), .src_valid(comparer.valid),
        .src_data(comparer.data)
    );


endmodule : gmm_subtract_fp_probability_pipe

`endif