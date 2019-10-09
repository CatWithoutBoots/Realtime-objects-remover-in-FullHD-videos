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