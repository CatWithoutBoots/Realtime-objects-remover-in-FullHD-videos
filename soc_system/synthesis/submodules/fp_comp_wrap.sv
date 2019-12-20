`ifndef FP_COMP_WRAP_SV
`define FP_COMP_WRAP_SV

module fp_comp_wrap (
    input clk, rst,

    input snk_valid,
    input[31:0] snk_dataa, snk_datab,
    output logic snk_ready,

    input src_ready,
    output logic src_valid,
    output logic src_agb
);
    localparam FP_COMP_LATENCY = 3;

    backpressure_machine #(
        .LATENCY (FP_COMP_LATENCY)
    ) bp_inst (
        .clk, .rst,

        .snk_valid, .snk_ready,
        .snk_data(),

        .src_ready, .src_valid,
        .src_data()
    );
    fp_comp_base fp_comp ( 
	    .aclr(rst),
	    .clk_en(snk_ready),
	    .clock(clk),
	    .dataa(snk_dataa),
        .datab(snk_datab),
	    .agb(src_agb)
    );
endmodule : fp_comp_wrap

`endif