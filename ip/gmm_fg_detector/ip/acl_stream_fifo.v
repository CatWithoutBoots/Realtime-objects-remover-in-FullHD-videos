// (C) 1992-2018 Intel Corporation.                            
// Intel, the Intel logo, Intel, MegaCore, NIOS II, Quartus and TalkBack words    
// and logos are trademarks of Intel Corporation or its subsidiaries in the U.S.  
// and/or other countries. Other marks and brands may be claimed as the property  
// of others. See Trademarks on intel.com for full list of Intel trademarks or    
// the Trademarks & Brands Names Database (if Intel) or See www.Intel.com/legal (if Altera) 
// Your use of Intel Corporation's design tools, logic functions and other        
// software and tools, and its AMPP partner logic functions, and any output       
// files any of the foregoing (including device programming or simulation         
// files), and any associated documentation or information are expressly subject  
// to the terms and conditions of the Altera Program License Subscription         
// Agreement, Intel MegaCore Function License Agreement, or other applicable      
// license agreement, including, without limitation, that your use is for the     
// sole purpose of programming logic devices manufactured by Intel and sold by    
// Intel or its authorized distributors.  Please refer to the applicable          
// agreement for further details.                                                 



module acl_stream_fifo
#(
    // FIFO_DEPTH must be >=0
    parameter integer FIFO_DEPTH = 0,
    parameter integer DATA_W = 32,             // > 0
    parameter integer STALL_ON_ALMOSTFULL = 0,
    parameter integer ALMOST_FULL_VALUE=-1, // < FIFO_DEPTH, -1 defaults to FIFO_DEPTH
    parameter integer USES_PACKETS = 0,
    parameter string IMPLEMENTATION_TYPE = "auto"
)
(
    input logic clock,
    input logic resetn,

    input logic                 stream_in_valid,
    input logic    [DATA_W-1:0] stream_in_data,
    output logic                stream_in_ready,
    input logic                 stream_in_startofpacket, // only used if USES_PACKETS == 1
    input logic                 stream_in_endofpacket, // only used if USES_PACKETS == 1

    input logic                 stream_out_ready,
    output logic   [DATA_W-1:0] stream_out_data,
    output logic                stream_out_valid,
    output logic                stream_out_startofpacket, // only used if USES_PACKETS == 1
    output logic                stream_out_endofpacket, // only used if USES_PACKETS == 1
    output logic                almost_full
);

    localparam ALMOST_FULL_THRESHOLD = ALMOST_FULL_VALUE == -1 ? FIFO_DEPTH : ALMOST_FULL_VALUE;
    localparam TYPE = (FIFO_DEPTH < 4) ? "ll_reg" : "ram";
    localparam INTERNAL_DATA_W = (USES_PACKETS == 1) ? (DATA_W +2) : DATA_W;
    
    logic [DATA_W+2-1:0] fifo_data_in;
    logic [DATA_W+2-1:0] fifo_data_out;

    assign fifo_data_in = {stream_in_startofpacket, stream_in_endofpacket, stream_in_data};
    assign {stream_out_startofpacket, stream_out_endofpacket, stream_out_data} = fifo_data_out;

    generate
    if (FIFO_DEPTH == 0)
    begin
        assign stream_in_ready          = stream_out_ready;
        assign stream_out_valid         = stream_in_valid;
        assign fifo_data_out            = fifo_data_in;
        assign almost_full              = ~stream_out_ready;
    end
    else if (IMPLEMENTATION_TYPE == "mlab")
    begin
        logic stall_out;
        acl_fifo
        #(
            .DATA_WIDTH(INTERNAL_DATA_W),
            .DEPTH(FIFO_DEPTH),
            .ALMOST_FULL_VALUE(ALMOST_FULL_THRESHOLD),
            .LPM_HINT("RAM_BLOCK_TYPE=MLAB")
        )
        fifo
        (
            .clock     (clock),
            .resetn    (resetn), 
            .data_in   (fifo_data_in[INTERNAL_DATA_W-1:0]),
            .valid_in  (stream_in_valid),
            .stall_out (stall_out),
            .data_out  (fifo_data_out[INTERNAL_DATA_W-1:0]),
            .stall_in  (~stream_out_ready),
            .valid_out (stream_out_valid),
            .almost_full(almost_full)
        );
        assign stream_in_ready = STALL_ON_ALMOSTFULL ? ~almost_full : ~stall_out;
    end
    else
    begin
        logic stall_out;
        acl_data_fifo
        #(
            .DATA_WIDTH(INTERNAL_DATA_W),
            .DEPTH(FIFO_DEPTH),
            .IMPL(TYPE),
            .ALMOST_FULL_VALUE(ALMOST_FULL_THRESHOLD),
            .ALLOW_FULL_WRITE(1)
        )
        fifo
        (
            .clock     (clock),
            .resetn    (resetn), 
            .data_in   (fifo_data_in[INTERNAL_DATA_W-1:0]),
            .valid_in  (stream_in_valid),
            .stall_out (stall_out),
            .data_out  (fifo_data_out[INTERNAL_DATA_W-1:0]),
            .stall_in  (~stream_out_ready),
            .valid_out (stream_out_valid),
            .almost_full(almost_full)
        );
        assign stream_in_ready = STALL_ON_ALMOSTFULL ? ~almost_full : ~stall_out;
    end
    endgenerate

endmodule

// vim:set filetype=verilog:
