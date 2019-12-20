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

module altera_msgdma_prefetcher_interrupt (
    input           clk,
    input           reset,
    input           write_back_done,
    input           transfer_complete_irq_mask,
    input [7:0]     error_irq_mask,
    input           early_termination_irq_mask,
    input [7:0]     error,
    input           early_termination,
    input           clear_irq,
    input           global_interrupt_enable_mask,

    output reg      irq

);

wire set_irq;

always @(posedge clk or posedge reset) begin
    if (reset)
        irq <= 0;
    else begin
        case ({clear_irq, set_irq})
            2'b00: irq <= irq;
            2'b01: irq <= 1'b1;
            2'b10: irq <= 1'b0;
            2'b11: irq <= 1'b1;
        endcase
    end
end

assign set_irq  = (global_interrupt_enable_mask == 1) & (write_back_done == 1) &       // transfer ended and interrupts are enabled
                   ((transfer_complete_irq_mask == 1) |                        // transfer ended and the transfer complete IRQ is enabled
                    ((error & error_irq_mask) != 0) |                          // transfer ended with an error and this IRQ is enabled
                    ((early_termination & early_termination_irq_mask) == 1));  // transfer ended early due to early termination and this IRQ is enabled

                    
endmodule
