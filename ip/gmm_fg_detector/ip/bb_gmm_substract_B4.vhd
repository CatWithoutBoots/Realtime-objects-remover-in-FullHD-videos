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

-- VHDL created from bb_gmm_substract_B4
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

entity bb_gmm_substract_B4 is
    port (
        in_bg_th_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_d_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_in_alpha_0 : in std_logic_vector(9 downto 0);  -- ufix10
        in_s_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_forked2755_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked2755_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked2801_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked2801_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_intel_reserved_ffwd_35_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_intel_reserved_ffwd_69_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_70_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_71_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_72_0 : in std_logic_vector(33 downto 0);  -- ufix34
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_intel_reserved_ffwd_92_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gmm_substract_B4;

architecture normal of bb_gmm_substract_B4 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_gmm_substract_B4_stall_region is
        port (
            in_bg_th_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_forked2755 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked2801 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_35_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_69_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_70_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_71_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_72_0 : in std_logic_vector(33 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going2804_gmm_substract_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going2804_gmm_substract_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe22832 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_92_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component gmm_substract_B4_branch is
        port (
            in_c0_exe22832 : in std_logic_vector(0 downto 0);  -- Fixed Point
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


    component gmm_substract_B4_merge is
        port (
            in_forked2755_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked2755_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked2801_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked2801_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_forked2755 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_forked2801 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_gmm_substract_B4_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going2804_gmm_substract_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B4_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going2804_gmm_substract_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B4_stall_region_out_c0_exe22832 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B4_stall_region_out_intel_reserved_ffwd_92_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gmm_substract_B4_stall_region_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B4_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B4_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B4_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B4_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B4_branch_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B4_merge_out_forked2755 : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B4_merge_out_forked2801 : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B4_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B4_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B4_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- gmm_substract_B4_branch(BLACKBOX,20)
    thegmm_substract_B4_branch : gmm_substract_B4_branch
    PORT MAP (
        in_c0_exe22832 => bb_gmm_substract_B4_stall_region_out_c0_exe22832,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_valid_in => bb_gmm_substract_B4_stall_region_out_valid_out,
        out_stall_out => gmm_substract_B4_branch_out_stall_out,
        out_valid_out_0 => gmm_substract_B4_branch_out_valid_out_0,
        out_valid_out_1 => gmm_substract_B4_branch_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- gmm_substract_B4_merge(BLACKBOX,21)
    thegmm_substract_B4_merge : gmm_substract_B4_merge
    PORT MAP (
        in_forked2755_0 => in_forked2755_0,
        in_forked2755_1 => in_forked2755_1,
        in_forked2801_0 => in_forked2801_0,
        in_forked2801_1 => in_forked2801_1,
        in_stall_in => bb_gmm_substract_B4_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_forked2755 => gmm_substract_B4_merge_out_forked2755,
        out_forked2801 => gmm_substract_B4_merge_out_forked2801,
        out_stall_out_0 => gmm_substract_B4_merge_out_stall_out_0,
        out_stall_out_1 => gmm_substract_B4_merge_out_stall_out_1,
        out_valid_out => gmm_substract_B4_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_gmm_substract_B4_stall_region(BLACKBOX,19)
    thebb_gmm_substract_B4_stall_region : bb_gmm_substract_B4_stall_region
    PORT MAP (
        in_bg_th_0 => in_bg_th_0,
        in_forked2755 => gmm_substract_B4_merge_out_forked2755,
        in_forked2801 => gmm_substract_B4_merge_out_forked2801,
        in_intel_reserved_ffwd_35_0 => in_intel_reserved_ffwd_35_0,
        in_intel_reserved_ffwd_69_0 => in_intel_reserved_ffwd_69_0,
        in_intel_reserved_ffwd_70_0 => in_intel_reserved_ffwd_70_0,
        in_intel_reserved_ffwd_71_0 => in_intel_reserved_ffwd_71_0,
        in_intel_reserved_ffwd_72_0 => in_intel_reserved_ffwd_72_0,
        in_pipeline_stall_in => in_pipeline_stall_in,
        in_stall_in => gmm_substract_B4_branch_out_stall_out,
        in_valid_in => gmm_substract_B4_merge_out_valid_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going2804_gmm_substract_exiting_stall_out => bb_gmm_substract_B4_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going2804_gmm_substract_exiting_stall_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going2804_gmm_substract_exiting_valid_out => bb_gmm_substract_B4_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going2804_gmm_substract_exiting_valid_out,
        out_c0_exe22832 => bb_gmm_substract_B4_stall_region_out_c0_exe22832,
        out_intel_reserved_ffwd_92_0 => bb_gmm_substract_B4_stall_region_out_intel_reserved_ffwd_92_0,
        out_pipeline_valid_out => bb_gmm_substract_B4_stall_region_out_pipeline_valid_out,
        out_stall_out => bb_gmm_substract_B4_stall_region_out_stall_out,
        out_valid_out => bb_gmm_substract_B4_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- out_exiting_stall_out(GPOUT,22)
    out_exiting_stall_out <= bb_gmm_substract_B4_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going2804_gmm_substract_exiting_stall_out;

    -- out_exiting_valid_out(GPOUT,23)
    out_exiting_valid_out <= bb_gmm_substract_B4_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going2804_gmm_substract_exiting_valid_out;

    -- out_intel_reserved_ffwd_92_0(GPOUT,24)
    out_intel_reserved_ffwd_92_0 <= bb_gmm_substract_B4_stall_region_out_intel_reserved_ffwd_92_0;

    -- out_stall_out_0(GPOUT,25)
    out_stall_out_0 <= gmm_substract_B4_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,26)
    out_stall_out_1 <= gmm_substract_B4_merge_out_stall_out_1;

    -- out_valid_out_0(GPOUT,27)
    out_valid_out_0 <= gmm_substract_B4_branch_out_valid_out_0;

    -- out_valid_out_1(GPOUT,28)
    out_valid_out_1 <= gmm_substract_B4_branch_out_valid_out_1;

    -- pipeline_valid_out_sync(GPOUT,30)
    out_pipeline_valid_out <= bb_gmm_substract_B4_stall_region_out_pipeline_valid_out;

END normal;
