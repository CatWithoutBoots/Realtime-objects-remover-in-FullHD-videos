`ifndef INT_CONVERT_TO_FP_WRAP_SV
`define INT_CONVERT_TO_FP_WRAP_SV

module int_convert_to_fp_wrap (
    input clk, rst,

    input snk_valid,
    input[20:0] snk_data,
    output logic snk_ready,

    input src_ready,
    output logic src_valid,
    output logic[31:0] src_data
);
    localparam INT_TO_FP_CONVERT_LATENCY = 6;

    backpressure_machine #(
        .LATENCY (INT_TO_FP_CONVERT_LATENCY)
    ) bp_inst (
        .clk, .rst,

        .snk_valid, .snk_ready,
        .snk_data(),

        .src_ready, .src_valid,
        .src_data()
    );

    int_convert_to_fp_base fp_convert0 ( 
        .aclr(rst),
        .clk_en(snk_ready),
        .clock(clk),
        .dataa(snk_data),
        .result(src_data)
    );
endmodule : int_convert_to_fp_wrap

`endif