-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 18.1 (Release Build #625)
-- 
-- Legal Notice: Copyright 2018 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract
-- VHDL created on Mon Oct 07 15:56:21 2019


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract is
    port (
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gmm_substract99_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit2835_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit2835_1 : out std_logic_vector(1 downto 0);  -- ufix2
        out_c0_exit2835_2 : out std_logic_vector(5 downto 0);  -- ufix6
        out_c0_exit2835_3 : out std_logic_vector(5 downto 0);  -- ufix6
        out_c0_exit2835_4 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exit2835_5 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exit2835_6 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exit2835_7 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exit2835_8 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exit2835_9 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exit2835_10 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exit2835_11 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exit2835_12 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exit2835_13 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exit2835_14 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exit2835_15 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exit2835_16 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exit2835_17 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exit2835_18 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exit2835_19 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exit2835_20 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exit2835_21 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exit2835_22 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        in_intel_reserved_ffwd_15_0_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_15_0_1 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_15_0_2 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_16_0_0 : in std_logic_vector(5 downto 0);  -- ufix6
        in_intel_reserved_ffwd_10_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_11_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_12_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_13_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_14_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_17_0 : in std_logic_vector(19 downto 0);  -- ufix20
        in_intel_reserved_ffwd_18_0 : in std_logic_vector(19 downto 0);  -- ufix20
        in_intel_reserved_ffwd_19_0 : in std_logic_vector(19 downto 0);  -- ufix20
        in_intel_reserved_ffwd_1_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_29_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_intel_reserved_ffwd_2_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_30_0 : in std_logic_vector(5 downto 0);  -- ufix6
        in_intel_reserved_ffwd_31_0 : in std_logic_vector(1 downto 0);  -- ufix2
        in_intel_reserved_ffwd_32_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_intel_reserved_ffwd_33_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_intel_reserved_ffwd_34_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_intel_reserved_ffwd_35_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_intel_reserved_ffwd_37_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_intel_reserved_ffwd_38_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_intel_reserved_ffwd_39_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_3_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_40_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_41_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_43_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_44_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_45_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_46_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_47_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_48_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_4_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_56_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_57_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_58_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_59_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_5_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_60_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_intel_reserved_ffwd_61_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_62_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_63_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_64_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_65_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_66_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_67_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_intel_reserved_ffwd_68_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_intel_reserved_ffwd_69_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_6_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_70_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_7_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_8_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_92_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_intel_reserved_ffwd_9_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_0_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_i_stall : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_stall : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract;

architecture normal of i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2880 is
        port (
            in_data_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(1 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_data_in_4 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_data_in_5 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_data_in_6 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_data_in_7 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_data_in_8 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_data_in_9 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_data_in_10 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_data_in_11 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_data_in_12 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_data_in_13 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_data_in_14 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_data_in_15 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_data_in_16 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_data_in_17 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_data_in_18 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_data_in_19 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_data_in_20 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_data_in_21 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_data_in_22 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_accepted : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(1 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_data_out_4 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_data_out_5 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_data_out_6 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_data_out_7 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_data_out_8 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_data_out_9 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_data_out_10 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_data_out_11 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_data_out_12 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_data_out_13 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_data_out_14 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_data_out_15 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_data_out_16 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_data_out_17 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_data_out_18 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_data_out_19 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_data_out_20 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_data_out_21 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_data_out_22 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_entry : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673 is
        port (
            in_intel_reserved_ffwd_15_0_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_15_0_1 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_15_0_2 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_16_0_0 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_0_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_10_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_11_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_12_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_13_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_14_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_17_0 : in std_logic_vector(19 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_18_0 : in std_logic_vector(19 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_19_0 : in std_logic_vector(19 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_1_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_29_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_2_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_30_0 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_31_0 : in std_logic_vector(1 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_32_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_33_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_34_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_35_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_37_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_38_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_39_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_3_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_40_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_41_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_43_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_44_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_45_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_46_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_47_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_48_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_4_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_56_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_57_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_58_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_59_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_5_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_60_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_61_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_62_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_63_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_64_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_65_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_66_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_67_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_68_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_69_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_6_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_70_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_7_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_8_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_92_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_9_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exi12834_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi12834_1 : out std_logic_vector(1 downto 0);  -- Fixed Point
            out_c0_exi12834_2 : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_c0_exi12834_3 : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_c0_exi12834_4 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exi12834_5 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exi12834_6 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exi12834_7 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exi12834_8 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exi12834_9 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exi12834_10 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exi12834_11 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exi12834_12 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exi12834_13 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exi12834_14 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exi12834_15 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exi12834_16 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exi12834_17 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exi12834_18 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exi12834_19 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exi12834_20 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exi12834_21 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exi12834_22 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (1 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (5 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (5 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_7 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_8 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_9 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_10 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_11 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_12 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_13 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_14 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_15 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_16 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_17 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_18 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_19 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_20 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_21 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_22 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_stall_entry : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_1 : STD_LOGIC_VECTOR (1 downto 0);
    signal i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_2 : STD_LOGIC_VECTOR (5 downto 0);
    signal i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_3 : STD_LOGIC_VECTOR (5 downto 0);
    signal i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_4 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_5 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_6 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_7 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_8 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_9 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_10 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_11 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_12 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_13 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_14 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_15 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_16 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_17 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_18 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_19 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_20 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_21 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_22 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal input_accepted_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_out(LOGICAL,60)
    not_stall_out_q <= not (i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_stall_entry);

    -- input_accepted_and(LOGICAL,59)
    input_accepted_and_q <= in_i_valid and not_stall_out_q;

    -- i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x(BLACKBOX,58)@0
    -- out out_c0_exi12834_0@90
    -- out out_c0_exi12834_1@90
    -- out out_c0_exi12834_2@90
    -- out out_c0_exi12834_3@90
    -- out out_c0_exi12834_4@90
    -- out out_c0_exi12834_5@90
    -- out out_c0_exi12834_6@90
    -- out out_c0_exi12834_7@90
    -- out out_c0_exi12834_8@90
    -- out out_c0_exi12834_9@90
    -- out out_c0_exi12834_10@90
    -- out out_c0_exi12834_11@90
    -- out out_c0_exi12834_12@90
    -- out out_c0_exi12834_13@90
    -- out out_c0_exi12834_14@90
    -- out out_c0_exi12834_15@90
    -- out out_c0_exi12834_16@90
    -- out out_c0_exi12834_17@90
    -- out out_c0_exi12834_18@90
    -- out out_c0_exi12834_19@90
    -- out out_c0_exi12834_20@90
    -- out out_c0_exi12834_21@90
    -- out out_c0_exi12834_22@90
    -- out out_o_valid@90
    thei_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x : i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673
    PORT MAP (
        in_intel_reserved_ffwd_15_0_0 => in_intel_reserved_ffwd_15_0_0,
        in_intel_reserved_ffwd_15_0_1 => in_intel_reserved_ffwd_15_0_1,
        in_intel_reserved_ffwd_15_0_2 => in_intel_reserved_ffwd_15_0_2,
        in_intel_reserved_ffwd_16_0_0 => in_intel_reserved_ffwd_16_0_0,
        in_i_valid => input_accepted_and_q,
        in_intel_reserved_ffwd_0_0 => in_intel_reserved_ffwd_0_0,
        in_intel_reserved_ffwd_10_0 => in_intel_reserved_ffwd_10_0,
        in_intel_reserved_ffwd_11_0 => in_intel_reserved_ffwd_11_0,
        in_intel_reserved_ffwd_12_0 => in_intel_reserved_ffwd_12_0,
        in_intel_reserved_ffwd_13_0 => in_intel_reserved_ffwd_13_0,
        in_intel_reserved_ffwd_14_0 => in_intel_reserved_ffwd_14_0,
        in_intel_reserved_ffwd_17_0 => in_intel_reserved_ffwd_17_0,
        in_intel_reserved_ffwd_18_0 => in_intel_reserved_ffwd_18_0,
        in_intel_reserved_ffwd_19_0 => in_intel_reserved_ffwd_19_0,
        in_intel_reserved_ffwd_1_0 => in_intel_reserved_ffwd_1_0,
        in_intel_reserved_ffwd_29_0 => in_intel_reserved_ffwd_29_0,
        in_intel_reserved_ffwd_2_0 => in_intel_reserved_ffwd_2_0,
        in_intel_reserved_ffwd_30_0 => in_intel_reserved_ffwd_30_0,
        in_intel_reserved_ffwd_31_0 => in_intel_reserved_ffwd_31_0,
        in_intel_reserved_ffwd_32_0 => in_intel_reserved_ffwd_32_0,
        in_intel_reserved_ffwd_33_0 => in_intel_reserved_ffwd_33_0,
        in_intel_reserved_ffwd_34_0 => in_intel_reserved_ffwd_34_0,
        in_intel_reserved_ffwd_35_0 => in_intel_reserved_ffwd_35_0,
        in_intel_reserved_ffwd_37_0 => in_intel_reserved_ffwd_37_0,
        in_intel_reserved_ffwd_38_0 => in_intel_reserved_ffwd_38_0,
        in_intel_reserved_ffwd_39_0 => in_intel_reserved_ffwd_39_0,
        in_intel_reserved_ffwd_3_0 => in_intel_reserved_ffwd_3_0,
        in_intel_reserved_ffwd_40_0 => in_intel_reserved_ffwd_40_0,
        in_intel_reserved_ffwd_41_0 => in_intel_reserved_ffwd_41_0,
        in_intel_reserved_ffwd_43_0 => in_intel_reserved_ffwd_43_0,
        in_intel_reserved_ffwd_44_0 => in_intel_reserved_ffwd_44_0,
        in_intel_reserved_ffwd_45_0 => in_intel_reserved_ffwd_45_0,
        in_intel_reserved_ffwd_46_0 => in_intel_reserved_ffwd_46_0,
        in_intel_reserved_ffwd_47_0 => in_intel_reserved_ffwd_47_0,
        in_intel_reserved_ffwd_48_0 => in_intel_reserved_ffwd_48_0,
        in_intel_reserved_ffwd_4_0 => in_intel_reserved_ffwd_4_0,
        in_intel_reserved_ffwd_56_0 => in_intel_reserved_ffwd_56_0,
        in_intel_reserved_ffwd_57_0 => in_intel_reserved_ffwd_57_0,
        in_intel_reserved_ffwd_58_0 => in_intel_reserved_ffwd_58_0,
        in_intel_reserved_ffwd_59_0 => in_intel_reserved_ffwd_59_0,
        in_intel_reserved_ffwd_5_0 => in_intel_reserved_ffwd_5_0,
        in_intel_reserved_ffwd_60_0 => in_intel_reserved_ffwd_60_0,
        in_intel_reserved_ffwd_61_0 => in_intel_reserved_ffwd_61_0,
        in_intel_reserved_ffwd_62_0 => in_intel_reserved_ffwd_62_0,
        in_intel_reserved_ffwd_63_0 => in_intel_reserved_ffwd_63_0,
        in_intel_reserved_ffwd_64_0 => in_intel_reserved_ffwd_64_0,
        in_intel_reserved_ffwd_65_0 => in_intel_reserved_ffwd_65_0,
        in_intel_reserved_ffwd_66_0 => in_intel_reserved_ffwd_66_0,
        in_intel_reserved_ffwd_67_0 => in_intel_reserved_ffwd_67_0,
        in_intel_reserved_ffwd_68_0 => in_intel_reserved_ffwd_68_0,
        in_intel_reserved_ffwd_69_0 => in_intel_reserved_ffwd_69_0,
        in_intel_reserved_ffwd_6_0 => in_intel_reserved_ffwd_6_0,
        in_intel_reserved_ffwd_70_0 => in_intel_reserved_ffwd_70_0,
        in_intel_reserved_ffwd_7_0 => in_intel_reserved_ffwd_7_0,
        in_intel_reserved_ffwd_8_0 => in_intel_reserved_ffwd_8_0,
        in_intel_reserved_ffwd_92_0 => in_intel_reserved_ffwd_92_0,
        in_intel_reserved_ffwd_9_0 => in_intel_reserved_ffwd_9_0,
        out_c0_exi12834_0 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_0,
        out_c0_exi12834_1 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_1,
        out_c0_exi12834_2 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_2,
        out_c0_exi12834_3 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_3,
        out_c0_exi12834_4 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_4,
        out_c0_exi12834_5 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_5,
        out_c0_exi12834_6 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_6,
        out_c0_exi12834_7 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_7,
        out_c0_exi12834_8 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_8,
        out_c0_exi12834_9 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_9,
        out_c0_exi12834_10 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_10,
        out_c0_exi12834_11 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_11,
        out_c0_exi12834_12 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_12,
        out_c0_exi12834_13 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_13,
        out_c0_exi12834_14 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_14,
        out_c0_exi12834_15 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_15,
        out_c0_exi12834_16 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_16,
        out_c0_exi12834_17 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_17,
        out_c0_exi12834_18 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_18,
        out_c0_exi12834_19 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_19,
        out_c0_exi12834_20 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_20,
        out_c0_exi12834_21 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_21,
        out_c0_exi12834_22 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_22,
        out_o_valid => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x(BLACKBOX,57)@20000000
    -- out out_data_out_0@20000003
    -- out out_data_out_1@20000003
    -- out out_data_out_2@20000003
    -- out out_data_out_3@20000003
    -- out out_data_out_4@20000003
    -- out out_data_out_5@20000003
    -- out out_data_out_6@20000003
    -- out out_data_out_7@20000003
    -- out out_data_out_8@20000003
    -- out out_data_out_9@20000003
    -- out out_data_out_10@20000003
    -- out out_data_out_11@20000003
    -- out out_data_out_12@20000003
    -- out out_data_out_13@20000003
    -- out out_data_out_14@20000003
    -- out out_data_out_15@20000003
    -- out out_data_out_16@20000003
    -- out out_data_out_17@20000003
    -- out out_data_out_18@20000003
    -- out out_data_out_19@20000003
    -- out out_data_out_20@20000003
    -- out out_data_out_21@20000003
    -- out out_data_out_22@20000003
    -- out out_valid_out@20000003
    thei_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x : i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2880
    PORT MAP (
        in_data_in_0 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_0,
        in_data_in_1 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_1,
        in_data_in_2 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_2,
        in_data_in_3 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_3,
        in_data_in_4 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_4,
        in_data_in_5 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_5,
        in_data_in_6 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_6,
        in_data_in_7 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_7,
        in_data_in_8 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_8,
        in_data_in_9 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_9,
        in_data_in_10 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_10,
        in_data_in_11 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_11,
        in_data_in_12 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_12,
        in_data_in_13 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_13,
        in_data_in_14 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_14,
        in_data_in_15 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_15,
        in_data_in_16 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_16,
        in_data_in_17 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_17,
        in_data_in_18 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_18,
        in_data_in_19 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_19,
        in_data_in_20 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_20,
        in_data_in_21 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_21,
        in_data_in_22 => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_c0_exi12834_22,
        in_input_accepted => input_accepted_and_q,
        in_stall_in => in_i_stall,
        in_valid_in => i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673_aunroll_x_out_o_valid,
        out_data_out_0 => i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_0,
        out_data_out_1 => i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_1,
        out_data_out_2 => i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_2,
        out_data_out_3 => i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_3,
        out_data_out_4 => i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_4,
        out_data_out_5 => i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_5,
        out_data_out_6 => i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_6,
        out_data_out_7 => i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_7,
        out_data_out_8 => i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_8,
        out_data_out_9 => i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_9,
        out_data_out_10 => i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_10,
        out_data_out_11 => i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_11,
        out_data_out_12 => i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_12,
        out_data_out_13 => i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_13,
        out_data_out_14 => i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_14,
        out_data_out_15 => i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_15,
        out_data_out_16 => i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_16,
        out_data_out_17 => i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_17,
        out_data_out_18 => i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_18,
        out_data_out_19 => i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_19,
        out_data_out_20 => i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_20,
        out_data_out_21 => i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_21,
        out_data_out_22 => i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_22,
        out_stall_entry => i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_stall_entry,
        out_valid_out => i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_sync_out_aunroll_x(GPOUT,3)@93
    out_c0_exit2835_0 <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_0;
    out_c0_exit2835_1 <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_1;
    out_c0_exit2835_2 <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_2;
    out_c0_exit2835_3 <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_3;
    out_c0_exit2835_4 <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_4;
    out_c0_exit2835_5 <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_5;
    out_c0_exit2835_6 <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_6;
    out_c0_exit2835_7 <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_7;
    out_c0_exit2835_8 <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_8;
    out_c0_exit2835_9 <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_9;
    out_c0_exit2835_10 <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_10;
    out_c0_exit2835_11 <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_11;
    out_c0_exit2835_12 <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_12;
    out_c0_exit2835_13 <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_13;
    out_c0_exit2835_14 <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_14;
    out_c0_exit2835_15 <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_15;
    out_c0_exit2835_16 <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_16;
    out_c0_exit2835_17 <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_17;
    out_c0_exit2835_18 <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_18;
    out_c0_exit2835_19 <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_19;
    out_c0_exit2835_20 <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_20;
    out_c0_exit2835_21 <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_21;
    out_c0_exit2835_22 <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_data_out_22;
    out_o_valid <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_valid_out;

    -- sync_out(GPOUT,63)@20000000
    out_o_stall <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract_aunroll_x_out_stall_entry;

END normal;
