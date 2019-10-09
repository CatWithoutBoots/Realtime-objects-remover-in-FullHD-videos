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


module acl_fp_convert_with_rounding_64(clock, resetn, dataa, result, valid_in, valid_out, stall_in, stall_out, enable);
    // Latency = 5.
    parameter UNSIGNED = 1;
    parameter ROUNDING_MODE = 0;
    parameter HIGH_CAPACITY = 1;
    // Rounding mode values are:
    // 0 - round to nearest even
    // 1 - round to nearest with ties away from zero
    // 2 - round towards zero (truncation)
    // 3 - round up
    // 4 - round down
    input clock;    
    input enable, resetn;
    input [31:0] dataa;
    output [63:0] result;
    input valid_in, stall_in;
    output stall_out, valid_out;

    // STAGE 0 - extract input data into format we can work with.
    wire sign_0;
    wire [7:0] exp_0;
    wire [22:0] man_0;
    wire [23:0] implied_man_0;

    assign {sign_0, exp_0, man_0} = dataa;
    assign implied_man_0 = (|exp_0) ? {1'b1, man_0} : 24'd0;

    // STAGE 1
    reg sign_c1;
    reg [63:0] man_c1;
    reg [8:0] shift_amount_c1;
    reg [7:0] exp_c1;
    reg valid_c1;
    wire stall_c1;
    wire enable_c1;
    assign stall_out = stall_c1 & valid_c1;
    assign enable_c1 = (HIGH_CAPACITY == 1) ? (~stall_c1 | ~valid_c1) : enable;

    always @( posedge clock or negedge resetn)
    begin
      if( ~resetn )
      begin
        sign_c1 <= 1'bx;
        man_c1 <= 64'dx;
        shift_amount_c1 <= 9'dx;
        exp_c1 <= 8'dx;
        valid_c1 <= 1'b0;
      end
      else if (enable_c1)
      begin
        sign_c1 <= sign_0;
        valid_c1 <= valid_in;
        if (UNSIGNED == 1)
        begin
          man_c1 <= {implied_man_0, 40'd0};
          shift_amount_c1 <= 9'd190 - {1'b0, exp_0};
        end
        else
        begin
          man_c1 <= {1'b0, implied_man_0, 39'd0};
          shift_amount_c1 <= 9'd189 - {1'b0, exp_0};
        end
        exp_c1 <= exp_0;
      end
    end

    // STAGE 2
    reg sign_c2;
    reg [66:0] extended_mantissa_c2;
    reg [4:0] shift_amount_c2;
    reg valid_c2;
    wire stall_c2;
    wire enable_c2 = (HIGH_CAPACITY == 1) ? (~stall_c2 | ~valid_c2) : enable;
    assign stall_c1 = stall_c2 & valid_c2;

    always @( posedge clock or negedge resetn)
    begin
      if (~resetn)
      begin
        sign_c2 <= 1'bx;
        extended_mantissa_c2 <= 67'dx;
        shift_amount_c2 <= 5'dx;
        valid_c2 <= 1'b0;
      end
      else if (enable_c2)
      begin
        sign_c2 <= sign_c1;
        valid_c2 <= valid_c1;
        shift_amount_c2 <= (shift_amount_c1[4:0]) & {5{(~(&exp_c1)) & ~shift_amount_c1[8]}};
        
        // Now handle the corner cases of NaN and INF. Make it maximum positive or negative integer depending on the sign.
        // Then handle overflow and regular shifting.
        if ((UNSIGNED == 1) && (exp_c1 == 8'hff))
          extended_mantissa_c2 <= {64'hffffffffffffffff, 3'd0};
        else if ((UNSIGNED == 0) && (exp_c1 == 8'hff))
          extended_mantissa_c2 <= {64'h7fffffffffffffff + sign_c1, 3'd0};
        else if (shift_amount_c1[8])
          extended_mantissa_c2 <= {(UNSIGNED == 0) ? 64'h7fffffffffffffff + sign_c1 : 64'hffffffffffffffff, 3'd0}; // Overflow/Saturation.
        else if (shift_amount_c1[7])
        begin
          // Shift by 128+
          // We know that the mantissa only has a limited number of useful bits, and those are the top 25.
          sign_c2 <= sign_c1 & (|man_c1[63:39]);
          extended_mantissa_c2 <= {66'd0, |man_c1[63:39]};
        end
        else if (shift_amount_c1[6])
        begin
          // Shift by 64+
          // We know that the mantissa only has a limited number of useful bits, and those are the top 25.
          sign_c2 <= sign_c1 & (|man_c1[63:39]);
          if (shift_amount_c1[5])
            extended_mantissa_c2 <= {66'd0, |man_c1[63:39]};
          else
            extended_mantissa_c2 <= {64'd0, man_c1[63:62], |man_c1[61:39]};
        end
        else if (shift_amount_c1[5])
        begin
          // Shift by 32
          sign_c2 <= sign_c1 & (|man_c1[63:39]);
          extended_mantissa_c2 <= {32'd0, man_c1[63:32], 3'd0};
        end
        else
          extended_mantissa_c2 <= {man_c1, 3'd0};
      end
    end

    // STAGE 3
    reg [66:0] extended_mantissa_c3;
    reg [2:0] shift_amount_c3;
    reg valid_c3;
    reg sign_c3;
    wire stall_c3;
    wire enable_c3 = (HIGH_CAPACITY == 1) ? (~valid_c3 | ~stall_c3) : enable;
    assign stall_c2 = valid_c3 & stall_c3;

    always @( posedge clock or negedge resetn)
    begin
      if (~resetn)
      begin
        extended_mantissa_c3 <= 67'dx;
        sign_c3 <= 1'bx;
        shift_amount_c3 <= 3'dx;
        valid_c3 <= 1'b0;
      end
      else if (enable_c3)
      begin
        valid_c3 <= valid_c2;
        sign_c3 <= sign_c2;
        shift_amount_c3 <= shift_amount_c2[2:0];
        case (shift_amount_c2[4:3])
           2'b11: extended_mantissa_c3 <= {24'd0, extended_mantissa_c2[66:25], |extended_mantissa_c2[24:0]};
           2'b10: extended_mantissa_c3 <= {16'd0, extended_mantissa_c2[66:17], |extended_mantissa_c2[16:0]};
           2'b01: extended_mantissa_c3 <= {8'd0, extended_mantissa_c2[66:9], |extended_mantissa_c2[8:0]};
           2'b00: extended_mantissa_c3 <= extended_mantissa_c2;
        endcase
      end
    end

    // STAGE 4
    reg [66:0] extended_mantissa_c4;
    reg sign_c4;
    reg valid_c4;
    wire stall_c4;
    wire enable_c4 = (HIGH_CAPACITY == 1) ? (~valid_c4 | ~stall_c4) : enable;
    assign stall_c3 = valid_c4 & stall_c4;   

    always @( posedge clock or negedge resetn)
    begin
      if (~resetn)
      begin
        extended_mantissa_c4 <= 67'dx;
        sign_c4 <= 1'dx;
        valid_c4 <= 1'b0;
      end
      else if (enable_c4)
      begin
        valid_c4 <= valid_c3;
        sign_c4 <= sign_c3;
        case (shift_amount_c3)
           3'b111: extended_mantissa_c4 <= {7'd0, extended_mantissa_c3[66:8], |extended_mantissa_c3[7:0]};
           3'b110: extended_mantissa_c4 <= {6'd0, extended_mantissa_c3[66:7], |extended_mantissa_c3[6:0]};
           3'b101: extended_mantissa_c4 <= {5'd0, extended_mantissa_c3[66:6], |extended_mantissa_c3[5:0]};
           3'b100: extended_mantissa_c4 <= {4'd0, extended_mantissa_c3[66:5], |extended_mantissa_c3[4:0]};
           3'b011: extended_mantissa_c4 <= {3'd0, extended_mantissa_c3[66:4], |extended_mantissa_c3[3:0]};
           3'b010: extended_mantissa_c4 <= {2'd0, extended_mantissa_c3[66:3], |extended_mantissa_c3[2:0]};
           3'b001: extended_mantissa_c4 <= {1'd0, extended_mantissa_c3[66:2], |extended_mantissa_c3[1:0]};
           3'b000: extended_mantissa_c4 <= extended_mantissa_c3;
        endcase
      end
    end

    // STAGE 5
    reg [64:0] result_c5;
    reg valid_c5;
    wire stall_c5;
    wire enable_c5 = (HIGH_CAPACITY == 1) ? (~valid_c5 | ~stall_c5) : enable;
    assign stall_c4 = valid_c5 & stall_c5;   
    assign stall_c5 = stall_in;

    always @( posedge clock or negedge resetn)
    begin
      if (~resetn)
      begin
        result_c5 <= 65'dx;
        valid_c5 <= 1'b0;
      end
      else if (enable_c5)
      begin
        valid_c5 <= valid_c4;
        case(ROUNDING_MODE)
          2:
          begin // 2 is round to zero
            if (UNSIGNED == 0)
            begin
              result_c5 <= ({65{sign_c4}} ^ (extended_mantissa_c4[66:3])) + sign_c4;
            end
            else
            begin
              result_c5 <= (sign_c4) ? 64'd0 : extended_mantissa_c4[66:3];
            end
          end        
          4:
          begin // 4 is round down
            if (|extended_mantissa_c4[2:0])
            begin
              if (UNSIGNED == 0)
              begin
                result_c5 <= (sign_c4) ? (({65{sign_c4}} ^ (extended_mantissa_c4[66:3] + 1'b1)) + 1'b1) :  extended_mantissa_c4[66:3];
              end
              else
              begin
                result_c5 <= (sign_c4) ? 64'd0 : extended_mantissa_c4[66:3];
              end
            end
            else
            begin
               if (UNSIGNED == 0)
                result_c5 <= ({65{sign_c4}} ^ extended_mantissa_c4[66:3]) + sign_c4;
              else
                result_c5 <= {64{~sign_c4}} & extended_mantissa_c4[66:3];
            end
          end
          3:
          begin // 3 is round up
            if (|extended_mantissa_c4[2:0])
            begin
              if (UNSIGNED == 0)
              begin
                result_c5 <= (sign_c4) ? (({65{sign_c4}} ^ extended_mantissa_c4[66:3]) + 1'b1) :  (extended_mantissa_c4[66:3] + 1'b1);
              end
              else
              begin
                result_c5 <= (sign_c4) ? 64'd0 : extended_mantissa_c4[66:3] + 1'b1;
              end
            end
            else
            begin
               if (UNSIGNED == 0)
                result_c5 <= ({65{sign_c4}} ^ extended_mantissa_c4[66:3]) + sign_c4;
              else
                result_c5 <= {64{~sign_c4}} & extended_mantissa_c4[66:3];
            end
          end        
          1:
          begin // 1 is round to nearest with ties rounded away from zero.
            if (extended_mantissa_c4[2])
            begin
              if (UNSIGNED == 0)
              begin
                result_c5 <= ({65{sign_c4}} ^ (extended_mantissa_c4[66:3] + 1'b1)) + sign_c4;
              end
              else
              begin
                result_c5 <= (sign_c4) ? 64'd0 : extended_mantissa_c4[66:3] + 1'b1;
              end
            end
            else
            begin
               if (UNSIGNED == 0)
                result_c5 <= ({65{sign_c4}} ^ extended_mantissa_c4[66:3]) + sign_c4;
              else
                result_c5 <= {64{~sign_c4}} & extended_mantissa_c4[66:3];
            end
          end

          default:
          begin // 0 and default are round to nearest even
            if ((extended_mantissa_c4[3:0] == 4'hc) | (extended_mantissa_c4[2] & (|extended_mantissa_c4[1:0])))
            begin
              if (UNSIGNED == 0)
              begin
                result_c5 <= ({65{sign_c4}} ^ (extended_mantissa_c4[66:3] + 1'b1)) + sign_c4;
              end
              else
              begin
                result_c5 <= (sign_c4) ? 64'd0 : extended_mantissa_c4[66:3] + 1'b1;
              end
            end
            else
            begin
              if (UNSIGNED == 0)
                result_c5 <= ({65{sign_c4}} ^ extended_mantissa_c4[66:3]) + sign_c4;
              else
                result_c5 <= {64{~sign_c4}} & extended_mantissa_c4[66:3];
            end
          end
        endcase
      end
    end   
   
    assign result = (UNSIGNED == 1) ? ({64{result_c5[64]}} | result_c5[63:0]) : ((result_c5[64] ^ result_c5[63]) ? {result_c5[64], {63{~result_c5[64]}}} : result_c5[63:0]);
    assign valid_out = valid_c5;
   
endmodule
