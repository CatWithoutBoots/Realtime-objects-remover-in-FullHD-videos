`ifndef _GMM_DMA_CONTROL_SV_
`define _GMM_DMA_CONTROL_SV_

/*
    Example of memory map for FRAMES_NUM = 2
    |----------------------------------------------|----------------|
    | ADDR                                         | TYPE           |
    |----------------------------------------------|----------------|
    | VIDEO_START_ADDR                             |                |
    | VIDEO_START_ADDR + 1                         | VIDEO_PACK_0   |
    | VIDEO_START_ADDR + VIDEO_SPAN_BYTES - 1      |                |
    |----------------------------------------------|----------------|
    | VIDEO_START_ADDR + VIDEO_SPAN_BYTES          |                |
    | VIDEO_START_ADDR + VIDEO_SPAN_BYTES + 1      | VIDEO_PACK_1   |
    | VIDEO_START_ADDR + 2*VIDEO_SPAN_BYTES - 1    |                |
    |----------------------------------------------|----------------|
    |           ....                               |     ...        |
    |----------------------------------------------|----------------|
    | CONTROL_START_ADDR                           |                |
    | CONTROL_START_ADDR + 1                       | CONTROL_PACK_0 |
    | CONTROL_START_ADDR + CONTOL_SPAN_BYTES - 1   |                |
    |----------------------------------------------|----------------|
    | CONTROL_START_ADDR + CONTOL_SPAN_BYTES       |                |
    | CONTROL_START_ADDR + CONTOL_SPAN_BYTES + 1   | CONTROL_PACK_1 |
    | CONTROL_START_ADDR + 2*CONTOL_SPAN_BYTES - 1 |                |
    |----------------------------------------------|----------------|
*/

