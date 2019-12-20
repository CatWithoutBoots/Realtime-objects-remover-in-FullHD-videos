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

module altera_msgdma_prefetcher_read #(
    parameter ENHANCED_FEATURES = 0,
    parameter ENABLE_READ_BURST = 0,
    parameter MAX_READ_BURST_COUNT = 4,
    parameter MAX_READ_BURST_COUNT_WIDTH = 3,
    parameter DATA_WIDTH = 32,
    parameter ADDRESS_WIDTH = 32,
    parameter DESCRIPTOR_WIDTH = 128,
    parameter RESPONSE_FIFO_WIDTH = 64

) (
    input                                           clk,
    input                                           reset,

    input [DATA_WIDTH-1:0]                          mm_read_readdata,
    input                                           mm_read_waitrequest,
    input                                           mm_read_readdatavalid,
    output reg [ADDRESS_WIDTH-1:0]                  mm_read_address,
    output reg                                      mm_read_read,
    output [MAX_READ_BURST_COUNT_WIDTH-1:0]         mm_read_burstcount,

    input                                           st_src_descr_ready,
    output reg                                      st_src_descr_valid,
    output [DESCRIPTOR_WIDTH-1:0]                   st_src_descr_data,

    input                                           resp_fifo_full,
    output                                          put_resp_fifo,
    output [RESPONSE_FIFO_WIDTH-1:0]                resp_fifo_wdata,

    input                                           run,
    input                                           reset_prefetcher,
    input [31:0]                                    nxt_desc_ptr_low,
    input [31:0]                                    nxt_desc_ptr_high,
    input                                           desc_poll_en,
    input [15:0]                                    desc_poll_freq,
    output                                          clear_run,
    output reg                                      update_nxt_desc_ptr,
    output [63:0]                                   updated_ptr_desc,
    output reg                                      reset_complete

);



// y = log2(x)
function integer log2;
    input integer x;
    begin
        x = x-1;
        for(log2=0; x>0; log2=log2+1)
            x = x>>1;
    end
endfunction


localparam PREFETCHER_DESCRIPTOR_WIDTH  = DESCRIPTOR_WIDTH * 2;
localparam NUM_RD_REQ                   = (ENABLE_READ_BURST == 1) ? (PREFETCHER_DESCRIPTOR_WIDTH / (DATA_WIDTH * MAX_READ_BURST_COUNT)) : (PREFETCHER_DESCRIPTOR_WIDTH / DATA_WIDTH);
localparam NUM_TOTAL_BURST_BEAT         = PREFETCHER_DESCRIPTOR_WIDTH / DATA_WIDTH;
localparam RD_REQ_CNT_WIDTH             = (NUM_RD_REQ == 1) ? 1 : log2(NUM_RD_REQ);
localparam BURST_BEAT_CNT_WIDTH         = (NUM_TOTAL_BURST_BEAT == 1) ? 1 : log2(NUM_TOTAL_BURST_BEAT);
localparam RD_ADDR_INCR                 = (ENABLE_READ_BURST == 1) ? ((DATA_WIDTH * MAX_READ_BURST_COUNT) / 8) : (DATA_WIDTH / 8);
localparam DESCRIPTOR_DEPTH             = PREFETCHER_DESCRIPTOR_WIDTH / DATA_WIDTH;



reg [3:0]                       ctrl_state;
reg [3:0]                       ctrl_state_nxt;
reg                             mm_read_read_nxt;
reg [RD_REQ_CNT_WIDTH-1:0]      rd_req_cnt;
reg [RD_REQ_CNT_WIDTH-1:0]      rd_req_cnt_nxt;
reg [BURST_BEAT_CNT_WIDTH-1:0]  rd_burst_cnt;
reg [BURST_BEAT_CNT_WIDTH-1:0]  rd_burst_cnt_nxt;
reg [ADDRESS_WIDTH-1:0]         ptr_desc;
reg [DATA_WIDTH-1:0]            descriptor_internal [0:DESCRIPTOR_DEPTH-1];
reg [15:0]                      poll_cnt;
reg [15:0]                      poll_cnt_nxt;
reg                             load_from_ptr_reg;


