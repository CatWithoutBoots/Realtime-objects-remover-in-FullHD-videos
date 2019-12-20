`ifndef BACKPRESSURE_MACHINE_SV
`define BACKPRESSURE_MACHINE_SV

//`include "gmm_structures.svh"

module backpressure_machine #(
    LATENCY = 2, // editable, must be more than 1
    DATA_EN = 0,
    DATA_WIDTH = 1
)(
    input clk, rst,

    input snk_valid,
    input[DATA_WIDTH-1:0] snk_data,
    output logic snk_ready,
    
    input src_ready,
    output logic src_valid,
    output logic[DATA_WIDTH-1:0] src_data
);
    localparam END = LATENCY-2;
    
    logic[END:0] valid_d;

    assign snk_ready = src_ready | ~src_valid;

    genvar i;
    generate 
        always_ff @(posedge clk or posedge rst) 
            if (rst)begin
                valid_d <= '0;
                src_valid <= '0;
            end
            else begin 
                if (snk_ready) begin
                    if (LATENCY > 2)
                        valid_d <= {valid_d[END-1:0], snk_valid};
                    else
                        valid_d <= snk_valid;
                end

                if (valid_d[END])
                    src_valid <= '1;
                else if (src_ready)
                    src_valid <= '0;
            end

        if (DATA_EN) begin
            logic[DATA_WIDTH-1:0] data_d [END:0];

            for (i = 0; i <= END; ++i) begin : i_idx
                always_ff @(posedge clk or posedge rst)
                    if (rst)
                        data_d[i] <= '0;
                    else if (snk_ready) begin
                        if (0 == i)
                            data_d[0] <= snk_data;
                        else
                            data_d[i] <= data_d[i-1];
                    end
            end : i_idx

            always_ff @(posedge clk or posedge rst)
                if (rst)
                    src_data <= '0;
                else if (valid_d[END] && snk_ready)
                    src_data <= data_d[END];
        end
    endgenerate
endmodule : backpressure_machine

`endif