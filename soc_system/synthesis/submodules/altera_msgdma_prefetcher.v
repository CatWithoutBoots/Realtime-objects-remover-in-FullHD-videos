// (C) 2001-2018 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

module altera_msgdma_prefetcher #(
    parameter ENHANCED_FEATURES = 0,
    parameter ENABLE_READ_BURST = 0,
    parameter MAX_READ_BURST_COUNT = 4,
    parameter MAX_READ_BURST_COUNT_WIDTH = 3,
    parameter DATA_WIDTH = 32,
    parameter DATA_BYTEENABLE_WIDTH = 4,
    parameter DESCRIPTOR_WIDTH = 128,
    parameter ADDRESS_WIDTH = 32,
    parameter RESPONSE_FIFO_DEPTH   = 256,
    parameter RESPONSE_FIFO_DEPTH_LOG2 = 7

) (
    input                                           clk,
    input                                           reset,
    input [DATA_WIDTH-1:0]                          mm_read_readdata,
    input                                           mm_read_waitrequest,
    input                                           mm_read_readdatavalid,
    input                                           st_src_descr_ready,
    input                                           mm_write_waitrequest,
    input                                           mm_write_writeresponsevalid,
    input [1:0]                                     mm_write_response,  // don't care the response status
    input                                           st_snk_valid,
    input [255:0]                                   st_snk_data,
    input [2:0]                                     mm_csr_address,
    input                                           mm_csr_write,
    input                                           mm_csr_read,
    input [31:0]                                    mm_csr_writedata,
    
    output [ADDRESS_WIDTH-1:0]                      mm_read_address,
    output                                          mm_read_read,
    output [MAX_READ_BURST_COUNT_WIDTH-1:0]         mm_read_burstcount,
    output                                          st_src_descr_valid,
    output [DESCRIPTOR_WIDTH-1:0]                   st_src_descr_data,
    output [ADDRESS_WIDTH-1:0]                      mm_write_address,
    output                                          mm_write_write,
    output [DATA_WIDTH-1:0]                         mm_write_writedata,
    output [DATA_BYTEENABLE_WIDTH-1:0]              mm_write_byteenable,
    output                                          st_snk_ready,
    output                                          csr_irq,
    output [31:0]                                   mm_csr_readdata




);




localparam RESPONSE_FIFO_WIDTH  = (ENHANCED_FEATURES == 1) ? 96 : 64;


wire                            run;
wire                            reset_prefetcher;
wire [31:0]                     nxt_desc_ptr_low;
wire [31:0]                     nxt_desc_ptr_high;
wire                            desc_poll_en;
wire [15:0]                     desc_poll_freq;
wire                            put_resp_fifo;
wire [RESPONSE_FIFO_WIDTH-1:0]  resp_fifo_wdata;
wire                            clear_run;
wire                            update_nxt_desc_ptr;
wire [63:0]                     updated_ptr_desc;
wire [RESPONSE_FIFO_WIDTH-1:0]  resp_fifo_rdata;
wire                            get_resp_fifo;
wire                            park_mode;
wire                            write_back_done;
wire                            transfer_complete_irq_mask;
wire [7:0]                      error_irq_mask;
wire                            early_termination_irq_mask;
wire [7:0]                      error;
wire                            early_termination;
wire                            clear_irq;
wire                            global_interrupt_enable_mask;
wire                            reset_complete_from_read;
wire                            reset_complete_from_write_back;
wire                            reset_complete;
wire                            resp_fifo_full;



altera_msgdma_prefetcher_read #(
    .ENHANCED_FEATURES              (ENHANCED_FEATURES),
    .ENABLE_READ_BURST              (ENABLE_READ_BURST),
    .MAX_READ_BURST_COUNT           (MAX_READ_BURST_COUNT),
    .MAX_READ_BURST_COUNT_WIDTH     (MAX_READ_BURST_COUNT_WIDTH),
    .DATA_WIDTH                     (DATA_WIDTH),
    .ADDRESS_WIDTH                  (ADDRESS_WIDTH),
    .DESCRIPTOR_WIDTH               (DESCRIPTOR_WIDTH),
    .RESPONSE_FIFO_WIDTH            (RESPONSE_FIFO_WIDTH)
) u_prefetcher_read (
    // inputs
    .clk                                (clk),
    .reset                              (reset),
    .mm_read_readdata                   (mm_read_readdata),
    .mm_read_waitrequest                (mm_read_waitrequest),
    .mm_read_readdatavalid              (mm_read_readdatavalid),
    .st_src_descr_ready                 (st_src_descr_ready),
    .run                                (run),
    .reset_prefetcher                   (reset_prefetcher),
    .nxt_desc_ptr_low                   (nxt_desc_ptr_low),
    .nxt_desc_ptr_high                  (nxt_desc_ptr_high),
    .desc_poll_en                       (desc_poll_en),
    .desc_poll_freq                     (desc_poll_freq),
    .resp_fifo_full                     (resp_fifo_full),
    // outputs
    .mm_read_address                    (mm_read_address),
    .mm_read_read                       (mm_read_read),
    .mm_read_burstcount                 (mm_read_burstcount),
    .st_src_descr_valid                 (st_src_descr_valid),
    .st_src_descr_data                  (st_src_descr_data),
    .put_resp_fifo                      (put_resp_fifo),
    .resp_fifo_wdata                    (resp_fifo_wdata),
    .clear_run                          (clear_run),
    .update_nxt_desc_ptr                (update_nxt_desc_ptr),
    .updated_ptr_desc                   (updated_ptr_desc),
    .reset_complete                     (reset_complete_from_read)

);



