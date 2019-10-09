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

-- VHDL created from i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract
-- VHDL created on Mon Oct 07 15:56:20 2019


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

entity i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract is
    port (
        in_in_alpha_0 : in std_logic_vector(9 downto 0);  -- ufix10
        in_c0_eni2_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni2_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni2_2 : in std_logic_vector(1 downto 0);  -- ufix2
        in_c0_eni2_3 : in std_logic_vector(5 downto 0);  -- ufix6
        in_c0_eni2_4 : in std_logic_vector(5 downto 0);  -- ufix6
        in_c0_eni2_5 : in std_logic_vector(7 downto 0);  -- ufix8
        in_c0_eni2_6 : in std_logic_vector(7 downto 0);  -- ufix8
        in_c0_eni2_7 : in std_logic_vector(7 downto 0);  -- ufix8
        in_c0_eni2_8 : in std_logic_vector(7 downto 0);  -- ufix8
        in_c0_eni2_9 : in std_logic_vector(7 downto 0);  -- ufix8
        in_c0_eni2_10 : in std_logic_vector(7 downto 0);  -- ufix8
        in_c0_eni2_11 : in std_logic_vector(7 downto 0);  -- ufix8
        in_c0_eni2_12 : in std_logic_vector(7 downto 0);  -- ufix8
        in_c0_eni2_13 : in std_logic_vector(7 downto 0);  -- ufix8
        in_c0_eni2_14 : in std_logic_vector(7 downto 0);  -- ufix8
        in_c0_eni2_15 : in std_logic_vector(7 downto 0);  -- ufix8
        in_c0_eni2_16 : in std_logic_vector(7 downto 0);  -- ufix8
        in_c0_eni2_17 : in std_logic_vector(7 downto 0);  -- ufix8
        in_c0_eni2_18 : in std_logic_vector(7 downto 0);  -- ufix8
        in_c0_eni2_19 : in std_logic_vector(7 downto 0);  -- ufix8
        in_c0_eni2_20 : in std_logic_vector(7 downto 0);  -- ufix8
        in_c0_eni2_21 : in std_logic_vector(7 downto 0);  -- ufix8
        in_c0_eni2_22 : in std_logic_vector(7 downto 0);  -- ufix8
        in_c0_eni2_23 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        in_s_0 : in std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_15_0_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_15_0_1 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_15_0_2 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_10_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_11_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_12_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_13_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_14_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_17_0 : out std_logic_vector(19 downto 0);  -- ufix20
        out_intel_reserved_ffwd_18_0 : out std_logic_vector(19 downto 0);  -- ufix20
        out_intel_reserved_ffwd_19_0 : out std_logic_vector(19 downto 0);  -- ufix20
        out_intel_reserved_ffwd_1_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_20_0 : out std_logic_vector(8 downto 0);  -- ufix9
        out_intel_reserved_ffwd_21_0 : out std_logic_vector(8 downto 0);  -- ufix9
        out_intel_reserved_ffwd_22_0 : out std_logic_vector(8 downto 0);  -- ufix9
        out_intel_reserved_ffwd_23_0 : out std_logic_vector(8 downto 0);  -- ufix9
        out_intel_reserved_ffwd_24_0 : out std_logic_vector(8 downto 0);  -- ufix9
        out_intel_reserved_ffwd_25_0 : out std_logic_vector(8 downto 0);  -- ufix9
        out_intel_reserved_ffwd_26_0 : out std_logic_vector(8 downto 0);  -- ufix9
        out_intel_reserved_ffwd_27_0 : out std_logic_vector(8 downto 0);  -- ufix9
        out_intel_reserved_ffwd_28_0 : out std_logic_vector(8 downto 0);  -- ufix9
        out_intel_reserved_ffwd_29_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_intel_reserved_ffwd_2_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_30_0 : out std_logic_vector(5 downto 0);  -- ufix6
        out_intel_reserved_ffwd_31_0 : out std_logic_vector(1 downto 0);  -- ufix2
        out_intel_reserved_ffwd_32_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_intel_reserved_ffwd_33_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_intel_reserved_ffwd_34_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_intel_reserved_ffwd_35_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_intel_reserved_ffwd_36_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_intel_reserved_ffwd_37_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_intel_reserved_ffwd_38_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_intel_reserved_ffwd_39_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_3_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_40_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_41_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_42_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_43_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_44_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_45_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_46_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_47_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_48_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_49_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_4_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_50_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_51_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_intel_reserved_ffwd_52_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_intel_reserved_ffwd_53_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_intel_reserved_ffwd_54_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_intel_reserved_ffwd_55_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_intel_reserved_ffwd_5_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_6_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_7_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_8_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_9_0 : out std_logic_vector(7 downto 0);  -- ufix8
        in_d_0 : in std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_0_0 : out std_logic_vector(7 downto 0);  -- ufix8
        in_i_stall : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_stall : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract;

architecture normal of i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_acl_sfc_exit_c0_wt_entry_gmm_substract_c0_exit_gmm_substract2250 is
        port (
            in_data_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_accepted : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_entry : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8 is
        port (
            in_c0_eni2_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni2_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni2_2 : in std_logic_vector(1 downto 0);  -- Fixed Point
            in_c0_eni2_3 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_c0_eni2_4 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_c0_eni2_5 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_c0_eni2_6 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_c0_eni2_7 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_c0_eni2_8 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_c0_eni2_9 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_c0_eni2_10 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_c0_eni2_11 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_c0_eni2_12 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_c0_eni2_13 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_c0_eni2_14 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_c0_eni2_15 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_c0_eni2_16 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_c0_eni2_17 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_c0_eni2_18 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_c0_eni2_19 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_c0_eni2_20 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_c0_eni2_21 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_c0_eni2_22 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_c0_eni2_23 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_d_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_in_alpha_0 : in std_logic_vector(9 downto 0);  -- Fixed Point
            in_s_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_15_0_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_15_0_1 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_15_0_2 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_unnamed_gmm_substract57_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_0_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_10_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_11_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_12_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_13_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_14_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_17_0 : out std_logic_vector(19 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_18_0 : out std_logic_vector(19 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_19_0 : out std_logic_vector(19 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_1_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_20_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_21_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_22_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_23_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_24_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_25_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_26_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_27_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_28_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_29_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_2_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_30_0 : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_31_0 : out std_logic_vector(1 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_32_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_33_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_34_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_35_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_36_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_37_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_38_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_39_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_3_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_40_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_41_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_42_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_43_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_44_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_45_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_46_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_47_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_48_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_49_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_4_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_50_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_51_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_52_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_53_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_54_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_55_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_5_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_6_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_7_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_8_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_9_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_wt_entry_gmm_substract_c0_exit_gmm_substract_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_wt_entry_gmm_substract_c0_exit_gmm_substract_aunroll_x_out_stall_entry : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_wt_entry_gmm_substract_c0_exit_gmm_substract_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_15_0_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_15_0_1 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_15_0_2 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_0_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_10_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_11_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_12_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_13_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_14_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_17_0 : STD_LOGIC_VECTOR (19 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_18_0 : STD_LOGIC_VECTOR (19 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_19_0 : STD_LOGIC_VECTOR (19 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_1_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_20_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_21_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_22_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_23_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_24_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_25_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_26_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_27_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_28_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_29_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_2_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_30_0 : STD_LOGIC_VECTOR (5 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_31_0 : STD_LOGIC_VECTOR (1 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_32_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_33_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_34_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_35_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_36_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_37_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_38_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_39_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_3_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_40_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_41_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_42_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_43_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_44_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_45_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_46_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_47_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_48_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_49_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_4_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_50_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_51_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_52_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_53_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_54_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_55_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_5_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_6_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_7_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_8_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_9_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal input_accepted_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x(BLACKBOX,61)@2
    -- out out_intel_reserved_ffwd_15_0_0@80
    -- out out_intel_reserved_ffwd_15_0_1@80
    -- out out_intel_reserved_ffwd_15_0_2@80
    -- out out_unnamed_gmm_substract57_0@80
    -- out out_intel_reserved_ffwd_0_0@80
    -- out out_intel_reserved_ffwd_10_0@80
    -- out out_intel_reserved_ffwd_11_0@80
    -- out out_intel_reserved_ffwd_12_0@80
    -- out out_intel_reserved_ffwd_13_0@80
    -- out out_intel_reserved_ffwd_14_0@80
    -- out out_intel_reserved_ffwd_17_0@80
    -- out out_intel_reserved_ffwd_18_0@80
    -- out out_intel_reserved_ffwd_19_0@80
    -- out out_intel_reserved_ffwd_1_0@80
    -- out out_intel_reserved_ffwd_20_0@80
    -- out out_intel_reserved_ffwd_21_0@80
    -- out out_intel_reserved_ffwd_22_0@80
    -- out out_intel_reserved_ffwd_23_0@80
    -- out out_intel_reserved_ffwd_24_0@80
    -- out out_intel_reserved_ffwd_25_0@80
    -- out out_intel_reserved_ffwd_26_0@80
    -- out out_intel_reserved_ffwd_27_0@80
    -- out out_intel_reserved_ffwd_28_0@80
    -- out out_intel_reserved_ffwd_29_0@80
    -- out out_intel_reserved_ffwd_2_0@80
    -- out out_intel_reserved_ffwd_30_0@80
    -- out out_intel_reserved_ffwd_31_0@80
    -- out out_intel_reserved_ffwd_32_0@80
    -- out out_intel_reserved_ffwd_33_0@80
    -- out out_intel_reserved_ffwd_34_0@80
    -- out out_intel_reserved_ffwd_35_0@80
    -- out out_intel_reserved_ffwd_36_0@80
    -- out out_intel_reserved_ffwd_37_0@80
    -- out out_intel_reserved_ffwd_38_0@80
    -- out out_intel_reserved_ffwd_39_0@80
    -- out out_intel_reserved_ffwd_3_0@80
    -- out out_intel_reserved_ffwd_40_0@80
    -- out out_intel_reserved_ffwd_41_0@80
    -- out out_intel_reserved_ffwd_42_0@80
    -- out out_intel_reserved_ffwd_43_0@80
    -- out out_intel_reserved_ffwd_44_0@80
    -- out out_intel_reserved_ffwd_45_0@80
    -- out out_intel_reserved_ffwd_46_0@80
    -- out out_intel_reserved_ffwd_47_0@80
    -- out out_intel_reserved_ffwd_48_0@80
    -- out out_intel_reserved_ffwd_49_0@80
    -- out out_intel_reserved_ffwd_4_0@80
    -- out out_intel_reserved_ffwd_50_0@80
    -- out out_intel_reserved_ffwd_51_0@80
    -- out out_intel_reserved_ffwd_52_0@80
    -- out out_intel_reserved_ffwd_53_0@80
    -- out out_intel_reserved_ffwd_54_0@80
    -- out out_intel_reserved_ffwd_55_0@80
    -- out out_intel_reserved_ffwd_5_0@80
    -- out out_intel_reserved_ffwd_6_0@80
    -- out out_intel_reserved_ffwd_7_0@80
    -- out out_intel_reserved_ffwd_8_0@80
    -- out out_intel_reserved_ffwd_9_0@80
    -- out out_o_valid@80
    thei_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x : i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8
    PORT MAP (
        in_c0_eni2_0 => in_c0_eni2_0,
        in_c0_eni2_1 => in_c0_eni2_1,
        in_c0_eni2_2 => in_c0_eni2_2,
        in_c0_eni2_3 => in_c0_eni2_3,
        in_c0_eni2_4 => in_c0_eni2_4,
        in_c0_eni2_5 => in_c0_eni2_5,
        in_c0_eni2_6 => in_c0_eni2_6,
        in_c0_eni2_7 => in_c0_eni2_7,
        in_c0_eni2_8 => in_c0_eni2_8,
        in_c0_eni2_9 => in_c0_eni2_9,
        in_c0_eni2_10 => in_c0_eni2_10,
        in_c0_eni2_11 => in_c0_eni2_11,
        in_c0_eni2_12 => in_c0_eni2_12,
        in_c0_eni2_13 => in_c0_eni2_13,
        in_c0_eni2_14 => in_c0_eni2_14,
        in_c0_eni2_15 => in_c0_eni2_15,
        in_c0_eni2_16 => in_c0_eni2_16,
        in_c0_eni2_17 => in_c0_eni2_17,
        in_c0_eni2_18 => in_c0_eni2_18,
        in_c0_eni2_19 => in_c0_eni2_19,
        in_c0_eni2_20 => in_c0_eni2_20,
        in_c0_eni2_21 => in_c0_eni2_21,
        in_c0_eni2_22 => in_c0_eni2_22,
        in_c0_eni2_23 => in_c0_eni2_23,
        in_d_0 => in_d_0,
        in_in_alpha_0 => in_in_alpha_0,
        in_s_0 => in_s_0,
        in_i_valid => input_accepted_and_q,
        out_intel_reserved_ffwd_15_0_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_15_0_0,
        out_intel_reserved_ffwd_15_0_1 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_15_0_1,
        out_intel_reserved_ffwd_15_0_2 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_15_0_2,
        out_intel_reserved_ffwd_0_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_0_0,
        out_intel_reserved_ffwd_10_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_10_0,
        out_intel_reserved_ffwd_11_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_11_0,
        out_intel_reserved_ffwd_12_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_12_0,
        out_intel_reserved_ffwd_13_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_13_0,
        out_intel_reserved_ffwd_14_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_14_0,
        out_intel_reserved_ffwd_17_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_17_0,
        out_intel_reserved_ffwd_18_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_18_0,
        out_intel_reserved_ffwd_19_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_19_0,
        out_intel_reserved_ffwd_1_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_1_0,
        out_intel_reserved_ffwd_20_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_20_0,
        out_intel_reserved_ffwd_21_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_21_0,
        out_intel_reserved_ffwd_22_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_22_0,
        out_intel_reserved_ffwd_23_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_23_0,
        out_intel_reserved_ffwd_24_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_24_0,
        out_intel_reserved_ffwd_25_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_25_0,
        out_intel_reserved_ffwd_26_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_26_0,
        out_intel_reserved_ffwd_27_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_27_0,
        out_intel_reserved_ffwd_28_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_28_0,
        out_intel_reserved_ffwd_29_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_29_0,
        out_intel_reserved_ffwd_2_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_2_0,
        out_intel_reserved_ffwd_30_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_30_0,
        out_intel_reserved_ffwd_31_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_31_0,
        out_intel_reserved_ffwd_32_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_32_0,
        out_intel_reserved_ffwd_33_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_33_0,
        out_intel_reserved_ffwd_34_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_34_0,
        out_intel_reserved_ffwd_35_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_35_0,
        out_intel_reserved_ffwd_36_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_36_0,
        out_intel_reserved_ffwd_37_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_37_0,
        out_intel_reserved_ffwd_38_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_38_0,
        out_intel_reserved_ffwd_39_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_39_0,
        out_intel_reserved_ffwd_3_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_3_0,
        out_intel_reserved_ffwd_40_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_40_0,
        out_intel_reserved_ffwd_41_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_41_0,
        out_intel_reserved_ffwd_42_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_42_0,
        out_intel_reserved_ffwd_43_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_43_0,
        out_intel_reserved_ffwd_44_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_44_0,
        out_intel_reserved_ffwd_45_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_45_0,
        out_intel_reserved_ffwd_46_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_46_0,
        out_intel_reserved_ffwd_47_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_47_0,
        out_intel_reserved_ffwd_48_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_48_0,
        out_intel_reserved_ffwd_49_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_49_0,
        out_intel_reserved_ffwd_4_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_4_0,
        out_intel_reserved_ffwd_50_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_50_0,
        out_intel_reserved_ffwd_51_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_51_0,
        out_intel_reserved_ffwd_52_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_52_0,
        out_intel_reserved_ffwd_53_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_53_0,
        out_intel_reserved_ffwd_54_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_54_0,
        out_intel_reserved_ffwd_55_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_55_0,
        out_intel_reserved_ffwd_5_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_5_0,
        out_intel_reserved_ffwd_6_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_6_0,
        out_intel_reserved_ffwd_7_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_7_0,
        out_intel_reserved_ffwd_8_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_8_0,
        out_intel_reserved_ffwd_9_0 => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_9_0,
        out_o_valid => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_out(LOGICAL,65)
    not_stall_out_q <= not (i_acl_sfc_exit_c0_wt_entry_gmm_substract_c0_exit_gmm_substract_aunroll_x_out_stall_entry);

    -- input_accepted_and(LOGICAL,64)
    input_accepted_and_q <= in_i_valid and not_stall_out_q;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_acl_sfc_exit_c0_wt_entry_gmm_substract_c0_exit_gmm_substract_aunroll_x(BLACKBOX,60)@20000000
    -- out out_data_out_0@20000003
    -- out out_valid_out@20000003
    thei_acl_sfc_exit_c0_wt_entry_gmm_substract_c0_exit_gmm_substract_aunroll_x : i_acl_sfc_exit_c0_wt_entry_gmm_substract_c0_exit_gmm_substract2250
    PORT MAP (
        in_data_in_0 => GND_q,
        in_input_accepted => input_accepted_and_q,
        in_stall_in => in_i_stall,
        in_valid_in => i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_o_valid,
        out_data_out_0 => i_acl_sfc_exit_c0_wt_entry_gmm_substract_c0_exit_gmm_substract_aunroll_x_out_data_out_0,
        out_stall_entry => i_acl_sfc_exit_c0_wt_entry_gmm_substract_c0_exit_gmm_substract_aunroll_x_out_stall_entry,
        out_valid_out => i_acl_sfc_exit_c0_wt_entry_gmm_substract_c0_exit_gmm_substract_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_sync_out_aunroll_x(GPOUT,4)@83
    out_c0_exit_0 <= i_acl_sfc_exit_c0_wt_entry_gmm_substract_c0_exit_gmm_substract_aunroll_x_out_data_out_0;
    out_o_valid <= i_acl_sfc_exit_c0_wt_entry_gmm_substract_c0_exit_gmm_substract_aunroll_x_out_valid_out;

    -- dupName_5_regfree_osync_aunroll_x(GPOUT,6)
    out_intel_reserved_ffwd_15_0_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_15_0_0;
    out_intel_reserved_ffwd_15_0_1 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_15_0_1;
    out_intel_reserved_ffwd_15_0_2 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_15_0_2;

    -- dupName_0_regfree_osync_x(GPOUT,7)
    out_intel_reserved_ffwd_10_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_10_0;

    -- dupName_1_regfree_osync_x(GPOUT,8)
    out_intel_reserved_ffwd_11_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_11_0;

    -- dupName_2_regfree_osync_x(GPOUT,9)
    out_intel_reserved_ffwd_12_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_12_0;

    -- dupName_3_regfree_osync_x(GPOUT,10)
    out_intel_reserved_ffwd_13_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_13_0;

    -- dupName_4_regfree_osync_x(GPOUT,11)
    out_intel_reserved_ffwd_14_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_14_0;

    -- dupName_6_regfree_osync_x(GPOUT,12)
    out_intel_reserved_ffwd_17_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_17_0;

    -- dupName_7_regfree_osync_x(GPOUT,13)
    out_intel_reserved_ffwd_18_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_18_0;

    -- dupName_8_regfree_osync_x(GPOUT,14)
    out_intel_reserved_ffwd_19_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_19_0;

    -- dupName_9_regfree_osync_x(GPOUT,15)
    out_intel_reserved_ffwd_1_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_1_0;

    -- dupName_10_regfree_osync_x(GPOUT,16)
    out_intel_reserved_ffwd_20_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_20_0;

    -- dupName_11_regfree_osync_x(GPOUT,17)
    out_intel_reserved_ffwd_21_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_21_0;

    -- dupName_12_regfree_osync_x(GPOUT,18)
    out_intel_reserved_ffwd_22_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_22_0;

    -- dupName_13_regfree_osync_x(GPOUT,19)
    out_intel_reserved_ffwd_23_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_23_0;

    -- dupName_14_regfree_osync_x(GPOUT,20)
    out_intel_reserved_ffwd_24_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_24_0;

    -- dupName_15_regfree_osync_x(GPOUT,21)
    out_intel_reserved_ffwd_25_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_25_0;

    -- dupName_16_regfree_osync_x(GPOUT,22)
    out_intel_reserved_ffwd_26_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_26_0;

    -- dupName_17_regfree_osync_x(GPOUT,23)
    out_intel_reserved_ffwd_27_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_27_0;

    -- dupName_18_regfree_osync_x(GPOUT,24)
    out_intel_reserved_ffwd_28_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_28_0;

    -- dupName_19_regfree_osync_x(GPOUT,25)
    out_intel_reserved_ffwd_29_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_29_0;

    -- dupName_20_regfree_osync_x(GPOUT,26)
    out_intel_reserved_ffwd_2_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_2_0;

    -- dupName_21_regfree_osync_x(GPOUT,27)
    out_intel_reserved_ffwd_30_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_30_0;

    -- dupName_22_regfree_osync_x(GPOUT,28)
    out_intel_reserved_ffwd_31_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_31_0;

    -- dupName_23_regfree_osync_x(GPOUT,29)
    out_intel_reserved_ffwd_32_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_32_0;

    -- dupName_24_regfree_osync_x(GPOUT,30)
    out_intel_reserved_ffwd_33_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_33_0;

    -- dupName_25_regfree_osync_x(GPOUT,31)
    out_intel_reserved_ffwd_34_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_34_0;

    -- dupName_26_regfree_osync_x(GPOUT,32)
    out_intel_reserved_ffwd_35_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_35_0;

    -- dupName_27_regfree_osync_x(GPOUT,33)
    out_intel_reserved_ffwd_36_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_36_0;

    -- dupName_28_regfree_osync_x(GPOUT,34)
    out_intel_reserved_ffwd_37_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_37_0;

    -- dupName_29_regfree_osync_x(GPOUT,35)
    out_intel_reserved_ffwd_38_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_38_0;

    -- dupName_30_regfree_osync_x(GPOUT,36)
    out_intel_reserved_ffwd_39_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_39_0;

    -- dupName_31_regfree_osync_x(GPOUT,37)
    out_intel_reserved_ffwd_3_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_3_0;

    -- dupName_32_regfree_osync_x(GPOUT,38)
    out_intel_reserved_ffwd_40_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_40_0;

    -- dupName_33_regfree_osync_x(GPOUT,39)
    out_intel_reserved_ffwd_41_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_41_0;

    -- dupName_34_regfree_osync_x(GPOUT,40)
    out_intel_reserved_ffwd_42_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_42_0;

    -- dupName_35_regfree_osync_x(GPOUT,41)
    out_intel_reserved_ffwd_43_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_43_0;

    -- dupName_36_regfree_osync_x(GPOUT,42)
    out_intel_reserved_ffwd_44_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_44_0;

    -- dupName_37_regfree_osync_x(GPOUT,43)
    out_intel_reserved_ffwd_45_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_45_0;

    -- dupName_38_regfree_osync_x(GPOUT,44)
    out_intel_reserved_ffwd_46_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_46_0;

    -- dupName_39_regfree_osync_x(GPOUT,45)
    out_intel_reserved_ffwd_47_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_47_0;

    -- dupName_40_regfree_osync_x(GPOUT,46)
    out_intel_reserved_ffwd_48_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_48_0;

    -- dupName_41_regfree_osync_x(GPOUT,47)
    out_intel_reserved_ffwd_49_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_49_0;

    -- dupName_42_regfree_osync_x(GPOUT,48)
    out_intel_reserved_ffwd_4_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_4_0;

    -- dupName_43_regfree_osync_x(GPOUT,49)
    out_intel_reserved_ffwd_50_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_50_0;

    -- dupName_44_regfree_osync_x(GPOUT,50)
    out_intel_reserved_ffwd_51_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_51_0;

    -- dupName_45_regfree_osync_x(GPOUT,51)
    out_intel_reserved_ffwd_52_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_52_0;

    -- dupName_46_regfree_osync_x(GPOUT,52)
    out_intel_reserved_ffwd_53_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_53_0;

    -- dupName_47_regfree_osync_x(GPOUT,53)
    out_intel_reserved_ffwd_54_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_54_0;

    -- dupName_48_regfree_osync_x(GPOUT,54)
    out_intel_reserved_ffwd_55_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_55_0;

    -- dupName_49_regfree_osync_x(GPOUT,55)
    out_intel_reserved_ffwd_5_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_5_0;

    -- dupName_50_regfree_osync_x(GPOUT,56)
    out_intel_reserved_ffwd_6_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_6_0;

    -- dupName_51_regfree_osync_x(GPOUT,57)
    out_intel_reserved_ffwd_7_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_7_0;

    -- dupName_52_regfree_osync_x(GPOUT,58)
    out_intel_reserved_ffwd_8_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_8_0;

    -- dupName_53_regfree_osync_x(GPOUT,59)
    out_intel_reserved_ffwd_9_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_9_0;

    -- regfree_osync(GPOUT,66)
    out_intel_reserved_ffwd_0_0 <= i_sfc_logic_c0_wt_entry_gmm_substract_c0_enter_gmm_substract8_aunroll_x_out_intel_reserved_ffwd_0_0;

    -- sync_out(GPOUT,68)@20000000
    out_o_stall <= i_acl_sfc_exit_c0_wt_entry_gmm_substract_c0_exit_gmm_substract_aunroll_x_out_stall_entry;

END normal;
