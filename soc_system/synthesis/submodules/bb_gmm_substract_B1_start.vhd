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

-- VHDL created from bb_gmm_substract_B1_start
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

entity bb_gmm_substract_B1_start is
    port (
        in_bg_th_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_d_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_in_alpha_0 : in std_logic_vector(9 downto 0);  -- ufix10
        in_s_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_iord_bl_do_i_fifodata : in std_logic_vector(0 downto 0);  -- ufix1
        in_iord_bl_do_i_fifovalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_iord_bl_snk_i_fifodata : in std_logic_vector(175 downto 0);  -- ufix176
        in_iord_bl_snk_i_fifovalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_intel_reserved_ffwd_15_0_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_15_0_1 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_15_0_2 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_16_0_0 : out std_logic_vector(5 downto 0);  -- ufix6
        out_intel_reserved_ffwd_0_0 : out std_logic_vector(7 downto 0);  -- ufix8
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
        out_iord_bl_do_o_fifoready : out std_logic_vector(0 downto 0);  -- ufix1
        out_iord_bl_snk_o_fifoready : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_in_1 : in std_logic_vector(7 downto 0);  -- ufix8
        out_feedback_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gmm_substract_B1_start;

architecture normal of bb_gmm_substract_B1_start is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_gmm_substract_B1_start_stall_region is
        port (
            in_d_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_in_alpha_0 : in std_logic_vector(9 downto 0);  -- Fixed Point
            in_s_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_in_1 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_iord_bl_do_i_fifodata : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_iord_bl_do_i_fifovalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_iord_bl_snk_i_fifodata : in std_logic_vector(175 downto 0);  -- Fixed Point
            in_iord_bl_snk_i_fifovalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_15_0_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_15_0_1 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_15_0_2 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_16_0_0 : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_feedback_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_iord_bl_do_o_fifoready : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_iord_bl_snk_o_fifoready : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component gmm_substract_B1_start_branch is
        port (
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component gmm_substract_B1_start_merge is
        port (
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_15_0_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_15_0_1 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_15_0_2 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_16_0_0 : STD_LOGIC_VECTOR (5 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_feedback_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_0_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_10_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_11_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_12_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_13_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_14_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_17_0 : STD_LOGIC_VECTOR (19 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_18_0 : STD_LOGIC_VECTOR (19 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_19_0 : STD_LOGIC_VECTOR (19 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_1_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_20_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_21_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_22_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_23_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_24_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_25_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_26_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_27_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_28_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_29_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_2_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_30_0 : STD_LOGIC_VECTOR (5 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_31_0 : STD_LOGIC_VECTOR (1 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_32_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_33_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_34_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_35_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_36_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_37_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_38_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_39_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_3_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_40_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_41_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_42_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_43_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_44_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_45_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_46_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_47_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_48_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_49_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_4_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_50_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_51_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_52_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_53_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_54_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_55_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_5_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_6_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_7_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_8_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_9_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_iord_bl_do_o_fifoready : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_iord_bl_snk_o_fifoready : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B1_start_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B1_start_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B1_start_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B1_start_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B1_start_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B1_start_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- gmm_substract_B1_start_merge(BLACKBOX,81)
    thegmm_substract_B1_start_merge : gmm_substract_B1_start_merge
    PORT MAP (
        in_stall_in => bb_gmm_substract_B1_start_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_stall_out_0 => gmm_substract_B1_start_merge_out_stall_out_0,
        out_stall_out_1 => gmm_substract_B1_start_merge_out_stall_out_1,
        out_valid_out => gmm_substract_B1_start_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- gmm_substract_B1_start_branch(BLACKBOX,80)
    thegmm_substract_B1_start_branch : gmm_substract_B1_start_branch
    PORT MAP (
        in_stall_in_0 => in_stall_in_0,
        in_valid_in => bb_gmm_substract_B1_start_stall_region_out_valid_out,
        out_stall_out => gmm_substract_B1_start_branch_out_stall_out,
        out_valid_out_0 => gmm_substract_B1_start_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_gmm_substract_B1_start_stall_region(BLACKBOX,76)
    thebb_gmm_substract_B1_start_stall_region : bb_gmm_substract_B1_start_stall_region
    PORT MAP (
        in_d_0 => in_d_0,
        in_in_alpha_0 => in_in_alpha_0,
        in_s_0 => in_s_0,
        in_feedback_in_1 => in_feedback_in_1,
        in_feedback_valid_in_1 => in_feedback_valid_in_1,
        in_iord_bl_do_i_fifodata => in_iord_bl_do_i_fifodata,
        in_iord_bl_do_i_fifovalid => in_iord_bl_do_i_fifovalid,
        in_iord_bl_snk_i_fifodata => in_iord_bl_snk_i_fifodata,
        in_iord_bl_snk_i_fifovalid => in_iord_bl_snk_i_fifovalid,
        in_stall_in => gmm_substract_B1_start_branch_out_stall_out,
        in_valid_in => gmm_substract_B1_start_merge_out_valid_out,
        out_intel_reserved_ffwd_15_0_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_15_0_0,
        out_intel_reserved_ffwd_15_0_1 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_15_0_1,
        out_intel_reserved_ffwd_15_0_2 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_15_0_2,
        out_intel_reserved_ffwd_16_0_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_16_0_0,
        out_feedback_stall_out_1 => bb_gmm_substract_B1_start_stall_region_out_feedback_stall_out_1,
        out_intel_reserved_ffwd_0_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_0_0,
        out_intel_reserved_ffwd_10_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_10_0,
        out_intel_reserved_ffwd_11_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_11_0,
        out_intel_reserved_ffwd_12_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_12_0,
        out_intel_reserved_ffwd_13_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_13_0,
        out_intel_reserved_ffwd_14_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_14_0,
        out_intel_reserved_ffwd_17_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_17_0,
        out_intel_reserved_ffwd_18_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_18_0,
        out_intel_reserved_ffwd_19_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_19_0,
        out_intel_reserved_ffwd_1_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_1_0,
        out_intel_reserved_ffwd_20_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_20_0,
        out_intel_reserved_ffwd_21_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_21_0,
        out_intel_reserved_ffwd_22_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_22_0,
        out_intel_reserved_ffwd_23_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_23_0,
        out_intel_reserved_ffwd_24_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_24_0,
        out_intel_reserved_ffwd_25_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_25_0,
        out_intel_reserved_ffwd_26_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_26_0,
        out_intel_reserved_ffwd_27_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_27_0,
        out_intel_reserved_ffwd_28_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_28_0,
        out_intel_reserved_ffwd_29_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_29_0,
        out_intel_reserved_ffwd_2_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_2_0,
        out_intel_reserved_ffwd_30_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_30_0,
        out_intel_reserved_ffwd_31_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_31_0,
        out_intel_reserved_ffwd_32_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_32_0,
        out_intel_reserved_ffwd_33_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_33_0,
        out_intel_reserved_ffwd_34_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_34_0,
        out_intel_reserved_ffwd_35_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_35_0,
        out_intel_reserved_ffwd_36_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_36_0,
        out_intel_reserved_ffwd_37_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_37_0,
        out_intel_reserved_ffwd_38_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_38_0,
        out_intel_reserved_ffwd_39_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_39_0,
        out_intel_reserved_ffwd_3_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_3_0,
        out_intel_reserved_ffwd_40_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_40_0,
        out_intel_reserved_ffwd_41_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_41_0,
        out_intel_reserved_ffwd_42_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_42_0,
        out_intel_reserved_ffwd_43_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_43_0,
        out_intel_reserved_ffwd_44_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_44_0,
        out_intel_reserved_ffwd_45_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_45_0,
        out_intel_reserved_ffwd_46_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_46_0,
        out_intel_reserved_ffwd_47_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_47_0,
        out_intel_reserved_ffwd_48_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_48_0,
        out_intel_reserved_ffwd_49_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_49_0,
        out_intel_reserved_ffwd_4_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_4_0,
        out_intel_reserved_ffwd_50_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_50_0,
        out_intel_reserved_ffwd_51_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_51_0,
        out_intel_reserved_ffwd_52_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_52_0,
        out_intel_reserved_ffwd_53_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_53_0,
        out_intel_reserved_ffwd_54_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_54_0,
        out_intel_reserved_ffwd_55_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_55_0,
        out_intel_reserved_ffwd_5_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_5_0,
        out_intel_reserved_ffwd_6_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_6_0,
        out_intel_reserved_ffwd_7_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_7_0,
        out_intel_reserved_ffwd_8_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_8_0,
        out_intel_reserved_ffwd_9_0 => bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_9_0,
        out_iord_bl_do_o_fifoready => bb_gmm_substract_B1_start_stall_region_out_iord_bl_do_o_fifoready,
        out_iord_bl_snk_o_fifoready => bb_gmm_substract_B1_start_stall_region_out_iord_bl_snk_o_fifoready,
        out_stall_out => bb_gmm_substract_B1_start_stall_region_out_stall_out,
        out_valid_out => bb_gmm_substract_B1_start_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- out_intel_reserved_ffwd_15_0_0(GPOUT,13)
    out_intel_reserved_ffwd_15_0_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_15_0_0;

    -- out_intel_reserved_ffwd_15_0_1(GPOUT,14)
    out_intel_reserved_ffwd_15_0_1 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_15_0_1;

    -- out_intel_reserved_ffwd_15_0_2(GPOUT,15)
    out_intel_reserved_ffwd_15_0_2 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_15_0_2;

    -- out_intel_reserved_ffwd_16_0_0(GPOUT,16)
    out_intel_reserved_ffwd_16_0_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_16_0_0;

    -- out_intel_reserved_ffwd_0_0(GPOUT,17)
    out_intel_reserved_ffwd_0_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_0_0;

    -- out_intel_reserved_ffwd_10_0(GPOUT,18)
    out_intel_reserved_ffwd_10_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_10_0;

    -- out_intel_reserved_ffwd_11_0(GPOUT,19)
    out_intel_reserved_ffwd_11_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_11_0;

    -- out_intel_reserved_ffwd_12_0(GPOUT,20)
    out_intel_reserved_ffwd_12_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_12_0;

    -- out_intel_reserved_ffwd_13_0(GPOUT,21)
    out_intel_reserved_ffwd_13_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_13_0;

    -- out_intel_reserved_ffwd_14_0(GPOUT,22)
    out_intel_reserved_ffwd_14_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_14_0;

    -- out_intel_reserved_ffwd_17_0(GPOUT,23)
    out_intel_reserved_ffwd_17_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_17_0;

    -- out_intel_reserved_ffwd_18_0(GPOUT,24)
    out_intel_reserved_ffwd_18_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_18_0;

    -- out_intel_reserved_ffwd_19_0(GPOUT,25)
    out_intel_reserved_ffwd_19_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_19_0;

    -- out_intel_reserved_ffwd_1_0(GPOUT,26)
    out_intel_reserved_ffwd_1_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_1_0;

    -- out_intel_reserved_ffwd_20_0(GPOUT,27)
    out_intel_reserved_ffwd_20_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_20_0;

    -- out_intel_reserved_ffwd_21_0(GPOUT,28)
    out_intel_reserved_ffwd_21_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_21_0;

    -- out_intel_reserved_ffwd_22_0(GPOUT,29)
    out_intel_reserved_ffwd_22_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_22_0;

    -- out_intel_reserved_ffwd_23_0(GPOUT,30)
    out_intel_reserved_ffwd_23_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_23_0;

    -- out_intel_reserved_ffwd_24_0(GPOUT,31)
    out_intel_reserved_ffwd_24_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_24_0;

    -- out_intel_reserved_ffwd_25_0(GPOUT,32)
    out_intel_reserved_ffwd_25_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_25_0;

    -- out_intel_reserved_ffwd_26_0(GPOUT,33)
    out_intel_reserved_ffwd_26_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_26_0;

    -- out_intel_reserved_ffwd_27_0(GPOUT,34)
    out_intel_reserved_ffwd_27_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_27_0;

    -- out_intel_reserved_ffwd_28_0(GPOUT,35)
    out_intel_reserved_ffwd_28_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_28_0;

    -- out_intel_reserved_ffwd_29_0(GPOUT,36)
    out_intel_reserved_ffwd_29_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_29_0;

    -- out_intel_reserved_ffwd_2_0(GPOUT,37)
    out_intel_reserved_ffwd_2_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_2_0;

    -- out_intel_reserved_ffwd_30_0(GPOUT,38)
    out_intel_reserved_ffwd_30_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_30_0;

    -- out_intel_reserved_ffwd_31_0(GPOUT,39)
    out_intel_reserved_ffwd_31_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_31_0;

    -- out_intel_reserved_ffwd_32_0(GPOUT,40)
    out_intel_reserved_ffwd_32_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_32_0;

    -- out_intel_reserved_ffwd_33_0(GPOUT,41)
    out_intel_reserved_ffwd_33_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_33_0;

    -- out_intel_reserved_ffwd_34_0(GPOUT,42)
    out_intel_reserved_ffwd_34_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_34_0;

    -- out_intel_reserved_ffwd_35_0(GPOUT,43)
    out_intel_reserved_ffwd_35_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_35_0;

    -- out_intel_reserved_ffwd_36_0(GPOUT,44)
    out_intel_reserved_ffwd_36_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_36_0;

    -- out_intel_reserved_ffwd_37_0(GPOUT,45)
    out_intel_reserved_ffwd_37_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_37_0;

    -- out_intel_reserved_ffwd_38_0(GPOUT,46)
    out_intel_reserved_ffwd_38_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_38_0;

    -- out_intel_reserved_ffwd_39_0(GPOUT,47)
    out_intel_reserved_ffwd_39_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_39_0;

    -- out_intel_reserved_ffwd_3_0(GPOUT,48)
    out_intel_reserved_ffwd_3_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_3_0;

    -- out_intel_reserved_ffwd_40_0(GPOUT,49)
    out_intel_reserved_ffwd_40_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_40_0;

    -- out_intel_reserved_ffwd_41_0(GPOUT,50)
    out_intel_reserved_ffwd_41_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_41_0;

    -- out_intel_reserved_ffwd_42_0(GPOUT,51)
    out_intel_reserved_ffwd_42_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_42_0;

    -- out_intel_reserved_ffwd_43_0(GPOUT,52)
    out_intel_reserved_ffwd_43_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_43_0;

    -- out_intel_reserved_ffwd_44_0(GPOUT,53)
    out_intel_reserved_ffwd_44_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_44_0;

    -- out_intel_reserved_ffwd_45_0(GPOUT,54)
    out_intel_reserved_ffwd_45_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_45_0;

    -- out_intel_reserved_ffwd_46_0(GPOUT,55)
    out_intel_reserved_ffwd_46_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_46_0;

    -- out_intel_reserved_ffwd_47_0(GPOUT,56)
    out_intel_reserved_ffwd_47_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_47_0;

    -- out_intel_reserved_ffwd_48_0(GPOUT,57)
    out_intel_reserved_ffwd_48_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_48_0;

    -- out_intel_reserved_ffwd_49_0(GPOUT,58)
    out_intel_reserved_ffwd_49_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_49_0;

    -- out_intel_reserved_ffwd_4_0(GPOUT,59)
    out_intel_reserved_ffwd_4_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_4_0;

    -- out_intel_reserved_ffwd_50_0(GPOUT,60)
    out_intel_reserved_ffwd_50_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_50_0;

    -- out_intel_reserved_ffwd_51_0(GPOUT,61)
    out_intel_reserved_ffwd_51_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_51_0;

    -- out_intel_reserved_ffwd_52_0(GPOUT,62)
    out_intel_reserved_ffwd_52_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_52_0;

    -- out_intel_reserved_ffwd_53_0(GPOUT,63)
    out_intel_reserved_ffwd_53_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_53_0;

    -- out_intel_reserved_ffwd_54_0(GPOUT,64)
    out_intel_reserved_ffwd_54_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_54_0;

    -- out_intel_reserved_ffwd_55_0(GPOUT,65)
    out_intel_reserved_ffwd_55_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_55_0;

    -- out_intel_reserved_ffwd_5_0(GPOUT,66)
    out_intel_reserved_ffwd_5_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_5_0;

    -- out_intel_reserved_ffwd_6_0(GPOUT,67)
    out_intel_reserved_ffwd_6_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_6_0;

    -- out_intel_reserved_ffwd_7_0(GPOUT,68)
    out_intel_reserved_ffwd_7_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_7_0;

    -- out_intel_reserved_ffwd_8_0(GPOUT,69)
    out_intel_reserved_ffwd_8_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_8_0;

    -- out_intel_reserved_ffwd_9_0(GPOUT,70)
    out_intel_reserved_ffwd_9_0 <= bb_gmm_substract_B1_start_stall_region_out_intel_reserved_ffwd_9_0;

    -- out_iord_bl_do_o_fifoready(GPOUT,71)
    out_iord_bl_do_o_fifoready <= bb_gmm_substract_B1_start_stall_region_out_iord_bl_do_o_fifoready;

    -- out_iord_bl_snk_o_fifoready(GPOUT,72)
    out_iord_bl_snk_o_fifoready <= bb_gmm_substract_B1_start_stall_region_out_iord_bl_snk_o_fifoready;

    -- out_stall_out_0(GPOUT,73)
    out_stall_out_0 <= gmm_substract_B1_start_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,74)
    out_stall_out_1 <= gmm_substract_B1_start_merge_out_stall_out_1;

    -- out_valid_out_0(GPOUT,75)
    out_valid_out_0 <= gmm_substract_B1_start_branch_out_valid_out_0;

    -- feedback_stall_out_1_sync(GPOUT,78)
    out_feedback_stall_out_1 <= bb_gmm_substract_B1_start_stall_region_out_feedback_stall_out_1;

END normal;