altera_msgdma_prefetcher_write_back #(
    .ENHANCED_FEATURES          (ENHANCED_FEATURES),
    .DATA_WIDTH                 (DATA_WIDTH),
    .DATA_BYTEENABLE_WIDTH      (DATA_BYTEENABLE_WIDTH),
    .ADDRESS_WIDTH              (ADDRESS_WIDTH),
    .RESPONSE_FIFO_WIDTH        (RESPONSE_FIFO_WIDTH)
) u_prefetcher_write_back (
    // inputs
    .clk                            (clk),
    .reset                          (reset),
    .mm_write_waitrequest           (mm_write_waitrequest),
    .mm_write_response              (mm_write_response),
    .mm_write_writeresponsevalid    (mm_write_writeresponsevalid),
    .st_snk_valid                   (st_snk_valid),
    .st_snk_data                    (st_snk_data),
    .resp_fifo_rdata                (resp_fifo_rdata),
    .park_mode                      (park_mode),
    .run                            (run),
    .reset_prefetcher               (reset_prefetcher),
    // outputs
    .mm_write_address               (mm_write_address),
    .mm_write_write                 (mm_write_write),
    .mm_write_writedata             (mm_write_writedata),
    .mm_write_byteenable            (mm_write_byteenable),
    .st_snk_ready                   (st_snk_ready),
    .get_resp_fifo                  (get_resp_fifo),
    .write_back_done                (write_back_done),
    .transfer_complete_irq_mask     (transfer_complete_irq_mask),
    .error_irq_mask                 (error_irq_mask),
    .early_termination_irq_mask     (early_termination_irq_mask),
    .error                          (error),
    .early_termination              (early_termination),
    .reset_complete                 (reset_complete_from_write_back)

);



altera_msgdma_prefetcher_fifo #(
    .RESPONSE_FIFO_WIDTH        (RESPONSE_FIFO_WIDTH),
    .RESPONSE_FIFO_DEPTH        (RESPONSE_FIFO_DEPTH),
    .RESPONSE_FIFO_DEPTH_LOG2   (RESPONSE_FIFO_DEPTH_LOG2),
    .LATENCY                    (2)
) u_prefetcher_fifo (
    // inputs
    .clk        (clk),
    .areset     (reset),
    .sreset     (reset_complete),
    .wr_data    (resp_fifo_wdata),
    .wrreq      (put_resp_fifo),
    .rdreq      (get_resp_fifo),
    // outputs
    .full       (resp_fifo_full),
    .rd_data    (resp_fifo_rdata)

);



altera_msgdma_prefetcher_csr u_prefetcher_csr (
    // inputs
    .clk                            (clk),
    .reset                          (reset),
    .mm_csr_address                 (mm_csr_address),
    .mm_csr_write                   (mm_csr_write),
    .mm_csr_read                    (mm_csr_read),
    .mm_csr_writedata               (mm_csr_writedata),
    .clear_run                      (clear_run),
    .reset_complete                 (reset_complete),
    .irq                            (csr_irq),
    .update_nxt_desc_ptr            (update_nxt_desc_ptr),
    .updated_ptr_desc               (updated_ptr_desc),
    // outputs
    .mm_csr_readdata                (mm_csr_readdata),
    .run                            (run),
    .reset_prefetcher               (reset_prefetcher),
    .clear_irq                      (clear_irq),
    .nxt_desc_ptr_low               (nxt_desc_ptr_low),
    .nxt_desc_ptr_high              (nxt_desc_ptr_high),
    .desc_poll_en                   (desc_poll_en),
    .desc_poll_freq                 (desc_poll_freq),
    .global_interrupt_enable_mask   (global_interrupt_enable_mask),
    .park_mode                      (park_mode)

);



altera_msgdma_prefetcher_interrupt u_prefetcher_interrupt (
    // inputs
    .clk                                (clk),
    .reset                              (reset),
    .write_back_done                    (write_back_done), 
    .transfer_complete_irq_mask         (transfer_complete_irq_mask),
    .error_irq_mask                     (error_irq_mask),
    .early_termination_irq_mask         (early_termination_irq_mask),
    .error                              (error),
    .early_termination                  (early_termination),
    .clear_irq                          (clear_irq),
    .global_interrupt_enable_mask       (global_interrupt_enable_mask),
    // outputs
    .irq                                (csr_irq)

);


assign reset_complete = reset_complete_from_read & reset_complete_from_write_back;

endmodule
