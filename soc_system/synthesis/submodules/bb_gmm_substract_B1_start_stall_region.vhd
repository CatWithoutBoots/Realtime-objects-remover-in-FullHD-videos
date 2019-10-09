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

-- VHDL created from bb_gmm_substract_B1_start_stall_region
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

entity bb_gmm_substract_B1_start_stall_region is
    port (
        in_in_alpha_0 : in std_logic_vector(9 downto 0);  -- ufix10
        in_s_0 : in std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_15_0_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_15_0_1 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_15_0_2 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_16_0_0 : out std_logic_vector(5 downto 0);  -- ufix6
        in_iord_bl_snk_i_fifodata : in std_logic_vector(175 downto 0);  -- ufix176
        in_iord_bl_snk_i_fifovalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_iord_bl_snk_o_fifoready : out std_logic_vector(0 downto 0);  -- ufix1
        out_intel_reserved_ffwd_10_0 : out std_logic_vector(7 downto 0);  -- ufix8
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
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
        in_iord_bl_do_i_fifodata : in std_logic_vector(0 downto 0);  -- ufix1
        in_iord_bl_do_i_fifovalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_iord_bl_do_o_fifoready : out std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_in_1 : in std_logic_vector(7 downto 0);  -- ufix8
        out_feedback_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_intel_reserved_ffwd_0_0 : out std_logic_vector(7 downto 0);  -- ufix8
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gmm_substract_B1_start_stall_region;

architecture normal of bb_gmm_substract_B1_start_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_ffwd_src_unnamed_gmm_substract58_gmm_substract2252 is
        port (
            in_src_data_in_16_0_0 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_16_0_0 : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract7 is
        port (
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_iord_bl_snk_i_fifodata : in std_logic_vector(175 downto 0);  -- Fixed Point
            in_iord_bl_snk_i_fifovalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(1 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_o_data_9 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_o_data_10 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_o_data_11 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_o_data_12 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_o_data_13 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_o_data_14 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_o_data_15 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_o_data_16 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_o_data_17 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_o_data_18 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_o_data_19 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_o_data_20 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_o_data_21 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_iord_bl_snk_o_fifoready : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract is
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
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_15_0_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_15_0_1 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_15_0_2 : out std_logic_vector(7 downto 0);  -- Fixed Point
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
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component gmm_substract_B1_start_merge_reg is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_throttle_pop_gmm_substract4 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_1 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_iord_bl_do_unnamed_gmm_substract0_gmm_substract6 is
        port (
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_iord_bl_do_i_fifodata : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_iord_bl_do_i_fifovalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_iord_bl_do_o_fifoready : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component acl_valid_fifo_counter is
        generic (
            DEPTH : INTEGER := 0;
            ASYNC_RESET : INTEGER := 1;
            STRICT_DEPTH : INTEGER := 0;
            ALLOW_FULL_WRITE : INTEGER := 0
        );
        port (
            clock : in std_logic;
            resetn : in std_logic;
            valid_in : in std_logic;
            stall_in : in std_logic;
            valid_out : out std_logic;
            stall_out : out std_logic;
            full : out std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_out_intel_reserved_ffwd_16_0_0 : STD_LOGIC_VECTOR (5 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (1 downto 0);
    signal i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (5 downto 0);
    signal i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (5 downto 0);
    signal i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_18 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_19 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_20 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_21 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_iord_bl_snk_o_fifoready : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_15_0_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_15_0_1 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_15_0_2 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_0_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_10_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_11_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_12_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_13_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_14_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_17_0 : STD_LOGIC_VECTOR (19 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_18_0 : STD_LOGIC_VECTOR (19 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_19_0 : STD_LOGIC_VECTOR (19 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_1_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_20_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_21_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_22_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_23_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_24_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_25_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_26_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_27_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_28_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_29_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_2_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_30_0 : STD_LOGIC_VECTOR (5 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_31_0 : STD_LOGIC_VECTOR (1 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_32_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_33_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_34_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_35_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_36_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_37_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_38_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_39_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_3_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_40_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_41_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_42_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_43_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_44_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_45_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_46_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_47_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_48_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_49_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_4_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_50_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_51_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_52_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_53_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_54_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_55_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_5_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_6_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_7_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_8_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_9_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B1_start_merge_reg_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B1_start_merge_reg_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_throttle_pop_gmm_substract_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_throttle_pop_gmm_substract_out_feedback_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_throttle_pop_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_throttle_pop_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_out_iord_bl_do_o_fifoready : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_out_o_data : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_q : STD_LOGIC_VECTOR (158 downto 0);
    signal bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_b : STD_LOGIC_VECTOR (1 downto 0);
    signal bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_c : STD_LOGIC_VECTOR (5 downto 0);
    signal bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_d : STD_LOGIC_VECTOR (5 downto 0);
    signal bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_e : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_f : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_g : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_h : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_i : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_j : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_k : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_l : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_m : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_n : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_o : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_p : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_r : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_s : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_t : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_u : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_v : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_w : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_acl_pop_i1_throttle_pop_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_acl_pop_i1_throttle_pop_gmm_substract_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_b : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gmm_substract_B1_start_merge_reg_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gmm_substract_B1_start_merge_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gmm_substract_B1_start_merge_reg_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_pop_i1_throttle_pop_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_pop_i1_throttle_pop_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_pop_i1_throttle_pop_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_reg_stall_out_bitsignaltemp : std_logic;

begin


    -- i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x(BLACKBOX,74)@2
    -- in in_i_stall@20000000
    -- out out_iord_bl_snk_o_fifoready@20000000
    -- out out_o_stall@20000000
    thei_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x : i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract7
    PORT MAP (
        in_i_dependence => bubble_select_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_b,
        in_i_stall => SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_backStall,
        in_i_valid => SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_V1,
        in_iord_bl_snk_i_fifodata => in_iord_bl_snk_i_fifodata,
        in_iord_bl_snk_i_fifovalid => in_iord_bl_snk_i_fifovalid,
        out_o_data_0 => i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_0,
        out_o_data_1 => i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_1,
        out_o_data_2 => i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_2,
        out_o_data_3 => i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_3,
        out_o_data_4 => i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_4,
        out_o_data_5 => i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_5,
        out_o_data_6 => i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_6,
        out_o_data_7 => i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_7,
        out_o_data_8 => i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_8,
        out_o_data_9 => i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_9,
        out_o_data_10 => i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_10,
        out_o_data_11 => i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_11,
        out_o_data_12 => i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_12,
        out_o_data_13 => i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_13,
        out_o_data_14 => i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_14,
        out_o_data_15 => i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_15,
        out_o_data_16 => i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_16,
        out_o_data_17 => i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_17,
        out_o_data_18 => i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_18,
        out_o_data_19 => i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_19,
        out_o_data_20 => i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_20,
        out_o_data_21 => i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_21,
        out_iord_bl_snk_o_fifoready => i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_iord_bl_snk_o_fifoready,
        out_o_stall => i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_stall,
        out_o_valid => i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- SE_stall_entry(STALLENABLE,123)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= gmm_substract_B1_start_merge_reg_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- gmm_substract_B1_start_merge_reg(BLACKBOX,88)@0
    -- in in_stall_in@20000000
    -- out out_data_out@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thegmm_substract_B1_start_merge_reg : gmm_substract_B1_start_merge_reg
    PORT MAP (
        in_data_in => GND_q,
        in_stall_in => SE_out_gmm_substract_B1_start_merge_reg_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_stall_out => gmm_substract_B1_start_merge_reg_out_stall_out,
        out_valid_out => gmm_substract_B1_start_merge_reg_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_gmm_substract_B1_start_merge_reg(STALLENABLE,118)
    -- Valid signal propagation
    SE_out_gmm_substract_B1_start_merge_reg_V0 <= SE_out_gmm_substract_B1_start_merge_reg_wireValid;
    -- Backward Stall generation
    SE_out_gmm_substract_B1_start_merge_reg_backStall <= i_acl_pop_i1_throttle_pop_gmm_substract_out_stall_out or not (SE_out_gmm_substract_B1_start_merge_reg_wireValid);
    -- Computing multiple Valid(s)
    SE_out_gmm_substract_B1_start_merge_reg_wireValid <= gmm_substract_B1_start_merge_reg_out_valid_out;

    -- i_acl_pop_i1_throttle_pop_gmm_substract(BLACKBOX,89)@1
    -- in in_stall_in@20000000
    -- out out_data_out@2
    -- out out_feedback_stall_out_1@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@2
    thei_acl_pop_i1_throttle_pop_gmm_substract : i_acl_pop_i1_throttle_pop_gmm_substract4
    PORT MAP (
        in_data_in => GND_q,
        in_dir => GND_q,
        in_feedback_in_1 => in_feedback_in_1,
        in_feedback_valid_in_1 => in_feedback_valid_in_1,
        in_predicate => GND_q,
        in_stall_in => SE_out_i_acl_pop_i1_throttle_pop_gmm_substract_backStall,
        in_valid_in => SE_out_gmm_substract_B1_start_merge_reg_V0,
        out_data_out => i_acl_pop_i1_throttle_pop_gmm_substract_out_data_out,
        out_feedback_stall_out_1 => i_acl_pop_i1_throttle_pop_gmm_substract_out_feedback_stall_out_1,
        out_stall_out => i_acl_pop_i1_throttle_pop_gmm_substract_out_stall_out,
        out_valid_out => i_acl_pop_i1_throttle_pop_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_acl_pop_i1_throttle_pop_gmm_substract(STALLENABLE,120)
    -- Valid signal propagation
    SE_out_i_acl_pop_i1_throttle_pop_gmm_substract_V0 <= SE_out_i_acl_pop_i1_throttle_pop_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_acl_pop_i1_throttle_pop_gmm_substract_backStall <= i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_out_o_stall or not (SE_out_i_acl_pop_i1_throttle_pop_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_acl_pop_i1_throttle_pop_gmm_substract_wireValid <= i_acl_pop_i1_throttle_pop_gmm_substract_out_valid_out;

    -- bubble_join_i_acl_pop_i1_throttle_pop_gmm_substract(BITJOIN,105)
    bubble_join_i_acl_pop_i1_throttle_pop_gmm_substract_q <= i_acl_pop_i1_throttle_pop_gmm_substract_out_data_out;

    -- bubble_select_i_acl_pop_i1_throttle_pop_gmm_substract(BITSELECT,106)
    bubble_select_i_acl_pop_i1_throttle_pop_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_acl_pop_i1_throttle_pop_gmm_substract_q(0 downto 0));

    -- i_iord_bl_do_unnamed_gmm_substract0_gmm_substract(BLACKBOX,90)@2
    -- in in_i_stall@20000000
    -- out out_iord_bl_do_o_fifoready@20000000
    -- out out_o_stall@20000000
    thei_iord_bl_do_unnamed_gmm_substract0_gmm_substract : i_iord_bl_do_unnamed_gmm_substract0_gmm_substract6
    PORT MAP (
        in_i_dependence => bubble_select_i_acl_pop_i1_throttle_pop_gmm_substract_b,
        in_i_stall => SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_backStall,
        in_i_valid => SE_out_i_acl_pop_i1_throttle_pop_gmm_substract_V0,
        in_iord_bl_do_i_fifodata => in_iord_bl_do_i_fifodata,
        in_iord_bl_do_i_fifovalid => in_iord_bl_do_i_fifovalid,
        out_iord_bl_do_o_fifoready => i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_out_iord_bl_do_o_fifoready,
        out_o_data => i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_out_o_data,
        out_o_stall => i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_out_o_stall,
        out_o_valid => i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract(STALLENABLE,122)
    SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_fromReg0 <= (others => '0');
            SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_fromReg0 <= SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_toReg0;
            -- Succesor 1
            SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_fromReg1 <= SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_consumed0 <= (not (SE_in_i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_backStall) and SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_wireValid) or SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_fromReg0;
    SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_consumed1 <= (not (i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_stall) and SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_wireValid) or SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_fromReg1;
    -- Consuming
    SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_StallValid <= SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_backStall and SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_wireValid;
    SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_toReg0 <= SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_StallValid and SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_consumed0;
    SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_toReg1 <= SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_StallValid and SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_consumed1;
    -- Backward Stall generation
    SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_or0 <= SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_consumed0;
    SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_wireStall <= not (SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_consumed1 and SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_or0);
    SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_backStall <= SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_wireStall;
    -- Valid signal propagation
    SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_V0 <= SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_wireValid and not (SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_fromReg0);
    SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_V1 <= SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_wireValid and not (SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_wireValid <= i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_out_o_valid;

    -- bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_reg(STALLFIFO,145)
    bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_reg_valid_in <= SE_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_V0;
    bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_reg_stall_in <= SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_backStall;
    bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_reg_valid_in_bitsignaltemp <= bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_reg_valid_in(0);
    bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_reg_stall_in_bitsignaltemp <= bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_reg_stall_in(0);
    bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_reg_valid_out(0) <= bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_reg_valid_out_bitsignaltemp;
    bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_reg_stall_out(0) <= bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_reg_stall_out_bitsignaltemp;
    thebubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 82,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x(STALLENABLE,112)
    -- Valid signal propagation
    SE_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_V0 <= SE_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_backStall <= bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_reg_stall_out or not (SE_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_wireValid <= i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_out_valid_out;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x(BLACKBOX,73)@2
    -- in in_stall_in@20000000
    -- out out_intel_reserved_ffwd_16_0_0@20000000
    -- out out_stall_out@20000000
    thei_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x : i_ffwd_src_unnamed_gmm_substract58_gmm_substract2252
    PORT MAP (
        in_src_data_in_16_0_0 => bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_c,
        in_enable_in => VCC_q,
        in_stall_in => SE_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_backStall,
        in_valid_in => SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_V1,
        out_intel_reserved_ffwd_16_0_0 => i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_out_intel_reserved_ffwd_16_0_0,
        out_stall_out => i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_out_stall_out,
        out_valid_out => i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x(STALLENABLE,114)
    SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_fromReg0 <= (others => '0');
            SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_fromReg0 <= SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_fromReg1 <= SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_consumed0 <= (not (SE_in_i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_backStall) and SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_wireValid) or SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_fromReg0;
    SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_consumed1 <= (not (i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_out_stall_out) and SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_wireValid) or SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_fromReg1;
    -- Consuming
    SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_StallValid <= SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_backStall and SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_wireValid;
    SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_toReg0 <= SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_StallValid and SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_consumed0;
    SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_toReg1 <= SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_StallValid and SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_consumed1;
    -- Backward Stall generation
    SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_or0 <= SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_consumed0;
    SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_wireStall <= not (SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_consumed1 and SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_or0);
    SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_backStall <= SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_V0 <= SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_wireValid and not (SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_fromReg0);
    SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_V1 <= SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_wireValid and not (SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_wireValid <= i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_valid;

    -- SE_in_i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x(STALLENABLE,115)
    -- Valid signal propagation
    SE_in_i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_V0 <= SE_in_i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_in_i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_backStall <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_o_stall or not (SE_in_i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_in_i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_and0 <= SE_out_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_V0;
    SE_in_i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_wireValid <= SE_out_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_V0 and SE_in_i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_and0;

    -- SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1(STALLENABLE,126)
    -- Valid signal propagation
    SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_V0 <= SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_backStall <= in_stall_in or not (SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_and0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_reg_valid_out;
    SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_wireValid <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_o_valid and SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_and0;

    -- bubble_join_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x(BITJOIN,100)
    bubble_join_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_q <= i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_21 & i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_20 & i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_19 & i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_18 & i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_17 & i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_16 & i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_15 & i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_14 & i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_13 & i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_12 & i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_11 & i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_10 & i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_9 & i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_8 & i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_7 & i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_6 & i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_5 & i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_4 & i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_3 & i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_2 & i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_1 & i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_o_data_0;

    -- bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x(BITSELECT,101)
    bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_q(1 downto 0));
    bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_q(7 downto 2));
    bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_q(13 downto 8));
    bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_q(21 downto 14));
    bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_q(29 downto 22));
    bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_q(37 downto 30));
    bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_q(45 downto 38));
    bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_q(53 downto 46));
    bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_q(61 downto 54));
    bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_q(69 downto 62));
    bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_q(77 downto 70));
    bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_m <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_q(85 downto 78));
    bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_n <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_q(93 downto 86));
    bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_o <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_q(101 downto 94));
    bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_p <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_q(109 downto 102));
    bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_q <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_q(117 downto 110));
    bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_r <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_q(125 downto 118));
    bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_s <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_q(133 downto 126));
    bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_t <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_q(141 downto 134));
    bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_u <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_q(149 downto 142));
    bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_v <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_q(157 downto 150));
    bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_w <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_q(158 downto 158));

    -- bubble_join_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract(BITJOIN,108)
    bubble_join_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_q <= i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_out_o_data;

    -- bubble_select_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract(BITSELECT,109)
    bubble_select_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_q(0 downto 0));

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x(BLACKBOX,75)@2
    -- in in_i_stall@20000000
    -- out out_c0_exit_0@83
    -- out out_intel_reserved_ffwd_15_0_0@20000000
    -- out out_intel_reserved_ffwd_15_0_1@20000000
    -- out out_intel_reserved_ffwd_15_0_2@20000000
    -- out out_intel_reserved_ffwd_0_0@20000000
    -- out out_intel_reserved_ffwd_10_0@20000000
    -- out out_intel_reserved_ffwd_11_0@20000000
    -- out out_intel_reserved_ffwd_12_0@20000000
    -- out out_intel_reserved_ffwd_13_0@20000000
    -- out out_intel_reserved_ffwd_14_0@20000000
    -- out out_intel_reserved_ffwd_17_0@20000000
    -- out out_intel_reserved_ffwd_18_0@20000000
    -- out out_intel_reserved_ffwd_19_0@20000000
    -- out out_intel_reserved_ffwd_1_0@20000000
    -- out out_intel_reserved_ffwd_20_0@20000000
    -- out out_intel_reserved_ffwd_21_0@20000000
    -- out out_intel_reserved_ffwd_22_0@20000000
    -- out out_intel_reserved_ffwd_23_0@20000000
    -- out out_intel_reserved_ffwd_24_0@20000000
    -- out out_intel_reserved_ffwd_25_0@20000000
    -- out out_intel_reserved_ffwd_26_0@20000000
    -- out out_intel_reserved_ffwd_27_0@20000000
    -- out out_intel_reserved_ffwd_28_0@20000000
    -- out out_intel_reserved_ffwd_29_0@20000000
    -- out out_intel_reserved_ffwd_2_0@20000000
    -- out out_intel_reserved_ffwd_30_0@20000000
    -- out out_intel_reserved_ffwd_31_0@20000000
    -- out out_intel_reserved_ffwd_32_0@20000000
    -- out out_intel_reserved_ffwd_33_0@20000000
    -- out out_intel_reserved_ffwd_34_0@20000000
    -- out out_intel_reserved_ffwd_35_0@20000000
    -- out out_intel_reserved_ffwd_36_0@20000000
    -- out out_intel_reserved_ffwd_37_0@20000000
    -- out out_intel_reserved_ffwd_38_0@20000000
    -- out out_intel_reserved_ffwd_39_0@20000000
    -- out out_intel_reserved_ffwd_3_0@20000000
    -- out out_intel_reserved_ffwd_40_0@20000000
    -- out out_intel_reserved_ffwd_41_0@20000000
    -- out out_intel_reserved_ffwd_42_0@20000000
    -- out out_intel_reserved_ffwd_43_0@20000000
    -- out out_intel_reserved_ffwd_44_0@20000000
    -- out out_intel_reserved_ffwd_45_0@20000000
    -- out out_intel_reserved_ffwd_46_0@20000000
    -- out out_intel_reserved_ffwd_47_0@20000000
    -- out out_intel_reserved_ffwd_48_0@20000000
    -- out out_intel_reserved_ffwd_49_0@20000000
    -- out out_intel_reserved_ffwd_4_0@20000000
    -- out out_intel_reserved_ffwd_50_0@20000000
    -- out out_intel_reserved_ffwd_51_0@20000000
    -- out out_intel_reserved_ffwd_52_0@20000000
    -- out out_intel_reserved_ffwd_53_0@20000000
    -- out out_intel_reserved_ffwd_54_0@20000000
    -- out out_intel_reserved_ffwd_55_0@20000000
    -- out out_intel_reserved_ffwd_5_0@20000000
    -- out out_intel_reserved_ffwd_6_0@20000000
    -- out out_intel_reserved_ffwd_7_0@20000000
    -- out out_intel_reserved_ffwd_8_0@20000000
    -- out out_intel_reserved_ffwd_9_0@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@83
    thei_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x : i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract
    PORT MAP (
        in_c0_eni2_0 => GND_q,
        in_c0_eni2_1 => bubble_select_i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_b,
        in_c0_eni2_2 => bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_b,
        in_c0_eni2_3 => bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_c,
        in_c0_eni2_4 => bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_d,
        in_c0_eni2_5 => bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_e,
        in_c0_eni2_6 => bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_f,
        in_c0_eni2_7 => bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_g,
        in_c0_eni2_8 => bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_h,
        in_c0_eni2_9 => bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_i,
        in_c0_eni2_10 => bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_j,
        in_c0_eni2_11 => bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_k,
        in_c0_eni2_12 => bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_l,
        in_c0_eni2_13 => bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_m,
        in_c0_eni2_14 => bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_n,
        in_c0_eni2_15 => bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_o,
        in_c0_eni2_16 => bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_p,
        in_c0_eni2_17 => bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_q,
        in_c0_eni2_18 => bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_r,
        in_c0_eni2_19 => bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_s,
        in_c0_eni2_20 => bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_t,
        in_c0_eni2_21 => bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_u,
        in_c0_eni2_22 => bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_v,
        in_c0_eni2_23 => bubble_select_i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_w,
        in_d_0 => in_d_0,
        in_in_alpha_0 => in_in_alpha_0,
        in_s_0 => in_s_0,
        in_i_stall => SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_backStall,
        in_i_valid => SE_in_i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_V0,
        out_intel_reserved_ffwd_15_0_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_15_0_0,
        out_intel_reserved_ffwd_15_0_1 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_15_0_1,
        out_intel_reserved_ffwd_15_0_2 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_15_0_2,
        out_intel_reserved_ffwd_0_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_0_0,
        out_intel_reserved_ffwd_10_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_10_0,
        out_intel_reserved_ffwd_11_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_11_0,
        out_intel_reserved_ffwd_12_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_12_0,
        out_intel_reserved_ffwd_13_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_13_0,
        out_intel_reserved_ffwd_14_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_14_0,
        out_intel_reserved_ffwd_17_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_17_0,
        out_intel_reserved_ffwd_18_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_18_0,
        out_intel_reserved_ffwd_19_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_19_0,
        out_intel_reserved_ffwd_1_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_1_0,
        out_intel_reserved_ffwd_20_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_20_0,
        out_intel_reserved_ffwd_21_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_21_0,
        out_intel_reserved_ffwd_22_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_22_0,
        out_intel_reserved_ffwd_23_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_23_0,
        out_intel_reserved_ffwd_24_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_24_0,
        out_intel_reserved_ffwd_25_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_25_0,
        out_intel_reserved_ffwd_26_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_26_0,
        out_intel_reserved_ffwd_27_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_27_0,
        out_intel_reserved_ffwd_28_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_28_0,
        out_intel_reserved_ffwd_29_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_29_0,
        out_intel_reserved_ffwd_2_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_2_0,
        out_intel_reserved_ffwd_30_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_30_0,
        out_intel_reserved_ffwd_31_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_31_0,
        out_intel_reserved_ffwd_32_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_32_0,
        out_intel_reserved_ffwd_33_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_33_0,
        out_intel_reserved_ffwd_34_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_34_0,
        out_intel_reserved_ffwd_35_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_35_0,
        out_intel_reserved_ffwd_36_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_36_0,
        out_intel_reserved_ffwd_37_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_37_0,
        out_intel_reserved_ffwd_38_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_38_0,
        out_intel_reserved_ffwd_39_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_39_0,
        out_intel_reserved_ffwd_3_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_3_0,
        out_intel_reserved_ffwd_40_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_40_0,
        out_intel_reserved_ffwd_41_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_41_0,
        out_intel_reserved_ffwd_42_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_42_0,
        out_intel_reserved_ffwd_43_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_43_0,
        out_intel_reserved_ffwd_44_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_44_0,
        out_intel_reserved_ffwd_45_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_45_0,
        out_intel_reserved_ffwd_46_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_46_0,
        out_intel_reserved_ffwd_47_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_47_0,
        out_intel_reserved_ffwd_48_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_48_0,
        out_intel_reserved_ffwd_49_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_49_0,
        out_intel_reserved_ffwd_4_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_4_0,
        out_intel_reserved_ffwd_50_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_50_0,
        out_intel_reserved_ffwd_51_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_51_0,
        out_intel_reserved_ffwd_52_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_52_0,
        out_intel_reserved_ffwd_53_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_53_0,
        out_intel_reserved_ffwd_54_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_54_0,
        out_intel_reserved_ffwd_55_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_55_0,
        out_intel_reserved_ffwd_5_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_5_0,
        out_intel_reserved_ffwd_6_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_6_0,
        out_intel_reserved_ffwd_7_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_7_0,
        out_intel_reserved_ffwd_8_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_8_0,
        out_intel_reserved_ffwd_9_0 => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_9_0,
        out_o_stall => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- dupName_5_regfree_osync_aunroll_x(GPOUT,4)
    out_intel_reserved_ffwd_15_0_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_15_0_0;
    out_intel_reserved_ffwd_15_0_1 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_15_0_1;
    out_intel_reserved_ffwd_15_0_2 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_15_0_2;

    -- dupName_6_regfree_osync_aunroll_x(GPOUT,5)
    out_intel_reserved_ffwd_16_0_0 <= i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_out_intel_reserved_ffwd_16_0_0;

    -- dupName_0_ext_sig_sync_out_x(GPOUT,7)
    out_iord_bl_snk_o_fifoready <= i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract_aunroll_x_out_iord_bl_snk_o_fifoready;

    -- dupName_0_regfree_osync_x(GPOUT,10)
    out_intel_reserved_ffwd_10_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_10_0;

    -- dupName_0_sync_out_x(GPOUT,12)@83
    out_valid_out <= SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract58_gmm_substract_aunroll_x_1_V0;

    -- dupName_1_regfree_osync_x(GPOUT,15)
    out_intel_reserved_ffwd_11_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_11_0;

    -- dupName_2_regfree_osync_x(GPOUT,18)
    out_intel_reserved_ffwd_12_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_12_0;

    -- dupName_3_regfree_osync_x(GPOUT,21)
    out_intel_reserved_ffwd_13_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_13_0;

    -- dupName_4_regfree_osync_x(GPOUT,24)
    out_intel_reserved_ffwd_14_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_14_0;

    -- dupName_7_regfree_osync_x(GPOUT,25)
    out_intel_reserved_ffwd_17_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_17_0;

    -- dupName_8_regfree_osync_x(GPOUT,26)
    out_intel_reserved_ffwd_18_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_18_0;

    -- dupName_9_regfree_osync_x(GPOUT,27)
    out_intel_reserved_ffwd_19_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_19_0;

    -- dupName_10_regfree_osync_x(GPOUT,28)
    out_intel_reserved_ffwd_1_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_1_0;

    -- dupName_11_regfree_osync_x(GPOUT,29)
    out_intel_reserved_ffwd_20_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_20_0;

    -- dupName_12_regfree_osync_x(GPOUT,30)
    out_intel_reserved_ffwd_21_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_21_0;

    -- dupName_13_regfree_osync_x(GPOUT,31)
    out_intel_reserved_ffwd_22_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_22_0;

    -- dupName_14_regfree_osync_x(GPOUT,32)
    out_intel_reserved_ffwd_23_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_23_0;

    -- dupName_15_regfree_osync_x(GPOUT,33)
    out_intel_reserved_ffwd_24_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_24_0;

    -- dupName_16_regfree_osync_x(GPOUT,34)
    out_intel_reserved_ffwd_25_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_25_0;

    -- dupName_17_regfree_osync_x(GPOUT,35)
    out_intel_reserved_ffwd_26_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_26_0;

    -- dupName_18_regfree_osync_x(GPOUT,36)
    out_intel_reserved_ffwd_27_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_27_0;

    -- dupName_19_regfree_osync_x(GPOUT,37)
    out_intel_reserved_ffwd_28_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_28_0;

    -- dupName_20_regfree_osync_x(GPOUT,38)
    out_intel_reserved_ffwd_29_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_29_0;

    -- dupName_21_regfree_osync_x(GPOUT,39)
    out_intel_reserved_ffwd_2_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_2_0;

    -- dupName_22_regfree_osync_x(GPOUT,40)
    out_intel_reserved_ffwd_30_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_30_0;

    -- dupName_23_regfree_osync_x(GPOUT,41)
    out_intel_reserved_ffwd_31_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_31_0;

    -- dupName_24_regfree_osync_x(GPOUT,42)
    out_intel_reserved_ffwd_32_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_32_0;

    -- dupName_25_regfree_osync_x(GPOUT,43)
    out_intel_reserved_ffwd_33_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_33_0;

    -- dupName_26_regfree_osync_x(GPOUT,44)
    out_intel_reserved_ffwd_34_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_34_0;

    -- dupName_27_regfree_osync_x(GPOUT,45)
    out_intel_reserved_ffwd_35_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_35_0;

    -- dupName_28_regfree_osync_x(GPOUT,46)
    out_intel_reserved_ffwd_36_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_36_0;

    -- dupName_29_regfree_osync_x(GPOUT,47)
    out_intel_reserved_ffwd_37_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_37_0;

    -- dupName_30_regfree_osync_x(GPOUT,48)
    out_intel_reserved_ffwd_38_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_38_0;

    -- dupName_31_regfree_osync_x(GPOUT,49)
    out_intel_reserved_ffwd_39_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_39_0;

    -- dupName_32_regfree_osync_x(GPOUT,50)
    out_intel_reserved_ffwd_3_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_3_0;

    -- dupName_33_regfree_osync_x(GPOUT,51)
    out_intel_reserved_ffwd_40_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_40_0;

    -- dupName_34_regfree_osync_x(GPOUT,52)
    out_intel_reserved_ffwd_41_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_41_0;

    -- dupName_35_regfree_osync_x(GPOUT,53)
    out_intel_reserved_ffwd_42_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_42_0;

    -- dupName_36_regfree_osync_x(GPOUT,54)
    out_intel_reserved_ffwd_43_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_43_0;

    -- dupName_37_regfree_osync_x(GPOUT,55)
    out_intel_reserved_ffwd_44_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_44_0;

    -- dupName_38_regfree_osync_x(GPOUT,56)
    out_intel_reserved_ffwd_45_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_45_0;

    -- dupName_39_regfree_osync_x(GPOUT,57)
    out_intel_reserved_ffwd_46_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_46_0;

    -- dupName_40_regfree_osync_x(GPOUT,58)
    out_intel_reserved_ffwd_47_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_47_0;

    -- dupName_41_regfree_osync_x(GPOUT,59)
    out_intel_reserved_ffwd_48_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_48_0;

    -- dupName_42_regfree_osync_x(GPOUT,60)
    out_intel_reserved_ffwd_49_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_49_0;

    -- dupName_43_regfree_osync_x(GPOUT,61)
    out_intel_reserved_ffwd_4_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_4_0;

    -- dupName_44_regfree_osync_x(GPOUT,62)
    out_intel_reserved_ffwd_50_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_50_0;

    -- dupName_45_regfree_osync_x(GPOUT,63)
    out_intel_reserved_ffwd_51_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_51_0;

    -- dupName_46_regfree_osync_x(GPOUT,64)
    out_intel_reserved_ffwd_52_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_52_0;

    -- dupName_47_regfree_osync_x(GPOUT,65)
    out_intel_reserved_ffwd_53_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_53_0;

    -- dupName_48_regfree_osync_x(GPOUT,66)
    out_intel_reserved_ffwd_54_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_54_0;

    -- dupName_49_regfree_osync_x(GPOUT,67)
    out_intel_reserved_ffwd_55_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_55_0;

    -- dupName_50_regfree_osync_x(GPOUT,68)
    out_intel_reserved_ffwd_5_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_5_0;

    -- dupName_51_regfree_osync_x(GPOUT,69)
    out_intel_reserved_ffwd_6_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_6_0;

    -- dupName_52_regfree_osync_x(GPOUT,70)
    out_intel_reserved_ffwd_7_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_7_0;

    -- dupName_53_regfree_osync_x(GPOUT,71)
    out_intel_reserved_ffwd_8_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_8_0;

    -- dupName_54_regfree_osync_x(GPOUT,72)
    out_intel_reserved_ffwd_9_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_9_0;

    -- ext_sig_sync_out(GPOUT,84)
    out_iord_bl_do_o_fifoready <= i_iord_bl_do_unnamed_gmm_substract0_gmm_substract_out_iord_bl_do_o_fifoready;

    -- feedback_stall_out_1_sync(GPOUT,86)
    out_feedback_stall_out_1 <= i_acl_pop_i1_throttle_pop_gmm_substract_out_feedback_stall_out_1;

    -- regfree_osync(GPOUT,93)
    out_intel_reserved_ffwd_0_0 <= i_sfc_c0_wt_entry_gmm_substract_c0_enter_gmm_substract_aunroll_x_out_intel_reserved_ffwd_0_0;

    -- sync_out(GPOUT,97)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
