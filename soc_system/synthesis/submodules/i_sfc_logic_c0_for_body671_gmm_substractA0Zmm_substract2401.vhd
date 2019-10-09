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

-- VHDL created from i_sfc_logic_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract2401
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

entity i_sfc_logic_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract2401 is
    port (
        in_c0_eni22818_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni22818_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni22818_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
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
        out_c0_exi2_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi2_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi2_2 : out std_logic_vector(0 downto 0);  -- ufix1
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
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going_gmm_substract_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going_gmm_substract_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract2401;

architecture normal of i_sfc_logic_c0_for_body671_gmm_substract_c0_enter2819_gmm_substract2401 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_acl_pipeline_keep_going_gmm_substract2407 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_initeration_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_initeration_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_not_exitcond_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_not_exitcond_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_initeration_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_not_exitcond_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i16_pop13_gmm_substract2464 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_13 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_valid_in_13 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_stall_out_13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i16_pop24_gmm_substract2452 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_24 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_valid_in_24 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_stall_out_24 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i16_pop25_gmm_substract2456 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_25 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_valid_in_25 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_stall_out_25 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i16_pop26_gmm_substract2460 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_26 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_valid_in_26 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_stall_out_26 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i2_fpgaindvars_iv_pop12_gmm_substract2558 is
        port (
            in_data_in : in std_logic_vector(1 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_12 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(1 downto 0);  -- Fixed Point
            out_feedback_stall_out_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i32_n_11834_pop34_gmm_substract2502 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_34 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_valid_in_34 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_stall_out_34 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i32_pop27_gmm_substract2420 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_27 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_valid_in_27 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_stall_out_27 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i32_pop28_gmm_substract2424 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_28 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_valid_in_28 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_stall_out_28 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i32_pop29_gmm_substract2428 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_29 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_valid_in_29 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_stall_out_29 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i32_pop33_gmm_substract2432 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_33 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_valid_in_33 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_stall_out_33 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i4_cleanups_pop36_gmm_substract2403 is
        port (
            in_data_in : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_36 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_36 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(3 downto 0);  -- Fixed Point
            out_feedback_stall_out_36 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i4_initerations_pop35_gmm_substract2409 is
        port (
            in_data_in : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_35 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_35 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(3 downto 0);  -- Fixed Point
            out_feedback_stall_out_35 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i8_pop14_gmm_substract2448 is
        port (
            in_data_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_14 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_stall_out_14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i8_pop30_gmm_substract2436 is
        port (
            in_data_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_30 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_30 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_stall_out_30 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i8_pop31_gmm_substract2440 is
        port (
            in_data_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_31 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_31 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_stall_out_31 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i8_pop32_gmm_substract2444 is
        port (
            in_data_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_32 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_32 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_stall_out_32 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i9_pop15_gmm_substract2500 is
        port (
            in_data_in : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_15 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_valid_in_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_feedback_stall_out_15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i9_pop16_gmm_substract2488 is
        port (
            in_data_in : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_16 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_valid_in_16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_feedback_stall_out_16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i9_pop17_gmm_substract2484 is
        port (
            in_data_in : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_17 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_valid_in_17 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_feedback_stall_out_17 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i9_pop18_gmm_substract2496 is
        port (
            in_data_in : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_18 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_valid_in_18 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_feedback_stall_out_18 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i9_pop19_gmm_substract2480 is
        port (
            in_data_in : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_19 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_valid_in_19 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_feedback_stall_out_19 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i9_pop20_gmm_substract2476 is
        port (
            in_data_in : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_20 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_valid_in_20 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_feedback_stall_out_20 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i9_pop21_gmm_substract2492 is
        port (
            in_data_in : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_21 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_valid_in_21 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_feedback_stall_out_21 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i9_pop22_gmm_substract2472 is
        port (
            in_data_in : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_22 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_valid_in_22 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_feedback_stall_out_22 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i9_pop23_gmm_substract2468 is
        port (
            in_data_in : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_23 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_valid_in_23 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_feedback_stall_out_23 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i16_push13_gmm_substract2516 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_stall_in_13 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_out_13 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_valid_out_13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i16_push24_gmm_substract2538 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_stall_in_24 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_out_24 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_valid_out_24 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i16_push25_gmm_substract2540 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_stall_in_25 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_out_25 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_valid_out_25 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i16_push26_gmm_substract2542 is
        port (
            in_data_in : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_feedback_stall_in_26 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_out_26 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_valid_out_26 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_lastiniteration_gmm_substract2416 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_2 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_notexitcond_gmm_substract2566 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_first_cleanup : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_3 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i2_fpgaindvars_iv_push12_gmm_substract2561 is
        port (
            in_data_in : in std_logic_vector(1 downto 0);  -- Fixed Point
            in_feedback_stall_in_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(1 downto 0);  -- Fixed Point
            out_feedback_out_12 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_n_11834_push34_gmm_substract2504 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_34 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_34 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_34 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_push27_gmm_substract2544 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_27 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_27 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_27 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_push28_gmm_substract2546 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_28 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_28 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_28 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_push29_gmm_substract2548 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_29 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_29 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_push33_gmm_substract2556 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_33 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_33 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_33 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i4_cleanups_push36_gmm_substract2569 is
        port (
            in_data_in : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_feedback_stall_in_36 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(3 downto 0);  -- Fixed Point
            out_feedback_out_36 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_36 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i4_initerations_push35_gmm_substract2412 is
        port (
            in_data_in : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_feedback_stall_in_35 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(3 downto 0);  -- Fixed Point
            out_feedback_out_35 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_35 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i8_push14_gmm_substract2518 is
        port (
            in_data_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_stall_in_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_out_14 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i8_push30_gmm_substract2550 is
        port (
            in_data_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_stall_in_30 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_out_30 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_30 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i8_push31_gmm_substract2552 is
        port (
            in_data_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_stall_in_31 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_out_31 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_31 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i8_push32_gmm_substract2554 is
        port (
            in_data_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_stall_in_32 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_out_32 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_32 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i9_push15_gmm_substract2520 is
        port (
            in_data_in : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_feedback_stall_in_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_feedback_out_15 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_valid_out_15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i9_push16_gmm_substract2522 is
        port (
            in_data_in : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_feedback_stall_in_16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_feedback_out_16 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_valid_out_16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i9_push17_gmm_substract2524 is
        port (
            in_data_in : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_feedback_stall_in_17 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_feedback_out_17 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_valid_out_17 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i9_push18_gmm_substract2526 is
        port (
            in_data_in : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_feedback_stall_in_18 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_feedback_out_18 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_valid_out_18 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i9_push19_gmm_substract2528 is
        port (
            in_data_in : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_feedback_stall_in_19 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_feedback_out_19 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_valid_out_19 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i9_push20_gmm_substract2530 is
        port (
            in_data_in : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_feedback_stall_in_20 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_feedback_out_20 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_valid_out_20 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i9_push21_gmm_substract2532 is
        port (
            in_data_in : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_feedback_stall_in_21 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_feedback_out_21 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_valid_out_21 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i9_push22_gmm_substract2534 is
        port (
            in_data_in : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_feedback_stall_in_22 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_feedback_out_22 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_valid_out_22 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i9_push23_gmm_substract2536 is
        port (
            in_data_in : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_feedback_stall_in_23 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_feedback_out_23 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_feedback_valid_out_23 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_3302612_gmm_substract2498 is
        port (
            in_intel_reserved_ffwd_20_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_20_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_3332614_gmm_substract2494 is
        port (
            in_intel_reserved_ffwd_21_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_21_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_3362616_gmm_substract2490 is
        port (
            in_intel_reserved_ffwd_22_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_22_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_3392618_gmm_substract2486 is
        port (
            in_intel_reserved_ffwd_23_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_23_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_3422620_gmm_substract2482 is
        port (
            in_intel_reserved_ffwd_24_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_24_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_3452622_gmm_substract2478 is
        port (
            in_intel_reserved_ffwd_25_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_25_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_3482624_gmm_substract2474 is
        port (
            in_intel_reserved_ffwd_26_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_26_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_3512626_gmm_substract2470 is
        port (
            in_intel_reserved_ffwd_27_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_27_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_3542628_gmm_substract2466 is
        port (
            in_intel_reserved_ffwd_28_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_28_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_3772642_gmm_substract2462 is
        port (
            in_intel_reserved_ffwd_33_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_33_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_3772644_gmm_substract2458 is
        port (
            in_intel_reserved_ffwd_33_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_33_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_3832675_gmm_substract2454 is
        port (
            in_intel_reserved_ffwd_36_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_36_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_3892688_gmm_substract2450 is
        port (
            in_intel_reserved_ffwd_38_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_38_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_3972693_gmm_substract2446 is
        port (
            in_intel_reserved_ffwd_39_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_39_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_3972695_gmm_substract2442 is
        port (
            in_intel_reserved_ffwd_39_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_39_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_4002700_gmm_substract2438 is
        port (
            in_intel_reserved_ffwd_40_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_40_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_4032704_gmm_substract2434 is
        port (
            in_intel_reserved_ffwd_41_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_41_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_div_i_i2728_gmm_substract2430 is
        port (
            in_intel_reserved_ffwd_51_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_51_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_div_i_i2730_gmm_substract2426 is
        port (
            in_intel_reserved_ffwd_51_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_51_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_div_i_i_12733_gmm_substract2422 is
        port (
            in_intel_reserved_ffwd_52_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_52_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_div_i_i_22736_gmm_substract2418 is
        port (
            in_intel_reserved_ffwd_55_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_55_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_unnamed_gmm_substract77_gmm_substract2563 is
        port (
            in_intel_reserved_ffwd_54_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_54_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract78_gmm_substract2571 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_73_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_73_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract79_gmm_substract2573 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_74_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_74_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract80_gmm_substract2575 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_75_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_75_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract81_gmm_substract2577 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_76_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_76_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract82_gmm_substract2579 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_77_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_77_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract83_gmm_substract2581 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_78_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_78_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract84_gmm_substract2583 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_79_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_79_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract85_gmm_substract2585 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_80_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_80_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract86_gmm_substract2587 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_81_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_81_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract87_gmm_substract2589 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_82_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_82_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract88_gmm_substract2591 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_83_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_83_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract89_gmm_substract2593 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_84_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_84_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract90_gmm_substract2595 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_85_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_85_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract91_gmm_substract2597 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_86_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_86_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract92_gmm_substract2599 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_87_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_87_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract93_gmm_substract2601 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_88_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_88_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract94_gmm_substract2603 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_89_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_89_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract95_gmm_substract2605 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_90_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_90_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract96_gmm_substract2607 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_91_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_91_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_add_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_fpgaindvars_iv_next_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (1 downto 0);
    signal i_cleanups_shl_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (3 downto 0);
    signal i_next_cleanups_gmm_substract_gmm_substract2568_shift_narrow_x_b : STD_LOGIC_VECTOR (1 downto 0);
    signal c_i16_undef_q : STD_LOGIC_VECTOR (15 downto 0);
    signal c_i2_0gr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal c_i2_1gr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_2gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i4_0gr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal c_i4_1gr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal c_i4_7gr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal c_i8_undef_q : STD_LOGIC_VECTOR (7 downto 0);
    signal c_i9_undef_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_acl_428_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_428_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pipeline_keep_going_gmm_substract_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_gmm_substract_out_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_gmm_substract_out_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_gmm_substract_out_initeration_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_gmm_substract_out_not_exitcond_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_gmm_substract_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i16_pop13_gmm_substract_out_data_out : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_pop_i16_pop13_gmm_substract_out_feedback_stall_out_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i16_pop24_gmm_substract_out_data_out : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_pop_i16_pop24_gmm_substract_out_feedback_stall_out_24 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i16_pop25_gmm_substract_out_data_out : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_pop_i16_pop25_gmm_substract_out_feedback_stall_out_25 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i16_pop26_gmm_substract_out_data_out : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_pop_i16_pop26_gmm_substract_out_feedback_stall_out_26 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i2_fpgaindvars_iv_pop12_gmm_substract_out_data_out : STD_LOGIC_VECTOR (1 downto 0);
    signal i_acl_pop_i2_fpgaindvars_iv_pop12_gmm_substract_out_feedback_stall_out_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i32_n_11834_pop34_gmm_substract_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_n_11834_pop34_gmm_substract_out_feedback_stall_out_34 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i32_pop27_gmm_substract_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_pop27_gmm_substract_out_feedback_stall_out_27 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i32_pop28_gmm_substract_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_pop28_gmm_substract_out_feedback_stall_out_28 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i32_pop29_gmm_substract_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_pop29_gmm_substract_out_feedback_stall_out_29 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i32_pop33_gmm_substract_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_pop33_gmm_substract_out_feedback_stall_out_33 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i4_cleanups_pop36_gmm_substract_out_data_out : STD_LOGIC_VECTOR (3 downto 0);
    signal i_acl_pop_i4_cleanups_pop36_gmm_substract_out_feedback_stall_out_36 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i4_initerations_pop35_gmm_substract_out_data_out : STD_LOGIC_VECTOR (3 downto 0);
    signal i_acl_pop_i4_initerations_pop35_gmm_substract_out_feedback_stall_out_35 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i8_pop14_gmm_substract_out_data_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_pop_i8_pop14_gmm_substract_out_feedback_stall_out_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i8_pop30_gmm_substract_out_data_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_pop_i8_pop30_gmm_substract_out_feedback_stall_out_30 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i8_pop31_gmm_substract_out_data_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_pop_i8_pop31_gmm_substract_out_feedback_stall_out_31 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i8_pop32_gmm_substract_out_data_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_pop_i8_pop32_gmm_substract_out_feedback_stall_out_32 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i9_pop15_gmm_substract_out_data_out : STD_LOGIC_VECTOR (8 downto 0);
    signal i_acl_pop_i9_pop15_gmm_substract_out_feedback_stall_out_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i9_pop16_gmm_substract_out_data_out : STD_LOGIC_VECTOR (8 downto 0);
    signal i_acl_pop_i9_pop16_gmm_substract_out_feedback_stall_out_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i9_pop17_gmm_substract_out_data_out : STD_LOGIC_VECTOR (8 downto 0);
    signal i_acl_pop_i9_pop17_gmm_substract_out_feedback_stall_out_17 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i9_pop18_gmm_substract_out_data_out : STD_LOGIC_VECTOR (8 downto 0);
    signal i_acl_pop_i9_pop18_gmm_substract_out_feedback_stall_out_18 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i9_pop19_gmm_substract_out_data_out : STD_LOGIC_VECTOR (8 downto 0);
    signal i_acl_pop_i9_pop19_gmm_substract_out_feedback_stall_out_19 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i9_pop20_gmm_substract_out_data_out : STD_LOGIC_VECTOR (8 downto 0);
    signal i_acl_pop_i9_pop20_gmm_substract_out_feedback_stall_out_20 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i9_pop21_gmm_substract_out_data_out : STD_LOGIC_VECTOR (8 downto 0);
    signal i_acl_pop_i9_pop21_gmm_substract_out_feedback_stall_out_21 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i9_pop22_gmm_substract_out_data_out : STD_LOGIC_VECTOR (8 downto 0);
    signal i_acl_pop_i9_pop22_gmm_substract_out_feedback_stall_out_22 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i9_pop23_gmm_substract_out_data_out : STD_LOGIC_VECTOR (8 downto 0);
    signal i_acl_pop_i9_pop23_gmm_substract_out_feedback_stall_out_23 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i16_push13_gmm_substract_out_feedback_out_13 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_push_i16_push13_gmm_substract_out_feedback_valid_out_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i16_push24_gmm_substract_out_feedback_out_24 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_push_i16_push24_gmm_substract_out_feedback_valid_out_24 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i16_push25_gmm_substract_out_feedback_out_25 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_push_i16_push25_gmm_substract_out_feedback_valid_out_25 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i16_push26_gmm_substract_out_feedback_out_26 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_push_i16_push26_gmm_substract_out_feedback_valid_out_26 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_lastiniteration_gmm_substract_out_feedback_out_2 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_lastiniteration_gmm_substract_out_feedback_valid_out_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_notexitcond_gmm_substract_out_feedback_out_3 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_notexitcond_gmm_substract_out_feedback_valid_out_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i2_fpgaindvars_iv_push12_gmm_substract_out_feedback_out_12 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i2_fpgaindvars_iv_push12_gmm_substract_out_feedback_valid_out_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_n_11834_push34_gmm_substract_out_feedback_out_34 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_n_11834_push34_gmm_substract_out_feedback_valid_out_34 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_push27_gmm_substract_out_feedback_out_27 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_push27_gmm_substract_out_feedback_valid_out_27 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_push28_gmm_substract_out_feedback_out_28 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_push28_gmm_substract_out_feedback_valid_out_28 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_push29_gmm_substract_out_feedback_out_29 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_push29_gmm_substract_out_feedback_valid_out_29 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_push33_gmm_substract_out_feedback_out_33 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_push33_gmm_substract_out_feedback_valid_out_33 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i4_cleanups_push36_gmm_substract_out_feedback_out_36 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i4_cleanups_push36_gmm_substract_out_feedback_valid_out_36 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i4_initerations_push35_gmm_substract_out_feedback_out_35 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i4_initerations_push35_gmm_substract_out_feedback_valid_out_35 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i8_push14_gmm_substract_out_feedback_out_14 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i8_push14_gmm_substract_out_feedback_valid_out_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i8_push30_gmm_substract_out_feedback_out_30 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i8_push30_gmm_substract_out_feedback_valid_out_30 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i8_push31_gmm_substract_out_feedback_out_31 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i8_push31_gmm_substract_out_feedback_valid_out_31 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i8_push32_gmm_substract_out_feedback_out_32 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i8_push32_gmm_substract_out_feedback_valid_out_32 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i9_push15_gmm_substract_out_feedback_out_15 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_push_i9_push15_gmm_substract_out_feedback_valid_out_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i9_push16_gmm_substract_out_feedback_out_16 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_push_i9_push16_gmm_substract_out_feedback_valid_out_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i9_push17_gmm_substract_out_feedback_out_17 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_push_i9_push17_gmm_substract_out_feedback_valid_out_17 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i9_push18_gmm_substract_out_feedback_out_18 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_push_i9_push18_gmm_substract_out_feedback_valid_out_18 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i9_push19_gmm_substract_out_feedback_out_19 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_push_i9_push19_gmm_substract_out_feedback_valid_out_19 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i9_push20_gmm_substract_out_feedback_out_20 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_push_i9_push20_gmm_substract_out_feedback_valid_out_20 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i9_push21_gmm_substract_out_feedback_out_21 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_push_i9_push21_gmm_substract_out_feedback_valid_out_21 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i9_push22_gmm_substract_out_feedback_out_22 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_push_i9_push22_gmm_substract_out_feedback_valid_out_22 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i9_push23_gmm_substract_out_feedback_out_23 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_push_i9_push23_gmm_substract_out_feedback_valid_out_23 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_add_gmm_substract_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_gmm_substract_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_gmm_substract_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_gmm_substract_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_cleanups_shl_gmm_substract_vt_const_3_q : STD_LOGIC_VECTOR (2 downto 0);
    signal i_cleanups_shl_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_cleanups_shl_gmm_substract_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i129_gmm_substract_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp_i_i129_gmm_substract_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp_i_i129_gmm_substract_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp_i_i129_gmm_substract_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i129_not_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_acl_3302612_gmm_substract_out_dest_data_out_20_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_ffwd_dst_acl_3332614_gmm_substract_out_dest_data_out_21_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_ffwd_dst_acl_3362616_gmm_substract_out_dest_data_out_22_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_ffwd_dst_acl_3392618_gmm_substract_out_dest_data_out_23_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_ffwd_dst_acl_3422620_gmm_substract_out_dest_data_out_24_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_ffwd_dst_acl_3452622_gmm_substract_out_dest_data_out_25_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_ffwd_dst_acl_3482624_gmm_substract_out_dest_data_out_26_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_ffwd_dst_acl_3512626_gmm_substract_out_dest_data_out_27_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_ffwd_dst_acl_3542628_gmm_substract_out_dest_data_out_28_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_ffwd_dst_acl_3772642_gmm_substract_out_dest_data_out_33_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_ffwd_dst_acl_3772644_gmm_substract_out_dest_data_out_33_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_ffwd_dst_acl_3832675_gmm_substract_out_dest_data_out_36_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_ffwd_dst_acl_3892688_gmm_substract_out_dest_data_out_38_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_ffwd_dst_acl_3972693_gmm_substract_out_dest_data_out_39_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_acl_3972695_gmm_substract_out_dest_data_out_39_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_acl_4002700_gmm_substract_out_dest_data_out_40_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_acl_4032704_gmm_substract_out_dest_data_out_41_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_div_i_i2728_gmm_substract_out_dest_data_out_51_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_ffwd_dst_div_i_i2730_gmm_substract_out_dest_data_out_51_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_ffwd_dst_div_i_i_12733_gmm_substract_out_dest_data_out_52_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_ffwd_dst_div_i_i_22736_gmm_substract_out_dest_data_out_55_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_ffwd_dst_unnamed_gmm_substract77_gmm_substract_out_dest_data_out_54_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract78_gmm_substract_out_intel_reserved_ffwd_73_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract79_gmm_substract_out_intel_reserved_ffwd_74_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract80_gmm_substract_out_intel_reserved_ffwd_75_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract81_gmm_substract_out_intel_reserved_ffwd_76_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract82_gmm_substract_out_intel_reserved_ffwd_77_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract83_gmm_substract_out_intel_reserved_ffwd_78_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract84_gmm_substract_out_intel_reserved_ffwd_79_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract85_gmm_substract_out_intel_reserved_ffwd_80_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract86_gmm_substract_out_intel_reserved_ffwd_81_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract87_gmm_substract_out_intel_reserved_ffwd_82_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract88_gmm_substract_out_intel_reserved_ffwd_83_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract89_gmm_substract_out_intel_reserved_ffwd_84_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract90_gmm_substract_out_intel_reserved_ffwd_85_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract91_gmm_substract_out_intel_reserved_ffwd_86_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract92_gmm_substract_out_intel_reserved_ffwd_87_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract93_gmm_substract_out_intel_reserved_ffwd_88_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract94_gmm_substract_out_intel_reserved_ffwd_89_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract95_gmm_substract_out_intel_reserved_ffwd_90_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract96_gmm_substract_out_intel_reserved_ffwd_91_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_first_cleanup_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_fpgaindvars_iv_next_gmm_substract_a : STD_LOGIC_VECTOR (2 downto 0);
    signal i_fpgaindvars_iv_next_gmm_substract_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_fpgaindvars_iv_next_gmm_substract_o : STD_LOGIC_VECTOR (2 downto 0);
    signal i_fpgaindvars_iv_next_gmm_substract_q : STD_LOGIC_VECTOR (2 downto 0);
    signal i_last_initeration_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_masked_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_next_initerations_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_next_initerations_gmm_substract_vt_select_2_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_notexit_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_10_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_10_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_reduction_gmm_substract_11_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_11_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_reduction_gmm_substract_12_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_12_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_reduction_gmm_substract_13_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_13_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_reduction_gmm_substract_14_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_14_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_reduction_gmm_substract_15_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_15_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_reduction_gmm_substract_16_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_16_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_reduction_gmm_substract_17_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_17_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_reduction_gmm_substract_18_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_18_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_reduction_gmm_substract_19_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_19_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_20_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_20_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_21_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_21_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_22_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_22_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_23_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_23_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_24_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_24_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_25_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_25_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_26_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_26_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_27_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_27_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_28_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_28_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_29_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_29_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_30_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_30_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_31_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_31_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_reduction_gmm_substract_32_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_32_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_reduction_gmm_substract_33_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_33_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_reduction_gmm_substract_34_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_34_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_reduction_gmm_substract_35_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_35_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_36_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_36_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_37_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_37_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_38_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_38_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_39_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_39_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_40_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_40_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_41_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_41_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_42_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_42_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_43_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_43_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_44_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_44_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_45_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_45_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_46_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_46_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_47_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_47_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_48_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_48_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_49_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_49_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_50_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_50_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_51_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_51_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_52_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_52_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_53_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_53_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_reduction_gmm_substract_54_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_54_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_reduction_gmm_substract_55_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_55_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_reduction_gmm_substract_56_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_56_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_reduction_gmm_substract_57_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_57_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_reduction_gmm_substract_58_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_58_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_reduction_gmm_substract_59_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_59_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_reduction_gmm_substract_60_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_60_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_reduction_gmm_substract_61_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_61_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_reduction_gmm_substract_62_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_62_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_reduction_gmm_substract_63_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_63_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_reduction_gmm_substract_64_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_64_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_reduction_gmm_substract_65_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_65_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_reduction_gmm_substract_66_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_66_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_reduction_gmm_substract_67_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_67_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_reduction_gmm_substract_68_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_68_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_reduction_gmm_substract_69_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_69_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_reduction_gmm_substract_70_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_70_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_reduction_gmm_substract_71_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_72_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_73_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_74_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_75_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_76_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_9_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_9_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_replace_phi2613_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_replace_phi2613_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_replace_phi2615_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_replace_phi2615_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_replace_phi2617_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_replace_phi2617_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_replace_phi2619_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_replace_phi2619_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_replace_phi2621_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_replace_phi2621_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_replace_phi2623_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_replace_phi2623_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_replace_phi2625_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_replace_phi2625_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_replace_phi2627_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_replace_phi2627_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_replace_phi2641_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_replace_phi2641_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_replace_phi2643_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_replace_phi2643_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_replace_phi2674_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_replace_phi2674_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_replace_phi2687_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_replace_phi2687_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_replace_phi2692_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_replace_phi2692_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_replace_phi2694_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_replace_phi2694_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_replace_phi2699_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_replace_phi2699_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_replace_phi2703_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_replace_phi2703_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_replace_phi2727_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_replace_phi2727_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_replace_phi2729_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_replace_phi2729_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_replace_phi2732_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_replace_phi2732_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_replace_phi2735_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_replace_phi2735_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_replace_phi_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_replace_phi_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_selcond_gmm_substract_11_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_selcond_gmm_substract_12_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_selcond_gmm_substract_12_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_selcond_gmm_substract_15_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_selcond_gmm_substract_16_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_selcond_gmm_substract_17_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_selcond_gmm_substract_18_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_selcond_gmm_substract_18_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_selcond_gmm_substract_21_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_selcond_gmm_substract_24_demorgan_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_selcond_gmm_substract_28_demorgan_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_selcond_gmm_substract_29_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_selcond_gmm_substract_32_demorgan_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_selcond_gmm_substract_71_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_selcond_gmm_substract_76_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gmm_substract2405_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_unnamed_gmm_substract2405_vt_join_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_unnamed_gmm_substract2405_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gmm_substract2414_vt_join_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_unnamed_gmm_substract2414_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gmm_substract2506_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gmm_substract2506_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gmm_substract2508_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gmm_substract2508_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gmm_substract2510_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gmm_substract2510_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gmm_substract2512_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gmm_substract2512_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gmm_substract2514_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gmm_substract2514_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gmm_substract2565_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_xor_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0Idx1Rng1_uid377_i_next_cleanups_gmm_substract_gmm_substract2568_shift_x_in : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage0Idx1Rng1_uid377_i_next_cleanups_gmm_substract_gmm_substract2568_shift_x_b : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage0Idx1_uid378_i_next_cleanups_gmm_substract_gmm_substract2568_shift_x_q : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStageSel0Dto0_uid379_i_next_cleanups_gmm_substract_gmm_substract2568_shift_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStageSel0Dto0_uid379_i_next_cleanups_gmm_substract_gmm_substract2568_shift_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid380_i_next_cleanups_gmm_substract_gmm_substract2568_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid380_i_next_cleanups_gmm_substract_gmm_substract2568_shift_x_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage0Idx1Rng1_uid385_i_next_initerations_gmm_substract_gmm_substract2411_shift_x_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage0Idx1_uid387_i_next_initerations_gmm_substract_gmm_substract2411_shift_x_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage0_uid389_i_next_initerations_gmm_substract_gmm_substract2411_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid389_i_next_initerations_gmm_substract_gmm_substract2411_shift_x_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_unnamed_gmm_substract2414_BitSelect_for_a_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gmm_substract2414_join_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_exitcond_gmm_substract_cmp_sign_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_unnamed_gmm_substract2565_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_unnamed_gmm_substract2565_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_unnamed_gmm_substract2514_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_unnamed_gmm_substract2512_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_unnamed_gmm_substract2510_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_unnamed_gmm_substract2510_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_unnamed_gmm_substract2508_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_unnamed_gmm_substract2506_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_selcond_gmm_substract_32_demorgan_gmm_substract_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_selcond_gmm_substract_28_demorgan_gmm_substract_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_selcond_gmm_substract_24_demorgan_gmm_substract_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_selcond_gmm_substract_17_gmm_substract_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_reduction_gmm_substract_30_gmm_substract_q_1_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist13_i_reduction_gmm_substract_18_gmm_substract_q_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist14_i_reduction_gmm_substract_16_gmm_substract_q_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist15_i_reduction_gmm_substract_14_gmm_substract_q_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist16_i_reduction_gmm_substract_12_gmm_substract_q_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist17_i_first_cleanup_gmm_substract_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_i_first_cleanup_gmm_substract_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_i_cmp_i_i129_not_gmm_substract_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_i_cmp_i_i129_gmm_substract_c_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_i_acl_pop_i32_n_11834_pop34_gmm_substract_out_data_out_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist22_i_acl_pipeline_keep_going_gmm_substract_out_data_out_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_i_acl_pipeline_keep_going_gmm_substract_out_data_out_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_i_acl_pipeline_keep_going_gmm_substract_out_data_out_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_sync_in_aunroll_x_in_c0_eni22818_1_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_sync_in_aunroll_x_in_c0_eni22818_1_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_sync_in_aunroll_x_in_i_valid_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_sync_in_aunroll_x_in_i_valid_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_sync_in_aunroll_x_in_i_valid_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_bgTrunc_i_add_gmm_substract_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist28_sync_in_aunroll_x_in_i_valid_2(DELAY,425)
    redist28_sync_in_aunroll_x_in_i_valid_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist28_sync_in_aunroll_x_in_i_valid_2_q, clk => clock, aclr => resetn );

    -- redist29_sync_in_aunroll_x_in_i_valid_3(DELAY,426)
    redist29_sync_in_aunroll_x_in_i_valid_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist28_sync_in_aunroll_x_in_i_valid_2_q, xout => redist29_sync_in_aunroll_x_in_i_valid_3_q, clk => clock, aclr => resetn );

    -- redist30_sync_in_aunroll_x_in_i_valid_4(DELAY,427)
    redist30_sync_in_aunroll_x_in_i_valid_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist29_sync_in_aunroll_x_in_i_valid_3_q, xout => redist30_sync_in_aunroll_x_in_i_valid_4_q, clk => clock, aclr => resetn );

    -- i_ffwd_dst_acl_4032704_gmm_substract(BLACKBOX,203)@4
    thei_ffwd_dst_acl_4032704_gmm_substract : i_ffwd_dst_acl_4032704_gmm_substract2434
    PORT MAP (
        in_intel_reserved_ffwd_41_0 => in_intel_reserved_ffwd_41_0,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_dest_data_out_41_0 => i_ffwd_dst_acl_4032704_gmm_substract_out_dest_data_out_41_0,
        clock => clock,
        resetn => resetn
    );

    -- c_i2_1gr(CONSTANT,114)
    c_i2_1gr_q <= "11";

    -- i_fpgaindvars_iv_next_gmm_substract(ADD,229)@3
    i_fpgaindvars_iv_next_gmm_substract_a <= STD_LOGIC_VECTOR("0" & i_acl_pop_i2_fpgaindvars_iv_pop12_gmm_substract_out_data_out);
    i_fpgaindvars_iv_next_gmm_substract_b <= STD_LOGIC_VECTOR("0" & c_i2_1gr_q);
    i_fpgaindvars_iv_next_gmm_substract_o <= STD_LOGIC_VECTOR(UNSIGNED(i_fpgaindvars_iv_next_gmm_substract_a) + UNSIGNED(i_fpgaindvars_iv_next_gmm_substract_b));
    i_fpgaindvars_iv_next_gmm_substract_q <= i_fpgaindvars_iv_next_gmm_substract_o(2 downto 0);

    -- bgTrunc_i_fpgaindvars_iv_next_gmm_substract_sel_x(BITSELECT,3)@3
    bgTrunc_i_fpgaindvars_iv_next_gmm_substract_sel_x_b <= i_fpgaindvars_iv_next_gmm_substract_q(1 downto 0);

    -- i_acl_push_i2_fpgaindvars_iv_push12_gmm_substract(BLACKBOX,158)@3
    -- out out_feedback_out_12@20000000
    -- out out_feedback_valid_out_12@20000000
    thei_acl_push_i2_fpgaindvars_iv_push12_gmm_substract : i_acl_push_i2_fpgaindvars_iv_push12_gmm_substract2561
    PORT MAP (
        in_data_in => bgTrunc_i_fpgaindvars_iv_next_gmm_substract_sel_x_b,
        in_feedback_stall_in_12 => i_acl_pop_i2_fpgaindvars_iv_pop12_gmm_substract_out_feedback_stall_out_12,
        in_keep_going => redist22_i_acl_pipeline_keep_going_gmm_substract_out_data_out_2_q,
        in_stall_in => GND_q,
        in_valid_in => redist28_sync_in_aunroll_x_in_i_valid_2_q,
        out_feedback_out_12 => i_acl_push_i2_fpgaindvars_iv_push12_gmm_substract_out_feedback_out_12,
        out_feedback_valid_out_12 => i_acl_push_i2_fpgaindvars_iv_push12_gmm_substract_out_feedback_valid_out_12,
        clock => clock,
        resetn => resetn
    );

    -- redist25_sync_in_aunroll_x_in_c0_eni22818_1_2(DELAY,422)
    redist25_sync_in_aunroll_x_in_c0_eni22818_1_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni22818_1, xout => redist25_sync_in_aunroll_x_in_c0_eni22818_1_2_q, clk => clock, aclr => resetn );

    -- c_i2_0gr(CONSTANT,113)
    c_i2_0gr_q <= "00";

    -- i_acl_pop_i2_fpgaindvars_iv_pop12_gmm_substract(BLACKBOX,131)@3
    -- out out_feedback_stall_out_12@20000000
    thei_acl_pop_i2_fpgaindvars_iv_pop12_gmm_substract : i_acl_pop_i2_fpgaindvars_iv_pop12_gmm_substract2558
    PORT MAP (
        in_data_in => c_i2_0gr_q,
        in_dir => redist25_sync_in_aunroll_x_in_c0_eni22818_1_2_q,
        in_feedback_in_12 => i_acl_push_i2_fpgaindvars_iv_push12_gmm_substract_out_feedback_out_12,
        in_feedback_valid_in_12 => i_acl_push_i2_fpgaindvars_iv_push12_gmm_substract_out_feedback_valid_out_12,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist28_sync_in_aunroll_x_in_i_valid_2_q,
        out_data_out => i_acl_pop_i2_fpgaindvars_iv_pop12_gmm_substract_out_data_out,
        out_feedback_stall_out_12 => i_acl_pop_i2_fpgaindvars_iv_pop12_gmm_substract_out_feedback_stall_out_12,
        clock => clock,
        resetn => resetn
    );

    -- i_exitcond_gmm_substract_cmp_sign(LOGICAL,395)@3
    i_exitcond_gmm_substract_cmp_sign_q <= STD_LOGIC_VECTOR(i_acl_pop_i2_fpgaindvars_iv_pop12_gmm_substract_out_data_out(1 downto 1));

    -- i_ffwd_dst_unnamed_gmm_substract77_gmm_substract(BLACKBOX,208)@3
    thei_ffwd_dst_unnamed_gmm_substract77_gmm_substract : i_ffwd_dst_unnamed_gmm_substract77_gmm_substract2563
    PORT MAP (
        in_intel_reserved_ffwd_54_0 => in_intel_reserved_ffwd_54_0,
        in_stall_in => GND_q,
        in_valid_in => redist28_sync_in_aunroll_x_in_i_valid_2_q,
        out_dest_data_out_54_0 => i_ffwd_dst_unnamed_gmm_substract77_gmm_substract_out_dest_data_out_54_0,
        clock => clock,
        resetn => resetn
    );

    -- i_unnamed_gmm_substract2565(LOGICAL,352)@3
    i_unnamed_gmm_substract2565_q <= i_ffwd_dst_unnamed_gmm_substract77_gmm_substract_out_dest_data_out_54_0 or i_exitcond_gmm_substract_cmp_sign_q;

    -- redist0_i_unnamed_gmm_substract2565_q_1(DELAY,397)
    redist0_i_unnamed_gmm_substract2565_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_gmm_substract2565_q, xout => redist0_i_unnamed_gmm_substract2565_q_1_q, clk => clock, aclr => resetn );

    -- i_notexit_gmm_substract(LOGICAL,235)@4
    i_notexit_gmm_substract_q <= redist0_i_unnamed_gmm_substract2565_q_1_q xor VCC_q;

    -- i_acl_push_i1_notexitcond_gmm_substract(BLACKBOX,157)@4
    -- out out_feedback_out_3@20000000
    -- out out_feedback_valid_out_3@20000000
    thei_acl_push_i1_notexitcond_gmm_substract : i_acl_push_i1_notexitcond_gmm_substract2566
    PORT MAP (
        in_data_in => i_notexit_gmm_substract_q,
        in_feedback_stall_in_3 => i_acl_pipeline_keep_going_gmm_substract_out_not_exitcond_stall_out,
        in_first_cleanup => redist17_i_first_cleanup_gmm_substract_q_1_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_3 => i_acl_push_i1_notexitcond_gmm_substract_out_feedback_out_3,
        out_feedback_valid_out_3 => i_acl_push_i1_notexitcond_gmm_substract_out_feedback_valid_out_3,
        clock => clock,
        resetn => resetn
    );

    -- c_i4_0gr(CONSTANT,119)
    c_i4_0gr_q <= "0000";

    -- i_cleanups_shl_gmm_substract_vt_const_3(CONSTANT,181)
    i_cleanups_shl_gmm_substract_vt_const_3_q <= "000";

    -- rightShiftStage0Idx1Rng1_uid385_i_next_initerations_gmm_substract_gmm_substract2411_shift_x(BITSELECT,384)@1
    rightShiftStage0Idx1Rng1_uid385_i_next_initerations_gmm_substract_gmm_substract2411_shift_x_b <= i_acl_pop_i4_initerations_pop35_gmm_substract_out_data_out(3 downto 1);

    -- rightShiftStage0Idx1_uid387_i_next_initerations_gmm_substract_gmm_substract2411_shift_x(BITJOIN,386)@1
    rightShiftStage0Idx1_uid387_i_next_initerations_gmm_substract_gmm_substract2411_shift_x_q <= GND_q & rightShiftStage0Idx1Rng1_uid385_i_next_initerations_gmm_substract_gmm_substract2411_shift_x_b;

    -- i_acl_push_i4_initerations_push35_gmm_substract(BLACKBOX,165)@1
    -- out out_feedback_out_35@20000000
    -- out out_feedback_valid_out_35@20000000
    thei_acl_push_i4_initerations_push35_gmm_substract : i_acl_push_i4_initerations_push35_gmm_substract2412
    PORT MAP (
        in_data_in => i_next_initerations_gmm_substract_vt_join_q,
        in_feedback_stall_in_35 => i_acl_pop_i4_initerations_pop35_gmm_substract_out_feedback_stall_out_35,
        in_keep_going => i_acl_pipeline_keep_going_gmm_substract_out_data_out,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_feedback_out_35 => i_acl_push_i4_initerations_push35_gmm_substract_out_feedback_out_35,
        out_feedback_valid_out_35 => i_acl_push_i4_initerations_push35_gmm_substract_out_feedback_valid_out_35,
        clock => clock,
        resetn => resetn
    );

    -- c_i4_7gr(CONSTANT,121)
    c_i4_7gr_q <= "0111";

    -- i_acl_pop_i4_initerations_pop35_gmm_substract(BLACKBOX,138)@1
    -- out out_feedback_stall_out_35@20000000
    thei_acl_pop_i4_initerations_pop35_gmm_substract : i_acl_pop_i4_initerations_pop35_gmm_substract2409
    PORT MAP (
        in_data_in => c_i4_7gr_q,
        in_dir => in_c0_eni22818_1,
        in_feedback_in_35 => i_acl_push_i4_initerations_push35_gmm_substract_out_feedback_out_35,
        in_feedback_valid_in_35 => i_acl_push_i4_initerations_push35_gmm_substract_out_feedback_valid_out_35,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i4_initerations_pop35_gmm_substract_out_data_out,
        out_feedback_stall_out_35 => i_acl_pop_i4_initerations_pop35_gmm_substract_out_feedback_stall_out_35,
        clock => clock,
        resetn => resetn
    );

    -- rightShiftStage0_uid389_i_next_initerations_gmm_substract_gmm_substract2411_shift_x(MUX,388)@1
    rightShiftStage0_uid389_i_next_initerations_gmm_substract_gmm_substract2411_shift_x_s <= VCC_q;
    rightShiftStage0_uid389_i_next_initerations_gmm_substract_gmm_substract2411_shift_x_combproc: PROCESS (rightShiftStage0_uid389_i_next_initerations_gmm_substract_gmm_substract2411_shift_x_s, i_acl_pop_i4_initerations_pop35_gmm_substract_out_data_out, rightShiftStage0Idx1_uid387_i_next_initerations_gmm_substract_gmm_substract2411_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid389_i_next_initerations_gmm_substract_gmm_substract2411_shift_x_s) IS
            WHEN "0" => rightShiftStage0_uid389_i_next_initerations_gmm_substract_gmm_substract2411_shift_x_q <= i_acl_pop_i4_initerations_pop35_gmm_substract_out_data_out;
            WHEN "1" => rightShiftStage0_uid389_i_next_initerations_gmm_substract_gmm_substract2411_shift_x_q <= rightShiftStage0Idx1_uid387_i_next_initerations_gmm_substract_gmm_substract2411_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid389_i_next_initerations_gmm_substract_gmm_substract2411_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_next_initerations_gmm_substract_vt_select_2(BITSELECT,234)@1
    i_next_initerations_gmm_substract_vt_select_2_b <= rightShiftStage0_uid389_i_next_initerations_gmm_substract_gmm_substract2411_shift_x_q(2 downto 0);

    -- i_next_initerations_gmm_substract_vt_join(BITJOIN,233)@1
    i_next_initerations_gmm_substract_vt_join_q <= GND_q & i_next_initerations_gmm_substract_vt_select_2_b;

    -- i_unnamed_gmm_substract2414_BitSelect_for_a(BITSELECT,393)@1
    i_unnamed_gmm_substract2414_BitSelect_for_a_b <= i_next_initerations_gmm_substract_vt_join_q(0 downto 0);

    -- i_unnamed_gmm_substract2414_join(BITJOIN,394)@1
    i_unnamed_gmm_substract2414_join_q <= GND_q & GND_q & GND_q & i_unnamed_gmm_substract2414_BitSelect_for_a_b;

    -- i_unnamed_gmm_substract2414_vt_select_0(BITSELECT,346)@1
    i_unnamed_gmm_substract2414_vt_select_0_b <= i_unnamed_gmm_substract2414_join_q(0 downto 0);

    -- i_unnamed_gmm_substract2414_vt_join(BITJOIN,345)@1
    i_unnamed_gmm_substract2414_vt_join_q <= i_cleanups_shl_gmm_substract_vt_const_3_q & i_unnamed_gmm_substract2414_vt_select_0_b;

    -- i_last_initeration_gmm_substract(LOGICAL,230)@1
    i_last_initeration_gmm_substract_q <= "1" WHEN i_unnamed_gmm_substract2414_vt_join_q /= c_i4_0gr_q ELSE "0";

    -- i_acl_push_i1_lastiniteration_gmm_substract(BLACKBOX,156)@1
    -- out out_feedback_out_2@20000000
    -- out out_feedback_valid_out_2@20000000
    thei_acl_push_i1_lastiniteration_gmm_substract : i_acl_push_i1_lastiniteration_gmm_substract2416
    PORT MAP (
        in_data_in => i_last_initeration_gmm_substract_q,
        in_feedback_stall_in_2 => i_acl_pipeline_keep_going_gmm_substract_out_initeration_stall_out,
        in_keep_going => i_acl_pipeline_keep_going_gmm_substract_out_data_out,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_feedback_out_2 => i_acl_push_i1_lastiniteration_gmm_substract_out_feedback_out_2,
        out_feedback_valid_out_2 => i_acl_push_i1_lastiniteration_gmm_substract_out_feedback_valid_out_2,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pipeline_keep_going_gmm_substract(BLACKBOX,126)@1
    -- out out_exiting_stall_out@20000000
    -- out out_exiting_valid_out@20000000
    -- out out_initeration_stall_out@20000000
    -- out out_not_exitcond_stall_out@20000000
    -- out out_pipeline_valid_out@20000000
    thei_acl_pipeline_keep_going_gmm_substract : i_acl_pipeline_keep_going_gmm_substract2407
    PORT MAP (
        in_data_in => in_c0_eni22818_2,
        in_initeration_in => i_acl_push_i1_lastiniteration_gmm_substract_out_feedback_out_2,
        in_initeration_valid_in => i_acl_push_i1_lastiniteration_gmm_substract_out_feedback_valid_out_2,
        in_not_exitcond_in => i_acl_push_i1_notexitcond_gmm_substract_out_feedback_out_3,
        in_not_exitcond_valid_in => i_acl_push_i1_notexitcond_gmm_substract_out_feedback_valid_out_3,
        in_pipeline_stall_in => in_pipeline_stall_in,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pipeline_keep_going_gmm_substract_out_data_out,
        out_exiting_stall_out => i_acl_pipeline_keep_going_gmm_substract_out_exiting_stall_out,
        out_exiting_valid_out => i_acl_pipeline_keep_going_gmm_substract_out_exiting_valid_out,
        out_initeration_stall_out => i_acl_pipeline_keep_going_gmm_substract_out_initeration_stall_out,
        out_not_exitcond_stall_out => i_acl_pipeline_keep_going_gmm_substract_out_not_exitcond_stall_out,
        out_pipeline_valid_out => i_acl_pipeline_keep_going_gmm_substract_out_pipeline_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- redist22_i_acl_pipeline_keep_going_gmm_substract_out_data_out_2(DELAY,419)
    redist22_i_acl_pipeline_keep_going_gmm_substract_out_data_out_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pipeline_keep_going_gmm_substract_out_data_out, xout => redist22_i_acl_pipeline_keep_going_gmm_substract_out_data_out_2_q, clk => clock, aclr => resetn );

    -- redist23_i_acl_pipeline_keep_going_gmm_substract_out_data_out_3(DELAY,420)
    redist23_i_acl_pipeline_keep_going_gmm_substract_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist22_i_acl_pipeline_keep_going_gmm_substract_out_data_out_2_q, xout => redist23_i_acl_pipeline_keep_going_gmm_substract_out_data_out_3_q, clk => clock, aclr => resetn );

    -- i_ffwd_dst_acl_4002700_gmm_substract(BLACKBOX,202)@4
    thei_ffwd_dst_acl_4002700_gmm_substract : i_ffwd_dst_acl_4002700_gmm_substract2438
    PORT MAP (
        in_intel_reserved_ffwd_40_0 => in_intel_reserved_ffwd_40_0,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_dest_data_out_40_0 => i_ffwd_dst_acl_4002700_gmm_substract_out_dest_data_out_40_0,
        clock => clock,
        resetn => resetn
    );

    -- c_i32_1gr(CONSTANT,116)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- i_add_gmm_substract(ADD,179)@1
    i_add_gmm_substract_a <= STD_LOGIC_VECTOR("0" & i_acl_pop_i32_n_11834_pop34_gmm_substract_out_data_out);
    i_add_gmm_substract_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_add_gmm_substract_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add_gmm_substract_a) + UNSIGNED(i_add_gmm_substract_b));
    i_add_gmm_substract_q <= i_add_gmm_substract_o(32 downto 0);

    -- bgTrunc_i_add_gmm_substract_sel_x(BITSELECT,2)@1
    bgTrunc_i_add_gmm_substract_sel_x_b <= i_add_gmm_substract_q(31 downto 0);

    -- i_acl_push_i32_n_11834_push34_gmm_substract(BLACKBOX,159)@1
    -- out out_feedback_out_34@20000000
    -- out out_feedback_valid_out_34@20000000
    thei_acl_push_i32_n_11834_push34_gmm_substract : i_acl_push_i32_n_11834_push34_gmm_substract2504
    PORT MAP (
        in_data_in => bgTrunc_i_add_gmm_substract_sel_x_b,
        in_feedback_stall_in_34 => i_acl_pop_i32_n_11834_pop34_gmm_substract_out_feedback_stall_out_34,
        in_keep_going => i_acl_pipeline_keep_going_gmm_substract_out_data_out,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_feedback_out_34 => i_acl_push_i32_n_11834_push34_gmm_substract_out_feedback_out_34,
        out_feedback_valid_out_34 => i_acl_push_i32_n_11834_push34_gmm_substract_out_feedback_valid_out_34,
        clock => clock,
        resetn => resetn
    );

    -- c_i32_0gr(CONSTANT,115)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- i_acl_pop_i32_n_11834_pop34_gmm_substract(BLACKBOX,132)@1
    -- out out_feedback_stall_out_34@20000000
    thei_acl_pop_i32_n_11834_pop34_gmm_substract : i_acl_pop_i32_n_11834_pop34_gmm_substract2502
    PORT MAP (
        in_data_in => c_i32_0gr_q,
        in_dir => in_c0_eni22818_1,
        in_feedback_in_34 => i_acl_push_i32_n_11834_push34_gmm_substract_out_feedback_out_34,
        in_feedback_valid_in_34 => i_acl_push_i32_n_11834_push34_gmm_substract_out_feedback_valid_out_34,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i32_n_11834_pop34_gmm_substract_out_data_out,
        out_feedback_stall_out_34 => i_acl_pop_i32_n_11834_pop34_gmm_substract_out_feedback_stall_out_34,
        clock => clock,
        resetn => resetn
    );

    -- redist21_i_acl_pop_i32_n_11834_pop34_gmm_substract_out_data_out_1(DELAY,418)
    redist21_i_acl_pop_i32_n_11834_pop34_gmm_substract_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i32_n_11834_pop34_gmm_substract_out_data_out, xout => redist21_i_acl_pop_i32_n_11834_pop34_gmm_substract_out_data_out_1_q, clk => clock, aclr => resetn );

    -- i_unnamed_gmm_substract2514(LOGICAL,351)@2 + 1
    i_unnamed_gmm_substract2514_qi <= "1" WHEN redist21_i_acl_pop_i32_n_11834_pop34_gmm_substract_out_data_out_1_q = c_i32_1gr_q ELSE "0";
    i_unnamed_gmm_substract2514_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_gmm_substract2514_qi, xout => i_unnamed_gmm_substract2514_q, clk => clock, aclr => resetn );

    -- redist2_i_unnamed_gmm_substract2514_q_2(DELAY,399)
    redist2_i_unnamed_gmm_substract2514_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_gmm_substract2514_q, xout => redist2_i_unnamed_gmm_substract2514_q_2_q, clk => clock, aclr => resetn );

    -- i_ffwd_dst_div_i_i_22736_gmm_substract(BLACKBOX,207)@3
    thei_ffwd_dst_div_i_i_22736_gmm_substract : i_ffwd_dst_div_i_i_22736_gmm_substract2418
    PORT MAP (
        in_intel_reserved_ffwd_55_0 => in_intel_reserved_ffwd_55_0,
        in_stall_in => GND_q,
        in_valid_in => redist28_sync_in_aunroll_x_in_i_valid_2_q,
        out_dest_data_out_55_0 => i_ffwd_dst_div_i_i_22736_gmm_substract_out_dest_data_out_55_0,
        clock => clock,
        resetn => resetn
    );

    -- i_selcond_gmm_substract_32_demorgan_gmm_substract(LOGICAL,336)@3
    i_selcond_gmm_substract_32_demorgan_gmm_substract_q <= i_cmp_i_i129_gmm_substract_c and i_unnamed_gmm_substract2506_q;

    -- i_reduction_gmm_substract_59_gmm_substract(MUX,286)@3
    i_reduction_gmm_substract_59_gmm_substract_s <= i_selcond_gmm_substract_32_demorgan_gmm_substract_q;
    i_reduction_gmm_substract_59_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_59_gmm_substract_s, i_replace_phi2735_gmm_substract_q, i_replace_phi2727_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_59_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_59_gmm_substract_q <= i_replace_phi2735_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_59_gmm_substract_q <= i_replace_phi2727_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_59_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_cmp_i_i129_not_gmm_substract(LOGICAL,185)@3
    i_cmp_i_i129_not_gmm_substract_q <= i_cmp_i_i129_gmm_substract_c xor VCC_q;

    -- c_i32_2gr(CONSTANT,117)
    c_i32_2gr_q <= "00000000000000000000000000000010";

    -- i_unnamed_gmm_substract2512(LOGICAL,350)@2 + 1
    i_unnamed_gmm_substract2512_qi <= "1" WHEN redist21_i_acl_pop_i32_n_11834_pop34_gmm_substract_out_data_out_1_q = c_i32_2gr_q ELSE "0";
    i_unnamed_gmm_substract2512_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_gmm_substract2512_qi, xout => i_unnamed_gmm_substract2512_q, clk => clock, aclr => resetn );

    -- i_selcond_gmm_substract_17_gmm_substract(LOGICAL,330)@3
    i_selcond_gmm_substract_17_gmm_substract_q <= i_unnamed_gmm_substract2512_q xor VCC_q;

    -- i_reduction_gmm_substract_71_gmm_substract(LOGICAL,298)@3
    i_reduction_gmm_substract_71_gmm_substract_q <= i_unnamed_gmm_substract2506_q or i_selcond_gmm_substract_17_gmm_substract_q;

    -- i_reduction_gmm_substract_72_gmm_substract(LOGICAL,299)@3
    i_reduction_gmm_substract_72_gmm_substract_q <= i_reduction_gmm_substract_71_gmm_substract_q or i_cmp_i_i129_not_gmm_substract_q;

    -- i_reduction_gmm_substract_60_gmm_substract(MUX,287)@3
    i_reduction_gmm_substract_60_gmm_substract_s <= i_reduction_gmm_substract_72_gmm_substract_q;
    i_reduction_gmm_substract_60_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_60_gmm_substract_s, i_reduction_gmm_substract_10_gmm_substract_q, i_reduction_gmm_substract_59_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_60_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_60_gmm_substract_q <= i_reduction_gmm_substract_10_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_60_gmm_substract_q <= i_reduction_gmm_substract_59_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_60_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i32_push27_gmm_substract(BLACKBOX,160)@3
    -- out out_feedback_out_27@20000000
    -- out out_feedback_valid_out_27@20000000
    thei_acl_push_i32_push27_gmm_substract : i_acl_push_i32_push27_gmm_substract2544
    PORT MAP (
        in_data_in => i_reduction_gmm_substract_60_gmm_substract_q,
        in_feedback_stall_in_27 => i_acl_pop_i32_pop27_gmm_substract_out_feedback_stall_out_27,
        in_keep_going => redist22_i_acl_pipeline_keep_going_gmm_substract_out_data_out_2_q,
        in_stall_in => GND_q,
        in_valid_in => redist28_sync_in_aunroll_x_in_i_valid_2_q,
        out_feedback_out_27 => i_acl_push_i32_push27_gmm_substract_out_feedback_out_27,
        out_feedback_valid_out_27 => i_acl_push_i32_push27_gmm_substract_out_feedback_valid_out_27,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i32_pop27_gmm_substract(BLACKBOX,133)@3
    -- out out_feedback_stall_out_27@20000000
    thei_acl_pop_i32_pop27_gmm_substract : i_acl_pop_i32_pop27_gmm_substract2420
    PORT MAP (
        in_data_in => c_i32_0gr_q,
        in_dir => redist25_sync_in_aunroll_x_in_c0_eni22818_1_2_q,
        in_feedback_in_27 => i_acl_push_i32_push27_gmm_substract_out_feedback_out_27,
        in_feedback_valid_in_27 => i_acl_push_i32_push27_gmm_substract_out_feedback_valid_out_27,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist28_sync_in_aunroll_x_in_i_valid_2_q,
        out_data_out => i_acl_pop_i32_pop27_gmm_substract_out_data_out,
        out_feedback_stall_out_27 => i_acl_pop_i32_pop27_gmm_substract_out_feedback_stall_out_27,
        clock => clock,
        resetn => resetn
    );

    -- i_replace_phi2735_gmm_substract(MUX,324)@3
    i_replace_phi2735_gmm_substract_s <= redist25_sync_in_aunroll_x_in_c0_eni22818_1_2_q;
    i_replace_phi2735_gmm_substract_combproc: PROCESS (i_replace_phi2735_gmm_substract_s, i_acl_pop_i32_pop27_gmm_substract_out_data_out, i_ffwd_dst_div_i_i_22736_gmm_substract_out_dest_data_out_55_0)
    BEGIN
        CASE (i_replace_phi2735_gmm_substract_s) IS
            WHEN "0" => i_replace_phi2735_gmm_substract_q <= i_acl_pop_i32_pop27_gmm_substract_out_data_out;
            WHEN "1" => i_replace_phi2735_gmm_substract_q <= i_ffwd_dst_div_i_i_22736_gmm_substract_out_dest_data_out_55_0;
            WHEN OTHERS => i_replace_phi2735_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_dst_div_i_i_12733_gmm_substract(BLACKBOX,206)@3
    thei_ffwd_dst_div_i_i_12733_gmm_substract : i_ffwd_dst_div_i_i_12733_gmm_substract2422
    PORT MAP (
        in_intel_reserved_ffwd_52_0 => in_intel_reserved_ffwd_52_0,
        in_stall_in => GND_q,
        in_valid_in => redist28_sync_in_aunroll_x_in_i_valid_2_q,
        out_dest_data_out_52_0 => i_ffwd_dst_div_i_i_12733_gmm_substract_out_dest_data_out_52_0,
        clock => clock,
        resetn => resetn
    );

    -- i_selcond_gmm_substract_24_demorgan_gmm_substract(LOGICAL,333)@3
    i_selcond_gmm_substract_24_demorgan_gmm_substract_q <= i_cmp_i_i129_gmm_substract_c and i_unnamed_gmm_substract2508_q;

    -- i_reduction_gmm_substract_61_gmm_substract(MUX,288)@3
    i_reduction_gmm_substract_61_gmm_substract_s <= i_selcond_gmm_substract_24_demorgan_gmm_substract_q;
    i_reduction_gmm_substract_61_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_61_gmm_substract_s, i_replace_phi2732_gmm_substract_q, i_replace_phi2727_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_61_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_61_gmm_substract_q <= i_replace_phi2732_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_61_gmm_substract_q <= i_replace_phi2727_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_61_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_selcond_gmm_substract_71_gmm_substract(LOGICAL,337)@3
    i_selcond_gmm_substract_71_gmm_substract_q <= i_unnamed_gmm_substract2514_q xor VCC_q;

    -- i_reduction_gmm_substract_73_gmm_substract(LOGICAL,300)@3
    i_reduction_gmm_substract_73_gmm_substract_q <= i_unnamed_gmm_substract2508_q or i_selcond_gmm_substract_71_gmm_substract_q;

    -- i_reduction_gmm_substract_74_gmm_substract(LOGICAL,301)@3
    i_reduction_gmm_substract_74_gmm_substract_q <= i_reduction_gmm_substract_73_gmm_substract_q or i_cmp_i_i129_not_gmm_substract_q;

    -- i_reduction_gmm_substract_62_gmm_substract(MUX,289)@3
    i_reduction_gmm_substract_62_gmm_substract_s <= i_reduction_gmm_substract_74_gmm_substract_q;
    i_reduction_gmm_substract_62_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_62_gmm_substract_s, i_reduction_gmm_substract_10_gmm_substract_q, i_reduction_gmm_substract_61_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_62_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_62_gmm_substract_q <= i_reduction_gmm_substract_10_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_62_gmm_substract_q <= i_reduction_gmm_substract_61_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_62_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i32_push28_gmm_substract(BLACKBOX,161)@3
    -- out out_feedback_out_28@20000000
    -- out out_feedback_valid_out_28@20000000
    thei_acl_push_i32_push28_gmm_substract : i_acl_push_i32_push28_gmm_substract2546
    PORT MAP (
        in_data_in => i_reduction_gmm_substract_62_gmm_substract_q,
        in_feedback_stall_in_28 => i_acl_pop_i32_pop28_gmm_substract_out_feedback_stall_out_28,
        in_keep_going => redist22_i_acl_pipeline_keep_going_gmm_substract_out_data_out_2_q,
        in_stall_in => GND_q,
        in_valid_in => redist28_sync_in_aunroll_x_in_i_valid_2_q,
        out_feedback_out_28 => i_acl_push_i32_push28_gmm_substract_out_feedback_out_28,
        out_feedback_valid_out_28 => i_acl_push_i32_push28_gmm_substract_out_feedback_valid_out_28,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i32_pop28_gmm_substract(BLACKBOX,134)@3
    -- out out_feedback_stall_out_28@20000000
    thei_acl_pop_i32_pop28_gmm_substract : i_acl_pop_i32_pop28_gmm_substract2424
    PORT MAP (
        in_data_in => c_i32_0gr_q,
        in_dir => redist25_sync_in_aunroll_x_in_c0_eni22818_1_2_q,
        in_feedback_in_28 => i_acl_push_i32_push28_gmm_substract_out_feedback_out_28,
        in_feedback_valid_in_28 => i_acl_push_i32_push28_gmm_substract_out_feedback_valid_out_28,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist28_sync_in_aunroll_x_in_i_valid_2_q,
        out_data_out => i_acl_pop_i32_pop28_gmm_substract_out_data_out,
        out_feedback_stall_out_28 => i_acl_pop_i32_pop28_gmm_substract_out_feedback_stall_out_28,
        clock => clock,
        resetn => resetn
    );

    -- i_replace_phi2732_gmm_substract(MUX,323)@3
    i_replace_phi2732_gmm_substract_s <= redist25_sync_in_aunroll_x_in_c0_eni22818_1_2_q;
    i_replace_phi2732_gmm_substract_combproc: PROCESS (i_replace_phi2732_gmm_substract_s, i_acl_pop_i32_pop28_gmm_substract_out_data_out, i_ffwd_dst_div_i_i_12733_gmm_substract_out_dest_data_out_52_0)
    BEGIN
        CASE (i_replace_phi2732_gmm_substract_s) IS
            WHEN "0" => i_replace_phi2732_gmm_substract_q <= i_acl_pop_i32_pop28_gmm_substract_out_data_out;
            WHEN "1" => i_replace_phi2732_gmm_substract_q <= i_ffwd_dst_div_i_i_12733_gmm_substract_out_dest_data_out_52_0;
            WHEN OTHERS => i_replace_phi2732_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_dst_div_i_i2730_gmm_substract(BLACKBOX,205)@3
    thei_ffwd_dst_div_i_i2730_gmm_substract : i_ffwd_dst_div_i_i2730_gmm_substract2426
    PORT MAP (
        in_intel_reserved_ffwd_51_0 => in_intel_reserved_ffwd_51_0,
        in_stall_in => GND_q,
        in_valid_in => redist28_sync_in_aunroll_x_in_i_valid_2_q,
        out_dest_data_out_51_0 => i_ffwd_dst_div_i_i2730_gmm_substract_out_dest_data_out_51_0,
        clock => clock,
        resetn => resetn
    );

    -- redist31_bgTrunc_i_add_gmm_substract_sel_x_b_1(DELAY,428)
    redist31_bgTrunc_i_add_gmm_substract_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add_gmm_substract_sel_x_b, xout => redist31_bgTrunc_i_add_gmm_substract_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_unnamed_gmm_substract2510(LOGICAL,349)@2 + 1
    i_unnamed_gmm_substract2510_qi <= "1" WHEN redist31_bgTrunc_i_add_gmm_substract_sel_x_b_1_q = c_i32_0gr_q ELSE "0";
    i_unnamed_gmm_substract2510_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_gmm_substract2510_qi, xout => i_unnamed_gmm_substract2510_q, clk => clock, aclr => resetn );

    -- i_selcond_gmm_substract_28_demorgan_gmm_substract(LOGICAL,334)@3
    i_selcond_gmm_substract_28_demorgan_gmm_substract_q <= i_cmp_i_i129_gmm_substract_c and i_unnamed_gmm_substract2510_q;

    -- i_reduction_gmm_substract_63_gmm_substract(MUX,290)@3
    i_reduction_gmm_substract_63_gmm_substract_s <= i_selcond_gmm_substract_28_demorgan_gmm_substract_q;
    i_reduction_gmm_substract_63_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_63_gmm_substract_s, i_replace_phi2729_gmm_substract_q, i_replace_phi2727_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_63_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_63_gmm_substract_q <= i_replace_phi2729_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_63_gmm_substract_q <= i_replace_phi2727_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_63_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_selcond_gmm_substract_76_gmm_substract(LOGICAL,338)@3
    i_selcond_gmm_substract_76_gmm_substract_q <= i_unnamed_gmm_substract2508_q xor VCC_q;

    -- i_reduction_gmm_substract_75_gmm_substract(LOGICAL,302)@3
    i_reduction_gmm_substract_75_gmm_substract_q <= i_unnamed_gmm_substract2510_q or i_selcond_gmm_substract_76_gmm_substract_q;

    -- i_reduction_gmm_substract_76_gmm_substract(LOGICAL,303)@3
    i_reduction_gmm_substract_76_gmm_substract_q <= i_reduction_gmm_substract_75_gmm_substract_q or i_cmp_i_i129_not_gmm_substract_q;

    -- i_reduction_gmm_substract_64_gmm_substract(MUX,291)@3
    i_reduction_gmm_substract_64_gmm_substract_s <= i_reduction_gmm_substract_76_gmm_substract_q;
    i_reduction_gmm_substract_64_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_64_gmm_substract_s, i_reduction_gmm_substract_10_gmm_substract_q, i_reduction_gmm_substract_63_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_64_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_64_gmm_substract_q <= i_reduction_gmm_substract_10_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_64_gmm_substract_q <= i_reduction_gmm_substract_63_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_64_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i32_push29_gmm_substract(BLACKBOX,162)@3
    -- out out_feedback_out_29@20000000
    -- out out_feedback_valid_out_29@20000000
    thei_acl_push_i32_push29_gmm_substract : i_acl_push_i32_push29_gmm_substract2548
    PORT MAP (
        in_data_in => i_reduction_gmm_substract_64_gmm_substract_q,
        in_feedback_stall_in_29 => i_acl_pop_i32_pop29_gmm_substract_out_feedback_stall_out_29,
        in_keep_going => redist22_i_acl_pipeline_keep_going_gmm_substract_out_data_out_2_q,
        in_stall_in => GND_q,
        in_valid_in => redist28_sync_in_aunroll_x_in_i_valid_2_q,
        out_feedback_out_29 => i_acl_push_i32_push29_gmm_substract_out_feedback_out_29,
        out_feedback_valid_out_29 => i_acl_push_i32_push29_gmm_substract_out_feedback_valid_out_29,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i32_pop29_gmm_substract(BLACKBOX,135)@3
    -- out out_feedback_stall_out_29@20000000
    thei_acl_pop_i32_pop29_gmm_substract : i_acl_pop_i32_pop29_gmm_substract2428
    PORT MAP (
        in_data_in => c_i32_0gr_q,
        in_dir => redist25_sync_in_aunroll_x_in_c0_eni22818_1_2_q,
        in_feedback_in_29 => i_acl_push_i32_push29_gmm_substract_out_feedback_out_29,
        in_feedback_valid_in_29 => i_acl_push_i32_push29_gmm_substract_out_feedback_valid_out_29,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist28_sync_in_aunroll_x_in_i_valid_2_q,
        out_data_out => i_acl_pop_i32_pop29_gmm_substract_out_data_out,
        out_feedback_stall_out_29 => i_acl_pop_i32_pop29_gmm_substract_out_feedback_stall_out_29,
        clock => clock,
        resetn => resetn
    );

    -- i_replace_phi2729_gmm_substract(MUX,322)@3
    i_replace_phi2729_gmm_substract_s <= redist25_sync_in_aunroll_x_in_c0_eni22818_1_2_q;
    i_replace_phi2729_gmm_substract_combproc: PROCESS (i_replace_phi2729_gmm_substract_s, i_acl_pop_i32_pop29_gmm_substract_out_data_out, i_ffwd_dst_div_i_i2730_gmm_substract_out_dest_data_out_51_0)
    BEGIN
        CASE (i_replace_phi2729_gmm_substract_s) IS
            WHEN "0" => i_replace_phi2729_gmm_substract_q <= i_acl_pop_i32_pop29_gmm_substract_out_data_out;
            WHEN "1" => i_replace_phi2729_gmm_substract_q <= i_ffwd_dst_div_i_i2730_gmm_substract_out_dest_data_out_51_0;
            WHEN OTHERS => i_replace_phi2729_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_unnamed_gmm_substract2508(LOGICAL,348)@2 + 1
    i_unnamed_gmm_substract2508_qi <= "1" WHEN redist21_i_acl_pop_i32_n_11834_pop34_gmm_substract_out_data_out_1_q = c_i32_0gr_q ELSE "0";
    i_unnamed_gmm_substract2508_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_gmm_substract2508_qi, xout => i_unnamed_gmm_substract2508_q, clk => clock, aclr => resetn );

    -- i_reduction_gmm_substract_9_gmm_substract(MUX,304)@3
    i_reduction_gmm_substract_9_gmm_substract_s <= i_unnamed_gmm_substract2508_q;
    i_reduction_gmm_substract_9_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_9_gmm_substract_s, i_replace_phi2729_gmm_substract_q, i_replace_phi2732_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_9_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_9_gmm_substract_q <= i_replace_phi2729_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_9_gmm_substract_q <= i_replace_phi2732_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_9_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_unnamed_gmm_substract2506(LOGICAL,347)@2 + 1
    i_unnamed_gmm_substract2506_qi <= "1" WHEN redist31_bgTrunc_i_add_gmm_substract_sel_x_b_1_q = c_i32_2gr_q ELSE "0";
    i_unnamed_gmm_substract2506_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_gmm_substract2506_qi, xout => i_unnamed_gmm_substract2506_q, clk => clock, aclr => resetn );

    -- i_reduction_gmm_substract_10_gmm_substract(MUX,237)@3
    i_reduction_gmm_substract_10_gmm_substract_s <= i_unnamed_gmm_substract2506_q;
    i_reduction_gmm_substract_10_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_10_gmm_substract_s, i_reduction_gmm_substract_9_gmm_substract_q, i_replace_phi2735_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_10_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_10_gmm_substract_q <= i_reduction_gmm_substract_9_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_10_gmm_substract_q <= i_replace_phi2735_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_10_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_dst_div_i_i2728_gmm_substract(BLACKBOX,204)@3
    thei_ffwd_dst_div_i_i2728_gmm_substract : i_ffwd_dst_div_i_i2728_gmm_substract2430
    PORT MAP (
        in_intel_reserved_ffwd_51_0 => in_intel_reserved_ffwd_51_0,
        in_stall_in => GND_q,
        in_valid_in => redist28_sync_in_aunroll_x_in_i_valid_2_q,
        out_dest_data_out_51_0 => i_ffwd_dst_div_i_i2728_gmm_substract_out_dest_data_out_51_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_428_gmm_substract(MUX,125)@3
    i_acl_428_gmm_substract_s <= i_cmp_i_i129_gmm_substract_c;
    i_acl_428_gmm_substract_combproc: PROCESS (i_acl_428_gmm_substract_s, i_reduction_gmm_substract_10_gmm_substract_q, i_replace_phi2727_gmm_substract_q)
    BEGIN
        CASE (i_acl_428_gmm_substract_s) IS
            WHEN "0" => i_acl_428_gmm_substract_q <= i_reduction_gmm_substract_10_gmm_substract_q;
            WHEN "1" => i_acl_428_gmm_substract_q <= i_replace_phi2727_gmm_substract_q;
            WHEN OTHERS => i_acl_428_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i32_push33_gmm_substract(BLACKBOX,163)@3
    -- out out_feedback_out_33@20000000
    -- out out_feedback_valid_out_33@20000000
    thei_acl_push_i32_push33_gmm_substract : i_acl_push_i32_push33_gmm_substract2556
    PORT MAP (
        in_data_in => i_acl_428_gmm_substract_q,
        in_feedback_stall_in_33 => i_acl_pop_i32_pop33_gmm_substract_out_feedback_stall_out_33,
        in_keep_going => redist22_i_acl_pipeline_keep_going_gmm_substract_out_data_out_2_q,
        in_stall_in => GND_q,
        in_valid_in => redist28_sync_in_aunroll_x_in_i_valid_2_q,
        out_feedback_out_33 => i_acl_push_i32_push33_gmm_substract_out_feedback_out_33,
        out_feedback_valid_out_33 => i_acl_push_i32_push33_gmm_substract_out_feedback_valid_out_33,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i32_pop33_gmm_substract(BLACKBOX,136)@3
    -- out out_feedback_stall_out_33@20000000
    thei_acl_pop_i32_pop33_gmm_substract : i_acl_pop_i32_pop33_gmm_substract2432
    PORT MAP (
        in_data_in => c_i32_0gr_q,
        in_dir => redist25_sync_in_aunroll_x_in_c0_eni22818_1_2_q,
        in_feedback_in_33 => i_acl_push_i32_push33_gmm_substract_out_feedback_out_33,
        in_feedback_valid_in_33 => i_acl_push_i32_push33_gmm_substract_out_feedback_valid_out_33,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist28_sync_in_aunroll_x_in_i_valid_2_q,
        out_data_out => i_acl_pop_i32_pop33_gmm_substract_out_data_out,
        out_feedback_stall_out_33 => i_acl_pop_i32_pop33_gmm_substract_out_feedback_stall_out_33,
        clock => clock,
        resetn => resetn
    );

    -- i_replace_phi2727_gmm_substract(MUX,321)@3
    i_replace_phi2727_gmm_substract_s <= redist25_sync_in_aunroll_x_in_c0_eni22818_1_2_q;
    i_replace_phi2727_gmm_substract_combproc: PROCESS (i_replace_phi2727_gmm_substract_s, i_acl_pop_i32_pop33_gmm_substract_out_data_out, i_ffwd_dst_div_i_i2728_gmm_substract_out_dest_data_out_51_0)
    BEGIN
        CASE (i_replace_phi2727_gmm_substract_s) IS
            WHEN "0" => i_replace_phi2727_gmm_substract_q <= i_acl_pop_i32_pop33_gmm_substract_out_data_out;
            WHEN "1" => i_replace_phi2727_gmm_substract_q <= i_ffwd_dst_div_i_i2728_gmm_substract_out_dest_data_out_51_0;
            WHEN OTHERS => i_replace_phi2727_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_cmp_i_i129_gmm_substract(COMPARE,184)@3
    i_cmp_i_i129_gmm_substract_a <= STD_LOGIC_VECTOR("00" & i_replace_phi2727_gmm_substract_q);
    i_cmp_i_i129_gmm_substract_b <= STD_LOGIC_VECTOR("00" & i_reduction_gmm_substract_10_gmm_substract_q);
    i_cmp_i_i129_gmm_substract_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i129_gmm_substract_a) - UNSIGNED(i_cmp_i_i129_gmm_substract_b));
    i_cmp_i_i129_gmm_substract_c(0) <= i_cmp_i_i129_gmm_substract_o(33);

    -- redist20_i_cmp_i_i129_gmm_substract_c_1(DELAY,417)
    redist20_i_cmp_i_i129_gmm_substract_c_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_i_i129_gmm_substract_c, xout => redist20_i_cmp_i_i129_gmm_substract_c_1_q, clk => clock, aclr => resetn );

    -- i_selcond_gmm_substract_21_gmm_substract(LOGICAL,332)@4
    i_selcond_gmm_substract_21_gmm_substract_q <= redist20_i_cmp_i_i129_gmm_substract_c_1_q and redist2_i_unnamed_gmm_substract2514_q_2_q;

    -- i_reduction_gmm_substract_67_gmm_substract(MUX,294)@4
    i_reduction_gmm_substract_67_gmm_substract_s <= i_selcond_gmm_substract_21_gmm_substract_q;
    i_reduction_gmm_substract_67_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_67_gmm_substract_s, i_replace_phi2699_gmm_substract_q, i_reduction_gmm_substract_14_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_67_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_67_gmm_substract_q <= i_replace_phi2699_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_67_gmm_substract_q <= i_reduction_gmm_substract_14_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_67_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist10_i_selcond_gmm_substract_24_demorgan_gmm_substract_q_1(DELAY,407)
    redist10_i_selcond_gmm_substract_24_demorgan_gmm_substract_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_selcond_gmm_substract_24_demorgan_gmm_substract_q, xout => redist10_i_selcond_gmm_substract_24_demorgan_gmm_substract_q_1_q, clk => clock, aclr => resetn );

    -- i_reduction_gmm_substract_68_gmm_substract(MUX,295)@4
    i_reduction_gmm_substract_68_gmm_substract_s <= redist10_i_selcond_gmm_substract_24_demorgan_gmm_substract_q_1_q;
    i_reduction_gmm_substract_68_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_68_gmm_substract_s, i_reduction_gmm_substract_67_gmm_substract_q, i_reduction_gmm_substract_12_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_68_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_68_gmm_substract_q <= i_reduction_gmm_substract_67_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_68_gmm_substract_q <= i_reduction_gmm_substract_12_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_68_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i8_push31_gmm_substract(BLACKBOX,168)@4
    -- out out_feedback_out_31@20000000
    -- out out_feedback_valid_out_31@20000000
    thei_acl_push_i8_push31_gmm_substract : i_acl_push_i8_push31_gmm_substract2552
    PORT MAP (
        in_data_in => i_reduction_gmm_substract_68_gmm_substract_q,
        in_feedback_stall_in_31 => i_acl_pop_i8_pop31_gmm_substract_out_feedback_stall_out_31,
        in_keep_going => redist23_i_acl_pipeline_keep_going_gmm_substract_out_data_out_3_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_31 => i_acl_push_i8_push31_gmm_substract_out_feedback_out_31,
        out_feedback_valid_out_31 => i_acl_push_i8_push31_gmm_substract_out_feedback_valid_out_31,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i8_pop31_gmm_substract(BLACKBOX,141)@4
    -- out out_feedback_stall_out_31@20000000
    thei_acl_pop_i8_pop31_gmm_substract : i_acl_pop_i8_pop31_gmm_substract2440
    PORT MAP (
        in_data_in => c_i8_undef_q,
        in_dir => redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q,
        in_feedback_in_31 => i_acl_push_i8_push31_gmm_substract_out_feedback_out_31,
        in_feedback_valid_in_31 => i_acl_push_i8_push31_gmm_substract_out_feedback_valid_out_31,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_data_out => i_acl_pop_i8_pop31_gmm_substract_out_data_out,
        out_feedback_stall_out_31 => i_acl_pop_i8_pop31_gmm_substract_out_feedback_stall_out_31,
        clock => clock,
        resetn => resetn
    );

    -- i_replace_phi2699_gmm_substract(MUX,319)@4
    i_replace_phi2699_gmm_substract_s <= redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q;
    i_replace_phi2699_gmm_substract_combproc: PROCESS (i_replace_phi2699_gmm_substract_s, i_acl_pop_i8_pop31_gmm_substract_out_data_out, i_ffwd_dst_acl_4002700_gmm_substract_out_dest_data_out_40_0)
    BEGIN
        CASE (i_replace_phi2699_gmm_substract_s) IS
            WHEN "0" => i_replace_phi2699_gmm_substract_q <= i_acl_pop_i8_pop31_gmm_substract_out_data_out;
            WHEN "1" => i_replace_phi2699_gmm_substract_q <= i_ffwd_dst_acl_4002700_gmm_substract_out_dest_data_out_40_0;
            WHEN OTHERS => i_replace_phi2699_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_dst_acl_3972695_gmm_substract(BLACKBOX,201)@4
    thei_ffwd_dst_acl_3972695_gmm_substract : i_ffwd_dst_acl_3972695_gmm_substract2442
    PORT MAP (
        in_intel_reserved_ffwd_39_0 => in_intel_reserved_ffwd_39_0,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_dest_data_out_39_0 => i_ffwd_dst_acl_3972695_gmm_substract_out_dest_data_out_39_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_push_i8_push32_gmm_substract(BLACKBOX,169)@4
    -- out out_feedback_out_32@20000000
    -- out out_feedback_valid_out_32@20000000
    thei_acl_push_i8_push32_gmm_substract : i_acl_push_i8_push32_gmm_substract2554
    PORT MAP (
        in_data_in => i_reduction_gmm_substract_70_gmm_substract_q,
        in_feedback_stall_in_32 => i_acl_pop_i8_pop32_gmm_substract_out_feedback_stall_out_32,
        in_keep_going => redist23_i_acl_pipeline_keep_going_gmm_substract_out_data_out_3_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_32 => i_acl_push_i8_push32_gmm_substract_out_feedback_out_32,
        out_feedback_valid_out_32 => i_acl_push_i8_push32_gmm_substract_out_feedback_valid_out_32,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i8_pop32_gmm_substract(BLACKBOX,142)@4
    -- out out_feedback_stall_out_32@20000000
    thei_acl_pop_i8_pop32_gmm_substract : i_acl_pop_i8_pop32_gmm_substract2444
    PORT MAP (
        in_data_in => c_i8_undef_q,
        in_dir => redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q,
        in_feedback_in_32 => i_acl_push_i8_push32_gmm_substract_out_feedback_out_32,
        in_feedback_valid_in_32 => i_acl_push_i8_push32_gmm_substract_out_feedback_valid_out_32,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_data_out => i_acl_pop_i8_pop32_gmm_substract_out_data_out,
        out_feedback_stall_out_32 => i_acl_pop_i8_pop32_gmm_substract_out_feedback_stall_out_32,
        clock => clock,
        resetn => resetn
    );

    -- i_replace_phi2694_gmm_substract(MUX,318)@4
    i_replace_phi2694_gmm_substract_s <= redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q;
    i_replace_phi2694_gmm_substract_combproc: PROCESS (i_replace_phi2694_gmm_substract_s, i_acl_pop_i8_pop32_gmm_substract_out_data_out, i_ffwd_dst_acl_3972695_gmm_substract_out_dest_data_out_39_0)
    BEGIN
        CASE (i_replace_phi2694_gmm_substract_s) IS
            WHEN "0" => i_replace_phi2694_gmm_substract_q <= i_acl_pop_i8_pop32_gmm_substract_out_data_out;
            WHEN "1" => i_replace_phi2694_gmm_substract_q <= i_ffwd_dst_acl_3972695_gmm_substract_out_dest_data_out_39_0;
            WHEN OTHERS => i_replace_phi2694_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist6_i_unnamed_gmm_substract2508_q_2(DELAY,403)
    redist6_i_unnamed_gmm_substract2508_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_gmm_substract2508_q, xout => redist6_i_unnamed_gmm_substract2508_q_2_q, clk => clock, aclr => resetn );

    -- i_reduction_gmm_substract_13_gmm_substract(MUX,240)@4
    i_reduction_gmm_substract_13_gmm_substract_s <= redist6_i_unnamed_gmm_substract2508_q_2_q;
    i_reduction_gmm_substract_13_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_13_gmm_substract_s, i_replace_phi2694_gmm_substract_q, i_replace_phi2699_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_13_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_13_gmm_substract_q <= i_replace_phi2694_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_13_gmm_substract_q <= i_replace_phi2699_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_13_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist7_i_unnamed_gmm_substract2506_q_2(DELAY,404)
    redist7_i_unnamed_gmm_substract2506_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_gmm_substract2506_q, xout => redist7_i_unnamed_gmm_substract2506_q_2_q, clk => clock, aclr => resetn );

    -- i_reduction_gmm_substract_14_gmm_substract(MUX,241)@4
    i_reduction_gmm_substract_14_gmm_substract_s <= redist7_i_unnamed_gmm_substract2506_q_2_q;
    i_reduction_gmm_substract_14_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_14_gmm_substract_s, i_reduction_gmm_substract_13_gmm_substract_q, i_replace_phi2703_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_14_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_14_gmm_substract_q <= i_reduction_gmm_substract_13_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_14_gmm_substract_q <= i_replace_phi2703_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_14_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_selcond_gmm_substract_29_gmm_substract(LOGICAL,335)@4
    i_selcond_gmm_substract_29_gmm_substract_q <= redist20_i_cmp_i_i129_gmm_substract_c_1_q and redist3_i_unnamed_gmm_substract2512_q_2_q;

    -- i_reduction_gmm_substract_65_gmm_substract(MUX,292)@4
    i_reduction_gmm_substract_65_gmm_substract_s <= i_selcond_gmm_substract_29_gmm_substract_q;
    i_reduction_gmm_substract_65_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_65_gmm_substract_s, i_replace_phi2703_gmm_substract_q, i_reduction_gmm_substract_14_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_65_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_65_gmm_substract_q <= i_replace_phi2703_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_65_gmm_substract_q <= i_reduction_gmm_substract_14_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_65_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist8_i_selcond_gmm_substract_32_demorgan_gmm_substract_q_1(DELAY,405)
    redist8_i_selcond_gmm_substract_32_demorgan_gmm_substract_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_selcond_gmm_substract_32_demorgan_gmm_substract_q, xout => redist8_i_selcond_gmm_substract_32_demorgan_gmm_substract_q_1_q, clk => clock, aclr => resetn );

    -- i_reduction_gmm_substract_66_gmm_substract(MUX,293)@4
    i_reduction_gmm_substract_66_gmm_substract_s <= redist8_i_selcond_gmm_substract_32_demorgan_gmm_substract_q_1_q;
    i_reduction_gmm_substract_66_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_66_gmm_substract_s, i_reduction_gmm_substract_65_gmm_substract_q, i_reduction_gmm_substract_12_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_66_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_66_gmm_substract_q <= i_reduction_gmm_substract_65_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_66_gmm_substract_q <= i_reduction_gmm_substract_12_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_66_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i8_push30_gmm_substract(BLACKBOX,167)@4
    -- out out_feedback_out_30@20000000
    -- out out_feedback_valid_out_30@20000000
    thei_acl_push_i8_push30_gmm_substract : i_acl_push_i8_push30_gmm_substract2550
    PORT MAP (
        in_data_in => i_reduction_gmm_substract_66_gmm_substract_q,
        in_feedback_stall_in_30 => i_acl_pop_i8_pop30_gmm_substract_out_feedback_stall_out_30,
        in_keep_going => redist23_i_acl_pipeline_keep_going_gmm_substract_out_data_out_3_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_30 => i_acl_push_i8_push30_gmm_substract_out_feedback_out_30,
        out_feedback_valid_out_30 => i_acl_push_i8_push30_gmm_substract_out_feedback_valid_out_30,
        clock => clock,
        resetn => resetn
    );

    -- c_i8_undef(CONSTANT,122)
    c_i8_undef_q <= "00000000";

    -- i_acl_pop_i8_pop30_gmm_substract(BLACKBOX,140)@4
    -- out out_feedback_stall_out_30@20000000
    thei_acl_pop_i8_pop30_gmm_substract : i_acl_pop_i8_pop30_gmm_substract2436
    PORT MAP (
        in_data_in => c_i8_undef_q,
        in_dir => redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q,
        in_feedback_in_30 => i_acl_push_i8_push30_gmm_substract_out_feedback_out_30,
        in_feedback_valid_in_30 => i_acl_push_i8_push30_gmm_substract_out_feedback_valid_out_30,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_data_out => i_acl_pop_i8_pop30_gmm_substract_out_data_out,
        out_feedback_stall_out_30 => i_acl_pop_i8_pop30_gmm_substract_out_feedback_stall_out_30,
        clock => clock,
        resetn => resetn
    );

    -- redist26_sync_in_aunroll_x_in_c0_eni22818_1_3(DELAY,423)
    redist26_sync_in_aunroll_x_in_c0_eni22818_1_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist25_sync_in_aunroll_x_in_c0_eni22818_1_2_q, xout => redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q, clk => clock, aclr => resetn );

    -- i_replace_phi2703_gmm_substract(MUX,320)@4
    i_replace_phi2703_gmm_substract_s <= redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q;
    i_replace_phi2703_gmm_substract_combproc: PROCESS (i_replace_phi2703_gmm_substract_s, i_acl_pop_i8_pop30_gmm_substract_out_data_out, i_ffwd_dst_acl_4032704_gmm_substract_out_dest_data_out_41_0)
    BEGIN
        CASE (i_replace_phi2703_gmm_substract_s) IS
            WHEN "0" => i_replace_phi2703_gmm_substract_q <= i_acl_pop_i8_pop30_gmm_substract_out_data_out;
            WHEN "1" => i_replace_phi2703_gmm_substract_q <= i_ffwd_dst_acl_4032704_gmm_substract_out_dest_data_out_41_0;
            WHEN OTHERS => i_replace_phi2703_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_11_gmm_substract(MUX,238)@4
    i_reduction_gmm_substract_11_gmm_substract_s <= redist2_i_unnamed_gmm_substract2514_q_2_q;
    i_reduction_gmm_substract_11_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_11_gmm_substract_s, i_replace_phi2694_gmm_substract_q, i_replace_phi2699_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_11_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_11_gmm_substract_q <= i_replace_phi2694_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_11_gmm_substract_q <= i_replace_phi2699_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_11_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist3_i_unnamed_gmm_substract2512_q_2(DELAY,400)
    redist3_i_unnamed_gmm_substract2512_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_gmm_substract2512_q, xout => redist3_i_unnamed_gmm_substract2512_q_2_q, clk => clock, aclr => resetn );

    -- i_reduction_gmm_substract_12_gmm_substract(MUX,239)@4
    i_reduction_gmm_substract_12_gmm_substract_s <= redist3_i_unnamed_gmm_substract2512_q_2_q;
    i_reduction_gmm_substract_12_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_12_gmm_substract_s, i_reduction_gmm_substract_11_gmm_substract_q, i_replace_phi2703_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_12_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_12_gmm_substract_q <= i_reduction_gmm_substract_11_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_12_gmm_substract_q <= i_replace_phi2703_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_12_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_69_gmm_substract(MUX,296)@4
    i_reduction_gmm_substract_69_gmm_substract_s <= redist10_i_selcond_gmm_substract_24_demorgan_gmm_substract_q_1_q;
    i_reduction_gmm_substract_69_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_69_gmm_substract_s, i_replace_phi2694_gmm_substract_q, i_reduction_gmm_substract_14_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_69_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_69_gmm_substract_q <= i_replace_phi2694_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_69_gmm_substract_q <= i_reduction_gmm_substract_14_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_69_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist9_i_selcond_gmm_substract_28_demorgan_gmm_substract_q_1(DELAY,406)
    redist9_i_selcond_gmm_substract_28_demorgan_gmm_substract_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_selcond_gmm_substract_28_demorgan_gmm_substract_q, xout => redist9_i_selcond_gmm_substract_28_demorgan_gmm_substract_q_1_q, clk => clock, aclr => resetn );

    -- i_reduction_gmm_substract_70_gmm_substract(MUX,297)@4
    i_reduction_gmm_substract_70_gmm_substract_s <= redist9_i_selcond_gmm_substract_28_demorgan_gmm_substract_q_1_q;
    i_reduction_gmm_substract_70_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_70_gmm_substract_s, i_reduction_gmm_substract_69_gmm_substract_q, i_reduction_gmm_substract_12_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_70_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_70_gmm_substract_q <= i_reduction_gmm_substract_69_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_70_gmm_substract_q <= i_reduction_gmm_substract_12_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_70_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- c_i4_1gr(CONSTANT,120)
    c_i4_1gr_q <= "0001";

    -- leftShiftStage0Idx1Rng1_uid377_i_next_cleanups_gmm_substract_gmm_substract2568_shift_x(BITSELECT,376)@3
    leftShiftStage0Idx1Rng1_uid377_i_next_cleanups_gmm_substract_gmm_substract2568_shift_x_in <= i_acl_pop_i4_cleanups_pop36_gmm_substract_out_data_out(2 downto 0);
    leftShiftStage0Idx1Rng1_uid377_i_next_cleanups_gmm_substract_gmm_substract2568_shift_x_b <= leftShiftStage0Idx1Rng1_uid377_i_next_cleanups_gmm_substract_gmm_substract2568_shift_x_in(2 downto 0);

    -- leftShiftStage0Idx1_uid378_i_next_cleanups_gmm_substract_gmm_substract2568_shift_x(BITJOIN,377)@3
    leftShiftStage0Idx1_uid378_i_next_cleanups_gmm_substract_gmm_substract2568_shift_x_q <= leftShiftStage0Idx1Rng1_uid377_i_next_cleanups_gmm_substract_gmm_substract2568_shift_x_b & GND_q;

    -- i_xor_gmm_substract(LOGICAL,353)@3
    i_xor_gmm_substract_q <= i_first_cleanup_gmm_substract_q xor VCC_q;

    -- i_or_gmm_substract(LOGICAL,236)@3
    i_or_gmm_substract_q <= i_unnamed_gmm_substract2565_q or i_xor_gmm_substract_q;

    -- i_cleanups_shl_gmm_substract_sel_x(BITSELECT,97)@3
    i_cleanups_shl_gmm_substract_sel_x_b <= std_logic_vector(resize(unsigned(i_or_gmm_substract_q(0 downto 0)), 4));

    -- i_cleanups_shl_gmm_substract_vt_select_0(BITSELECT,183)@3
    i_cleanups_shl_gmm_substract_vt_select_0_b <= i_cleanups_shl_gmm_substract_sel_x_b(0 downto 0);

    -- i_cleanups_shl_gmm_substract_vt_join(BITJOIN,182)@3
    i_cleanups_shl_gmm_substract_vt_join_q <= i_cleanups_shl_gmm_substract_vt_const_3_q & i_cleanups_shl_gmm_substract_vt_select_0_b;

    -- i_next_cleanups_gmm_substract_gmm_substract2568_shift_narrow_x(BITSELECT,101)@3
    i_next_cleanups_gmm_substract_gmm_substract2568_shift_narrow_x_b <= i_cleanups_shl_gmm_substract_vt_join_q(1 downto 0);

    -- leftShiftStageSel0Dto0_uid379_i_next_cleanups_gmm_substract_gmm_substract2568_shift_x(BITSELECT,378)@3
    leftShiftStageSel0Dto0_uid379_i_next_cleanups_gmm_substract_gmm_substract2568_shift_x_in <= i_next_cleanups_gmm_substract_gmm_substract2568_shift_narrow_x_b(0 downto 0);
    leftShiftStageSel0Dto0_uid379_i_next_cleanups_gmm_substract_gmm_substract2568_shift_x_b <= leftShiftStageSel0Dto0_uid379_i_next_cleanups_gmm_substract_gmm_substract2568_shift_x_in(0 downto 0);

    -- leftShiftStage0_uid380_i_next_cleanups_gmm_substract_gmm_substract2568_shift_x(MUX,379)@3
    leftShiftStage0_uid380_i_next_cleanups_gmm_substract_gmm_substract2568_shift_x_s <= leftShiftStageSel0Dto0_uid379_i_next_cleanups_gmm_substract_gmm_substract2568_shift_x_b;
    leftShiftStage0_uid380_i_next_cleanups_gmm_substract_gmm_substract2568_shift_x_combproc: PROCESS (leftShiftStage0_uid380_i_next_cleanups_gmm_substract_gmm_substract2568_shift_x_s, i_acl_pop_i4_cleanups_pop36_gmm_substract_out_data_out, leftShiftStage0Idx1_uid378_i_next_cleanups_gmm_substract_gmm_substract2568_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid380_i_next_cleanups_gmm_substract_gmm_substract2568_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid380_i_next_cleanups_gmm_substract_gmm_substract2568_shift_x_q <= i_acl_pop_i4_cleanups_pop36_gmm_substract_out_data_out;
            WHEN "1" => leftShiftStage0_uid380_i_next_cleanups_gmm_substract_gmm_substract2568_shift_x_q <= leftShiftStage0Idx1_uid378_i_next_cleanups_gmm_substract_gmm_substract2568_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid380_i_next_cleanups_gmm_substract_gmm_substract2568_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i4_cleanups_push36_gmm_substract(BLACKBOX,164)@3
    -- out out_feedback_out_36@20000000
    -- out out_feedback_valid_out_36@20000000
    thei_acl_push_i4_cleanups_push36_gmm_substract : i_acl_push_i4_cleanups_push36_gmm_substract2569
    PORT MAP (
        in_data_in => leftShiftStage0_uid380_i_next_cleanups_gmm_substract_gmm_substract2568_shift_x_q,
        in_feedback_stall_in_36 => i_acl_pop_i4_cleanups_pop36_gmm_substract_out_feedback_stall_out_36,
        in_keep_going => redist22_i_acl_pipeline_keep_going_gmm_substract_out_data_out_2_q,
        in_stall_in => GND_q,
        in_valid_in => redist28_sync_in_aunroll_x_in_i_valid_2_q,
        out_feedback_out_36 => i_acl_push_i4_cleanups_push36_gmm_substract_out_feedback_out_36,
        out_feedback_valid_out_36 => i_acl_push_i4_cleanups_push36_gmm_substract_out_feedback_valid_out_36,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i4_cleanups_pop36_gmm_substract(BLACKBOX,137)@3
    -- out out_feedback_stall_out_36@20000000
    thei_acl_pop_i4_cleanups_pop36_gmm_substract : i_acl_pop_i4_cleanups_pop36_gmm_substract2403
    PORT MAP (
        in_data_in => c_i4_7gr_q,
        in_dir => redist25_sync_in_aunroll_x_in_c0_eni22818_1_2_q,
        in_feedback_in_36 => i_acl_push_i4_cleanups_push36_gmm_substract_out_feedback_out_36,
        in_feedback_valid_in_36 => i_acl_push_i4_cleanups_push36_gmm_substract_out_feedback_valid_out_36,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist28_sync_in_aunroll_x_in_i_valid_2_q,
        out_data_out => i_acl_pop_i4_cleanups_pop36_gmm_substract_out_data_out,
        out_feedback_stall_out_36 => i_acl_pop_i4_cleanups_pop36_gmm_substract_out_feedback_stall_out_36,
        clock => clock,
        resetn => resetn
    );

    -- i_unnamed_gmm_substract2405(LOGICAL,339)@3
    i_unnamed_gmm_substract2405_q <= i_acl_pop_i4_cleanups_pop36_gmm_substract_out_data_out and c_i4_1gr_q;

    -- i_unnamed_gmm_substract2405_vt_select_0(BITSELECT,342)@3
    i_unnamed_gmm_substract2405_vt_select_0_b <= i_unnamed_gmm_substract2405_q(0 downto 0);

    -- i_unnamed_gmm_substract2405_vt_join(BITJOIN,341)@3
    i_unnamed_gmm_substract2405_vt_join_q <= i_cleanups_shl_gmm_substract_vt_const_3_q & i_unnamed_gmm_substract2405_vt_select_0_b;

    -- i_first_cleanup_gmm_substract(LOGICAL,228)@3
    i_first_cleanup_gmm_substract_q <= "1" WHEN i_unnamed_gmm_substract2405_vt_join_q /= c_i4_0gr_q ELSE "0";

    -- redist17_i_first_cleanup_gmm_substract_q_1(DELAY,414)
    redist17_i_first_cleanup_gmm_substract_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_first_cleanup_gmm_substract_q, xout => redist17_i_first_cleanup_gmm_substract_q_1_q, clk => clock, aclr => resetn );

    -- i_ffwd_src_unnamed_gmm_substract96_gmm_substract(BLACKBOX,227)@4
    -- out out_intel_reserved_ffwd_91_0@20000000
    thei_ffwd_src_unnamed_gmm_substract96_gmm_substract : i_ffwd_src_unnamed_gmm_substract96_gmm_substract2607
    PORT MAP (
        in_enable_in => redist17_i_first_cleanup_gmm_substract_q_1_q,
        in_src_data_in_91_0 => i_reduction_gmm_substract_70_gmm_substract_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_intel_reserved_ffwd_91_0 => i_ffwd_src_unnamed_gmm_substract96_gmm_substract_out_intel_reserved_ffwd_91_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_src_unnamed_gmm_substract95_gmm_substract(BLACKBOX,226)@4
    -- out out_intel_reserved_ffwd_90_0@20000000
    thei_ffwd_src_unnamed_gmm_substract95_gmm_substract : i_ffwd_src_unnamed_gmm_substract95_gmm_substract2605
    PORT MAP (
        in_enable_in => redist17_i_first_cleanup_gmm_substract_q_1_q,
        in_src_data_in_90_0 => i_reduction_gmm_substract_68_gmm_substract_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_intel_reserved_ffwd_90_0 => i_ffwd_src_unnamed_gmm_substract95_gmm_substract_out_intel_reserved_ffwd_90_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_src_unnamed_gmm_substract94_gmm_substract(BLACKBOX,225)@4
    -- out out_intel_reserved_ffwd_89_0@20000000
    thei_ffwd_src_unnamed_gmm_substract94_gmm_substract : i_ffwd_src_unnamed_gmm_substract94_gmm_substract2603
    PORT MAP (
        in_enable_in => redist17_i_first_cleanup_gmm_substract_q_1_q,
        in_src_data_in_89_0 => i_reduction_gmm_substract_66_gmm_substract_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_intel_reserved_ffwd_89_0 => i_ffwd_src_unnamed_gmm_substract94_gmm_substract_out_intel_reserved_ffwd_89_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_src_unnamed_gmm_substract93_gmm_substract(BLACKBOX,224)@3
    -- out out_intel_reserved_ffwd_88_0@20000000
    thei_ffwd_src_unnamed_gmm_substract93_gmm_substract : i_ffwd_src_unnamed_gmm_substract93_gmm_substract2601
    PORT MAP (
        in_enable_in => i_first_cleanup_gmm_substract_q,
        in_src_data_in_88_0 => i_reduction_gmm_substract_64_gmm_substract_q,
        in_stall_in => GND_q,
        in_valid_in => redist28_sync_in_aunroll_x_in_i_valid_2_q,
        out_intel_reserved_ffwd_88_0 => i_ffwd_src_unnamed_gmm_substract93_gmm_substract_out_intel_reserved_ffwd_88_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_src_unnamed_gmm_substract92_gmm_substract(BLACKBOX,223)@3
    -- out out_intel_reserved_ffwd_87_0@20000000
    thei_ffwd_src_unnamed_gmm_substract92_gmm_substract : i_ffwd_src_unnamed_gmm_substract92_gmm_substract2599
    PORT MAP (
        in_enable_in => i_first_cleanup_gmm_substract_q,
        in_src_data_in_87_0 => i_reduction_gmm_substract_62_gmm_substract_q,
        in_stall_in => GND_q,
        in_valid_in => redist28_sync_in_aunroll_x_in_i_valid_2_q,
        out_intel_reserved_ffwd_87_0 => i_ffwd_src_unnamed_gmm_substract92_gmm_substract_out_intel_reserved_ffwd_87_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_acl_3892688_gmm_substract(BLACKBOX,199)@4
    thei_ffwd_dst_acl_3892688_gmm_substract : i_ffwd_dst_acl_3892688_gmm_substract2450
    PORT MAP (
        in_intel_reserved_ffwd_38_0 => in_intel_reserved_ffwd_38_0,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_dest_data_out_38_0 => i_ffwd_dst_acl_3892688_gmm_substract_out_dest_data_out_38_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_acl_3832675_gmm_substract(BLACKBOX,198)@4
    thei_ffwd_dst_acl_3832675_gmm_substract : i_ffwd_dst_acl_3832675_gmm_substract2454
    PORT MAP (
        in_intel_reserved_ffwd_36_0 => in_intel_reserved_ffwd_36_0,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_dest_data_out_36_0 => i_ffwd_dst_acl_3832675_gmm_substract_out_dest_data_out_36_0,
        clock => clock,
        resetn => resetn
    );

    -- i_reduction_gmm_substract_55_gmm_substract(MUX,282)@4
    i_reduction_gmm_substract_55_gmm_substract_s <= i_selcond_gmm_substract_21_gmm_substract_q;
    i_reduction_gmm_substract_55_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_55_gmm_substract_s, i_replace_phi2674_gmm_substract_q, i_reduction_gmm_substract_18_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_55_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_55_gmm_substract_q <= i_replace_phi2674_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_55_gmm_substract_q <= i_reduction_gmm_substract_18_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_55_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_56_gmm_substract(MUX,283)@4
    i_reduction_gmm_substract_56_gmm_substract_s <= redist10_i_selcond_gmm_substract_24_demorgan_gmm_substract_q_1_q;
    i_reduction_gmm_substract_56_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_56_gmm_substract_s, i_reduction_gmm_substract_55_gmm_substract_q, i_reduction_gmm_substract_16_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_56_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_56_gmm_substract_q <= i_reduction_gmm_substract_55_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_56_gmm_substract_q <= i_reduction_gmm_substract_16_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_56_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i16_push25_gmm_substract(BLACKBOX,154)@4
    -- out out_feedback_out_25@20000000
    -- out out_feedback_valid_out_25@20000000
    thei_acl_push_i16_push25_gmm_substract : i_acl_push_i16_push25_gmm_substract2540
    PORT MAP (
        in_data_in => i_reduction_gmm_substract_56_gmm_substract_q,
        in_feedback_stall_in_25 => i_acl_pop_i16_pop25_gmm_substract_out_feedback_stall_out_25,
        in_keep_going => redist23_i_acl_pipeline_keep_going_gmm_substract_out_data_out_3_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_25 => i_acl_push_i16_push25_gmm_substract_out_feedback_out_25,
        out_feedback_valid_out_25 => i_acl_push_i16_push25_gmm_substract_out_feedback_valid_out_25,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i16_pop25_gmm_substract(BLACKBOX,129)@4
    -- out out_feedback_stall_out_25@20000000
    thei_acl_pop_i16_pop25_gmm_substract : i_acl_pop_i16_pop25_gmm_substract2456
    PORT MAP (
        in_data_in => c_i16_undef_q,
        in_dir => redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q,
        in_feedback_in_25 => i_acl_push_i16_push25_gmm_substract_out_feedback_out_25,
        in_feedback_valid_in_25 => i_acl_push_i16_push25_gmm_substract_out_feedback_valid_out_25,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_data_out => i_acl_pop_i16_pop25_gmm_substract_out_data_out,
        out_feedback_stall_out_25 => i_acl_pop_i16_pop25_gmm_substract_out_feedback_stall_out_25,
        clock => clock,
        resetn => resetn
    );

    -- i_replace_phi2674_gmm_substract(MUX,315)@4
    i_replace_phi2674_gmm_substract_s <= redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q;
    i_replace_phi2674_gmm_substract_combproc: PROCESS (i_replace_phi2674_gmm_substract_s, i_acl_pop_i16_pop25_gmm_substract_out_data_out, i_ffwd_dst_acl_3832675_gmm_substract_out_dest_data_out_36_0)
    BEGIN
        CASE (i_replace_phi2674_gmm_substract_s) IS
            WHEN "0" => i_replace_phi2674_gmm_substract_q <= i_acl_pop_i16_pop25_gmm_substract_out_data_out;
            WHEN "1" => i_replace_phi2674_gmm_substract_q <= i_ffwd_dst_acl_3832675_gmm_substract_out_dest_data_out_36_0;
            WHEN OTHERS => i_replace_phi2674_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_dst_acl_3772644_gmm_substract(BLACKBOX,197)@4
    thei_ffwd_dst_acl_3772644_gmm_substract : i_ffwd_dst_acl_3772644_gmm_substract2458
    PORT MAP (
        in_intel_reserved_ffwd_33_0 => in_intel_reserved_ffwd_33_0,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_dest_data_out_33_0 => i_ffwd_dst_acl_3772644_gmm_substract_out_dest_data_out_33_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_push_i16_push26_gmm_substract(BLACKBOX,155)@4
    -- out out_feedback_out_26@20000000
    -- out out_feedback_valid_out_26@20000000
    thei_acl_push_i16_push26_gmm_substract : i_acl_push_i16_push26_gmm_substract2542
    PORT MAP (
        in_data_in => i_reduction_gmm_substract_58_gmm_substract_q,
        in_feedback_stall_in_26 => i_acl_pop_i16_pop26_gmm_substract_out_feedback_stall_out_26,
        in_keep_going => redist23_i_acl_pipeline_keep_going_gmm_substract_out_data_out_3_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_26 => i_acl_push_i16_push26_gmm_substract_out_feedback_out_26,
        out_feedback_valid_out_26 => i_acl_push_i16_push26_gmm_substract_out_feedback_valid_out_26,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i16_pop26_gmm_substract(BLACKBOX,130)@4
    -- out out_feedback_stall_out_26@20000000
    thei_acl_pop_i16_pop26_gmm_substract : i_acl_pop_i16_pop26_gmm_substract2460
    PORT MAP (
        in_data_in => c_i16_undef_q,
        in_dir => redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q,
        in_feedback_in_26 => i_acl_push_i16_push26_gmm_substract_out_feedback_out_26,
        in_feedback_valid_in_26 => i_acl_push_i16_push26_gmm_substract_out_feedback_valid_out_26,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_data_out => i_acl_pop_i16_pop26_gmm_substract_out_data_out,
        out_feedback_stall_out_26 => i_acl_pop_i16_pop26_gmm_substract_out_feedback_stall_out_26,
        clock => clock,
        resetn => resetn
    );

    -- i_replace_phi2643_gmm_substract(MUX,314)@4
    i_replace_phi2643_gmm_substract_s <= redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q;
    i_replace_phi2643_gmm_substract_combproc: PROCESS (i_replace_phi2643_gmm_substract_s, i_acl_pop_i16_pop26_gmm_substract_out_data_out, i_ffwd_dst_acl_3772644_gmm_substract_out_dest_data_out_33_0)
    BEGIN
        CASE (i_replace_phi2643_gmm_substract_s) IS
            WHEN "0" => i_replace_phi2643_gmm_substract_q <= i_acl_pop_i16_pop26_gmm_substract_out_data_out;
            WHEN "1" => i_replace_phi2643_gmm_substract_q <= i_ffwd_dst_acl_3772644_gmm_substract_out_dest_data_out_33_0;
            WHEN OTHERS => i_replace_phi2643_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_17_gmm_substract(MUX,244)@4
    i_reduction_gmm_substract_17_gmm_substract_s <= redist6_i_unnamed_gmm_substract2508_q_2_q;
    i_reduction_gmm_substract_17_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_17_gmm_substract_s, i_replace_phi2643_gmm_substract_q, i_replace_phi2674_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_17_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_17_gmm_substract_q <= i_replace_phi2643_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_17_gmm_substract_q <= i_replace_phi2674_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_17_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_18_gmm_substract(MUX,245)@4
    i_reduction_gmm_substract_18_gmm_substract_s <= redist7_i_unnamed_gmm_substract2506_q_2_q;
    i_reduction_gmm_substract_18_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_18_gmm_substract_s, i_reduction_gmm_substract_17_gmm_substract_q, i_replace_phi2687_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_18_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_18_gmm_substract_q <= i_reduction_gmm_substract_17_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_18_gmm_substract_q <= i_replace_phi2687_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_18_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_53_gmm_substract(MUX,280)@4
    i_reduction_gmm_substract_53_gmm_substract_s <= i_selcond_gmm_substract_29_gmm_substract_q;
    i_reduction_gmm_substract_53_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_53_gmm_substract_s, i_replace_phi2687_gmm_substract_q, i_reduction_gmm_substract_18_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_53_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_53_gmm_substract_q <= i_replace_phi2687_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_53_gmm_substract_q <= i_reduction_gmm_substract_18_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_53_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_54_gmm_substract(MUX,281)@4
    i_reduction_gmm_substract_54_gmm_substract_s <= redist8_i_selcond_gmm_substract_32_demorgan_gmm_substract_q_1_q;
    i_reduction_gmm_substract_54_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_54_gmm_substract_s, i_reduction_gmm_substract_53_gmm_substract_q, i_reduction_gmm_substract_16_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_54_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_54_gmm_substract_q <= i_reduction_gmm_substract_53_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_54_gmm_substract_q <= i_reduction_gmm_substract_16_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_54_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i16_push24_gmm_substract(BLACKBOX,153)@4
    -- out out_feedback_out_24@20000000
    -- out out_feedback_valid_out_24@20000000
    thei_acl_push_i16_push24_gmm_substract : i_acl_push_i16_push24_gmm_substract2538
    PORT MAP (
        in_data_in => i_reduction_gmm_substract_54_gmm_substract_q,
        in_feedback_stall_in_24 => i_acl_pop_i16_pop24_gmm_substract_out_feedback_stall_out_24,
        in_keep_going => redist23_i_acl_pipeline_keep_going_gmm_substract_out_data_out_3_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_24 => i_acl_push_i16_push24_gmm_substract_out_feedback_out_24,
        out_feedback_valid_out_24 => i_acl_push_i16_push24_gmm_substract_out_feedback_valid_out_24,
        clock => clock,
        resetn => resetn
    );

    -- c_i16_undef(CONSTANT,110)
    c_i16_undef_q <= "0000000000000000";

    -- i_acl_pop_i16_pop24_gmm_substract(BLACKBOX,128)@4
    -- out out_feedback_stall_out_24@20000000
    thei_acl_pop_i16_pop24_gmm_substract : i_acl_pop_i16_pop24_gmm_substract2452
    PORT MAP (
        in_data_in => c_i16_undef_q,
        in_dir => redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q,
        in_feedback_in_24 => i_acl_push_i16_push24_gmm_substract_out_feedback_out_24,
        in_feedback_valid_in_24 => i_acl_push_i16_push24_gmm_substract_out_feedback_valid_out_24,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_data_out => i_acl_pop_i16_pop24_gmm_substract_out_data_out,
        out_feedback_stall_out_24 => i_acl_pop_i16_pop24_gmm_substract_out_feedback_stall_out_24,
        clock => clock,
        resetn => resetn
    );

    -- i_replace_phi2687_gmm_substract(MUX,316)@4
    i_replace_phi2687_gmm_substract_s <= redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q;
    i_replace_phi2687_gmm_substract_combproc: PROCESS (i_replace_phi2687_gmm_substract_s, i_acl_pop_i16_pop24_gmm_substract_out_data_out, i_ffwd_dst_acl_3892688_gmm_substract_out_dest_data_out_38_0)
    BEGIN
        CASE (i_replace_phi2687_gmm_substract_s) IS
            WHEN "0" => i_replace_phi2687_gmm_substract_q <= i_acl_pop_i16_pop24_gmm_substract_out_data_out;
            WHEN "1" => i_replace_phi2687_gmm_substract_q <= i_ffwd_dst_acl_3892688_gmm_substract_out_dest_data_out_38_0;
            WHEN OTHERS => i_replace_phi2687_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_15_gmm_substract(MUX,242)@4
    i_reduction_gmm_substract_15_gmm_substract_s <= redist2_i_unnamed_gmm_substract2514_q_2_q;
    i_reduction_gmm_substract_15_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_15_gmm_substract_s, i_replace_phi2643_gmm_substract_q, i_replace_phi2674_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_15_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_15_gmm_substract_q <= i_replace_phi2643_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_15_gmm_substract_q <= i_replace_phi2674_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_15_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_16_gmm_substract(MUX,243)@4
    i_reduction_gmm_substract_16_gmm_substract_s <= redist3_i_unnamed_gmm_substract2512_q_2_q;
    i_reduction_gmm_substract_16_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_16_gmm_substract_s, i_reduction_gmm_substract_15_gmm_substract_q, i_replace_phi2687_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_16_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_16_gmm_substract_q <= i_reduction_gmm_substract_15_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_16_gmm_substract_q <= i_replace_phi2687_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_16_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_57_gmm_substract(MUX,284)@4
    i_reduction_gmm_substract_57_gmm_substract_s <= redist10_i_selcond_gmm_substract_24_demorgan_gmm_substract_q_1_q;
    i_reduction_gmm_substract_57_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_57_gmm_substract_s, i_replace_phi2643_gmm_substract_q, i_reduction_gmm_substract_18_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_57_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_57_gmm_substract_q <= i_replace_phi2643_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_57_gmm_substract_q <= i_reduction_gmm_substract_18_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_57_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_58_gmm_substract(MUX,285)@4
    i_reduction_gmm_substract_58_gmm_substract_s <= redist9_i_selcond_gmm_substract_28_demorgan_gmm_substract_q_1_q;
    i_reduction_gmm_substract_58_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_58_gmm_substract_s, i_reduction_gmm_substract_57_gmm_substract_q, i_reduction_gmm_substract_16_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_58_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_58_gmm_substract_q <= i_reduction_gmm_substract_57_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_58_gmm_substract_q <= i_reduction_gmm_substract_16_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_58_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_src_unnamed_gmm_substract91_gmm_substract(BLACKBOX,222)@4
    -- out out_intel_reserved_ffwd_86_0@20000000
    thei_ffwd_src_unnamed_gmm_substract91_gmm_substract : i_ffwd_src_unnamed_gmm_substract91_gmm_substract2597
    PORT MAP (
        in_enable_in => redist17_i_first_cleanup_gmm_substract_q_1_q,
        in_src_data_in_86_0 => i_reduction_gmm_substract_58_gmm_substract_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_intel_reserved_ffwd_86_0 => i_ffwd_src_unnamed_gmm_substract91_gmm_substract_out_intel_reserved_ffwd_86_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_src_unnamed_gmm_substract90_gmm_substract(BLACKBOX,221)@4
    -- out out_intel_reserved_ffwd_85_0@20000000
    thei_ffwd_src_unnamed_gmm_substract90_gmm_substract : i_ffwd_src_unnamed_gmm_substract90_gmm_substract2595
    PORT MAP (
        in_enable_in => redist17_i_first_cleanup_gmm_substract_q_1_q,
        in_src_data_in_85_0 => i_reduction_gmm_substract_56_gmm_substract_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_intel_reserved_ffwd_85_0 => i_ffwd_src_unnamed_gmm_substract90_gmm_substract_out_intel_reserved_ffwd_85_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_src_unnamed_gmm_substract89_gmm_substract(BLACKBOX,220)@4
    -- out out_intel_reserved_ffwd_84_0@20000000
    thei_ffwd_src_unnamed_gmm_substract89_gmm_substract : i_ffwd_src_unnamed_gmm_substract89_gmm_substract2593
    PORT MAP (
        in_enable_in => redist17_i_first_cleanup_gmm_substract_q_1_q,
        in_src_data_in_84_0 => i_reduction_gmm_substract_54_gmm_substract_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_intel_reserved_ffwd_84_0 => i_ffwd_src_unnamed_gmm_substract89_gmm_substract_out_intel_reserved_ffwd_84_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_acl_3362616_gmm_substract(BLACKBOX,189)@4
    thei_ffwd_dst_acl_3362616_gmm_substract : i_ffwd_dst_acl_3362616_gmm_substract2490
    PORT MAP (
        in_intel_reserved_ffwd_22_0 => in_intel_reserved_ffwd_22_0,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_dest_data_out_22_0 => i_ffwd_dst_acl_3362616_gmm_substract_out_dest_data_out_22_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_acl_3512626_gmm_substract(BLACKBOX,194)@4
    thei_ffwd_dst_acl_3512626_gmm_substract : i_ffwd_dst_acl_3512626_gmm_substract2470
    PORT MAP (
        in_intel_reserved_ffwd_27_0 => in_intel_reserved_ffwd_27_0,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_dest_data_out_27_0 => i_ffwd_dst_acl_3512626_gmm_substract_out_dest_data_out_27_0,
        clock => clock,
        resetn => resetn
    );

    -- i_reduction_gmm_substract_49_gmm_substract(MUX,276)@4
    i_reduction_gmm_substract_49_gmm_substract_s <= i_selcond_gmm_substract_21_gmm_substract_q;
    i_reduction_gmm_substract_49_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_49_gmm_substract_s, i_replace_phi2625_gmm_substract_q, i_reduction_gmm_substract_22_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_49_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_49_gmm_substract_q <= i_replace_phi2625_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_49_gmm_substract_q <= i_reduction_gmm_substract_22_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_49_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_50_gmm_substract(MUX,277)@4
    i_reduction_gmm_substract_50_gmm_substract_s <= redist10_i_selcond_gmm_substract_24_demorgan_gmm_substract_q_1_q;
    i_reduction_gmm_substract_50_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_50_gmm_substract_s, i_reduction_gmm_substract_49_gmm_substract_q, i_reduction_gmm_substract_20_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_50_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_50_gmm_substract_q <= i_reduction_gmm_substract_49_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_50_gmm_substract_q <= i_reduction_gmm_substract_20_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_50_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i9_push22_gmm_substract(BLACKBOX,177)@4
    -- out out_feedback_out_22@20000000
    -- out out_feedback_valid_out_22@20000000
    thei_acl_push_i9_push22_gmm_substract : i_acl_push_i9_push22_gmm_substract2534
    PORT MAP (
        in_data_in => i_reduction_gmm_substract_50_gmm_substract_q,
        in_feedback_stall_in_22 => i_acl_pop_i9_pop22_gmm_substract_out_feedback_stall_out_22,
        in_keep_going => redist23_i_acl_pipeline_keep_going_gmm_substract_out_data_out_3_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_22 => i_acl_push_i9_push22_gmm_substract_out_feedback_out_22,
        out_feedback_valid_out_22 => i_acl_push_i9_push22_gmm_substract_out_feedback_valid_out_22,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i9_pop22_gmm_substract(BLACKBOX,150)@4
    -- out out_feedback_stall_out_22@20000000
    thei_acl_pop_i9_pop22_gmm_substract : i_acl_pop_i9_pop22_gmm_substract2472
    PORT MAP (
        in_data_in => c_i9_undef_q,
        in_dir => redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q,
        in_feedback_in_22 => i_acl_push_i9_push22_gmm_substract_out_feedback_out_22,
        in_feedback_valid_in_22 => i_acl_push_i9_push22_gmm_substract_out_feedback_valid_out_22,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_data_out => i_acl_pop_i9_pop22_gmm_substract_out_data_out,
        out_feedback_stall_out_22 => i_acl_pop_i9_pop22_gmm_substract_out_feedback_stall_out_22,
        clock => clock,
        resetn => resetn
    );

    -- i_replace_phi2625_gmm_substract(MUX,311)@4
    i_replace_phi2625_gmm_substract_s <= redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q;
    i_replace_phi2625_gmm_substract_combproc: PROCESS (i_replace_phi2625_gmm_substract_s, i_acl_pop_i9_pop22_gmm_substract_out_data_out, i_ffwd_dst_acl_3512626_gmm_substract_out_dest_data_out_27_0)
    BEGIN
        CASE (i_replace_phi2625_gmm_substract_s) IS
            WHEN "0" => i_replace_phi2625_gmm_substract_q <= i_acl_pop_i9_pop22_gmm_substract_out_data_out;
            WHEN "1" => i_replace_phi2625_gmm_substract_q <= i_ffwd_dst_acl_3512626_gmm_substract_out_dest_data_out_27_0;
            WHEN OTHERS => i_replace_phi2625_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_dst_acl_3542628_gmm_substract(BLACKBOX,195)@4
    thei_ffwd_dst_acl_3542628_gmm_substract : i_ffwd_dst_acl_3542628_gmm_substract2466
    PORT MAP (
        in_intel_reserved_ffwd_28_0 => in_intel_reserved_ffwd_28_0,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_dest_data_out_28_0 => i_ffwd_dst_acl_3542628_gmm_substract_out_dest_data_out_28_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_push_i9_push23_gmm_substract(BLACKBOX,178)@4
    -- out out_feedback_out_23@20000000
    -- out out_feedback_valid_out_23@20000000
    thei_acl_push_i9_push23_gmm_substract : i_acl_push_i9_push23_gmm_substract2536
    PORT MAP (
        in_data_in => i_reduction_gmm_substract_52_gmm_substract_q,
        in_feedback_stall_in_23 => i_acl_pop_i9_pop23_gmm_substract_out_feedback_stall_out_23,
        in_keep_going => redist23_i_acl_pipeline_keep_going_gmm_substract_out_data_out_3_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_23 => i_acl_push_i9_push23_gmm_substract_out_feedback_out_23,
        out_feedback_valid_out_23 => i_acl_push_i9_push23_gmm_substract_out_feedback_valid_out_23,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i9_pop23_gmm_substract(BLACKBOX,151)@4
    -- out out_feedback_stall_out_23@20000000
    thei_acl_pop_i9_pop23_gmm_substract : i_acl_pop_i9_pop23_gmm_substract2468
    PORT MAP (
        in_data_in => c_i9_undef_q,
        in_dir => redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q,
        in_feedback_in_23 => i_acl_push_i9_push23_gmm_substract_out_feedback_out_23,
        in_feedback_valid_in_23 => i_acl_push_i9_push23_gmm_substract_out_feedback_valid_out_23,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_data_out => i_acl_pop_i9_pop23_gmm_substract_out_data_out,
        out_feedback_stall_out_23 => i_acl_pop_i9_pop23_gmm_substract_out_feedback_stall_out_23,
        clock => clock,
        resetn => resetn
    );

    -- i_replace_phi2627_gmm_substract(MUX,312)@4
    i_replace_phi2627_gmm_substract_s <= redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q;
    i_replace_phi2627_gmm_substract_combproc: PROCESS (i_replace_phi2627_gmm_substract_s, i_acl_pop_i9_pop23_gmm_substract_out_data_out, i_ffwd_dst_acl_3542628_gmm_substract_out_dest_data_out_28_0)
    BEGIN
        CASE (i_replace_phi2627_gmm_substract_s) IS
            WHEN "0" => i_replace_phi2627_gmm_substract_q <= i_acl_pop_i9_pop23_gmm_substract_out_data_out;
            WHEN "1" => i_replace_phi2627_gmm_substract_q <= i_ffwd_dst_acl_3542628_gmm_substract_out_dest_data_out_28_0;
            WHEN OTHERS => i_replace_phi2627_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_21_gmm_substract(MUX,248)@4
    i_reduction_gmm_substract_21_gmm_substract_s <= redist6_i_unnamed_gmm_substract2508_q_2_q;
    i_reduction_gmm_substract_21_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_21_gmm_substract_s, i_replace_phi2627_gmm_substract_q, i_replace_phi2625_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_21_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_21_gmm_substract_q <= i_replace_phi2627_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_21_gmm_substract_q <= i_replace_phi2625_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_21_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_22_gmm_substract(MUX,249)@4
    i_reduction_gmm_substract_22_gmm_substract_s <= redist7_i_unnamed_gmm_substract2506_q_2_q;
    i_reduction_gmm_substract_22_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_22_gmm_substract_s, i_reduction_gmm_substract_21_gmm_substract_q, i_replace_phi2615_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_22_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_22_gmm_substract_q <= i_reduction_gmm_substract_21_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_22_gmm_substract_q <= i_replace_phi2615_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_22_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_47_gmm_substract(MUX,274)@4
    i_reduction_gmm_substract_47_gmm_substract_s <= i_selcond_gmm_substract_29_gmm_substract_q;
    i_reduction_gmm_substract_47_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_47_gmm_substract_s, i_replace_phi2615_gmm_substract_q, i_reduction_gmm_substract_22_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_47_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_47_gmm_substract_q <= i_replace_phi2615_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_47_gmm_substract_q <= i_reduction_gmm_substract_22_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_47_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_48_gmm_substract(MUX,275)@4
    i_reduction_gmm_substract_48_gmm_substract_s <= redist8_i_selcond_gmm_substract_32_demorgan_gmm_substract_q_1_q;
    i_reduction_gmm_substract_48_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_48_gmm_substract_s, i_reduction_gmm_substract_47_gmm_substract_q, i_reduction_gmm_substract_20_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_48_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_48_gmm_substract_q <= i_reduction_gmm_substract_47_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_48_gmm_substract_q <= i_reduction_gmm_substract_20_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_48_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i9_push21_gmm_substract(BLACKBOX,176)@4
    -- out out_feedback_out_21@20000000
    -- out out_feedback_valid_out_21@20000000
    thei_acl_push_i9_push21_gmm_substract : i_acl_push_i9_push21_gmm_substract2532
    PORT MAP (
        in_data_in => i_reduction_gmm_substract_48_gmm_substract_q,
        in_feedback_stall_in_21 => i_acl_pop_i9_pop21_gmm_substract_out_feedback_stall_out_21,
        in_keep_going => redist23_i_acl_pipeline_keep_going_gmm_substract_out_data_out_3_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_21 => i_acl_push_i9_push21_gmm_substract_out_feedback_out_21,
        out_feedback_valid_out_21 => i_acl_push_i9_push21_gmm_substract_out_feedback_valid_out_21,
        clock => clock,
        resetn => resetn
    );

    -- c_i9_undef(CONSTANT,123)
    c_i9_undef_q <= "000000000";

    -- i_acl_pop_i9_pop21_gmm_substract(BLACKBOX,149)@4
    -- out out_feedback_stall_out_21@20000000
    thei_acl_pop_i9_pop21_gmm_substract : i_acl_pop_i9_pop21_gmm_substract2492
    PORT MAP (
        in_data_in => c_i9_undef_q,
        in_dir => redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q,
        in_feedback_in_21 => i_acl_push_i9_push21_gmm_substract_out_feedback_out_21,
        in_feedback_valid_in_21 => i_acl_push_i9_push21_gmm_substract_out_feedback_valid_out_21,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_data_out => i_acl_pop_i9_pop21_gmm_substract_out_data_out,
        out_feedback_stall_out_21 => i_acl_pop_i9_pop21_gmm_substract_out_feedback_stall_out_21,
        clock => clock,
        resetn => resetn
    );

    -- i_replace_phi2615_gmm_substract(MUX,306)@4
    i_replace_phi2615_gmm_substract_s <= redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q;
    i_replace_phi2615_gmm_substract_combproc: PROCESS (i_replace_phi2615_gmm_substract_s, i_acl_pop_i9_pop21_gmm_substract_out_data_out, i_ffwd_dst_acl_3362616_gmm_substract_out_dest_data_out_22_0)
    BEGIN
        CASE (i_replace_phi2615_gmm_substract_s) IS
            WHEN "0" => i_replace_phi2615_gmm_substract_q <= i_acl_pop_i9_pop21_gmm_substract_out_data_out;
            WHEN "1" => i_replace_phi2615_gmm_substract_q <= i_ffwd_dst_acl_3362616_gmm_substract_out_dest_data_out_22_0;
            WHEN OTHERS => i_replace_phi2615_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_19_gmm_substract(MUX,246)@4
    i_reduction_gmm_substract_19_gmm_substract_s <= redist2_i_unnamed_gmm_substract2514_q_2_q;
    i_reduction_gmm_substract_19_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_19_gmm_substract_s, i_replace_phi2627_gmm_substract_q, i_replace_phi2625_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_19_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_19_gmm_substract_q <= i_replace_phi2627_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_19_gmm_substract_q <= i_replace_phi2625_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_19_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_20_gmm_substract(MUX,247)@4
    i_reduction_gmm_substract_20_gmm_substract_s <= redist3_i_unnamed_gmm_substract2512_q_2_q;
    i_reduction_gmm_substract_20_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_20_gmm_substract_s, i_reduction_gmm_substract_19_gmm_substract_q, i_replace_phi2615_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_20_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_20_gmm_substract_q <= i_reduction_gmm_substract_19_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_20_gmm_substract_q <= i_replace_phi2615_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_20_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_51_gmm_substract(MUX,278)@4
    i_reduction_gmm_substract_51_gmm_substract_s <= redist10_i_selcond_gmm_substract_24_demorgan_gmm_substract_q_1_q;
    i_reduction_gmm_substract_51_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_51_gmm_substract_s, i_replace_phi2627_gmm_substract_q, i_reduction_gmm_substract_22_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_51_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_51_gmm_substract_q <= i_replace_phi2627_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_51_gmm_substract_q <= i_reduction_gmm_substract_22_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_51_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_52_gmm_substract(MUX,279)@4
    i_reduction_gmm_substract_52_gmm_substract_s <= redist9_i_selcond_gmm_substract_28_demorgan_gmm_substract_q_1_q;
    i_reduction_gmm_substract_52_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_52_gmm_substract_s, i_reduction_gmm_substract_51_gmm_substract_q, i_reduction_gmm_substract_20_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_52_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_52_gmm_substract_q <= i_reduction_gmm_substract_51_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_52_gmm_substract_q <= i_reduction_gmm_substract_20_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_52_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_src_unnamed_gmm_substract88_gmm_substract(BLACKBOX,219)@4
    -- out out_intel_reserved_ffwd_83_0@20000000
    thei_ffwd_src_unnamed_gmm_substract88_gmm_substract : i_ffwd_src_unnamed_gmm_substract88_gmm_substract2591
    PORT MAP (
        in_enable_in => redist17_i_first_cleanup_gmm_substract_q_1_q,
        in_src_data_in_83_0 => i_reduction_gmm_substract_52_gmm_substract_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_intel_reserved_ffwd_83_0 => i_ffwd_src_unnamed_gmm_substract88_gmm_substract_out_intel_reserved_ffwd_83_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_src_unnamed_gmm_substract87_gmm_substract(BLACKBOX,218)@4
    -- out out_intel_reserved_ffwd_82_0@20000000
    thei_ffwd_src_unnamed_gmm_substract87_gmm_substract : i_ffwd_src_unnamed_gmm_substract87_gmm_substract2589
    PORT MAP (
        in_enable_in => redist17_i_first_cleanup_gmm_substract_q_1_q,
        in_src_data_in_82_0 => i_reduction_gmm_substract_50_gmm_substract_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_intel_reserved_ffwd_82_0 => i_ffwd_src_unnamed_gmm_substract87_gmm_substract_out_intel_reserved_ffwd_82_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_src_unnamed_gmm_substract86_gmm_substract(BLACKBOX,217)@4
    -- out out_intel_reserved_ffwd_81_0@20000000
    thei_ffwd_src_unnamed_gmm_substract86_gmm_substract : i_ffwd_src_unnamed_gmm_substract86_gmm_substract2587
    PORT MAP (
        in_enable_in => redist17_i_first_cleanup_gmm_substract_q_1_q,
        in_src_data_in_81_0 => i_reduction_gmm_substract_48_gmm_substract_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_intel_reserved_ffwd_81_0 => i_ffwd_src_unnamed_gmm_substract86_gmm_substract_out_intel_reserved_ffwd_81_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_acl_3332614_gmm_substract(BLACKBOX,188)@4
    thei_ffwd_dst_acl_3332614_gmm_substract : i_ffwd_dst_acl_3332614_gmm_substract2494
    PORT MAP (
        in_intel_reserved_ffwd_21_0 => in_intel_reserved_ffwd_21_0,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_dest_data_out_21_0 => i_ffwd_dst_acl_3332614_gmm_substract_out_dest_data_out_21_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_acl_3452622_gmm_substract(BLACKBOX,192)@4
    thei_ffwd_dst_acl_3452622_gmm_substract : i_ffwd_dst_acl_3452622_gmm_substract2478
    PORT MAP (
        in_intel_reserved_ffwd_25_0 => in_intel_reserved_ffwd_25_0,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_dest_data_out_25_0 => i_ffwd_dst_acl_3452622_gmm_substract_out_dest_data_out_25_0,
        clock => clock,
        resetn => resetn
    );

    -- i_reduction_gmm_substract_43_gmm_substract(MUX,270)@4
    i_reduction_gmm_substract_43_gmm_substract_s <= i_selcond_gmm_substract_21_gmm_substract_q;
    i_reduction_gmm_substract_43_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_43_gmm_substract_s, i_replace_phi2621_gmm_substract_q, i_reduction_gmm_substract_26_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_43_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_43_gmm_substract_q <= i_replace_phi2621_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_43_gmm_substract_q <= i_reduction_gmm_substract_26_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_43_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_44_gmm_substract(MUX,271)@4
    i_reduction_gmm_substract_44_gmm_substract_s <= redist10_i_selcond_gmm_substract_24_demorgan_gmm_substract_q_1_q;
    i_reduction_gmm_substract_44_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_44_gmm_substract_s, i_reduction_gmm_substract_43_gmm_substract_q, i_reduction_gmm_substract_24_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_44_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_44_gmm_substract_q <= i_reduction_gmm_substract_43_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_44_gmm_substract_q <= i_reduction_gmm_substract_24_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_44_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i9_push19_gmm_substract(BLACKBOX,174)@4
    -- out out_feedback_out_19@20000000
    -- out out_feedback_valid_out_19@20000000
    thei_acl_push_i9_push19_gmm_substract : i_acl_push_i9_push19_gmm_substract2528
    PORT MAP (
        in_data_in => i_reduction_gmm_substract_44_gmm_substract_q,
        in_feedback_stall_in_19 => i_acl_pop_i9_pop19_gmm_substract_out_feedback_stall_out_19,
        in_keep_going => redist23_i_acl_pipeline_keep_going_gmm_substract_out_data_out_3_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_19 => i_acl_push_i9_push19_gmm_substract_out_feedback_out_19,
        out_feedback_valid_out_19 => i_acl_push_i9_push19_gmm_substract_out_feedback_valid_out_19,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i9_pop19_gmm_substract(BLACKBOX,147)@4
    -- out out_feedback_stall_out_19@20000000
    thei_acl_pop_i9_pop19_gmm_substract : i_acl_pop_i9_pop19_gmm_substract2480
    PORT MAP (
        in_data_in => c_i9_undef_q,
        in_dir => redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q,
        in_feedback_in_19 => i_acl_push_i9_push19_gmm_substract_out_feedback_out_19,
        in_feedback_valid_in_19 => i_acl_push_i9_push19_gmm_substract_out_feedback_valid_out_19,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_data_out => i_acl_pop_i9_pop19_gmm_substract_out_data_out,
        out_feedback_stall_out_19 => i_acl_pop_i9_pop19_gmm_substract_out_feedback_stall_out_19,
        clock => clock,
        resetn => resetn
    );

    -- i_replace_phi2621_gmm_substract(MUX,309)@4
    i_replace_phi2621_gmm_substract_s <= redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q;
    i_replace_phi2621_gmm_substract_combproc: PROCESS (i_replace_phi2621_gmm_substract_s, i_acl_pop_i9_pop19_gmm_substract_out_data_out, i_ffwd_dst_acl_3452622_gmm_substract_out_dest_data_out_25_0)
    BEGIN
        CASE (i_replace_phi2621_gmm_substract_s) IS
            WHEN "0" => i_replace_phi2621_gmm_substract_q <= i_acl_pop_i9_pop19_gmm_substract_out_data_out;
            WHEN "1" => i_replace_phi2621_gmm_substract_q <= i_ffwd_dst_acl_3452622_gmm_substract_out_dest_data_out_25_0;
            WHEN OTHERS => i_replace_phi2621_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_dst_acl_3482624_gmm_substract(BLACKBOX,193)@4
    thei_ffwd_dst_acl_3482624_gmm_substract : i_ffwd_dst_acl_3482624_gmm_substract2474
    PORT MAP (
        in_intel_reserved_ffwd_26_0 => in_intel_reserved_ffwd_26_0,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_dest_data_out_26_0 => i_ffwd_dst_acl_3482624_gmm_substract_out_dest_data_out_26_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_push_i9_push20_gmm_substract(BLACKBOX,175)@4
    -- out out_feedback_out_20@20000000
    -- out out_feedback_valid_out_20@20000000
    thei_acl_push_i9_push20_gmm_substract : i_acl_push_i9_push20_gmm_substract2530
    PORT MAP (
        in_data_in => i_reduction_gmm_substract_46_gmm_substract_q,
        in_feedback_stall_in_20 => i_acl_pop_i9_pop20_gmm_substract_out_feedback_stall_out_20,
        in_keep_going => redist23_i_acl_pipeline_keep_going_gmm_substract_out_data_out_3_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_20 => i_acl_push_i9_push20_gmm_substract_out_feedback_out_20,
        out_feedback_valid_out_20 => i_acl_push_i9_push20_gmm_substract_out_feedback_valid_out_20,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i9_pop20_gmm_substract(BLACKBOX,148)@4
    -- out out_feedback_stall_out_20@20000000
    thei_acl_pop_i9_pop20_gmm_substract : i_acl_pop_i9_pop20_gmm_substract2476
    PORT MAP (
        in_data_in => c_i9_undef_q,
        in_dir => redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q,
        in_feedback_in_20 => i_acl_push_i9_push20_gmm_substract_out_feedback_out_20,
        in_feedback_valid_in_20 => i_acl_push_i9_push20_gmm_substract_out_feedback_valid_out_20,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_data_out => i_acl_pop_i9_pop20_gmm_substract_out_data_out,
        out_feedback_stall_out_20 => i_acl_pop_i9_pop20_gmm_substract_out_feedback_stall_out_20,
        clock => clock,
        resetn => resetn
    );

    -- i_replace_phi2623_gmm_substract(MUX,310)@4
    i_replace_phi2623_gmm_substract_s <= redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q;
    i_replace_phi2623_gmm_substract_combproc: PROCESS (i_replace_phi2623_gmm_substract_s, i_acl_pop_i9_pop20_gmm_substract_out_data_out, i_ffwd_dst_acl_3482624_gmm_substract_out_dest_data_out_26_0)
    BEGIN
        CASE (i_replace_phi2623_gmm_substract_s) IS
            WHEN "0" => i_replace_phi2623_gmm_substract_q <= i_acl_pop_i9_pop20_gmm_substract_out_data_out;
            WHEN "1" => i_replace_phi2623_gmm_substract_q <= i_ffwd_dst_acl_3482624_gmm_substract_out_dest_data_out_26_0;
            WHEN OTHERS => i_replace_phi2623_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_25_gmm_substract(MUX,252)@4
    i_reduction_gmm_substract_25_gmm_substract_s <= redist6_i_unnamed_gmm_substract2508_q_2_q;
    i_reduction_gmm_substract_25_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_25_gmm_substract_s, i_replace_phi2623_gmm_substract_q, i_replace_phi2621_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_25_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_25_gmm_substract_q <= i_replace_phi2623_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_25_gmm_substract_q <= i_replace_phi2621_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_25_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_26_gmm_substract(MUX,253)@4
    i_reduction_gmm_substract_26_gmm_substract_s <= redist7_i_unnamed_gmm_substract2506_q_2_q;
    i_reduction_gmm_substract_26_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_26_gmm_substract_s, i_reduction_gmm_substract_25_gmm_substract_q, i_replace_phi2613_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_26_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_26_gmm_substract_q <= i_reduction_gmm_substract_25_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_26_gmm_substract_q <= i_replace_phi2613_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_26_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_41_gmm_substract(MUX,268)@4
    i_reduction_gmm_substract_41_gmm_substract_s <= i_selcond_gmm_substract_29_gmm_substract_q;
    i_reduction_gmm_substract_41_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_41_gmm_substract_s, i_replace_phi2613_gmm_substract_q, i_reduction_gmm_substract_26_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_41_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_41_gmm_substract_q <= i_replace_phi2613_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_41_gmm_substract_q <= i_reduction_gmm_substract_26_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_41_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_42_gmm_substract(MUX,269)@4
    i_reduction_gmm_substract_42_gmm_substract_s <= redist8_i_selcond_gmm_substract_32_demorgan_gmm_substract_q_1_q;
    i_reduction_gmm_substract_42_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_42_gmm_substract_s, i_reduction_gmm_substract_41_gmm_substract_q, i_reduction_gmm_substract_24_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_42_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_42_gmm_substract_q <= i_reduction_gmm_substract_41_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_42_gmm_substract_q <= i_reduction_gmm_substract_24_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_42_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i9_push18_gmm_substract(BLACKBOX,173)@4
    -- out out_feedback_out_18@20000000
    -- out out_feedback_valid_out_18@20000000
    thei_acl_push_i9_push18_gmm_substract : i_acl_push_i9_push18_gmm_substract2526
    PORT MAP (
        in_data_in => i_reduction_gmm_substract_42_gmm_substract_q,
        in_feedback_stall_in_18 => i_acl_pop_i9_pop18_gmm_substract_out_feedback_stall_out_18,
        in_keep_going => redist23_i_acl_pipeline_keep_going_gmm_substract_out_data_out_3_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_18 => i_acl_push_i9_push18_gmm_substract_out_feedback_out_18,
        out_feedback_valid_out_18 => i_acl_push_i9_push18_gmm_substract_out_feedback_valid_out_18,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i9_pop18_gmm_substract(BLACKBOX,146)@4
    -- out out_feedback_stall_out_18@20000000
    thei_acl_pop_i9_pop18_gmm_substract : i_acl_pop_i9_pop18_gmm_substract2496
    PORT MAP (
        in_data_in => c_i9_undef_q,
        in_dir => redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q,
        in_feedback_in_18 => i_acl_push_i9_push18_gmm_substract_out_feedback_out_18,
        in_feedback_valid_in_18 => i_acl_push_i9_push18_gmm_substract_out_feedback_valid_out_18,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_data_out => i_acl_pop_i9_pop18_gmm_substract_out_data_out,
        out_feedback_stall_out_18 => i_acl_pop_i9_pop18_gmm_substract_out_feedback_stall_out_18,
        clock => clock,
        resetn => resetn
    );

    -- i_replace_phi2613_gmm_substract(MUX,305)@4
    i_replace_phi2613_gmm_substract_s <= redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q;
    i_replace_phi2613_gmm_substract_combproc: PROCESS (i_replace_phi2613_gmm_substract_s, i_acl_pop_i9_pop18_gmm_substract_out_data_out, i_ffwd_dst_acl_3332614_gmm_substract_out_dest_data_out_21_0)
    BEGIN
        CASE (i_replace_phi2613_gmm_substract_s) IS
            WHEN "0" => i_replace_phi2613_gmm_substract_q <= i_acl_pop_i9_pop18_gmm_substract_out_data_out;
            WHEN "1" => i_replace_phi2613_gmm_substract_q <= i_ffwd_dst_acl_3332614_gmm_substract_out_dest_data_out_21_0;
            WHEN OTHERS => i_replace_phi2613_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_23_gmm_substract(MUX,250)@4
    i_reduction_gmm_substract_23_gmm_substract_s <= redist2_i_unnamed_gmm_substract2514_q_2_q;
    i_reduction_gmm_substract_23_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_23_gmm_substract_s, i_replace_phi2623_gmm_substract_q, i_replace_phi2621_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_23_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_23_gmm_substract_q <= i_replace_phi2623_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_23_gmm_substract_q <= i_replace_phi2621_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_23_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_24_gmm_substract(MUX,251)@4
    i_reduction_gmm_substract_24_gmm_substract_s <= redist3_i_unnamed_gmm_substract2512_q_2_q;
    i_reduction_gmm_substract_24_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_24_gmm_substract_s, i_reduction_gmm_substract_23_gmm_substract_q, i_replace_phi2613_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_24_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_24_gmm_substract_q <= i_reduction_gmm_substract_23_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_24_gmm_substract_q <= i_replace_phi2613_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_24_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_45_gmm_substract(MUX,272)@4
    i_reduction_gmm_substract_45_gmm_substract_s <= redist10_i_selcond_gmm_substract_24_demorgan_gmm_substract_q_1_q;
    i_reduction_gmm_substract_45_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_45_gmm_substract_s, i_replace_phi2623_gmm_substract_q, i_reduction_gmm_substract_26_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_45_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_45_gmm_substract_q <= i_replace_phi2623_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_45_gmm_substract_q <= i_reduction_gmm_substract_26_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_45_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_46_gmm_substract(MUX,273)@4
    i_reduction_gmm_substract_46_gmm_substract_s <= redist9_i_selcond_gmm_substract_28_demorgan_gmm_substract_q_1_q;
    i_reduction_gmm_substract_46_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_46_gmm_substract_s, i_reduction_gmm_substract_45_gmm_substract_q, i_reduction_gmm_substract_24_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_46_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_46_gmm_substract_q <= i_reduction_gmm_substract_45_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_46_gmm_substract_q <= i_reduction_gmm_substract_24_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_46_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_src_unnamed_gmm_substract85_gmm_substract(BLACKBOX,216)@4
    -- out out_intel_reserved_ffwd_80_0@20000000
    thei_ffwd_src_unnamed_gmm_substract85_gmm_substract : i_ffwd_src_unnamed_gmm_substract85_gmm_substract2585
    PORT MAP (
        in_enable_in => redist17_i_first_cleanup_gmm_substract_q_1_q,
        in_src_data_in_80_0 => i_reduction_gmm_substract_46_gmm_substract_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_intel_reserved_ffwd_80_0 => i_ffwd_src_unnamed_gmm_substract85_gmm_substract_out_intel_reserved_ffwd_80_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_src_unnamed_gmm_substract84_gmm_substract(BLACKBOX,215)@4
    -- out out_intel_reserved_ffwd_79_0@20000000
    thei_ffwd_src_unnamed_gmm_substract84_gmm_substract : i_ffwd_src_unnamed_gmm_substract84_gmm_substract2583
    PORT MAP (
        in_enable_in => redist17_i_first_cleanup_gmm_substract_q_1_q,
        in_src_data_in_79_0 => i_reduction_gmm_substract_44_gmm_substract_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_intel_reserved_ffwd_79_0 => i_ffwd_src_unnamed_gmm_substract84_gmm_substract_out_intel_reserved_ffwd_79_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_src_unnamed_gmm_substract83_gmm_substract(BLACKBOX,214)@4
    -- out out_intel_reserved_ffwd_78_0@20000000
    thei_ffwd_src_unnamed_gmm_substract83_gmm_substract : i_ffwd_src_unnamed_gmm_substract83_gmm_substract2581
    PORT MAP (
        in_enable_in => redist17_i_first_cleanup_gmm_substract_q_1_q,
        in_src_data_in_78_0 => i_reduction_gmm_substract_42_gmm_substract_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_intel_reserved_ffwd_78_0 => i_ffwd_src_unnamed_gmm_substract83_gmm_substract_out_intel_reserved_ffwd_78_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_acl_3302612_gmm_substract(BLACKBOX,187)@4
    thei_ffwd_dst_acl_3302612_gmm_substract : i_ffwd_dst_acl_3302612_gmm_substract2498
    PORT MAP (
        in_intel_reserved_ffwd_20_0 => in_intel_reserved_ffwd_20_0,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_dest_data_out_20_0 => i_ffwd_dst_acl_3302612_gmm_substract_out_dest_data_out_20_0,
        clock => clock,
        resetn => resetn
    );

    -- i_selcond_gmm_substract_16_gmm_substract(LOGICAL,329)@4
    i_selcond_gmm_substract_16_gmm_substract_q <= redist7_i_unnamed_gmm_substract2506_q_2_q and redist20_i_cmp_i_i129_gmm_substract_c_1_q;

    -- i_reduction_gmm_substract_35_gmm_substract(MUX,262)@4 + 1
    i_reduction_gmm_substract_35_gmm_substract_s <= i_selcond_gmm_substract_16_gmm_substract_q;
    i_reduction_gmm_substract_35_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_reduction_gmm_substract_35_gmm_substract_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_reduction_gmm_substract_35_gmm_substract_s) IS
                WHEN "0" => i_reduction_gmm_substract_35_gmm_substract_q <= i_replace_phi_gmm_substract_q;
                WHEN "1" => i_reduction_gmm_substract_35_gmm_substract_q <= i_reduction_gmm_substract_28_gmm_substract_q;
                WHEN OTHERS => i_reduction_gmm_substract_35_gmm_substract_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_ffwd_dst_acl_3392618_gmm_substract(BLACKBOX,190)@4
    thei_ffwd_dst_acl_3392618_gmm_substract : i_ffwd_dst_acl_3392618_gmm_substract2486
    PORT MAP (
        in_intel_reserved_ffwd_23_0 => in_intel_reserved_ffwd_23_0,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_dest_data_out_23_0 => i_ffwd_dst_acl_3392618_gmm_substract_out_dest_data_out_23_0,
        clock => clock,
        resetn => resetn
    );

    -- i_reduction_gmm_substract_37_gmm_substract(MUX,264)@4
    i_reduction_gmm_substract_37_gmm_substract_s <= i_selcond_gmm_substract_21_gmm_substract_q;
    i_reduction_gmm_substract_37_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_37_gmm_substract_s, i_replace_phi2617_gmm_substract_q, i_reduction_gmm_substract_30_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_37_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_37_gmm_substract_q <= i_replace_phi2617_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_37_gmm_substract_q <= i_reduction_gmm_substract_30_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_37_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_38_gmm_substract(MUX,265)@4
    i_reduction_gmm_substract_38_gmm_substract_s <= redist10_i_selcond_gmm_substract_24_demorgan_gmm_substract_q_1_q;
    i_reduction_gmm_substract_38_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_38_gmm_substract_s, i_reduction_gmm_substract_37_gmm_substract_q, i_reduction_gmm_substract_28_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_38_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_38_gmm_substract_q <= i_reduction_gmm_substract_37_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_38_gmm_substract_q <= i_reduction_gmm_substract_28_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_38_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i9_push16_gmm_substract(BLACKBOX,171)@4
    -- out out_feedback_out_16@20000000
    -- out out_feedback_valid_out_16@20000000
    thei_acl_push_i9_push16_gmm_substract : i_acl_push_i9_push16_gmm_substract2522
    PORT MAP (
        in_data_in => i_reduction_gmm_substract_38_gmm_substract_q,
        in_feedback_stall_in_16 => i_acl_pop_i9_pop16_gmm_substract_out_feedback_stall_out_16,
        in_keep_going => redist23_i_acl_pipeline_keep_going_gmm_substract_out_data_out_3_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_16 => i_acl_push_i9_push16_gmm_substract_out_feedback_out_16,
        out_feedback_valid_out_16 => i_acl_push_i9_push16_gmm_substract_out_feedback_valid_out_16,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i9_pop16_gmm_substract(BLACKBOX,144)@4
    -- out out_feedback_stall_out_16@20000000
    thei_acl_pop_i9_pop16_gmm_substract : i_acl_pop_i9_pop16_gmm_substract2488
    PORT MAP (
        in_data_in => c_i9_undef_q,
        in_dir => redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q,
        in_feedback_in_16 => i_acl_push_i9_push16_gmm_substract_out_feedback_out_16,
        in_feedback_valid_in_16 => i_acl_push_i9_push16_gmm_substract_out_feedback_valid_out_16,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_data_out => i_acl_pop_i9_pop16_gmm_substract_out_data_out,
        out_feedback_stall_out_16 => i_acl_pop_i9_pop16_gmm_substract_out_feedback_stall_out_16,
        clock => clock,
        resetn => resetn
    );

    -- i_replace_phi2617_gmm_substract(MUX,307)@4
    i_replace_phi2617_gmm_substract_s <= redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q;
    i_replace_phi2617_gmm_substract_combproc: PROCESS (i_replace_phi2617_gmm_substract_s, i_acl_pop_i9_pop16_gmm_substract_out_data_out, i_ffwd_dst_acl_3392618_gmm_substract_out_dest_data_out_23_0)
    BEGIN
        CASE (i_replace_phi2617_gmm_substract_s) IS
            WHEN "0" => i_replace_phi2617_gmm_substract_q <= i_acl_pop_i9_pop16_gmm_substract_out_data_out;
            WHEN "1" => i_replace_phi2617_gmm_substract_q <= i_ffwd_dst_acl_3392618_gmm_substract_out_dest_data_out_23_0;
            WHEN OTHERS => i_replace_phi2617_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_dst_acl_3422620_gmm_substract(BLACKBOX,191)@4
    thei_ffwd_dst_acl_3422620_gmm_substract : i_ffwd_dst_acl_3422620_gmm_substract2482
    PORT MAP (
        in_intel_reserved_ffwd_24_0 => in_intel_reserved_ffwd_24_0,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_dest_data_out_24_0 => i_ffwd_dst_acl_3422620_gmm_substract_out_dest_data_out_24_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_push_i9_push17_gmm_substract(BLACKBOX,172)@4
    -- out out_feedback_out_17@20000000
    -- out out_feedback_valid_out_17@20000000
    thei_acl_push_i9_push17_gmm_substract : i_acl_push_i9_push17_gmm_substract2524
    PORT MAP (
        in_data_in => i_reduction_gmm_substract_40_gmm_substract_q,
        in_feedback_stall_in_17 => i_acl_pop_i9_pop17_gmm_substract_out_feedback_stall_out_17,
        in_keep_going => redist23_i_acl_pipeline_keep_going_gmm_substract_out_data_out_3_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_17 => i_acl_push_i9_push17_gmm_substract_out_feedback_out_17,
        out_feedback_valid_out_17 => i_acl_push_i9_push17_gmm_substract_out_feedback_valid_out_17,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i9_pop17_gmm_substract(BLACKBOX,145)@4
    -- out out_feedback_stall_out_17@20000000
    thei_acl_pop_i9_pop17_gmm_substract : i_acl_pop_i9_pop17_gmm_substract2484
    PORT MAP (
        in_data_in => c_i9_undef_q,
        in_dir => redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q,
        in_feedback_in_17 => i_acl_push_i9_push17_gmm_substract_out_feedback_out_17,
        in_feedback_valid_in_17 => i_acl_push_i9_push17_gmm_substract_out_feedback_valid_out_17,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_data_out => i_acl_pop_i9_pop17_gmm_substract_out_data_out,
        out_feedback_stall_out_17 => i_acl_pop_i9_pop17_gmm_substract_out_feedback_stall_out_17,
        clock => clock,
        resetn => resetn
    );

    -- i_replace_phi2619_gmm_substract(MUX,308)@4
    i_replace_phi2619_gmm_substract_s <= redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q;
    i_replace_phi2619_gmm_substract_combproc: PROCESS (i_replace_phi2619_gmm_substract_s, i_acl_pop_i9_pop17_gmm_substract_out_data_out, i_ffwd_dst_acl_3422620_gmm_substract_out_dest_data_out_24_0)
    BEGIN
        CASE (i_replace_phi2619_gmm_substract_s) IS
            WHEN "0" => i_replace_phi2619_gmm_substract_q <= i_acl_pop_i9_pop17_gmm_substract_out_data_out;
            WHEN "1" => i_replace_phi2619_gmm_substract_q <= i_ffwd_dst_acl_3422620_gmm_substract_out_dest_data_out_24_0;
            WHEN OTHERS => i_replace_phi2619_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_29_gmm_substract(MUX,256)@4
    i_reduction_gmm_substract_29_gmm_substract_s <= redist6_i_unnamed_gmm_substract2508_q_2_q;
    i_reduction_gmm_substract_29_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_29_gmm_substract_s, i_replace_phi2619_gmm_substract_q, i_replace_phi2617_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_29_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_29_gmm_substract_q <= i_replace_phi2619_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_29_gmm_substract_q <= i_replace_phi2617_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_29_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_30_gmm_substract(MUX,257)@4
    i_reduction_gmm_substract_30_gmm_substract_s <= redist7_i_unnamed_gmm_substract2506_q_2_q;
    i_reduction_gmm_substract_30_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_30_gmm_substract_s, i_reduction_gmm_substract_29_gmm_substract_q, i_replace_phi_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_30_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_30_gmm_substract_q <= i_reduction_gmm_substract_29_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_30_gmm_substract_q <= i_replace_phi_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_30_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist12_i_reduction_gmm_substract_30_gmm_substract_q_1(DELAY,409)
    redist12_i_reduction_gmm_substract_30_gmm_substract_q_1 : dspba_delay
    GENERIC MAP ( width => 9, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_reduction_gmm_substract_30_gmm_substract_q, xout => redist12_i_reduction_gmm_substract_30_gmm_substract_q_1_q, clk => clock, aclr => resetn );

    -- redist11_i_selcond_gmm_substract_17_gmm_substract_q_1(DELAY,408)
    redist11_i_selcond_gmm_substract_17_gmm_substract_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_selcond_gmm_substract_17_gmm_substract_q, xout => redist11_i_selcond_gmm_substract_17_gmm_substract_q_1_q, clk => clock, aclr => resetn );

    -- redist19_i_cmp_i_i129_not_gmm_substract_q_1(DELAY,416)
    redist19_i_cmp_i_i129_not_gmm_substract_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_i_i129_not_gmm_substract_q, xout => redist19_i_cmp_i_i129_not_gmm_substract_q_1_q, clk => clock, aclr => resetn );

    -- i_selcond_gmm_substract_15_gmm_substract(LOGICAL,328)@4
    i_selcond_gmm_substract_15_gmm_substract_q <= redist7_i_unnamed_gmm_substract2506_q_2_q or redist19_i_cmp_i_i129_not_gmm_substract_q_1_q;

    -- i_selcond_gmm_substract_18_gmm_substract(LOGICAL,331)@4 + 1
    i_selcond_gmm_substract_18_gmm_substract_qi <= i_selcond_gmm_substract_15_gmm_substract_q or redist11_i_selcond_gmm_substract_17_gmm_substract_q_1_q;
    i_selcond_gmm_substract_18_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_selcond_gmm_substract_18_gmm_substract_qi, xout => i_selcond_gmm_substract_18_gmm_substract_q, clk => clock, aclr => resetn );

    -- i_reduction_gmm_substract_36_gmm_substract(MUX,263)@5
    i_reduction_gmm_substract_36_gmm_substract_s <= i_selcond_gmm_substract_18_gmm_substract_q;
    i_reduction_gmm_substract_36_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_36_gmm_substract_s, redist12_i_reduction_gmm_substract_30_gmm_substract_q_1_q, i_reduction_gmm_substract_35_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_36_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_36_gmm_substract_q <= redist12_i_reduction_gmm_substract_30_gmm_substract_q_1_q;
            WHEN "1" => i_reduction_gmm_substract_36_gmm_substract_q <= i_reduction_gmm_substract_35_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_36_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i9_push15_gmm_substract(BLACKBOX,170)@5
    -- out out_feedback_out_15@20000000
    -- out out_feedback_valid_out_15@20000000
    thei_acl_push_i9_push15_gmm_substract : i_acl_push_i9_push15_gmm_substract2520
    PORT MAP (
        in_data_in => i_reduction_gmm_substract_36_gmm_substract_q,
        in_feedback_stall_in_15 => i_acl_pop_i9_pop15_gmm_substract_out_feedback_stall_out_15,
        in_keep_going => redist24_i_acl_pipeline_keep_going_gmm_substract_out_data_out_4_q,
        in_stall_in => GND_q,
        in_valid_in => redist30_sync_in_aunroll_x_in_i_valid_4_q,
        out_feedback_out_15 => i_acl_push_i9_push15_gmm_substract_out_feedback_out_15,
        out_feedback_valid_out_15 => i_acl_push_i9_push15_gmm_substract_out_feedback_valid_out_15,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i9_pop15_gmm_substract(BLACKBOX,143)@4
    -- out out_feedback_stall_out_15@20000000
    thei_acl_pop_i9_pop15_gmm_substract : i_acl_pop_i9_pop15_gmm_substract2500
    PORT MAP (
        in_data_in => c_i9_undef_q,
        in_dir => redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q,
        in_feedback_in_15 => i_acl_push_i9_push15_gmm_substract_out_feedback_out_15,
        in_feedback_valid_in_15 => i_acl_push_i9_push15_gmm_substract_out_feedback_valid_out_15,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_data_out => i_acl_pop_i9_pop15_gmm_substract_out_data_out,
        out_feedback_stall_out_15 => i_acl_pop_i9_pop15_gmm_substract_out_feedback_stall_out_15,
        clock => clock,
        resetn => resetn
    );

    -- i_replace_phi_gmm_substract(MUX,325)@4
    i_replace_phi_gmm_substract_s <= redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q;
    i_replace_phi_gmm_substract_combproc: PROCESS (i_replace_phi_gmm_substract_s, i_acl_pop_i9_pop15_gmm_substract_out_data_out, i_ffwd_dst_acl_3302612_gmm_substract_out_dest_data_out_20_0)
    BEGIN
        CASE (i_replace_phi_gmm_substract_s) IS
            WHEN "0" => i_replace_phi_gmm_substract_q <= i_acl_pop_i9_pop15_gmm_substract_out_data_out;
            WHEN "1" => i_replace_phi_gmm_substract_q <= i_ffwd_dst_acl_3302612_gmm_substract_out_dest_data_out_20_0;
            WHEN OTHERS => i_replace_phi_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_27_gmm_substract(MUX,254)@4
    i_reduction_gmm_substract_27_gmm_substract_s <= redist2_i_unnamed_gmm_substract2514_q_2_q;
    i_reduction_gmm_substract_27_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_27_gmm_substract_s, i_replace_phi2619_gmm_substract_q, i_replace_phi2617_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_27_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_27_gmm_substract_q <= i_replace_phi2619_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_27_gmm_substract_q <= i_replace_phi2617_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_27_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_28_gmm_substract(MUX,255)@4
    i_reduction_gmm_substract_28_gmm_substract_s <= redist3_i_unnamed_gmm_substract2512_q_2_q;
    i_reduction_gmm_substract_28_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_28_gmm_substract_s, i_reduction_gmm_substract_27_gmm_substract_q, i_replace_phi_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_28_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_28_gmm_substract_q <= i_reduction_gmm_substract_27_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_28_gmm_substract_q <= i_replace_phi_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_28_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_39_gmm_substract(MUX,266)@4
    i_reduction_gmm_substract_39_gmm_substract_s <= redist10_i_selcond_gmm_substract_24_demorgan_gmm_substract_q_1_q;
    i_reduction_gmm_substract_39_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_39_gmm_substract_s, i_replace_phi2619_gmm_substract_q, i_reduction_gmm_substract_30_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_39_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_39_gmm_substract_q <= i_replace_phi2619_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_39_gmm_substract_q <= i_reduction_gmm_substract_30_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_39_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_40_gmm_substract(MUX,267)@4
    i_reduction_gmm_substract_40_gmm_substract_s <= redist9_i_selcond_gmm_substract_28_demorgan_gmm_substract_q_1_q;
    i_reduction_gmm_substract_40_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_40_gmm_substract_s, i_reduction_gmm_substract_39_gmm_substract_q, i_reduction_gmm_substract_28_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_40_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_40_gmm_substract_q <= i_reduction_gmm_substract_39_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_40_gmm_substract_q <= i_reduction_gmm_substract_28_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_40_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_src_unnamed_gmm_substract82_gmm_substract(BLACKBOX,213)@4
    -- out out_intel_reserved_ffwd_77_0@20000000
    thei_ffwd_src_unnamed_gmm_substract82_gmm_substract : i_ffwd_src_unnamed_gmm_substract82_gmm_substract2579
    PORT MAP (
        in_enable_in => redist17_i_first_cleanup_gmm_substract_q_1_q,
        in_src_data_in_77_0 => i_reduction_gmm_substract_40_gmm_substract_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_intel_reserved_ffwd_77_0 => i_ffwd_src_unnamed_gmm_substract82_gmm_substract_out_intel_reserved_ffwd_77_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_src_unnamed_gmm_substract81_gmm_substract(BLACKBOX,212)@4
    -- out out_intel_reserved_ffwd_76_0@20000000
    thei_ffwd_src_unnamed_gmm_substract81_gmm_substract : i_ffwd_src_unnamed_gmm_substract81_gmm_substract2577
    PORT MAP (
        in_enable_in => redist17_i_first_cleanup_gmm_substract_q_1_q,
        in_src_data_in_76_0 => i_reduction_gmm_substract_38_gmm_substract_q,
        in_stall_in => GND_q,
        in_valid_in => redist29_sync_in_aunroll_x_in_i_valid_3_q,
        out_intel_reserved_ffwd_76_0 => i_ffwd_src_unnamed_gmm_substract81_gmm_substract_out_intel_reserved_ffwd_76_0,
        clock => clock,
        resetn => resetn
    );

    -- redist18_i_first_cleanup_gmm_substract_q_2(DELAY,415)
    redist18_i_first_cleanup_gmm_substract_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist17_i_first_cleanup_gmm_substract_q_1_q, xout => redist18_i_first_cleanup_gmm_substract_q_2_q, clk => clock, aclr => resetn );

    -- i_ffwd_src_unnamed_gmm_substract80_gmm_substract(BLACKBOX,211)@5
    -- out out_intel_reserved_ffwd_75_0@20000000
    thei_ffwd_src_unnamed_gmm_substract80_gmm_substract : i_ffwd_src_unnamed_gmm_substract80_gmm_substract2575
    PORT MAP (
        in_enable_in => redist18_i_first_cleanup_gmm_substract_q_2_q,
        in_src_data_in_75_0 => i_reduction_gmm_substract_36_gmm_substract_q,
        in_stall_in => GND_q,
        in_valid_in => redist30_sync_in_aunroll_x_in_i_valid_4_q,
        out_intel_reserved_ffwd_75_0 => i_ffwd_src_unnamed_gmm_substract80_gmm_substract_out_intel_reserved_ffwd_75_0,
        clock => clock,
        resetn => resetn
    );

    -- redist16_i_reduction_gmm_substract_12_gmm_substract_q_1(DELAY,413)
    redist16_i_reduction_gmm_substract_12_gmm_substract_q_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_reduction_gmm_substract_12_gmm_substract_q, xout => redist16_i_reduction_gmm_substract_12_gmm_substract_q_1_q, clk => clock, aclr => resetn );

    -- redist15_i_reduction_gmm_substract_14_gmm_substract_q_1(DELAY,412)
    redist15_i_reduction_gmm_substract_14_gmm_substract_q_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_reduction_gmm_substract_14_gmm_substract_q, xout => redist15_i_reduction_gmm_substract_14_gmm_substract_q_1_q, clk => clock, aclr => resetn );

    -- redist4_i_unnamed_gmm_substract2510_q_2(DELAY,401)
    redist4_i_unnamed_gmm_substract2510_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_gmm_substract2510_q, xout => redist4_i_unnamed_gmm_substract2510_q_2_q, clk => clock, aclr => resetn );

    -- redist5_i_unnamed_gmm_substract2510_q_3(DELAY,402)
    redist5_i_unnamed_gmm_substract2510_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist4_i_unnamed_gmm_substract2510_q_2_q, xout => redist5_i_unnamed_gmm_substract2510_q_3_q, clk => clock, aclr => resetn );

    -- i_reduction_gmm_substract_33_gmm_substract(MUX,260)@5
    i_reduction_gmm_substract_33_gmm_substract_s <= redist5_i_unnamed_gmm_substract2510_q_3_q;
    i_reduction_gmm_substract_33_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_33_gmm_substract_s, redist15_i_reduction_gmm_substract_14_gmm_substract_q_1_q, redist16_i_reduction_gmm_substract_12_gmm_substract_q_1_q)
    BEGIN
        CASE (i_reduction_gmm_substract_33_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_33_gmm_substract_q <= redist15_i_reduction_gmm_substract_14_gmm_substract_q_1_q;
            WHEN "1" => i_reduction_gmm_substract_33_gmm_substract_q <= redist16_i_reduction_gmm_substract_12_gmm_substract_q_1_q;
            WHEN OTHERS => i_reduction_gmm_substract_33_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_dst_acl_3972693_gmm_substract(BLACKBOX,200)@5
    thei_ffwd_dst_acl_3972693_gmm_substract : i_ffwd_dst_acl_3972693_gmm_substract2446
    PORT MAP (
        in_intel_reserved_ffwd_39_0 => in_intel_reserved_ffwd_39_0,
        in_stall_in => GND_q,
        in_valid_in => redist30_sync_in_aunroll_x_in_i_valid_4_q,
        out_dest_data_out_39_0 => i_ffwd_dst_acl_3972693_gmm_substract_out_dest_data_out_39_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_push_i8_push14_gmm_substract(BLACKBOX,166)@5
    -- out out_feedback_out_14@20000000
    -- out out_feedback_valid_out_14@20000000
    thei_acl_push_i8_push14_gmm_substract : i_acl_push_i8_push14_gmm_substract2518
    PORT MAP (
        in_data_in => i_reduction_gmm_substract_34_gmm_substract_q,
        in_feedback_stall_in_14 => i_acl_pop_i8_pop14_gmm_substract_out_feedback_stall_out_14,
        in_keep_going => redist24_i_acl_pipeline_keep_going_gmm_substract_out_data_out_4_q,
        in_stall_in => GND_q,
        in_valid_in => redist30_sync_in_aunroll_x_in_i_valid_4_q,
        out_feedback_out_14 => i_acl_push_i8_push14_gmm_substract_out_feedback_out_14,
        out_feedback_valid_out_14 => i_acl_push_i8_push14_gmm_substract_out_feedback_valid_out_14,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i8_pop14_gmm_substract(BLACKBOX,139)@5
    -- out out_feedback_stall_out_14@20000000
    thei_acl_pop_i8_pop14_gmm_substract : i_acl_pop_i8_pop14_gmm_substract2448
    PORT MAP (
        in_data_in => c_i8_undef_q,
        in_dir => redist27_sync_in_aunroll_x_in_c0_eni22818_1_4_q,
        in_feedback_in_14 => i_acl_push_i8_push14_gmm_substract_out_feedback_out_14,
        in_feedback_valid_in_14 => i_acl_push_i8_push14_gmm_substract_out_feedback_valid_out_14,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist30_sync_in_aunroll_x_in_i_valid_4_q,
        out_data_out => i_acl_pop_i8_pop14_gmm_substract_out_data_out,
        out_feedback_stall_out_14 => i_acl_pop_i8_pop14_gmm_substract_out_feedback_stall_out_14,
        clock => clock,
        resetn => resetn
    );

    -- redist27_sync_in_aunroll_x_in_c0_eni22818_1_4(DELAY,424)
    redist27_sync_in_aunroll_x_in_c0_eni22818_1_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist26_sync_in_aunroll_x_in_c0_eni22818_1_3_q, xout => redist27_sync_in_aunroll_x_in_c0_eni22818_1_4_q, clk => clock, aclr => resetn );

    -- i_replace_phi2692_gmm_substract(MUX,317)@5
    i_replace_phi2692_gmm_substract_s <= redist27_sync_in_aunroll_x_in_c0_eni22818_1_4_q;
    i_replace_phi2692_gmm_substract_combproc: PROCESS (i_replace_phi2692_gmm_substract_s, i_acl_pop_i8_pop14_gmm_substract_out_data_out, i_ffwd_dst_acl_3972693_gmm_substract_out_dest_data_out_39_0)
    BEGIN
        CASE (i_replace_phi2692_gmm_substract_s) IS
            WHEN "0" => i_replace_phi2692_gmm_substract_q <= i_acl_pop_i8_pop14_gmm_substract_out_data_out;
            WHEN "1" => i_replace_phi2692_gmm_substract_q <= i_ffwd_dst_acl_3972693_gmm_substract_out_dest_data_out_39_0;
            WHEN OTHERS => i_replace_phi2692_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_selcond_gmm_substract_11_gmm_substract(LOGICAL,326)@4
    i_selcond_gmm_substract_11_gmm_substract_q <= redist6_i_unnamed_gmm_substract2508_q_2_q or redist4_i_unnamed_gmm_substract2510_q_2_q;

    -- i_selcond_gmm_substract_12_gmm_substract(LOGICAL,327)@4 + 1
    i_selcond_gmm_substract_12_gmm_substract_qi <= redist20_i_cmp_i_i129_gmm_substract_c_1_q and i_selcond_gmm_substract_11_gmm_substract_q;
    i_selcond_gmm_substract_12_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_selcond_gmm_substract_12_gmm_substract_qi, xout => i_selcond_gmm_substract_12_gmm_substract_q, clk => clock, aclr => resetn );

    -- i_reduction_gmm_substract_34_gmm_substract(MUX,261)@5
    i_reduction_gmm_substract_34_gmm_substract_s <= i_selcond_gmm_substract_12_gmm_substract_q;
    i_reduction_gmm_substract_34_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_34_gmm_substract_s, i_replace_phi2692_gmm_substract_q, i_reduction_gmm_substract_33_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_34_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_34_gmm_substract_q <= i_replace_phi2692_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_34_gmm_substract_q <= i_reduction_gmm_substract_33_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_34_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_src_unnamed_gmm_substract79_gmm_substract(BLACKBOX,210)@5
    -- out out_intel_reserved_ffwd_74_0@20000000
    thei_ffwd_src_unnamed_gmm_substract79_gmm_substract : i_ffwd_src_unnamed_gmm_substract79_gmm_substract2573
    PORT MAP (
        in_enable_in => redist18_i_first_cleanup_gmm_substract_q_2_q,
        in_src_data_in_74_0 => i_reduction_gmm_substract_34_gmm_substract_q,
        in_stall_in => GND_q,
        in_valid_in => redist30_sync_in_aunroll_x_in_i_valid_4_q,
        out_intel_reserved_ffwd_74_0 => i_ffwd_src_unnamed_gmm_substract79_gmm_substract_out_intel_reserved_ffwd_74_0,
        clock => clock,
        resetn => resetn
    );

    -- redist14_i_reduction_gmm_substract_16_gmm_substract_q_1(DELAY,411)
    redist14_i_reduction_gmm_substract_16_gmm_substract_q_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_reduction_gmm_substract_16_gmm_substract_q, xout => redist14_i_reduction_gmm_substract_16_gmm_substract_q_1_q, clk => clock, aclr => resetn );

    -- redist13_i_reduction_gmm_substract_18_gmm_substract_q_1(DELAY,410)
    redist13_i_reduction_gmm_substract_18_gmm_substract_q_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_reduction_gmm_substract_18_gmm_substract_q, xout => redist13_i_reduction_gmm_substract_18_gmm_substract_q_1_q, clk => clock, aclr => resetn );

    -- i_reduction_gmm_substract_31_gmm_substract(MUX,258)@5
    i_reduction_gmm_substract_31_gmm_substract_s <= redist5_i_unnamed_gmm_substract2510_q_3_q;
    i_reduction_gmm_substract_31_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_31_gmm_substract_s, redist13_i_reduction_gmm_substract_18_gmm_substract_q_1_q, redist14_i_reduction_gmm_substract_16_gmm_substract_q_1_q)
    BEGIN
        CASE (i_reduction_gmm_substract_31_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_31_gmm_substract_q <= redist13_i_reduction_gmm_substract_18_gmm_substract_q_1_q;
            WHEN "1" => i_reduction_gmm_substract_31_gmm_substract_q <= redist14_i_reduction_gmm_substract_16_gmm_substract_q_1_q;
            WHEN OTHERS => i_reduction_gmm_substract_31_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_dst_acl_3772642_gmm_substract(BLACKBOX,196)@5
    thei_ffwd_dst_acl_3772642_gmm_substract : i_ffwd_dst_acl_3772642_gmm_substract2462
    PORT MAP (
        in_intel_reserved_ffwd_33_0 => in_intel_reserved_ffwd_33_0,
        in_stall_in => GND_q,
        in_valid_in => redist30_sync_in_aunroll_x_in_i_valid_4_q,
        out_dest_data_out_33_0 => i_ffwd_dst_acl_3772642_gmm_substract_out_dest_data_out_33_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_push_i16_push13_gmm_substract(BLACKBOX,152)@5
    -- out out_feedback_out_13@20000000
    -- out out_feedback_valid_out_13@20000000
    thei_acl_push_i16_push13_gmm_substract : i_acl_push_i16_push13_gmm_substract2516
    PORT MAP (
        in_data_in => i_reduction_gmm_substract_32_gmm_substract_q,
        in_feedback_stall_in_13 => i_acl_pop_i16_pop13_gmm_substract_out_feedback_stall_out_13,
        in_keep_going => redist24_i_acl_pipeline_keep_going_gmm_substract_out_data_out_4_q,
        in_stall_in => GND_q,
        in_valid_in => redist30_sync_in_aunroll_x_in_i_valid_4_q,
        out_feedback_out_13 => i_acl_push_i16_push13_gmm_substract_out_feedback_out_13,
        out_feedback_valid_out_13 => i_acl_push_i16_push13_gmm_substract_out_feedback_valid_out_13,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i16_pop13_gmm_substract(BLACKBOX,127)@5
    -- out out_feedback_stall_out_13@20000000
    thei_acl_pop_i16_pop13_gmm_substract : i_acl_pop_i16_pop13_gmm_substract2464
    PORT MAP (
        in_data_in => c_i16_undef_q,
        in_dir => redist27_sync_in_aunroll_x_in_c0_eni22818_1_4_q,
        in_feedback_in_13 => i_acl_push_i16_push13_gmm_substract_out_feedback_out_13,
        in_feedback_valid_in_13 => i_acl_push_i16_push13_gmm_substract_out_feedback_valid_out_13,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist30_sync_in_aunroll_x_in_i_valid_4_q,
        out_data_out => i_acl_pop_i16_pop13_gmm_substract_out_data_out,
        out_feedback_stall_out_13 => i_acl_pop_i16_pop13_gmm_substract_out_feedback_stall_out_13,
        clock => clock,
        resetn => resetn
    );

    -- i_replace_phi2641_gmm_substract(MUX,313)@5
    i_replace_phi2641_gmm_substract_s <= redist27_sync_in_aunroll_x_in_c0_eni22818_1_4_q;
    i_replace_phi2641_gmm_substract_combproc: PROCESS (i_replace_phi2641_gmm_substract_s, i_acl_pop_i16_pop13_gmm_substract_out_data_out, i_ffwd_dst_acl_3772642_gmm_substract_out_dest_data_out_33_0)
    BEGIN
        CASE (i_replace_phi2641_gmm_substract_s) IS
            WHEN "0" => i_replace_phi2641_gmm_substract_q <= i_acl_pop_i16_pop13_gmm_substract_out_data_out;
            WHEN "1" => i_replace_phi2641_gmm_substract_q <= i_ffwd_dst_acl_3772642_gmm_substract_out_dest_data_out_33_0;
            WHEN OTHERS => i_replace_phi2641_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_gmm_substract_32_gmm_substract(MUX,259)@5
    i_reduction_gmm_substract_32_gmm_substract_s <= i_selcond_gmm_substract_12_gmm_substract_q;
    i_reduction_gmm_substract_32_gmm_substract_combproc: PROCESS (i_reduction_gmm_substract_32_gmm_substract_s, i_replace_phi2641_gmm_substract_q, i_reduction_gmm_substract_31_gmm_substract_q)
    BEGIN
        CASE (i_reduction_gmm_substract_32_gmm_substract_s) IS
            WHEN "0" => i_reduction_gmm_substract_32_gmm_substract_q <= i_replace_phi2641_gmm_substract_q;
            WHEN "1" => i_reduction_gmm_substract_32_gmm_substract_q <= i_reduction_gmm_substract_31_gmm_substract_q;
            WHEN OTHERS => i_reduction_gmm_substract_32_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_src_unnamed_gmm_substract78_gmm_substract(BLACKBOX,209)@5
    -- out out_intel_reserved_ffwd_73_0@20000000
    thei_ffwd_src_unnamed_gmm_substract78_gmm_substract : i_ffwd_src_unnamed_gmm_substract78_gmm_substract2571
    PORT MAP (
        in_enable_in => redist18_i_first_cleanup_gmm_substract_q_2_q,
        in_src_data_in_73_0 => i_reduction_gmm_substract_32_gmm_substract_q,
        in_stall_in => GND_q,
        in_valid_in => redist30_sync_in_aunroll_x_in_i_valid_4_q,
        out_intel_reserved_ffwd_73_0 => i_ffwd_src_unnamed_gmm_substract78_gmm_substract_out_intel_reserved_ffwd_73_0,
        clock => clock,
        resetn => resetn
    );

    -- redist1_i_unnamed_gmm_substract2565_q_2(DELAY,398)
    redist1_i_unnamed_gmm_substract2565_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist0_i_unnamed_gmm_substract2565_q_1_q, xout => redist1_i_unnamed_gmm_substract2565_q_2_q, clk => clock, aclr => resetn );

    -- i_masked_gmm_substract(LOGICAL,231)@5
    i_masked_gmm_substract_q <= redist1_i_unnamed_gmm_substract2565_q_2_q and redist18_i_first_cleanup_gmm_substract_q_2_q;

    -- redist24_i_acl_pipeline_keep_going_gmm_substract_out_data_out_4(DELAY,421)
    redist24_i_acl_pipeline_keep_going_gmm_substract_out_data_out_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist23_i_acl_pipeline_keep_going_gmm_substract_out_data_out_3_q, xout => redist24_i_acl_pipeline_keep_going_gmm_substract_out_data_out_4_q, clk => clock, aclr => resetn );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,107)@5
    out_c0_exi2_0 <= GND_q;
    out_c0_exi2_1 <= redist24_i_acl_pipeline_keep_going_gmm_substract_out_data_out_4_q;
    out_c0_exi2_2 <= i_masked_gmm_substract_q;
    out_intel_reserved_ffwd_73_0 <= i_ffwd_src_unnamed_gmm_substract78_gmm_substract_out_intel_reserved_ffwd_73_0;
    out_intel_reserved_ffwd_74_0 <= i_ffwd_src_unnamed_gmm_substract79_gmm_substract_out_intel_reserved_ffwd_74_0;
    out_intel_reserved_ffwd_75_0 <= i_ffwd_src_unnamed_gmm_substract80_gmm_substract_out_intel_reserved_ffwd_75_0;
    out_intel_reserved_ffwd_76_0 <= i_ffwd_src_unnamed_gmm_substract81_gmm_substract_out_intel_reserved_ffwd_76_0;
    out_intel_reserved_ffwd_77_0 <= i_ffwd_src_unnamed_gmm_substract82_gmm_substract_out_intel_reserved_ffwd_77_0;
    out_intel_reserved_ffwd_78_0 <= i_ffwd_src_unnamed_gmm_substract83_gmm_substract_out_intel_reserved_ffwd_78_0;
    out_intel_reserved_ffwd_79_0 <= i_ffwd_src_unnamed_gmm_substract84_gmm_substract_out_intel_reserved_ffwd_79_0;
    out_intel_reserved_ffwd_80_0 <= i_ffwd_src_unnamed_gmm_substract85_gmm_substract_out_intel_reserved_ffwd_80_0;
    out_intel_reserved_ffwd_81_0 <= i_ffwd_src_unnamed_gmm_substract86_gmm_substract_out_intel_reserved_ffwd_81_0;
    out_intel_reserved_ffwd_82_0 <= i_ffwd_src_unnamed_gmm_substract87_gmm_substract_out_intel_reserved_ffwd_82_0;
    out_intel_reserved_ffwd_83_0 <= i_ffwd_src_unnamed_gmm_substract88_gmm_substract_out_intel_reserved_ffwd_83_0;
    out_intel_reserved_ffwd_84_0 <= i_ffwd_src_unnamed_gmm_substract89_gmm_substract_out_intel_reserved_ffwd_84_0;
    out_intel_reserved_ffwd_85_0 <= i_ffwd_src_unnamed_gmm_substract90_gmm_substract_out_intel_reserved_ffwd_85_0;
    out_intel_reserved_ffwd_86_0 <= i_ffwd_src_unnamed_gmm_substract91_gmm_substract_out_intel_reserved_ffwd_86_0;
    out_intel_reserved_ffwd_87_0 <= i_ffwd_src_unnamed_gmm_substract92_gmm_substract_out_intel_reserved_ffwd_87_0;
    out_intel_reserved_ffwd_88_0 <= i_ffwd_src_unnamed_gmm_substract93_gmm_substract_out_intel_reserved_ffwd_88_0;
    out_intel_reserved_ffwd_89_0 <= i_ffwd_src_unnamed_gmm_substract94_gmm_substract_out_intel_reserved_ffwd_89_0;
    out_intel_reserved_ffwd_90_0 <= i_ffwd_src_unnamed_gmm_substract95_gmm_substract_out_intel_reserved_ffwd_90_0;
    out_intel_reserved_ffwd_91_0 <= i_ffwd_src_unnamed_gmm_substract96_gmm_substract_out_intel_reserved_ffwd_91_0;
    out_o_valid <= redist30_sync_in_aunroll_x_in_i_valid_4_q;

    -- ext_sig_sync_out(GPOUT,124)
    out_aclp_to_limiter_i_acl_pipeline_keep_going_gmm_substract_exiting_valid_out <= i_acl_pipeline_keep_going_gmm_substract_out_exiting_valid_out;
    out_aclp_to_limiter_i_acl_pipeline_keep_going_gmm_substract_exiting_stall_out <= i_acl_pipeline_keep_going_gmm_substract_out_exiting_stall_out;

    -- pipeline_valid_out_sync(GPOUT,363)
    out_pipeline_valid_out <= i_acl_pipeline_keep_going_gmm_substract_out_pipeline_valid_out;

END normal;
