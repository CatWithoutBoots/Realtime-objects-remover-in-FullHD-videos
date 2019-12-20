`ifndef FP_EXP_WRAP_SV
`define FP_EXP_WRAP_SV

module fp_exp_wrap (
    input clk, rst,

    input snk_valid,
    input[31:0] snk_data,
    output logic snk_ready,

    input src_ready,
    output logic src_valid,
    output logic[31:0] src_data
);
    localparam FP_EXP_LATENCY = 17;

    backpressure_machine #(
        .LATENCY (FP_EXP_LATENCY)
    ) bp_inst (
        .clk, .rst,

        .snk_valid, .snk_ready,
        .snk_data(),

        .src_ready, .src_valid,
        .src_data()
    );

    fp_exp_base fp_exp ( 
	    .aclr(rst),
	    .clk_en(snk_ready),
	    .clock(clk),
	    .data(snk_data),
	    .result(src_data)
    );
endmodule : fp_exp_wrap

`endif