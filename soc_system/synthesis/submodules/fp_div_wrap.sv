`ifndef FP_DIV_WRAP_SV
`define FP_DIV_WRAP_SV

module fp_div_wrap (
    input clk, rst,

    input snk_valid,
    input[31:0] snk_dataa,
    input[31:0] snk_datab,
    output logic snk_ready,

    input src_ready,
    output logic src_valid,
    output logic[31:0] src_data
);
    localparam FP_DIV_LATENCY = 33;

    backpressure_machine #(
        .LATENCY (FP_DIV_LATENCY)
    ) bp_inst (
        .clk, .rst,

        .snk_valid, .snk_ready,
        .snk_data(),

        .src_ready, .src_valid,
        .src_data()
    );

    fp_div_base fp_div0 ( 
	    .aclr(rst),
	    .clk_en(snk_ready),
	    .clock(clk),
	    .dataa(snk_dataa),
	    .datab(snk_datab),
	    .result(src_data)
    );
endmodule : fp_div_wrap

`endif