module gmm_dma_control
#(
    FRAMES_NUM = 2, // max 8

    VIDEO_START_ADDR = 0,
    VIDEO_SPAN_BYTES = 33177600, // 1920x1080x(128/8), prefere bank_size of memory

    CONTROL_START_ADDR = FRAMES_NUM * VIDEO_SPAN_BYTES,
    CONTROL_SPAN_BYTES = 32
)(
    input clk, rst,

    input is_read, en,

    output logic ram_write,
    output logic[255:0] ram_writedata,
    output logic[5:0] ram_addr,
    
    output logic pref_write,
    output logic[31:0] pref_writedata,
    output logic[2:0] pref_addr
);
    localparam DESC_NUM = 2 * FRAMES_NUM;

    typedef struct packed {
        logic go;
        logic owned_by_hw;
        logic[3:0] reserved2;
        logic wait_for_write_responses;
        logic early_done_enable;
        logic[7:0] transmit_error;
        logic early_termination_irq_en;
        logic tranfer_complete_irq_en;
        logic reserved1;
        logic end_on_eop;
        logic park_writes;
        logic park_reads;
        logic generate_eop;
        logic generate_sop;
        logic[7:0] transmit_ch;
    } desc_control_t;

    typedef struct packed {
        desc_control_t control;
        logic[31:0] reserved2;
        logic[15:0] reserved1, status;
        logic[31:0] actual_bytes_tranferred, next_desc_ptr;
        logic[31:0] length, write_addr, read_addr;
    } pref_standart_desc_t;

    typedef struct packed {
        logic[26:0] reserved1;
        logic pack_mode;
        logic global_interrupt_en_mask;
        logic reset_prefectcher;
        logic desc_poll_en;
        logic run;
    } pref_control_t;

    pref_standart_desc_t desc;
    pref_control_t pref_control;

    logic run = '0;
    logic[$bits(DESC_NUM)-1:0] desc_cnt = '0;
    logic[31:0] control_addr = CONTROL_START_ADDR, next_desc_ptr = 32'd32;
    logic[31:0] video_addr = VIDEO_START_ADDR;
    logic[1:0] pref_cnt = 2'd2;

    assign ram_writedata = desc;
    assign pref_writedata = pref_control;

    always_ff @(posedge clk or posedge rst)
        if (rst) begin
            desc_cnt <= '0;

            control_addr <= CONTROL_START_ADDR;
            video_addr <= VIDEO_START_ADDR;
            next_desc_ptr <= 32'd32;

            ram_write <= '0;
            ram_addr <= '0;

            pref_write <= '0;
            pref_addr <= 3'd0;

            desc <= '0;
            pref_control <= '0;

            run <= '0;
            pref_cnt <= 2'd2;
        end
        else if (desc_cnt < DESC_NUM) begin
            ram_write <= '1;
            ram_addr <= desc_cnt;
            desc_cnt <= desc_cnt + 1'b1;
            next_desc_ptr <= next_desc_ptr + 32'd32;
            if (1'b0 == desc_cnt[0]) begin // desc for CONTROL packet
                /*desc <= '{
                    default: '0,
                    write_addr: is_read ? '0 : control_addr,
                    read_addr: is_read ? control_addr : '0,
                    next_desc_ptr: (desc_cnt == DESC_NUM - 1) ? CONTROL_START_ADDR : next_desc_ptr,
                    length: CONTROL_SPAN_BYTES,
                    control: '{
                        default: '0,
                        go: '1,
                        owned_by_hw: '1,
                        early_done_enable: '1,
                        end_on_eop: ~is_read,
                        generate_eop: is_read,
                        generate_sop: is_read
                    }
                };*/
                desc <= '0;
                desc.write_addr <= is_read ? '0 : control_addr;
                desc.read_addr <= is_read ? control_addr : '0;
                desc.next_desc_ptr <= (desc_cnt == DESC_NUM - 1) ? CONTROL_START_ADDR : next_desc_ptr;
                desc.length <= CONTROL_SPAN_BYTES;
                desc.control.go <= '1;
                desc.control.owned_by_hw <= '1;
                desc.control.early_done_enable <= '1;
                desc.control.end_on_eop <= '1;
                desc.control.generate_eop <= is_read;
                desc.control.generate_sop <= is_read;
                control_addr <= control_addr + CONTROL_SPAN_BYTES;
            end
            else begin // desc for VIDEO packet
                /*desc <= '{
                    default: '0,
                    write_addr: is_read ? '0 : video_addr,
                    read_addr: is_read ? video_addr : '0,
                    next_desc_ptr: (desc_cnt == DESC_NUM - 1) ? VIDEO_START_ADDR : next_desc_ptr,
                    length: VIDEO_SPAN_BYTES,
                    control: '{
                        default: '0,
                        go: '1,
                        owned_by_hw: '1,
                        early_done_enable: '1,
                        end_on_eop: ~is_read,
                        generate_eop: is_read,
                        generate_sop: is_read
                    }
                };*/
                desc <= '0;
                desc.write_addr <= is_read ? '0 : video_addr;
                desc.read_addr <= is_read ? video_addr : '0;
                desc.next_desc_ptr <= (desc_cnt == DESC_NUM - 1) ? VIDEO_START_ADDR : next_desc_ptr;
                desc.length <= VIDEO_SPAN_BYTES;
                desc.control.go <= '1;
                desc.control.owned_by_hw <= '1;
                desc.control.early_done_enable <= '1;
                desc.control.end_on_eop <= ~is_read;
                desc.control.generate_eop <= is_read;
                desc.control.generate_sop <= is_read;

                video_addr <= video_addr + VIDEO_SPAN_BYTES;
            end
        end
        else begin
            ram_write <= '0;
            pref_write <= '0;

            if (!run && en) begin
                pref_write <= '1;
                pref_addr <= pref_cnt;
                if ('0 == pref_cnt) begin
                    run <= '1;
                    /*pref_control <= '{
                        default: '0,
                        pack_mode: '1,
                        run: '1
                    };*/
                    pref_control <= '0;
                    pref_control.pack_mode <= '1;
                    pref_control.run <= '1;
                end
                else begin
                    pref_cnt <= pref_cnt - 2'd1;
                    pref_control <= '0;
                end
            end
        end

endmodule : gmm_dma_control

`endif