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

-- VHDL created from bb_gmm_substract_B3_stall_region
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

entity bb_gmm_substract_B3_stall_region is
    port (
        in_intel_reserved_ffwd_21_0 : in std_logic_vector(8 downto 0);  -- ufix9
        out_intel_reserved_ffwd_74_0 : out std_logic_vector(7 downto 0);  -- ufix8
        in_forked : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked2782 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_intel_reserved_ffwd_22_0 : in std_logic_vector(8 downto 0);  -- ufix9
        out_intel_reserved_ffwd_75_0 : out std_logic_vector(8 downto 0);  -- ufix9
        in_intel_reserved_ffwd_23_0 : in std_logic_vector(8 downto 0);  -- ufix9
        out_intel_reserved_ffwd_76_0 : out std_logic_vector(8 downto 0);  -- ufix9
        in_intel_reserved_ffwd_24_0 : in std_logic_vector(8 downto 0);  -- ufix9
        out_intel_reserved_ffwd_77_0 : out std_logic_vector(8 downto 0);  -- ufix9
        in_intel_reserved_ffwd_25_0 : in std_logic_vector(8 downto 0);  -- ufix9
        out_intel_reserved_ffwd_78_0 : out std_logic_vector(8 downto 0);  -- ufix9
        in_intel_reserved_ffwd_26_0 : in std_logic_vector(8 downto 0);  -- ufix9
        out_intel_reserved_ffwd_79_0 : out std_logic_vector(8 downto 0);  -- ufix9
        in_intel_reserved_ffwd_27_0 : in std_logic_vector(8 downto 0);  -- ufix9
        out_intel_reserved_ffwd_80_0 : out std_logic_vector(8 downto 0);  -- ufix9
        in_intel_reserved_ffwd_28_0 : in std_logic_vector(8 downto 0);  -- ufix9
        out_intel_reserved_ffwd_81_0 : out std_logic_vector(8 downto 0);  -- ufix9
        in_intel_reserved_ffwd_33_0 : in std_logic_vector(15 downto 0);  -- ufix16
        out_intel_reserved_ffwd_82_0 : out std_logic_vector(8 downto 0);  -- ufix9
        in_intel_reserved_ffwd_36_0 : in std_logic_vector(15 downto 0);  -- ufix16
        out_intel_reserved_ffwd_83_0 : out std_logic_vector(8 downto 0);  -- ufix9
        in_intel_reserved_ffwd_38_0 : in std_logic_vector(15 downto 0);  -- ufix16
        out_intel_reserved_ffwd_84_0 : out std_logic_vector(15 downto 0);  -- ufix16
        in_intel_reserved_ffwd_39_0 : in std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_85_0 : out std_logic_vector(15 downto 0);  -- ufix16
        in_intel_reserved_ffwd_40_0 : in std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_86_0 : out std_logic_vector(15 downto 0);  -- ufix16
        in_intel_reserved_ffwd_41_0 : in std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_87_0 : out std_logic_vector(31 downto 0);  -- ufix32
        in_intel_reserved_ffwd_51_0 : in std_logic_vector(31 downto 0);  -- ufix32
        out_intel_reserved_ffwd_88_0 : out std_logic_vector(31 downto 0);  -- ufix32
        in_intel_reserved_ffwd_52_0 : in std_logic_vector(31 downto 0);  -- ufix32
        out_intel_reserved_ffwd_89_0 : out std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_54_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_intel_reserved_ffwd_90_0 : out std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_55_0 : in std_logic_vector(31 downto 0);  -- ufix32
        out_intel_reserved_ffwd_91_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_aclp_to_limiter_i_acl_pipeline_keep_going_gmm_substract_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going_gmm_substract_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_intel_reserved_ffwd_20_0 : in std_logic_vector(8 downto 0);  -- ufix9
        out_intel_reserved_ffwd_73_0 : out std_logic_vector(15 downto 0);  -- ufix16
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gmm_substract_B3_stall_region;

architecture normal of bb_gmm_substract_B3_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component gmm_substract_B3_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract is
        port (
            in_c0_eni22818_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni22818_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni22818_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_20_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_21_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_22_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_23_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_24_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_25_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_26_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_27_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_28_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_33_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_36_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_38_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_39_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_40_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_41_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_51_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_52_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_54_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_55_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit2822_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit2822_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit2822_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going_gmm_substract_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going_gmm_substract_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_73_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_74_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_75_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_76_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_77_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_78_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_79_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_80_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_81_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_82_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_83_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_84_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_85_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_86_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_87_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_88_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_89_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_90_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_91_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B3_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B3_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B3_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B3_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_c0_exit2822_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_gmm_substract_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_gmm_substract_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_73_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_74_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_75_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_76_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_77_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_78_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_79_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_80_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_81_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_82_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_83_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_84_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_85_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_86_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_87_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_88_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_89_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_90_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_91_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_gmm_substract_B3_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (1 downto 0);
    signal bubble_select_gmm_substract_B3_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_gmm_substract_B3_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (1 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gmm_substract_B3_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gmm_substract_B3_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gmm_substract_B3_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_stall_entry(STALLENABLE,73)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= gmm_substract_B3_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,66)
    bubble_join_stall_entry_q <= in_forked2782 & in_forked;

    -- bubble_select_stall_entry(BITSELECT,67)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(0 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1 downto 1));

    -- gmm_substract_B3_merge_reg_aunroll_x(BLACKBOX,42)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_data_out_1@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thegmm_substract_B3_merge_reg_aunroll_x : gmm_substract_B3_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_b,
        in_data_in_1 => bubble_select_stall_entry_c,
        in_stall_in => SE_out_gmm_substract_B3_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => gmm_substract_B3_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => gmm_substract_B3_merge_reg_aunroll_x_out_data_out_1,
        out_stall_out => gmm_substract_B3_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => gmm_substract_B3_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_gmm_substract_B3_merge_reg_aunroll_x(STALLENABLE,70)
    -- Valid signal propagation
    SE_out_gmm_substract_B3_merge_reg_aunroll_x_V0 <= SE_out_gmm_substract_B3_merge_reg_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_gmm_substract_B3_merge_reg_aunroll_x_backStall <= i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_o_stall or not (SE_out_gmm_substract_B3_merge_reg_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_gmm_substract_B3_merge_reg_aunroll_x_wireValid <= gmm_substract_B3_merge_reg_aunroll_x_out_valid_out;

    -- SE_out_i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x(STALLENABLE,72)
    -- Valid signal propagation
    SE_out_i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_V0 <= SE_out_i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_backStall <= in_stall_in or not (SE_out_i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_wireValid <= i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_o_valid;

    -- bubble_join_gmm_substract_B3_merge_reg_aunroll_x(BITJOIN,59)
    bubble_join_gmm_substract_B3_merge_reg_aunroll_x_q <= gmm_substract_B3_merge_reg_aunroll_x_out_data_out_1 & gmm_substract_B3_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_gmm_substract_B3_merge_reg_aunroll_x(BITSELECT,60)
    bubble_select_gmm_substract_B3_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_gmm_substract_B3_merge_reg_aunroll_x_q(0 downto 0));
    bubble_select_gmm_substract_B3_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_gmm_substract_B3_merge_reg_aunroll_x_q(1 downto 1));

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x(BLACKBOX,43)@1
    -- in in_i_stall@20000000
    -- out out_c0_exit2822_0@8
    -- out out_c0_exit2822_1@8
    -- out out_c0_exit2822_2@8
    -- out out_aclp_to_limiter_i_acl_pipeline_keep_going_gmm_substract_exiting_stall_out@20000000
    -- out out_aclp_to_limiter_i_acl_pipeline_keep_going_gmm_substract_exiting_valid_out@20000000
    -- out out_intel_reserved_ffwd_73_0@20000000
    -- out out_intel_reserved_ffwd_74_0@20000000
    -- out out_intel_reserved_ffwd_75_0@20000000
    -- out out_intel_reserved_ffwd_76_0@20000000
    -- out out_intel_reserved_ffwd_77_0@20000000
    -- out out_intel_reserved_ffwd_78_0@20000000
    -- out out_intel_reserved_ffwd_79_0@20000000
    -- out out_intel_reserved_ffwd_80_0@20000000
    -- out out_intel_reserved_ffwd_81_0@20000000
    -- out out_intel_reserved_ffwd_82_0@20000000
    -- out out_intel_reserved_ffwd_83_0@20000000
    -- out out_intel_reserved_ffwd_84_0@20000000
    -- out out_intel_reserved_ffwd_85_0@20000000
    -- out out_intel_reserved_ffwd_86_0@20000000
    -- out out_intel_reserved_ffwd_87_0@20000000
    -- out out_intel_reserved_ffwd_88_0@20000000
    -- out out_intel_reserved_ffwd_89_0@20000000
    -- out out_intel_reserved_ffwd_90_0@20000000
    -- out out_intel_reserved_ffwd_91_0@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@8
    -- out out_pipeline_valid_out@20000000
    thei_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x : i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract
    PORT MAP (
        in_c0_eni22818_0 => GND_q,
        in_c0_eni22818_1 => bubble_select_gmm_substract_B3_merge_reg_aunroll_x_b,
        in_c0_eni22818_2 => bubble_select_gmm_substract_B3_merge_reg_aunroll_x_c,
        in_i_stall => SE_out_i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_backStall,
        in_i_valid => SE_out_gmm_substract_B3_merge_reg_aunroll_x_V0,
        in_intel_reserved_ffwd_20_0 => in_intel_reserved_ffwd_20_0,
        in_intel_reserved_ffwd_21_0 => in_intel_reserved_ffwd_21_0,
        in_intel_reserved_ffwd_22_0 => in_intel_reserved_ffwd_22_0,
        in_intel_reserved_ffwd_23_0 => in_intel_reserved_ffwd_23_0,
        in_intel_reserved_ffwd_24_0 => in_intel_reserved_ffwd_24_0,
        in_intel_reserved_ffwd_25_0 => in_intel_reserved_ffwd_25_0,
        in_intel_reserved_ffwd_26_0 => in_intel_reserved_ffwd_26_0,
        in_intel_reserved_ffwd_27_0 => in_intel_reserved_ffwd_27_0,
        in_intel_reserved_ffwd_28_0 => in_intel_reserved_ffwd_28_0,
        in_intel_reserved_ffwd_33_0 => in_intel_reserved_ffwd_33_0,
        in_intel_reserved_ffwd_36_0 => in_intel_reserved_ffwd_36_0,
        in_intel_reserved_ffwd_38_0 => in_intel_reserved_ffwd_38_0,
        in_intel_reserved_ffwd_39_0 => in_intel_reserved_ffwd_39_0,
        in_intel_reserved_ffwd_40_0 => in_intel_reserved_ffwd_40_0,
        in_intel_reserved_ffwd_41_0 => in_intel_reserved_ffwd_41_0,
        in_intel_reserved_ffwd_51_0 => in_intel_reserved_ffwd_51_0,
        in_intel_reserved_ffwd_52_0 => in_intel_reserved_ffwd_52_0,
        in_intel_reserved_ffwd_54_0 => in_intel_reserved_ffwd_54_0,
        in_intel_reserved_ffwd_55_0 => in_intel_reserved_ffwd_55_0,
        in_pipeline_stall_in => in_pipeline_stall_in,
        out_c0_exit2822_2 => i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_c0_exit2822_2,
        out_aclp_to_limiter_i_acl_pipeline_keep_going_gmm_substract_exiting_stall_out => i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_gmm_substract_exiting_stall_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going_gmm_substract_exiting_valid_out => i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_gmm_substract_exiting_valid_out,
        out_intel_reserved_ffwd_73_0 => i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_73_0,
        out_intel_reserved_ffwd_74_0 => i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_74_0,
        out_intel_reserved_ffwd_75_0 => i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_75_0,
        out_intel_reserved_ffwd_76_0 => i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_76_0,
        out_intel_reserved_ffwd_77_0 => i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_77_0,
        out_intel_reserved_ffwd_78_0 => i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_78_0,
        out_intel_reserved_ffwd_79_0 => i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_79_0,
        out_intel_reserved_ffwd_80_0 => i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_80_0,
        out_intel_reserved_ffwd_81_0 => i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_81_0,
        out_intel_reserved_ffwd_82_0 => i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_82_0,
        out_intel_reserved_ffwd_83_0 => i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_83_0,
        out_intel_reserved_ffwd_84_0 => i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_84_0,
        out_intel_reserved_ffwd_85_0 => i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_85_0,
        out_intel_reserved_ffwd_86_0 => i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_86_0,
        out_intel_reserved_ffwd_87_0 => i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_87_0,
        out_intel_reserved_ffwd_88_0 => i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_88_0,
        out_intel_reserved_ffwd_89_0 => i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_89_0,
        out_intel_reserved_ffwd_90_0 => i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_90_0,
        out_intel_reserved_ffwd_91_0 => i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_91_0,
        out_o_stall => i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_o_valid,
        out_pipeline_valid_out => i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_pipeline_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_regfree_osync_x(GPOUT,5)
    out_intel_reserved_ffwd_74_0 <= i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_74_0;

    -- bubble_join_i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x(BITJOIN,62)
    bubble_join_i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_q <= i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_c0_exit2822_2;

    -- bubble_select_i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x(BITSELECT,63)
    bubble_select_i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_q(0 downto 0));

    -- dupName_0_sync_out_x(GPOUT,7)@8
    out_c0_exe2 <= bubble_select_i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_b;
    out_valid_out <= SE_out_i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_V0;

    -- dupName_1_regfree_osync_x(GPOUT,9)
    out_intel_reserved_ffwd_75_0 <= i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_75_0;

    -- dupName_2_regfree_osync_x(GPOUT,11)
    out_intel_reserved_ffwd_76_0 <= i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_76_0;

    -- dupName_3_regfree_osync_x(GPOUT,13)
    out_intel_reserved_ffwd_77_0 <= i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_77_0;

    -- dupName_4_regfree_osync_x(GPOUT,15)
    out_intel_reserved_ffwd_78_0 <= i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_78_0;

    -- dupName_5_regfree_osync_x(GPOUT,17)
    out_intel_reserved_ffwd_79_0 <= i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_79_0;

    -- dupName_6_regfree_osync_x(GPOUT,19)
    out_intel_reserved_ffwd_80_0 <= i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_80_0;

    -- dupName_7_regfree_osync_x(GPOUT,21)
    out_intel_reserved_ffwd_81_0 <= i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_81_0;

    -- dupName_8_regfree_osync_x(GPOUT,23)
    out_intel_reserved_ffwd_82_0 <= i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_82_0;

    -- dupName_9_regfree_osync_x(GPOUT,25)
    out_intel_reserved_ffwd_83_0 <= i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_83_0;

    -- dupName_10_regfree_osync_x(GPOUT,27)
    out_intel_reserved_ffwd_84_0 <= i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_84_0;

    -- dupName_11_regfree_osync_x(GPOUT,29)
    out_intel_reserved_ffwd_85_0 <= i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_85_0;

    -- dupName_12_regfree_osync_x(GPOUT,31)
    out_intel_reserved_ffwd_86_0 <= i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_86_0;

    -- dupName_13_regfree_osync_x(GPOUT,33)
    out_intel_reserved_ffwd_87_0 <= i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_87_0;

    -- dupName_14_regfree_osync_x(GPOUT,35)
    out_intel_reserved_ffwd_88_0 <= i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_88_0;

    -- dupName_15_regfree_osync_x(GPOUT,37)
    out_intel_reserved_ffwd_89_0 <= i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_89_0;

    -- dupName_16_regfree_osync_x(GPOUT,39)
    out_intel_reserved_ffwd_90_0 <= i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_90_0;

    -- dupName_17_regfree_osync_x(GPOUT,41)
    out_intel_reserved_ffwd_91_0 <= i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_91_0;

    -- ext_sig_sync_out(GPOUT,47)
    out_aclp_to_limiter_i_acl_pipeline_keep_going_gmm_substract_exiting_valid_out <= i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_gmm_substract_exiting_valid_out;
    out_aclp_to_limiter_i_acl_pipeline_keep_going_gmm_substract_exiting_stall_out <= i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_gmm_substract_exiting_stall_out;

    -- pipeline_valid_out_sync(GPOUT,51)
    out_pipeline_valid_out <= i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_pipeline_valid_out;

    -- regfree_osync(GPOUT,53)
    out_intel_reserved_ffwd_73_0 <= i_sfc_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract_aunroll_x_out_intel_reserved_ffwd_73_0;

    -- sync_out(GPOUT,57)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
