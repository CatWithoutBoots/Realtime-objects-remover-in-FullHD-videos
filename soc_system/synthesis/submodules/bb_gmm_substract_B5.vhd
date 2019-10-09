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

-- VHDL created from bb_gmm_substract_B5
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

entity bb_gmm_substract_B5 is
    port (
        in_bg_th_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_d_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_in_alpha_0 : in std_logic_vector(9 downto 0);  -- ufix10
        in_intel_reserved_ffwd_15_0_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_15_0_1 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_15_0_2 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_16_0_0 : in std_logic_vector(5 downto 0);  -- ufix6
        in_s_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_0_0 : in std_logic_vector(7 downto 0);  -- ufix8
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
        in_iowr_bl_src_i_fifoready : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_out_1 : out std_logic_vector(7 downto 0);  -- ufix8
        in_feedback_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_iowr_bl_src_o_fifodata : out std_logic_vector(175 downto 0);  -- ufix176
        out_iowr_bl_src_o_fifovalid : out std_logic_vector(0 downto 0);  -- ufix1
        out_iowr_nb_return_o_fifodata : out std_logic_vector(0 downto 0);  -- ufix1
        out_iowr_nb_return_o_fifovalid : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gmm_substract_B5;

architecture normal of bb_gmm_substract_B5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_gmm_substract_B5_stall_region is
        port (
            in_intel_reserved_ffwd_15_0_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_15_0_1 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_15_0_2 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_16_0_0 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_feedback_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            in_iowr_bl_src_i_fifoready : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_1 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_iowr_bl_src_o_fifodata : out std_logic_vector(175 downto 0);  -- Fixed Point
            out_iowr_bl_src_o_fifovalid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_iowr_nb_return_o_fifodata : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_iowr_nb_return_o_fifovalid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component gmm_substract_B5_branch is
        port (
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component gmm_substract_B5_merge is
        port (
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_gmm_substract_B5_stall_region_out_feedback_out_1 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B5_stall_region_out_feedback_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B5_stall_region_out_iowr_bl_src_o_fifodata : STD_LOGIC_VECTOR (175 downto 0);
    signal bb_gmm_substract_B5_stall_region_out_iowr_bl_src_o_fifovalid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B5_stall_region_out_iowr_nb_return_o_fifodata : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B5_stall_region_out_iowr_nb_return_o_fifovalid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B5_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B5_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B5_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B5_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B5_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B5_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- gmm_substract_B5_merge(BLACKBOX,70)
    thegmm_substract_B5_merge : gmm_substract_B5_merge
    PORT MAP (
        in_stall_in => bb_gmm_substract_B5_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        out_stall_out_0 => gmm_substract_B5_merge_out_stall_out_0,
        out_valid_out => gmm_substract_B5_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- gmm_substract_B5_branch(BLACKBOX,69)
    thegmm_substract_B5_branch : gmm_substract_B5_branch
    PORT MAP (
        in_stall_in_0 => in_stall_in_0,
        in_valid_in => bb_gmm_substract_B5_stall_region_out_valid_out,
        out_stall_out => gmm_substract_B5_branch_out_stall_out,
        out_valid_out_0 => gmm_substract_B5_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_gmm_substract_B5_stall_region(BLACKBOX,65)
    thebb_gmm_substract_B5_stall_region : bb_gmm_substract_B5_stall_region
    PORT MAP (
        in_intel_reserved_ffwd_15_0_0 => in_intel_reserved_ffwd_15_0_0,
        in_intel_reserved_ffwd_15_0_1 => in_intel_reserved_ffwd_15_0_1,
        in_intel_reserved_ffwd_15_0_2 => in_intel_reserved_ffwd_15_0_2,
        in_intel_reserved_ffwd_16_0_0 => in_intel_reserved_ffwd_16_0_0,
        in_feedback_stall_in_1 => in_feedback_stall_in_1,
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
        in_iowr_bl_src_i_fifoready => in_iowr_bl_src_i_fifoready,
        in_stall_in => gmm_substract_B5_branch_out_stall_out,
        in_valid_in => gmm_substract_B5_merge_out_valid_out,
        out_feedback_out_1 => bb_gmm_substract_B5_stall_region_out_feedback_out_1,
        out_feedback_valid_out_1 => bb_gmm_substract_B5_stall_region_out_feedback_valid_out_1,
        out_iowr_bl_src_o_fifodata => bb_gmm_substract_B5_stall_region_out_iowr_bl_src_o_fifodata,
        out_iowr_bl_src_o_fifovalid => bb_gmm_substract_B5_stall_region_out_iowr_bl_src_o_fifovalid,
        out_iowr_nb_return_o_fifodata => bb_gmm_substract_B5_stall_region_out_iowr_nb_return_o_fifodata,
        out_iowr_nb_return_o_fifovalid => bb_gmm_substract_B5_stall_region_out_iowr_nb_return_o_fifovalid,
        out_stall_out => bb_gmm_substract_B5_stall_region_out_stall_out,
        out_valid_out => bb_gmm_substract_B5_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- feedback_out_1_sync(GPOUT,66)
    out_feedback_out_1 <= bb_gmm_substract_B5_stall_region_out_feedback_out_1;

    -- feedback_valid_out_1_sync(GPOUT,68)
    out_feedback_valid_out_1 <= bb_gmm_substract_B5_stall_region_out_feedback_valid_out_1;

    -- out_iowr_bl_src_o_fifodata(GPOUT,71)
    out_iowr_bl_src_o_fifodata <= bb_gmm_substract_B5_stall_region_out_iowr_bl_src_o_fifodata;

    -- out_iowr_bl_src_o_fifovalid(GPOUT,72)
    out_iowr_bl_src_o_fifovalid <= bb_gmm_substract_B5_stall_region_out_iowr_bl_src_o_fifovalid;

    -- out_iowr_nb_return_o_fifodata(GPOUT,73)
    out_iowr_nb_return_o_fifodata <= bb_gmm_substract_B5_stall_region_out_iowr_nb_return_o_fifodata;

    -- out_iowr_nb_return_o_fifovalid(GPOUT,74)
    out_iowr_nb_return_o_fifovalid <= bb_gmm_substract_B5_stall_region_out_iowr_nb_return_o_fifovalid;

    -- out_stall_out_0(GPOUT,75)
    out_stall_out_0 <= gmm_substract_B5_merge_out_stall_out_0;

    -- out_valid_out_0(GPOUT,76)
    out_valid_out_0 <= gmm_substract_B5_branch_out_valid_out_0;

END normal;
