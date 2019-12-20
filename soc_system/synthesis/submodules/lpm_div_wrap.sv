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