wire                                rd_wait_done;
wire                                rd_pend_done;
wire                                poll_wait_done;
wire                                owned_by_hardware;
wire                                set_mm_read_read;
wire                                clr_mm_read_read;
wire [63:0]                         ptr_reg;
wire                                load_ptr_reg;
wire [ADDRESS_WIDTH-1:0]            ptr_desc_nxt;
wire [ADDRESS_WIDTH-1:0]            nxt_desc_ptr_to_fifo_unmask;
wire [RESPONSE_FIFO_WIDTH-33:0]     nxt_desc_ptr_to_fifo;
wire                                poll_load_state;
wire                                wr_req_state;
wire                                rd_req_state;
wire                                clr_run_state;
wire                                idle_state;
wire                                wr_done_state;
wire                                reset_complete_nxt;

localparam [3:0]    IDLE        = 4'b0000; 
localparam [3:0]    RD_REQ      = 4'b0001; 
localparam [3:0]    RD_WAIT     = 4'b0010; 
localparam [3:0]    RD_PEND     = 4'b0011; 
localparam [3:0]    RD_DONE     = 4'b0100; 
localparam [3:0]    WR_REQ      = 4'b0101; 
localparam [3:0]    WR_WAIT     = 4'b0110; 
localparam [3:0]    WR_DONE     = 4'b0111; 
localparam [3:0]    POLL_LOAD   = 4'b1000; 
localparam [3:0]    POLL_WAIT   = 4'b1001; 
localparam [3:0]    CLR_RUN     = 4'b1010; 



//--------------------------------------------------------------------------------------------//
// Main FSM
//--------------------------------------------------------------------------------------------//
always @(posedge clk or posedge reset) begin
    if (reset)
        ctrl_state  <= IDLE;
    else
        ctrl_state  <= ctrl_state_nxt;
end



always @* begin
    case (ctrl_state)
        IDLE: begin
            if (run & ~reset_prefetcher)
                ctrl_state_nxt  = RD_REQ;
            else
                ctrl_state_nxt  = IDLE;
        end

        RD_REQ: begin
            ctrl_state_nxt  = RD_WAIT;
        end
        
        RD_WAIT: begin
            if (rd_wait_done)
                ctrl_state_nxt  = RD_PEND;
            else
                ctrl_state_nxt  = RD_WAIT;
        end

        RD_PEND: begin
            if (rd_pend_done)
                ctrl_state_nxt  = RD_DONE;
            else
                ctrl_state_nxt  = RD_PEND;
        end

        RD_DONE: begin
            if (reset_prefetcher | (~owned_by_hardware & ~desc_poll_en)) // The completion of read request will be the point where reset_prefetcher takes effects
                ctrl_state_nxt  = CLR_RUN;
            else if (desc_poll_en & ~owned_by_hardware)
                ctrl_state_nxt  = POLL_LOAD;
            else if (owned_by_hardware & ~resp_fifo_full)
                ctrl_state_nxt  = WR_REQ;
            else
                ctrl_state_nxt  = RD_DONE;
        end

        WR_REQ: begin
            ctrl_state_nxt  = WR_WAIT;
        end

        WR_WAIT: begin
            if (st_src_descr_ready)
                ctrl_state_nxt  = WR_DONE;
            else
                ctrl_state_nxt  = WR_WAIT;
        end
        
        WR_DONE: begin
            ctrl_state_nxt  = RD_REQ;
        end

        POLL_LOAD: begin
            ctrl_state_nxt  = POLL_WAIT;
        end

        POLL_WAIT: begin
            if (poll_wait_done)
                ctrl_state_nxt  = RD_REQ;
            else
                ctrl_state_nxt  = POLL_WAIT;
        end

        CLR_RUN: begin
            ctrl_state_nxt  = IDLE;
        end

        default: begin
            ctrl_state_nxt  = IDLE;
        end

    endcase
end



//--------------------------------------------------------------------------------------------//
// RD REQ Counter
//--------------------------------------------------------------------------------------------//
always @(posedge clk or posedge reset) begin
    if (reset)
        rd_req_cnt  <= 0;
    else
        rd_req_cnt  <= rd_req_cnt_nxt;
end

always @* begin
    if (set_mm_read_read)
        rd_req_cnt_nxt = (NUM_RD_REQ - 1);
    else if ((rd_req_cnt > 0) & mm_read_read & ~mm_read_waitrequest)
        rd_req_cnt_nxt = rd_req_cnt - 1;
    else
        rd_req_cnt_nxt = rd_req_cnt;
