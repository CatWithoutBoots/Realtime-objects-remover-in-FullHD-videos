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

-- VHDL created from bb_gmm_substract_B3
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

entity bb_gmm_substract_B3 is
    port (
        in_bg_th_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_d_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_in_alpha_0 : in std_logic_vector(9 downto 0);  -- ufix10
        in_s_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_forked2782_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked2782_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_intel_reserved_ffwd_20_0 : in std_logic_vector(8 downto 0);  -- ufix9
        in_intel_reserved_ffwd_21_0 : in std_logic_vector(8 downto 0);  -- ufix9
        in_intel_reserved_ffwd_22_0 : in std_logic_vector(8 downto 0);  -- ufix9
        in_intel_reserved_ffwd_23_0 : in std_logic_vector(8 downto 0);  -- ufix9
        in_intel_reserved_ffwd_24_0 : in std_logic_vector(8 downto 0);  -- ufix9
        in_intel_reserved_ffwd_25_0 : in std_logic_vector(8 downto 0);  -- ufix9
        in_intel_reserved_ffwd_26_0 : in std_logic_vector(8 downto 0);  -- ufix9
        in_intel_reserved_ffwd_27_0 : in std_logic_vector(8 downto 0);  -- ufix9
        in_intel_reserved_ffwd_28_0 : in std_logic_vector(8 downto 0);  -- ufix9
        in_intel_reserved_ffwd_33_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_intel_reserved_ffwd_36_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_intel_reserved_ffwd_38_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_intel_reserved_ffwd_39_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_40_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_41_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_51_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_intel_reserved_ffwd_52_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_intel_reserved_ffwd_54_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_intel_reserved_ffwd_55_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_intel_reserved_ffwd_73_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_intel_reserved_ffwd_74_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_75_0 : out std_logic_vector(8 downto 0);  -- ufix9
        out_intel_reserved_ffwd_76_0 : out std_logic_vector(8 downto 0);  -- ufix9
        out_intel_reserved_ffwd_77_0 : out std_logic_vector(8 downto 0);  -- ufix9
        out_intel_reserved_ffwd_78_0 : out std_logic_vector(8 downto 0);  -- ufix9
        out_intel_reserved_ffwd_79_0 : out std_logic_vector(8 downto 0);  -- ufix9
        out_intel_reserved_ffwd_80_0 : out std_logic_vector(8 downto 0);  -- ufix9
        out_intel_reserved_ffwd_81_0 : out std_logic_vector(8 downto 0);  -- ufix9
        out_intel_reserved_ffwd_82_0 : out std_logic_vector(8 downto 0);  -- ufix9
        out_intel_reserved_ffwd_83_0 : out std_logic_vector(8 downto 0);  -- ufix9
        out_intel_reserved_ffwd_84_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_intel_reserved_ffwd_85_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_intel_reserved_ffwd_86_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_intel_reserved_ffwd_87_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_intel_reserved_ffwd_88_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_intel_reserved_ffwd_89_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_90_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_91_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gmm_substract_B3;

architecture normal of bb_gmm_substract_B3 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_gmm_substract_B3_stall_region is
        port (
            in_forked : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked2782 : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going_gmm_substract_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going_gmm_substract_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2 : out std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component gmm_substract_B3_branch is
        port (
            in_c0_exe2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component gmm_substract_B3_merge is
        port (
            in_forked2782_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked2782_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_forked : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_forked2782 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_gmm_substract_B3_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going_gmm_substract_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B3_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going_gmm_substract_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B3_stall_region_out_c0_exe2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_73_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_74_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_75_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_76_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_77_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_78_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_79_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_80_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_81_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_82_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_83_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_84_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_85_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_86_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_87_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_88_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_89_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_90_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_91_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B3_stall_region_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B3_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B3_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B3_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B3_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B3_branch_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B3_merge_out_forked : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B3_merge_out_forked2782 : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B3_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B3_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B3_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- gmm_substract_B3_branch(BLACKBOX,34)
    thegmm_substract_B3_branch : gmm_substract_B3_branch
    PORT MAP (
        in_c0_exe2 => bb_gmm_substract_B3_stall_region_out_c0_exe2,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_valid_in => bb_gmm_substract_B3_stall_region_out_valid_out,
        out_stall_out => gmm_substract_B3_branch_out_stall_out,
        out_valid_out_0 => gmm_substract_B3_branch_out_valid_out_0,
        out_valid_out_1 => gmm_substract_B3_branch_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- gmm_substract_B3_merge(BLACKBOX,35)
    thegmm_substract_B3_merge : gmm_substract_B3_merge
    PORT MAP (
        in_forked2782_0 => in_forked2782_0,
        in_forked2782_1 => in_forked2782_1,
        in_forked_0 => in_forked_0,
        in_forked_1 => in_forked_1,
        in_stall_in => bb_gmm_substract_B3_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_forked => gmm_substract_B3_merge_out_forked,
        out_forked2782 => gmm_substract_B3_merge_out_forked2782,
        out_stall_out_0 => gmm_substract_B3_merge_out_stall_out_0,
        out_stall_out_1 => gmm_substract_B3_merge_out_stall_out_1,
        out_valid_out => gmm_substract_B3_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_gmm_substract_B3_stall_region(BLACKBOX,33)
    thebb_gmm_substract_B3_stall_region : bb_gmm_substract_B3_stall_region
    PORT MAP (
        in_forked => gmm_substract_B3_merge_out_forked,
        in_forked2782 => gmm_substract_B3_merge_out_forked2782,
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
        in_stall_in => gmm_substract_B3_branch_out_stall_out,
        in_valid_in => gmm_substract_B3_merge_out_valid_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going_gmm_substract_exiting_stall_out => bb_gmm_substract_B3_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going_gmm_substract_exiting_stall_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going_gmm_substract_exiting_valid_out => bb_gmm_substract_B3_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going_gmm_substract_exiting_valid_out,
        out_c0_exe2 => bb_gmm_substract_B3_stall_region_out_c0_exe2,
        out_intel_reserved_ffwd_73_0 => bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_73_0,
        out_intel_reserved_ffwd_74_0 => bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_74_0,
        out_intel_reserved_ffwd_75_0 => bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_75_0,
        out_intel_reserved_ffwd_76_0 => bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_76_0,
        out_intel_reserved_ffwd_77_0 => bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_77_0,
        out_intel_reserved_ffwd_78_0 => bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_78_0,
        out_intel_reserved_ffwd_79_0 => bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_79_0,
        out_intel_reserved_ffwd_80_0 => bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_80_0,
        out_intel_reserved_ffwd_81_0 => bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_81_0,
        out_intel_reserved_ffwd_82_0 => bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_82_0,
        out_intel_reserved_ffwd_83_0 => bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_83_0,
        out_intel_reserved_ffwd_84_0 => bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_84_0,
        out_intel_reserved_ffwd_85_0 => bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_85_0,
        out_intel_reserved_ffwd_86_0 => bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_86_0,
        out_intel_reserved_ffwd_87_0 => bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_87_0,
        out_intel_reserved_ffwd_88_0 => bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_88_0,
        out_intel_reserved_ffwd_89_0 => bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_89_0,
        out_intel_reserved_ffwd_90_0 => bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_90_0,
        out_intel_reserved_ffwd_91_0 => bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_91_0,
        out_pipeline_valid_out => bb_gmm_substract_B3_stall_region_out_pipeline_valid_out,
        out_stall_out => bb_gmm_substract_B3_stall_region_out_stall_out,
        out_valid_out => bb_gmm_substract_B3_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- out_exiting_stall_out(GPOUT,36)
    out_exiting_stall_out <= bb_gmm_substract_B3_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going_gmm_substract_exiting_stall_out;

    -- out_exiting_valid_out(GPOUT,37)
    out_exiting_valid_out <= bb_gmm_substract_B3_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going_gmm_substract_exiting_valid_out;

    -- out_intel_reserved_ffwd_73_0(GPOUT,38)
    out_intel_reserved_ffwd_73_0 <= bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_73_0;

    -- out_intel_reserved_ffwd_74_0(GPOUT,39)
    out_intel_reserved_ffwd_74_0 <= bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_74_0;

    -- out_intel_reserved_ffwd_75_0(GPOUT,40)
    out_intel_reserved_ffwd_75_0 <= bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_75_0;

    -- out_intel_reserved_ffwd_76_0(GPOUT,41)
    out_intel_reserved_ffwd_76_0 <= bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_76_0;

    -- out_intel_reserved_ffwd_77_0(GPOUT,42)
    out_intel_reserved_ffwd_77_0 <= bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_77_0;

    -- out_intel_reserved_ffwd_78_0(GPOUT,43)
    out_intel_reserved_ffwd_78_0 <= bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_78_0;

    -- out_intel_reserved_ffwd_79_0(GPOUT,44)
    out_intel_reserved_ffwd_79_0 <= bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_79_0;

    -- out_intel_reserved_ffwd_80_0(GPOUT,45)
    out_intel_reserved_ffwd_80_0 <= bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_80_0;

    -- out_intel_reserved_ffwd_81_0(GPOUT,46)
    out_intel_reserved_ffwd_81_0 <= bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_81_0;

    -- out_intel_reserved_ffwd_82_0(GPOUT,47)
    out_intel_reserved_ffwd_82_0 <= bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_82_0;

    -- out_intel_reserved_ffwd_83_0(GPOUT,48)
    out_intel_reserved_ffwd_83_0 <= bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_83_0;

    -- out_intel_reserved_ffwd_84_0(GPOUT,49)
    out_intel_reserved_ffwd_84_0 <= bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_84_0;

    -- out_intel_reserved_ffwd_85_0(GPOUT,50)
    out_intel_reserved_ffwd_85_0 <= bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_85_0;

    -- out_intel_reserved_ffwd_86_0(GPOUT,51)
    out_intel_reserved_ffwd_86_0 <= bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_86_0;

    -- out_intel_reserved_ffwd_87_0(GPOUT,52)
    out_intel_reserved_ffwd_87_0 <= bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_87_0;

    -- out_intel_reserved_ffwd_88_0(GPOUT,53)
    out_intel_reserved_ffwd_88_0 <= bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_88_0;

    -- out_intel_reserved_ffwd_89_0(GPOUT,54)
    out_intel_reserved_ffwd_89_0 <= bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_89_0;

    -- out_intel_reserved_ffwd_90_0(GPOUT,55)
    out_intel_reserved_ffwd_90_0 <= bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_90_0;

    -- out_intel_reserved_ffwd_91_0(GPOUT,56)
    out_intel_reserved_ffwd_91_0 <= bb_gmm_substract_B3_stall_region_out_intel_reserved_ffwd_91_0;

    -- out_stall_out_0(GPOUT,57)
    out_stall_out_0 <= gmm_substract_B3_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,58)
    out_stall_out_1 <= gmm_substract_B3_merge_out_stall_out_1;

    -- out_valid_out_0(GPOUT,59)
    out_valid_out_0 <= gmm_substract_B3_branch_out_valid_out_0;

    -- out_valid_out_1(GPOUT,60)
    out_valid_out_1 <= gmm_substract_B3_branch_out_valid_out_1;

    -- pipeline_valid_out_sync(GPOUT,62)
    out_pipeline_valid_out <= bb_gmm_substract_B3_stall_region_out_pipeline_valid_out;

END normal;
