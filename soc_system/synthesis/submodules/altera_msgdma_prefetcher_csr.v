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

module altera_msgdma_prefetcher_csr (
    input               clk,
    input               reset,

    input [2:0]         mm_csr_address,
    input               mm_csr_write,
    input               mm_csr_read,
    input [31:0]        mm_csr_writedata,

    output reg [31:0]   mm_csr_readdata,

    input               clear_run,
    input               reset_complete,
    input               irq,
    input               update_nxt_desc_ptr,
    input [63:0]        updated_ptr_desc,

    output reg          run,
    output reg          reset_prefetcher,
    output              clear_irq,
    output reg [31:0]   nxt_desc_ptr_low,
    output reg [31:0]   nxt_desc_ptr_high,
    output reg          desc_poll_en,
    output reg [15:0]   desc_poll_freq,
    output reg          global_interrupt_enable_mask,
    output reg          park_mode

);


wire        control_access;
wire        nxt_desc_ptr_low_access;
wire        nxt_desc_ptr_high_access;
wire        desc_poll_freq_access;
wire        status_access;
wire        reset_prefetcher_nxt;
wire        run_nxt;

wire [31:0] mm_csr_readdata_nxt;
wire [31:0] control_int;
wire [31:0] nxt_desc_ptr_low_int;
wire [31:0] nxt_desc_ptr_high_int;
wire [31:0] desc_poll_freq_int;
wire [31:0] status_int;

wire        control_read;
wire        nxt_desc_ptr_low_read;
wire        nxt_desc_ptr_high_read;
wire        desc_poll_freq_read;
wire        status_read;


//--------------------------------------------------------------------------------------------//
// address decode
//--------------------------------------------------------------------------------------------//
assign control_access               = (mm_csr_address == 3'h0);
assign nxt_desc_ptr_low_access      = (mm_csr_address == 3'h1);
assign nxt_desc_ptr_high_access     = (mm_csr_address == 3'h2);
assign desc_poll_freq_access        = (mm_csr_address == 3'h3);
assign status_access                = (mm_csr_address == 3'h4);

//--------------------------------------------------------------------------------------------//
// read decode
//--------------------------------------------------------------------------------------------//
assign control_read             = control_access & mm_csr_read;
assign nxt_desc_ptr_low_read    = nxt_desc_ptr_low_access & mm_csr_read; 
assign nxt_desc_ptr_high_read   = nxt_desc_ptr_high_access & mm_csr_read; 
assign desc_poll_freq_read      = desc_poll_freq_access & mm_csr_read;
assign status_read              = status_access & mm_csr_read;




//--------------------------------------------------------------------------------------------//
// park mode bit
//--------------------------------------------------------------------------------------------//
always @(posedge clk or posedge reset) begin
    if (reset)
        park_mode   <= 1'b0;
    else if (mm_csr_write & control_access)
        park_mode   <= mm_csr_writedata[4];
end



//--------------------------------------------------------------------------------------------//
// global interrupt enable mask bit
//--------------------------------------------------------------------------------------------//
always @(posedge clk or posedge reset) begin
    if (reset)
        global_interrupt_enable_mask    <= 1'b0;
    else if (mm_csr_write & control_access)
        global_interrupt_enable_mask   <= mm_csr_writedata[3];
end



//--------------------------------------------------------------------------------------------//
// reset prefetcher bit
//--------------------------------------------------------------------------------------------//
always @(posedge clk or posedge reset) begin
    if (reset)
        reset_prefetcher    <= 1'b0;
    else
        reset_prefetcher    <= reset_prefetcher_nxt;
end

assign reset_prefetcher_nxt = reset_prefetcher ? ~reset_complete : (mm_csr_write & control_access & mm_csr_writedata[2]); 



//--------------------------------------------------------------------------------------------//
// descriptor poll en bit
//--------------------------------------------------------------------------------------------//
always @(posedge clk or posedge reset) begin
    if (reset)
        desc_poll_en    <= 1'b0;
    else if (mm_csr_write & control_access)
        desc_poll_en   <= mm_csr_writedata[1];
end



//--------------------------------------------------------------------------------------------//
// run bit
//--------------------------------------------------------------------------------------------//
always @(posedge clk or posedge reset) begin
    if (reset)
        run     <= 1'b0;
    else
        run     <= run_nxt;
end

assign run_nxt = run ? ~clear_run : (mm_csr_write & control_access & mm_csr_writedata[0]); 



//--------------------------------------------------------------------------------------------//
// next descriptor pointer low
//--------------------------------------------------------------------------------------------//
always @(posedge clk or posedge reset) begin
    if (reset)
        nxt_desc_ptr_low    <= 32'h0;
    else if (mm_csr_write & nxt_desc_ptr_low_access)
        nxt_desc_ptr_low    <= mm_csr_writedata;
    else if (update_nxt_desc_ptr)
        nxt_desc_ptr_low    <= updated_ptr_desc[31:0];
end


//--------------------------------------------------------------------------------------------//
// next descriptor pointer high
//--------------------------------------------------------------------------------------------//
always @(posedge clk or posedge reset) begin
    if (reset)
        nxt_desc_ptr_high    <= 32'h0;
    else if (mm_csr_write & nxt_desc_ptr_high_access)
        nxt_desc_ptr_high    <= mm_csr_writedata;
    else if (update_nxt_desc_ptr)
        nxt_desc_ptr_high    <= updated_ptr_desc[63:32];
end




//--------------------------------------------------------------------------------------------//
// descriptor poll freq
//--------------------------------------------------------------------------------------------//
always @(posedge clk or posedge reset) begin
    if (reset)
        desc_poll_freq  <= 16'h0;
    else if (mm_csr_write & desc_poll_freq_access)
        desc_poll_freq  <= mm_csr_writedata[15:0];
end



//--------------------------------------------------------------------------------------------//
// irq status clear event 
//--------------------------------------------------------------------------------------------//
assign clear_irq = mm_csr_write & status_access & mm_csr_writedata[0];

//--------------------------------------------------------------------------------------------//
// readdata register
//--------------------------------------------------------------------------------------------//
always @(posedge clk or posedge reset) begin
    if (reset)
        mm_csr_readdata <= 32'h0;
    else
        mm_csr_readdata <= mm_csr_readdata_nxt;
end



assign control_int              = {27'h0, park_mode, global_interrupt_enable_mask, reset_prefetcher, desc_poll_en, run};
assign nxt_desc_ptr_low_int     = nxt_desc_ptr_low; 
assign nxt_desc_ptr_high_int    = nxt_desc_ptr_high; 
assign desc_poll_freq_int       = {16'h0, desc_poll_freq};
assign status_int               = {31'h0, irq};

assign mm_csr_readdata_nxt      =   (control_int            & {32{control_read}}            )   |
                                    (nxt_desc_ptr_low_int   & {32{nxt_desc_ptr_low_read}}   )   |
                                    (nxt_desc_ptr_high_int  & {32{nxt_desc_ptr_high_read}}  )   |
                                    (desc_poll_freq_int     & {32{desc_poll_freq_read}}     )   |
                                    (status_int             & {32{status_read}}             );



endmodule