end



//--------------------------------------------------------------------------------------------//
// RD BURST BEAT Counter
//--------------------------------------------------------------------------------------------//
always @(posedge clk or posedge reset) begin
    if (reset)
        rd_burst_cnt    <= 0;
    else
        rd_burst_cnt    <= rd_burst_cnt_nxt;
end

always @* begin
    if (set_mm_read_read)
        rd_burst_cnt_nxt = (NUM_TOTAL_BURST_BEAT - 1);
    else if ((rd_burst_cnt > 0) & mm_read_readdatavalid)
        rd_burst_cnt_nxt = rd_burst_cnt - 1;
    else
        rd_burst_cnt_nxt = rd_burst_cnt;
end



//--------------------------------------------------------------------------------------------//
// Descriptor Poll Counter
//--------------------------------------------------------------------------------------------//
always @(posedge clk or posedge reset) begin
    if (reset)
        poll_cnt    <= 0;
    else
        poll_cnt    <= poll_cnt_nxt;
end

always @* begin
    if (poll_load_state)
        poll_cnt_nxt = desc_poll_freq;
    else if (poll_cnt > 0)
        poll_cnt_nxt = poll_cnt - 1;
    else
        poll_cnt_nxt = poll_cnt;
end



//--------------------------------------------------------------------------------------------//
// Avalon MM Read descriptor registers
//--------------------------------------------------------------------------------------------//
always @(posedge clk or posedge reset) begin
    if (reset)
        mm_read_read    <= 1'b0;
    else
        mm_read_read    <= mm_read_read_nxt;
end

always @* begin
    case ({set_mm_read_read, clr_mm_read_read})
        2'b00: mm_read_read_nxt     = mm_read_read;
        2'b01: mm_read_read_nxt     = 1'b0;
        2'b10: mm_read_read_nxt     = 1'b1;
        2'b11: mm_read_read_nxt     = mm_read_read;
        default: mm_read_read_nxt   = 1'b0;
    endcase
end



always @(posedge clk or posedge reset) begin
    if (reset)
        mm_read_address <= 0;
    else if (set_mm_read_read)
        mm_read_address <= (load_from_ptr_reg ? ptr_reg[ADDRESS_WIDTH-1:0] : ptr_desc[ADDRESS_WIDTH-1:0]);
    else if (mm_read_read & ~mm_read_waitrequest)
        mm_read_address <= mm_read_address + RD_ADDR_INCR;
    else
        mm_read_address <= mm_read_address;
end

assign mm_read_burstcount = MAX_READ_BURST_COUNT;   // If read burst mode is disabled, this signal is not exported out at mSGDMA top level 




//--------------------------------------------------------------------------------------------//
// Descriptor internal register
//--------------------------------------------------------------------------------------------//
genvar i;
generate
    for (i=0; i<DESCRIPTOR_DEPTH; i=i+1) begin : descriptor_array_loop
        always @(posedge clk or posedge reset) begin
            if (reset)
                descriptor_internal[DESCRIPTOR_DEPTH-1-i] <= {DATA_WIDTH{1'b0}};
            else if (mm_read_readdatavalid & (rd_burst_cnt == i))
                descriptor_internal[DESCRIPTOR_DEPTH-1-i] <= mm_read_readdata;
        end
    end
endgenerate


always @(posedge clk or posedge reset) begin
    if (reset)
        ptr_desc    <= 0;
    else if (wr_done_state)
        ptr_desc    <= ptr_desc_nxt;
    else
        ptr_desc    <= ptr_desc;
end


always @(posedge clk or posedge reset) begin
    if (reset)
        update_nxt_desc_ptr     <= 1'b0;
    else if (wr_done_state & desc_poll_en)
        update_nxt_desc_ptr     <= 1'b1;
    else
        update_nxt_desc_ptr     <= 1'b0;
end

generate
if (ADDRESS_WIDTH == 64) begin
    assign updated_ptr_desc = ptr_desc;
end
else begin
    assign updated_ptr_desc = {{(64 - ADDRESS_WIDTH){1'b0}}, ptr_desc};
end
endgenerate


always @(posedge clk or posedge reset) begin
    if (reset)
        load_from_ptr_reg   <= 1'b0;
    else if (load_ptr_reg)
        load_from_ptr_reg   <= 1'b1;
    else if (wr_done_state)
        load_from_ptr_reg   <= 1'b0;
end

assign nxt_desc_ptr_to_fifo_unmask = load_from_ptr_reg ? ptr_reg[ADDRESS_WIDTH-1:0] : ptr_desc; 

generate
if (ENHANCED_FEATURES) begin
    if (ADDRESS_WIDTH == 64) begin
        assign nxt_desc_ptr_to_fifo = nxt_desc_ptr_to_fifo_unmask;
    end
    else begin
        assign nxt_desc_ptr_to_fifo = {{(64 - ADDRESS_WIDTH){1'b0}}, nxt_desc_ptr_to_fifo_unmask};
    end
end
else begin
    if (ADDRESS_WIDTH == 32) begin
        assign nxt_desc_ptr_to_fifo = nxt_desc_ptr_to_fifo_unmask;
    end
    else begin
        assign nxt_desc_ptr_to_fifo = {{(32 - ADDRESS_WIDTH){1'b0}}, nxt_desc_ptr_to_fifo_unmask};
    end
end
endgenerate


//--------------------------------------------------------------------------------------------//
// Avalon ST Write Dispatcher registers
//--------------------------------------------------------------------------------------------//
always @(posedge clk or posedge reset) begin
    if (reset)
        st_src_descr_valid  <= 1'b0;
    else if (wr_req_state)
        st_src_descr_valid  <= 1'b1;
    else if (st_src_descr_valid & st_src_descr_ready)
        st_src_descr_valid  <= 1'b0;
    else
        st_src_descr_valid  <= st_src_descr_valid;
end




//--------------------------------------------------------------------------------------------//
// Reset Prefetcher Complete bit
//--------------------------------------------------------------------------------------------//
always @(posedge clk or posedge reset) begin
    if (reset)
        reset_complete  <= 1'b0;
    else
        reset_complete  <= reset_complete_nxt;
end

assign reset_complete_nxt = reset_complete ? reset_prefetcher : (reset_prefetcher & (idle_state | clr_run_state));




//--------------------------------------------------------------------------------------------//
// Combinatorial assignment
//--------------------------------------------------------------------------------------------//
assign rd_req_state         = (ctrl_state == RD_REQ);
assign poll_load_state      = (ctrl_state == POLL_LOAD);
assign wr_req_state         = (ctrl_state == WR_REQ);
assign clr_run_state        = (ctrl_state == CLR_RUN);
assign idle_state           = (ctrl_state == IDLE);
assign wr_done_state        = (ctrl_state == WR_DONE); 

assign set_mm_read_read     = rd_req_state;
assign clr_mm_read_read     = (ctrl_state == RD_WAIT) & (ctrl_state_nxt != RD_WAIT);
assign load_ptr_reg         = (ctrl_state == IDLE) & (ctrl_state_nxt == RD_REQ);

assign ptr_reg              = {nxt_desc_ptr_high, nxt_desc_ptr_low};

assign rd_wait_done         = (rd_req_cnt == 0) & mm_read_read & ~mm_read_waitrequest;      
assign rd_pend_done         = (rd_burst_cnt == 0) & mm_read_readdatavalid;
assign poll_wait_done       = (poll_cnt == 0);
assign clear_run            = clr_run_state | (idle_state & run & reset_prefetcher);
assign put_resp_fifo        = wr_done_state;

generate
if (ENHANCED_FEATURES) begin

    if (DATA_WIDTH == 32) begin
        assign ptr_desc_nxt         = {descriptor_internal[11][31:0], descriptor_internal[3][31:0]};
        assign owned_by_hardware    = descriptor_internal[15][30];
        assign st_src_descr_data    = {2'b10, descriptor_internal[15][29:0], descriptor_internal[10][31:0], descriptor_internal[9][31:0], descriptor_internal[8][31:0], descriptor_internal[7][31:0], descriptor_internal[2][31:0], descriptor_internal[1][31:0], descriptor_internal[0][31:0]};
        assign resp_fifo_wdata      = {descriptor_internal[15][31:0], nxt_desc_ptr_to_fifo};
    end
    else if (DATA_WIDTH == 64) begin
        assign ptr_desc_nxt         = {descriptor_internal[5][63:32], descriptor_internal[1][63:32]};
        assign owned_by_hardware    = descriptor_internal[7][62];
        assign st_src_descr_data    = {2'b10, descriptor_internal[7][61:32], descriptor_internal[5][31:0], descriptor_internal[4][63:0], descriptor_internal[3][63:32], descriptor_internal[1][31:0], descriptor_internal[0][63:0]};
        assign resp_fifo_wdata      = {descriptor_internal[7][63:32], nxt_desc_ptr_to_fifo};
    end
    else if (DATA_WIDTH == 128) begin
        assign ptr_desc_nxt         = {descriptor_internal[2][127:96], descriptor_internal[0][127:96]};
        assign owned_by_hardware    = descriptor_internal[3][126];
        assign st_src_descr_data    = {2'b10, descriptor_internal[3][125:96], descriptor_internal[2][95:0], descriptor_internal[1][127:96], descriptor_internal[0][95:0]};
        assign resp_fifo_wdata      = {descriptor_internal[3][127:96], nxt_desc_ptr_to_fifo};
    end
    else if (DATA_WIDTH == 256) begin
        assign ptr_desc_nxt         = {descriptor_internal[1][127:96], descriptor_internal[0][127:96]};
        assign owned_by_hardware    = descriptor_internal[1][254];
        assign st_src_descr_data    = {2'b10, descriptor_internal[1][253:224], descriptor_internal[1][95:0], descriptor_internal[0][255:224], descriptor_internal[0][95:0]};
        assign resp_fifo_wdata      = {descriptor_internal[1][255:224], nxt_desc_ptr_to_fifo};
    end
    else if (DATA_WIDTH == 512) begin
        assign ptr_desc_nxt         = {descriptor_internal[0][383:352], descriptor_internal[0][127:96]};
        assign owned_by_hardware    = descriptor_internal[0][510];
        assign st_src_descr_data    = {2'b10, descriptor_internal[0][509:480], descriptor_internal[0][351:224], descriptor_internal[0][95:0]};
        assign resp_fifo_wdata      = {descriptor_internal[0][511:480], nxt_desc_ptr_to_fifo};
    end
end
else begin
    
    if (DATA_WIDTH == 32) begin
        assign ptr_desc_nxt         = descriptor_internal[3][31:0];
        assign owned_by_hardware    = descriptor_internal[7][30];
        assign st_src_descr_data    = {2'b10, descriptor_internal[7][29:0], descriptor_internal[2][31:0], descriptor_internal[1][31:0], descriptor_internal[0][31:0]};
        assign resp_fifo_wdata      = {descriptor_internal[7][31:0], nxt_desc_ptr_to_fifo};
    end
    else if (DATA_WIDTH == 64) begin
        assign ptr_desc_nxt         = descriptor_internal[1][63:32];
        assign owned_by_hardware    = descriptor_internal[3][62];
        assign st_src_descr_data    = {2'b10, descriptor_internal[3][61:32], descriptor_internal[1][31:0], descriptor_internal[0][63:0]};
        assign resp_fifo_wdata      = {descriptor_internal[3][63:32], nxt_desc_ptr_to_fifo};
    end
    else if (DATA_WIDTH == 128) begin
        assign ptr_desc_nxt         = descriptor_internal[0][127:96];
        assign owned_by_hardware    = descriptor_internal[1][126];
        assign st_src_descr_data    = {2'b10, descriptor_internal[1][125:96], descriptor_internal[0][95:0]};
        assign resp_fifo_wdata      = {descriptor_internal[1][127:96], nxt_desc_ptr_to_fifo};
    end
    else if (DATA_WIDTH == 256) begin
        assign ptr_desc_nxt         = descriptor_internal[0][127:96];
        assign owned_by_hardware    = descriptor_internal[0][254];
        assign st_src_descr_data    = {2'b10, descriptor_internal[0][253:224], descriptor_internal[0][95:0]};
        assign resp_fifo_wdata      = {descriptor_internal[0][255:224], nxt_desc_ptr_to_fifo};
    end
end
endgenerate



endmodule
