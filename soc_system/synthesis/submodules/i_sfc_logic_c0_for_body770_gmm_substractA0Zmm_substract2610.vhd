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

-- VHDL created from i_sfc_logic_c0_for_body770_gmm_substract_c0_enter2825_gmm_substract2610
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

entity i_sfc_logic_c0_for_body770_gmm_substract_c0_enter2825_gmm_substract2610 is
    port (
        in_bg_th_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_c0_eni22824_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni22824_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni22824_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        in_intel_reserved_ffwd_35_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_intel_reserved_ffwd_69_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_70_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_71_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_72_0 : in std_logic_vector(33 downto 0);  -- ufix34
        out_c0_exi22829_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi22829_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi22829_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_intel_reserved_ffwd_92_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going2804_gmm_substract_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going2804_gmm_substract_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_for_body770_gmm_substract_c0_enter2825_gmm_substract2610;

architecture normal of i_sfc_logic_c0_for_body770_gmm_substract_c0_enter2825_gmm_substract2610 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_syncbuf_bg_th_sync_buffer_gmm_substract2635 is
        port (
            in_buffer_in_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pipeline_keep_going2804_gmm_substract2616 is
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


    component i_acl_pop_i32_b_01846_pop7_gmm_substract2637 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_valid_in_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_stall_out_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i32_k766_01845_pop8_gmm_substract2639 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_valid_in_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_stall_out_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i34_fpgaindvars_iv2606_pop6_gmm_substract2629 is
        port (
            in_data_in : in std_logic_vector(33 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_6 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_feedback_valid_in_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(33 downto 0);  -- Fixed Point
            out_feedback_stall_out_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i4_cleanups2807_pop11_gmm_substract2612 is
        port (
            in_data_in : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_11 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(3 downto 0);  -- Fixed Point
            out_feedback_stall_out_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i4_initerations2802_pop10_gmm_substract2618 is
        port (
            in_data_in : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_10 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(3 downto 0);  -- Fixed Point
            out_feedback_stall_out_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i8_b_w_sum_0_0_0_01844_pop9_gmm_substract2633 is
        port (
            in_data_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_9 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_stall_out_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_lastiniteration2806_gmm_substract2625 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going2804 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_4 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_notexitcond2814_gmm_substract2665 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_first_cleanup2809 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_5 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_b_01846_push7_gmm_substract2641 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going2804 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_k766_01845_push8_gmm_substract2657 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going2804 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i34_fpgaindvars_iv2606_push6_gmm_substract2660 is
        port (
            in_data_in : in std_logic_vector(33 downto 0);  -- Fixed Point
            in_feedback_stall_in_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going2804 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(33 downto 0);  -- Fixed Point
            out_feedback_out_6 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_feedback_valid_out_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i4_cleanups2807_push11_gmm_substract2668 is
        port (
            in_data_in : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_feedback_stall_in_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going2804 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(3 downto 0);  -- Fixed Point
            out_feedback_out_11 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i4_initerations2802_push10_gmm_substract2621 is
        port (
            in_data_in : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_feedback_stall_in_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going2804 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(3 downto 0);  -- Fixed Point
            out_feedback_out_10 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i8_b_w_sum_0_0_0_01844_push9_gmm_substract2655 is
        port (
            in_data_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_stall_in_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going2804 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_out_9 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_cmp_i_i_i279_12649_gmm_substract2662 is
        port (
            in_intel_reserved_ffwd_35_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_35_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_select6222751_gmm_substract2652 is
        port (
            in_intel_reserved_ffwd_69_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_69_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_select6282754_gmm_substract2647 is
        port (
            in_intel_reserved_ffwd_70_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_70_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_select6342756_gmm_substract2631 is
        port (
            in_intel_reserved_ffwd_71_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_71_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_select6342757_gmm_substract2649 is
        port (
            in_intel_reserved_ffwd_71_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_71_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_unnamed_gmm_substract97_gmm_substract2627 is
        port (
            in_intel_reserved_ffwd_72_0 : in std_logic_vector(33 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_72_0 : out std_logic_vector(33 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract98_gmm_substract2670 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_92_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_92_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_add_i_i113_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bgTrunc_i_fpgaindvars_iv_next2607_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (33 downto 0);
    signal bgTrunc_i_inc780_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_cleanups_shl2808_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (3 downto 0);
    signal i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_narrow_x_b : STD_LOGIC_VECTOR (1 downto 0);
    signal i_syncbuf_bg_th_sync_buffer_gmm_substract_aunroll_x_out_buffer_out_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_2gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i34_1gr_q : STD_LOGIC_VECTOR (33 downto 0);
    signal c_i34_undef_q : STD_LOGIC_VECTOR (33 downto 0);
    signal c_i4_0gr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal c_i4_1gr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal c_i4_7gr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal c_i8_undef_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_pipeline_keep_going2804_gmm_substract_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going2804_gmm_substract_out_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going2804_gmm_substract_out_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going2804_gmm_substract_out_initeration_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going2804_gmm_substract_out_not_exitcond_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going2804_gmm_substract_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i32_b_01846_pop7_gmm_substract_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_b_01846_pop7_gmm_substract_out_feedback_stall_out_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i32_k766_01845_pop8_gmm_substract_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_k766_01845_pop8_gmm_substract_out_feedback_stall_out_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i34_fpgaindvars_iv2606_pop6_gmm_substract_out_data_out : STD_LOGIC_VECTOR (33 downto 0);
    signal i_acl_pop_i34_fpgaindvars_iv2606_pop6_gmm_substract_out_feedback_stall_out_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i4_cleanups2807_pop11_gmm_substract_out_data_out : STD_LOGIC_VECTOR (3 downto 0);
    signal i_acl_pop_i4_cleanups2807_pop11_gmm_substract_out_feedback_stall_out_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i4_initerations2802_pop10_gmm_substract_out_data_out : STD_LOGIC_VECTOR (3 downto 0);
    signal i_acl_pop_i4_initerations2802_pop10_gmm_substract_out_feedback_stall_out_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i8_b_w_sum_0_0_0_01844_pop9_gmm_substract_out_data_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_pop_i8_b_w_sum_0_0_0_01844_pop9_gmm_substract_out_feedback_stall_out_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_lastiniteration2806_gmm_substract_out_feedback_out_4 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_lastiniteration2806_gmm_substract_out_feedback_valid_out_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_notexitcond2814_gmm_substract_out_feedback_out_5 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_notexitcond2814_gmm_substract_out_feedback_valid_out_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_b_01846_push7_gmm_substract_out_feedback_out_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_b_01846_push7_gmm_substract_out_feedback_valid_out_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_k766_01845_push8_gmm_substract_out_feedback_out_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_k766_01845_push8_gmm_substract_out_feedback_valid_out_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i34_fpgaindvars_iv2606_push6_gmm_substract_out_feedback_out_6 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_push_i34_fpgaindvars_iv2606_push6_gmm_substract_out_feedback_valid_out_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i4_cleanups2807_push11_gmm_substract_out_feedback_out_11 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i4_cleanups2807_push11_gmm_substract_out_feedback_valid_out_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i4_initerations2802_push10_gmm_substract_out_feedback_out_10 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i4_initerations2802_push10_gmm_substract_out_feedback_valid_out_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i8_b_w_sum_0_0_0_01844_push9_gmm_substract_out_feedback_out_9 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i8_b_w_sum_0_0_0_01844_push9_gmm_substract_out_feedback_valid_out_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_add_i_i113_gmm_substract_a : STD_LOGIC_VECTOR (8 downto 0);
    signal i_add_i_i113_gmm_substract_b : STD_LOGIC_VECTOR (8 downto 0);
    signal i_add_i_i113_gmm_substract_o : STD_LOGIC_VECTOR (8 downto 0);
    signal i_add_i_i113_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_b_1_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_b_1_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_b_w_sum_0_0_0_01844_replace_phi_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_b_w_sum_0_0_0_01844_replace_phi_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_cleanups_shl2808_gmm_substract_vt_const_3_q : STD_LOGIC_VECTOR (2 downto 0);
    signal i_cleanups_shl2808_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_cleanups_shl2808_gmm_substract_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i119_gmm_substract_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i119_gmm_substract_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i119_gmm_substract_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_cmp_i_i119_gmm_substract_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond2608_gmm_substract_a : STD_LOGIC_VECTOR (35 downto 0);
    signal i_exitcond2608_gmm_substract_b : STD_LOGIC_VECTOR (35 downto 0);
    signal i_exitcond2608_gmm_substract_o : STD_LOGIC_VECTOR (35 downto 0);
    signal i_exitcond2608_gmm_substract_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_12649_gmm_substract_out_dest_data_out_35_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_select6222751_gmm_substract_out_dest_data_out_69_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_select6282754_gmm_substract_out_dest_data_out_70_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_select6342756_gmm_substract_out_dest_data_out_71_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_select6342757_gmm_substract_out_dest_data_out_71_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_unnamed_gmm_substract97_gmm_substract_out_dest_data_out_72_0 : STD_LOGIC_VECTOR (33 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract98_gmm_substract_out_intel_reserved_ffwd_92_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_first_cleanup2809_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_fpgaindvars_iv2606_replace_phi_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_fpgaindvars_iv2606_replace_phi_gmm_substract_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_fpgaindvars_iv_next2607_gmm_substract_a : STD_LOGIC_VECTOR (34 downto 0);
    signal i_fpgaindvars_iv_next2607_gmm_substract_b : STD_LOGIC_VECTOR (34 downto 0);
    signal i_fpgaindvars_iv_next2607_gmm_substract_o : STD_LOGIC_VECTOR (34 downto 0);
    signal i_fpgaindvars_iv_next2607_gmm_substract_q : STD_LOGIC_VECTOR (34 downto 0);
    signal i_inc780_gmm_substract_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc780_gmm_substract_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc780_gmm_substract_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc780_gmm_substract_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_last_initeration2805_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_masked2813_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_next_initerations2803_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_next_initerations2803_gmm_substract_vt_select_2_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_notcmp_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or2811_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gmm_substract2614_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_unnamed_gmm_substract2614_vt_join_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_unnamed_gmm_substract2614_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gmm_substract2623_vt_join_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_unnamed_gmm_substract2623_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gmm_substract2643_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gmm_substract2643_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gmm_substract2645_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gmm_substract2645_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gmm_substract2651_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gmm_substract2651_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_unnamed_gmm_substract2654_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gmm_substract2654_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_unnamed_gmm_substract2664_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_xor2810_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0Idx1Rng1_uid127_i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_x_in : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage0Idx1Rng1_uid127_i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_x_b : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage0Idx1_uid128_i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_x_q : STD_LOGIC_VECTOR (3 downto 0);
    signal leftShiftStageSel0Dto0_uid129_i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStageSel0Dto0_uid129_i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid130_i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid130_i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_x_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage0Idx1Rng1_uid135_i_next_initerations2803_gmm_substract_gmm_substract2620_shift_x_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage0Idx1_uid137_i_next_initerations2803_gmm_substract_gmm_substract2620_shift_x_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage0_uid139_i_next_initerations2803_gmm_substract_gmm_substract2620_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid139_i_next_initerations2803_gmm_substract_gmm_substract2620_shift_x_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_unnamed_gmm_substract2623_BitSelect_for_a_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gmm_substract2623_join_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist0_i_acl_pop_i32_k766_01845_pop8_gmm_substract_out_data_out_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_acl_pop_i32_k766_01845_pop8_gmm_substract_out_data_out_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_i_acl_pipeline_keep_going2804_gmm_substract_out_data_out_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_acl_pipeline_keep_going2804_gmm_substract_out_data_out_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_acl_pipeline_keep_going2804_gmm_substract_out_data_out_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_sync_in_aunroll_x_in_c0_eni22824_1_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_sync_in_aunroll_x_in_c0_eni22824_1_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_sync_in_aunroll_x_in_c0_eni22824_1_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_sync_in_aunroll_x_in_i_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_sync_in_aunroll_x_in_i_valid_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_sync_in_aunroll_x_in_i_valid_3_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist8_sync_in_aunroll_x_in_i_valid_1(DELAY,154)
    redist8_sync_in_aunroll_x_in_i_valid_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist8_sync_in_aunroll_x_in_i_valid_1_q, clk => clock, aclr => resetn );

    -- redist9_sync_in_aunroll_x_in_i_valid_2(DELAY,155)
    redist9_sync_in_aunroll_x_in_i_valid_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist8_sync_in_aunroll_x_in_i_valid_1_q, xout => redist9_sync_in_aunroll_x_in_i_valid_2_q, clk => clock, aclr => resetn );

    -- redist10_sync_in_aunroll_x_in_i_valid_3(DELAY,156)
    redist10_sync_in_aunroll_x_in_i_valid_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist9_sync_in_aunroll_x_in_i_valid_2_q, xout => redist10_sync_in_aunroll_x_in_i_valid_3_q, clk => clock, aclr => resetn );

    -- i_ffwd_dst_unnamed_gmm_substract97_gmm_substract(BLACKBOX,83)@2
    thei_ffwd_dst_unnamed_gmm_substract97_gmm_substract : i_ffwd_dst_unnamed_gmm_substract97_gmm_substract2627
    PORT MAP (
        in_intel_reserved_ffwd_72_0 => in_intel_reserved_ffwd_72_0,
        in_stall_in => GND_q,
        in_valid_in => redist8_sync_in_aunroll_x_in_i_valid_1_q,
        out_dest_data_out_72_0 => i_ffwd_dst_unnamed_gmm_substract97_gmm_substract_out_dest_data_out_72_0,
        clock => clock,
        resetn => resetn
    );

    -- redist3_i_acl_pipeline_keep_going2804_gmm_substract_out_data_out_2(DELAY,149)
    redist3_i_acl_pipeline_keep_going2804_gmm_substract_out_data_out_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist2_i_acl_pipeline_keep_going2804_gmm_substract_out_data_out_1_q, xout => redist3_i_acl_pipeline_keep_going2804_gmm_substract_out_data_out_2_q, clk => clock, aclr => resetn );

    -- i_fpgaindvars_iv_next2607_gmm_substract(ADD,87)@3
    i_fpgaindvars_iv_next2607_gmm_substract_a <= STD_LOGIC_VECTOR("0" & i_fpgaindvars_iv2606_replace_phi_gmm_substract_q);
    i_fpgaindvars_iv_next2607_gmm_substract_b <= STD_LOGIC_VECTOR("0" & c_i34_1gr_q);
    i_fpgaindvars_iv_next2607_gmm_substract_o <= STD_LOGIC_VECTOR(UNSIGNED(i_fpgaindvars_iv_next2607_gmm_substract_a) + UNSIGNED(i_fpgaindvars_iv_next2607_gmm_substract_b));
    i_fpgaindvars_iv_next2607_gmm_substract_q <= i_fpgaindvars_iv_next2607_gmm_substract_o(34 downto 0);

    -- bgTrunc_i_fpgaindvars_iv_next2607_gmm_substract_sel_x(BITSELECT,3)@3
    bgTrunc_i_fpgaindvars_iv_next2607_gmm_substract_sel_x_b <= i_fpgaindvars_iv_next2607_gmm_substract_q(33 downto 0);

    -- i_acl_push_i34_fpgaindvars_iv2606_push6_gmm_substract(BLACKBOX,65)@3
    -- out out_feedback_out_6@20000000
    -- out out_feedback_valid_out_6@20000000
    thei_acl_push_i34_fpgaindvars_iv2606_push6_gmm_substract : i_acl_push_i34_fpgaindvars_iv2606_push6_gmm_substract2660
    PORT MAP (
        in_data_in => bgTrunc_i_fpgaindvars_iv_next2607_gmm_substract_sel_x_b,
        in_feedback_stall_in_6 => i_acl_pop_i34_fpgaindvars_iv2606_pop6_gmm_substract_out_feedback_stall_out_6,
        in_keep_going2804 => redist3_i_acl_pipeline_keep_going2804_gmm_substract_out_data_out_2_q,
        in_stall_in => GND_q,
        in_valid_in => redist9_sync_in_aunroll_x_in_i_valid_2_q,
        out_feedback_out_6 => i_acl_push_i34_fpgaindvars_iv2606_push6_gmm_substract_out_feedback_out_6,
        out_feedback_valid_out_6 => i_acl_push_i34_fpgaindvars_iv2606_push6_gmm_substract_out_feedback_valid_out_6,
        clock => clock,
        resetn => resetn
    );

    -- c_i34_undef(CONSTANT,48)
    c_i34_undef_q <= "0000000000000000000000000000000000";

    -- i_acl_pop_i34_fpgaindvars_iv2606_pop6_gmm_substract(BLACKBOX,57)@2
    -- out out_feedback_stall_out_6@20000000
    thei_acl_pop_i34_fpgaindvars_iv2606_pop6_gmm_substract : i_acl_pop_i34_fpgaindvars_iv2606_pop6_gmm_substract2629
    PORT MAP (
        in_data_in => c_i34_undef_q,
        in_dir => redist5_sync_in_aunroll_x_in_c0_eni22824_1_1_q,
        in_feedback_in_6 => i_acl_push_i34_fpgaindvars_iv2606_push6_gmm_substract_out_feedback_out_6,
        in_feedback_valid_in_6 => i_acl_push_i34_fpgaindvars_iv2606_push6_gmm_substract_out_feedback_valid_out_6,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist8_sync_in_aunroll_x_in_i_valid_1_q,
        out_data_out => i_acl_pop_i34_fpgaindvars_iv2606_pop6_gmm_substract_out_data_out,
        out_feedback_stall_out_6 => i_acl_pop_i34_fpgaindvars_iv2606_pop6_gmm_substract_out_feedback_stall_out_6,
        clock => clock,
        resetn => resetn
    );

    -- redist5_sync_in_aunroll_x_in_c0_eni22824_1_1(DELAY,151)
    redist5_sync_in_aunroll_x_in_c0_eni22824_1_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni22824_1, xout => redist5_sync_in_aunroll_x_in_c0_eni22824_1_1_q, clk => clock, aclr => resetn );

    -- i_fpgaindvars_iv2606_replace_phi_gmm_substract(MUX,86)@2 + 1
    i_fpgaindvars_iv2606_replace_phi_gmm_substract_s <= redist5_sync_in_aunroll_x_in_c0_eni22824_1_1_q;
    i_fpgaindvars_iv2606_replace_phi_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_fpgaindvars_iv2606_replace_phi_gmm_substract_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_fpgaindvars_iv2606_replace_phi_gmm_substract_s) IS
                WHEN "0" => i_fpgaindvars_iv2606_replace_phi_gmm_substract_q <= i_acl_pop_i34_fpgaindvars_iv2606_pop6_gmm_substract_out_data_out;
                WHEN "1" => i_fpgaindvars_iv2606_replace_phi_gmm_substract_q <= i_ffwd_dst_unnamed_gmm_substract97_gmm_substract_out_dest_data_out_72_0;
                WHEN OTHERS => i_fpgaindvars_iv2606_replace_phi_gmm_substract_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- c_i34_1gr(CONSTANT,47)
    c_i34_1gr_q <= "1111111111111111111111111111111111";

    -- i_exitcond2608_gmm_substract(COMPARE,77)@3 + 1
    i_exitcond2608_gmm_substract_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 34 => c_i34_1gr_q(33)) & c_i34_1gr_q));
    i_exitcond2608_gmm_substract_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 34 => i_fpgaindvars_iv2606_replace_phi_gmm_substract_q(33)) & i_fpgaindvars_iv2606_replace_phi_gmm_substract_q));
    i_exitcond2608_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_exitcond2608_gmm_substract_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_exitcond2608_gmm_substract_o <= STD_LOGIC_VECTOR(SIGNED(i_exitcond2608_gmm_substract_a) - SIGNED(i_exitcond2608_gmm_substract_b));
        END IF;
    END PROCESS;
    i_exitcond2608_gmm_substract_c(0) <= i_exitcond2608_gmm_substract_o(35);

    -- i_ffwd_dst_cmp_i_i_i279_12649_gmm_substract(BLACKBOX,78)@4
    thei_ffwd_dst_cmp_i_i_i279_12649_gmm_substract : i_ffwd_dst_cmp_i_i_i279_12649_gmm_substract2662
    PORT MAP (
        in_intel_reserved_ffwd_35_0 => in_intel_reserved_ffwd_35_0,
        in_stall_in => GND_q,
        in_valid_in => redist10_sync_in_aunroll_x_in_i_valid_3_q,
        out_dest_data_out_35_0 => i_ffwd_dst_cmp_i_i_i279_12649_gmm_substract_out_dest_data_out_35_0,
        clock => clock,
        resetn => resetn
    );

    -- i_unnamed_gmm_substract2664(LOGICAL,108)@4
    i_unnamed_gmm_substract2664_q <= i_ffwd_dst_cmp_i_i_i279_12649_gmm_substract_out_dest_data_out_35_0 and i_exitcond2608_gmm_substract_c;

    -- i_acl_push_i1_notexitcond2814_gmm_substract(BLACKBOX,62)@4
    -- out out_feedback_out_5@20000000
    -- out out_feedback_valid_out_5@20000000
    thei_acl_push_i1_notexitcond2814_gmm_substract : i_acl_push_i1_notexitcond2814_gmm_substract2665
    PORT MAP (
        in_data_in => i_unnamed_gmm_substract2664_q,
        in_feedback_stall_in_5 => i_acl_pipeline_keep_going2804_gmm_substract_out_not_exitcond_stall_out,
        in_first_cleanup2809 => i_first_cleanup2809_gmm_substract_q,
        in_stall_in => GND_q,
        in_valid_in => redist10_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_5 => i_acl_push_i1_notexitcond2814_gmm_substract_out_feedback_out_5,
        out_feedback_valid_out_5 => i_acl_push_i1_notexitcond2814_gmm_substract_out_feedback_valid_out_5,
        clock => clock,
        resetn => resetn
    );

    -- c_i4_0gr(CONSTANT,49)
    c_i4_0gr_q <= "0000";

    -- i_cleanups_shl2808_gmm_substract_vt_const_3(CONSTANT,73)
    i_cleanups_shl2808_gmm_substract_vt_const_3_q <= "000";

    -- rightShiftStage0Idx1Rng1_uid135_i_next_initerations2803_gmm_substract_gmm_substract2620_shift_x(BITSELECT,134)@2
    rightShiftStage0Idx1Rng1_uid135_i_next_initerations2803_gmm_substract_gmm_substract2620_shift_x_b <= i_acl_pop_i4_initerations2802_pop10_gmm_substract_out_data_out(3 downto 1);

    -- rightShiftStage0Idx1_uid137_i_next_initerations2803_gmm_substract_gmm_substract2620_shift_x(BITJOIN,136)@2
    rightShiftStage0Idx1_uid137_i_next_initerations2803_gmm_substract_gmm_substract2620_shift_x_q <= GND_q & rightShiftStage0Idx1Rng1_uid135_i_next_initerations2803_gmm_substract_gmm_substract2620_shift_x_b;

    -- i_acl_push_i4_initerations2802_push10_gmm_substract(BLACKBOX,67)@2
    -- out out_feedback_out_10@20000000
    -- out out_feedback_valid_out_10@20000000
    thei_acl_push_i4_initerations2802_push10_gmm_substract : i_acl_push_i4_initerations2802_push10_gmm_substract2621
    PORT MAP (
        in_data_in => i_next_initerations2803_gmm_substract_vt_join_q,
        in_feedback_stall_in_10 => i_acl_pop_i4_initerations2802_pop10_gmm_substract_out_feedback_stall_out_10,
        in_keep_going2804 => redist2_i_acl_pipeline_keep_going2804_gmm_substract_out_data_out_1_q,
        in_stall_in => GND_q,
        in_valid_in => redist8_sync_in_aunroll_x_in_i_valid_1_q,
        out_feedback_out_10 => i_acl_push_i4_initerations2802_push10_gmm_substract_out_feedback_out_10,
        out_feedback_valid_out_10 => i_acl_push_i4_initerations2802_push10_gmm_substract_out_feedback_valid_out_10,
        clock => clock,
        resetn => resetn
    );

    -- c_i4_7gr(CONSTANT,51)
    c_i4_7gr_q <= "0111";

    -- i_acl_pop_i4_initerations2802_pop10_gmm_substract(BLACKBOX,59)@2
    -- out out_feedback_stall_out_10@20000000
    thei_acl_pop_i4_initerations2802_pop10_gmm_substract : i_acl_pop_i4_initerations2802_pop10_gmm_substract2618
    PORT MAP (
        in_data_in => c_i4_7gr_q,
        in_dir => redist5_sync_in_aunroll_x_in_c0_eni22824_1_1_q,
        in_feedback_in_10 => i_acl_push_i4_initerations2802_push10_gmm_substract_out_feedback_out_10,
        in_feedback_valid_in_10 => i_acl_push_i4_initerations2802_push10_gmm_substract_out_feedback_valid_out_10,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist8_sync_in_aunroll_x_in_i_valid_1_q,
        out_data_out => i_acl_pop_i4_initerations2802_pop10_gmm_substract_out_data_out,
        out_feedback_stall_out_10 => i_acl_pop_i4_initerations2802_pop10_gmm_substract_out_feedback_stall_out_10,
        clock => clock,
        resetn => resetn
    );

    -- rightShiftStage0_uid139_i_next_initerations2803_gmm_substract_gmm_substract2620_shift_x(MUX,138)@2
    rightShiftStage0_uid139_i_next_initerations2803_gmm_substract_gmm_substract2620_shift_x_s <= VCC_q;
    rightShiftStage0_uid139_i_next_initerations2803_gmm_substract_gmm_substract2620_shift_x_combproc: PROCESS (rightShiftStage0_uid139_i_next_initerations2803_gmm_substract_gmm_substract2620_shift_x_s, i_acl_pop_i4_initerations2802_pop10_gmm_substract_out_data_out, rightShiftStage0Idx1_uid137_i_next_initerations2803_gmm_substract_gmm_substract2620_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid139_i_next_initerations2803_gmm_substract_gmm_substract2620_shift_x_s) IS
            WHEN "0" => rightShiftStage0_uid139_i_next_initerations2803_gmm_substract_gmm_substract2620_shift_x_q <= i_acl_pop_i4_initerations2802_pop10_gmm_substract_out_data_out;
            WHEN "1" => rightShiftStage0_uid139_i_next_initerations2803_gmm_substract_gmm_substract2620_shift_x_q <= rightShiftStage0Idx1_uid137_i_next_initerations2803_gmm_substract_gmm_substract2620_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid139_i_next_initerations2803_gmm_substract_gmm_substract2620_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_next_initerations2803_gmm_substract_vt_select_2(BITSELECT,93)@2
    i_next_initerations2803_gmm_substract_vt_select_2_b <= rightShiftStage0_uid139_i_next_initerations2803_gmm_substract_gmm_substract2620_shift_x_q(2 downto 0);

    -- i_next_initerations2803_gmm_substract_vt_join(BITJOIN,92)@2
    i_next_initerations2803_gmm_substract_vt_join_q <= GND_q & i_next_initerations2803_gmm_substract_vt_select_2_b;

    -- i_unnamed_gmm_substract2623_BitSelect_for_a(BITSELECT,144)@2
    i_unnamed_gmm_substract2623_BitSelect_for_a_b <= i_next_initerations2803_gmm_substract_vt_join_q(0 downto 0);

    -- i_unnamed_gmm_substract2623_join(BITJOIN,145)@2
    i_unnamed_gmm_substract2623_join_q <= GND_q & GND_q & GND_q & i_unnamed_gmm_substract2623_BitSelect_for_a_b;

    -- i_unnamed_gmm_substract2623_vt_select_0(BITSELECT,103)@2
    i_unnamed_gmm_substract2623_vt_select_0_b <= i_unnamed_gmm_substract2623_join_q(0 downto 0);

    -- i_unnamed_gmm_substract2623_vt_join(BITJOIN,102)@2
    i_unnamed_gmm_substract2623_vt_join_q <= i_cleanups_shl2808_gmm_substract_vt_const_3_q & i_unnamed_gmm_substract2623_vt_select_0_b;

    -- i_last_initeration2805_gmm_substract(LOGICAL,89)@2
    i_last_initeration2805_gmm_substract_q <= "1" WHEN i_unnamed_gmm_substract2623_vt_join_q /= c_i4_0gr_q ELSE "0";

    -- i_acl_push_i1_lastiniteration2806_gmm_substract(BLACKBOX,61)@2
    -- out out_feedback_out_4@20000000
    -- out out_feedback_valid_out_4@20000000
    thei_acl_push_i1_lastiniteration2806_gmm_substract : i_acl_push_i1_lastiniteration2806_gmm_substract2625
    PORT MAP (
        in_data_in => i_last_initeration2805_gmm_substract_q,
        in_feedback_stall_in_4 => i_acl_pipeline_keep_going2804_gmm_substract_out_initeration_stall_out,
        in_keep_going2804 => redist2_i_acl_pipeline_keep_going2804_gmm_substract_out_data_out_1_q,
        in_stall_in => GND_q,
        in_valid_in => redist8_sync_in_aunroll_x_in_i_valid_1_q,
        out_feedback_out_4 => i_acl_push_i1_lastiniteration2806_gmm_substract_out_feedback_out_4,
        out_feedback_valid_out_4 => i_acl_push_i1_lastiniteration2806_gmm_substract_out_feedback_valid_out_4,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pipeline_keep_going2804_gmm_substract(BLACKBOX,54)@1
    -- out out_exiting_stall_out@20000000
    -- out out_exiting_valid_out@20000000
    -- out out_initeration_stall_out@20000000
    -- out out_not_exitcond_stall_out@20000000
    -- out out_pipeline_valid_out@20000000
    thei_acl_pipeline_keep_going2804_gmm_substract : i_acl_pipeline_keep_going2804_gmm_substract2616
    PORT MAP (
        in_data_in => in_c0_eni22824_2,
        in_initeration_in => i_acl_push_i1_lastiniteration2806_gmm_substract_out_feedback_out_4,
        in_initeration_valid_in => i_acl_push_i1_lastiniteration2806_gmm_substract_out_feedback_valid_out_4,
        in_not_exitcond_in => i_acl_push_i1_notexitcond2814_gmm_substract_out_feedback_out_5,
        in_not_exitcond_valid_in => i_acl_push_i1_notexitcond2814_gmm_substract_out_feedback_valid_out_5,
        in_pipeline_stall_in => in_pipeline_stall_in,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pipeline_keep_going2804_gmm_substract_out_data_out,
        out_exiting_stall_out => i_acl_pipeline_keep_going2804_gmm_substract_out_exiting_stall_out,
        out_exiting_valid_out => i_acl_pipeline_keep_going2804_gmm_substract_out_exiting_valid_out,
        out_initeration_stall_out => i_acl_pipeline_keep_going2804_gmm_substract_out_initeration_stall_out,
        out_not_exitcond_stall_out => i_acl_pipeline_keep_going2804_gmm_substract_out_not_exitcond_stall_out,
        out_pipeline_valid_out => i_acl_pipeline_keep_going2804_gmm_substract_out_pipeline_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- redist2_i_acl_pipeline_keep_going2804_gmm_substract_out_data_out_1(DELAY,148)
    redist2_i_acl_pipeline_keep_going2804_gmm_substract_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pipeline_keep_going2804_gmm_substract_out_data_out, xout => redist2_i_acl_pipeline_keep_going2804_gmm_substract_out_data_out_1_q, clk => clock, aclr => resetn );

    -- i_inc780_gmm_substract(ADD,88)@2
    i_inc780_gmm_substract_a <= STD_LOGIC_VECTOR("0" & redist0_i_acl_pop_i32_k766_01845_pop8_gmm_substract_out_data_out_1_q);
    i_inc780_gmm_substract_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_inc780_gmm_substract_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc780_gmm_substract_a) + UNSIGNED(i_inc780_gmm_substract_b));
    i_inc780_gmm_substract_q <= i_inc780_gmm_substract_o(32 downto 0);

    -- bgTrunc_i_inc780_gmm_substract_sel_x(BITSELECT,4)@2
    bgTrunc_i_inc780_gmm_substract_sel_x_b <= i_inc780_gmm_substract_q(31 downto 0);

    -- i_acl_push_i32_k766_01845_push8_gmm_substract(BLACKBOX,64)@2
    -- out out_feedback_out_8@20000000
    -- out out_feedback_valid_out_8@20000000
    thei_acl_push_i32_k766_01845_push8_gmm_substract : i_acl_push_i32_k766_01845_push8_gmm_substract2657
    PORT MAP (
        in_data_in => bgTrunc_i_inc780_gmm_substract_sel_x_b,
        in_feedback_stall_in_8 => i_acl_pop_i32_k766_01845_pop8_gmm_substract_out_feedback_stall_out_8,
        in_keep_going2804 => redist2_i_acl_pipeline_keep_going2804_gmm_substract_out_data_out_1_q,
        in_stall_in => GND_q,
        in_valid_in => redist8_sync_in_aunroll_x_in_i_valid_1_q,
        out_feedback_out_8 => i_acl_push_i32_k766_01845_push8_gmm_substract_out_feedback_out_8,
        out_feedback_valid_out_8 => i_acl_push_i32_k766_01845_push8_gmm_substract_out_feedback_valid_out_8,
        clock => clock,
        resetn => resetn
    );

    -- c_i32_1gr(CONSTANT,45)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- i_acl_pop_i32_k766_01845_pop8_gmm_substract(BLACKBOX,56)@1
    -- out out_feedback_stall_out_8@20000000
    thei_acl_pop_i32_k766_01845_pop8_gmm_substract : i_acl_pop_i32_k766_01845_pop8_gmm_substract2639
    PORT MAP (
        in_data_in => c_i32_1gr_q,
        in_dir => in_c0_eni22824_1,
        in_feedback_in_8 => i_acl_push_i32_k766_01845_push8_gmm_substract_out_feedback_out_8,
        in_feedback_valid_in_8 => i_acl_push_i32_k766_01845_push8_gmm_substract_out_feedback_valid_out_8,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i32_k766_01845_pop8_gmm_substract_out_data_out,
        out_feedback_stall_out_8 => i_acl_pop_i32_k766_01845_pop8_gmm_substract_out_feedback_stall_out_8,
        clock => clock,
        resetn => resetn
    );

    -- redist0_i_acl_pop_i32_k766_01845_pop8_gmm_substract_out_data_out_1(DELAY,146)
    redist0_i_acl_pop_i32_k766_01845_pop8_gmm_substract_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i32_k766_01845_pop8_gmm_substract_out_data_out, xout => redist0_i_acl_pop_i32_k766_01845_pop8_gmm_substract_out_data_out_1_q, clk => clock, aclr => resetn );

    -- redist1_i_acl_pop_i32_k766_01845_pop8_gmm_substract_out_data_out_3(DELAY,147)
    redist1_i_acl_pop_i32_k766_01845_pop8_gmm_substract_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist0_i_acl_pop_i32_k766_01845_pop8_gmm_substract_out_data_out_1_q, xout => redist1_i_acl_pop_i32_k766_01845_pop8_gmm_substract_out_data_out_3_q, clk => clock, aclr => resetn );

    -- i_acl_push_i32_b_01846_push7_gmm_substract(BLACKBOX,63)@4
    -- out out_feedback_out_7@20000000
    -- out out_feedback_valid_out_7@20000000
    thei_acl_push_i32_b_01846_push7_gmm_substract : i_acl_push_i32_b_01846_push7_gmm_substract2641
    PORT MAP (
        in_data_in => i_b_1_gmm_substract_q,
        in_feedback_stall_in_7 => i_acl_pop_i32_b_01846_pop7_gmm_substract_out_feedback_stall_out_7,
        in_keep_going2804 => redist4_i_acl_pipeline_keep_going2804_gmm_substract_out_data_out_3_q,
        in_stall_in => GND_q,
        in_valid_in => redist10_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_7 => i_acl_push_i32_b_01846_push7_gmm_substract_out_feedback_out_7,
        out_feedback_valid_out_7 => i_acl_push_i32_b_01846_push7_gmm_substract_out_feedback_valid_out_7,
        clock => clock,
        resetn => resetn
    );

    -- redist6_sync_in_aunroll_x_in_c0_eni22824_1_2(DELAY,152)
    redist6_sync_in_aunroll_x_in_c0_eni22824_1_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist5_sync_in_aunroll_x_in_c0_eni22824_1_1_q, xout => redist6_sync_in_aunroll_x_in_c0_eni22824_1_2_q, clk => clock, aclr => resetn );

    -- redist7_sync_in_aunroll_x_in_c0_eni22824_1_3(DELAY,153)
    redist7_sync_in_aunroll_x_in_c0_eni22824_1_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist6_sync_in_aunroll_x_in_c0_eni22824_1_2_q, xout => redist7_sync_in_aunroll_x_in_c0_eni22824_1_3_q, clk => clock, aclr => resetn );

    -- c_i32_0gr(CONSTANT,44)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- i_acl_pop_i32_b_01846_pop7_gmm_substract(BLACKBOX,55)@4
    -- out out_feedback_stall_out_7@20000000
    thei_acl_pop_i32_b_01846_pop7_gmm_substract : i_acl_pop_i32_b_01846_pop7_gmm_substract2637
    PORT MAP (
        in_data_in => c_i32_0gr_q,
        in_dir => redist7_sync_in_aunroll_x_in_c0_eni22824_1_3_q,
        in_feedback_in_7 => i_acl_push_i32_b_01846_push7_gmm_substract_out_feedback_out_7,
        in_feedback_valid_in_7 => i_acl_push_i32_b_01846_push7_gmm_substract_out_feedback_valid_out_7,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist10_sync_in_aunroll_x_in_i_valid_3_q,
        out_data_out => i_acl_pop_i32_b_01846_pop7_gmm_substract_out_data_out,
        out_feedback_stall_out_7 => i_acl_pop_i32_b_01846_pop7_gmm_substract_out_feedback_stall_out_7,
        clock => clock,
        resetn => resetn
    );

    -- i_syncbuf_bg_th_sync_buffer_gmm_substract_aunroll_x(BLACKBOX,36)@0
    -- in in_i_dependence@4
    -- in in_valid_in@4
    -- out out_buffer_out_0@4
    -- out out_valid_out@4
    thei_syncbuf_bg_th_sync_buffer_gmm_substract_aunroll_x : i_syncbuf_bg_th_sync_buffer_gmm_substract2635
    PORT MAP (
        in_buffer_in_0 => in_bg_th_0,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist10_sync_in_aunroll_x_in_i_valid_3_q,
        out_buffer_out_0 => i_syncbuf_bg_th_sync_buffer_gmm_substract_aunroll_x_out_buffer_out_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_select6342756_gmm_substract(BLACKBOX,81)@3
    thei_ffwd_dst_select6342756_gmm_substract : i_ffwd_dst_select6342756_gmm_substract2631
    PORT MAP (
        in_intel_reserved_ffwd_71_0 => in_intel_reserved_ffwd_71_0,
        in_stall_in => GND_q,
        in_valid_in => redist9_sync_in_aunroll_x_in_i_valid_2_q,
        out_dest_data_out_71_0 => i_ffwd_dst_select6342756_gmm_substract_out_dest_data_out_71_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_select6222751_gmm_substract(BLACKBOX,79)@3
    thei_ffwd_dst_select6222751_gmm_substract : i_ffwd_dst_select6222751_gmm_substract2652
    PORT MAP (
        in_intel_reserved_ffwd_69_0 => in_intel_reserved_ffwd_69_0,
        in_stall_in => GND_q,
        in_valid_in => redist9_sync_in_aunroll_x_in_i_valid_2_q,
        out_dest_data_out_69_0 => i_ffwd_dst_select6222751_gmm_substract_out_dest_data_out_69_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_select6282754_gmm_substract(BLACKBOX,80)@3
    thei_ffwd_dst_select6282754_gmm_substract : i_ffwd_dst_select6282754_gmm_substract2647
    PORT MAP (
        in_intel_reserved_ffwd_70_0 => in_intel_reserved_ffwd_70_0,
        in_stall_in => GND_q,
        in_valid_in => redist9_sync_in_aunroll_x_in_i_valid_2_q,
        out_dest_data_out_70_0 => i_ffwd_dst_select6282754_gmm_substract_out_dest_data_out_70_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_select6342757_gmm_substract(BLACKBOX,82)@3
    thei_ffwd_dst_select6342757_gmm_substract : i_ffwd_dst_select6342757_gmm_substract2649
    PORT MAP (
        in_intel_reserved_ffwd_71_0 => in_intel_reserved_ffwd_71_0,
        in_stall_in => GND_q,
        in_valid_in => redist9_sync_in_aunroll_x_in_i_valid_2_q,
        out_dest_data_out_71_0 => i_ffwd_dst_select6342757_gmm_substract_out_dest_data_out_71_0,
        clock => clock,
        resetn => resetn
    );

    -- i_unnamed_gmm_substract2645(LOGICAL,105)@2 + 1
    i_unnamed_gmm_substract2645_qi <= "1" WHEN redist0_i_acl_pop_i32_k766_01845_pop8_gmm_substract_out_data_out_1_q = c_i32_1gr_q ELSE "0";
    i_unnamed_gmm_substract2645_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_gmm_substract2645_qi, xout => i_unnamed_gmm_substract2645_q, clk => clock, aclr => resetn );

    -- i_unnamed_gmm_substract2651(MUX,106)@3
    i_unnamed_gmm_substract2651_s <= i_unnamed_gmm_substract2645_q;
    i_unnamed_gmm_substract2651_combproc: PROCESS (i_unnamed_gmm_substract2651_s, i_ffwd_dst_select6342757_gmm_substract_out_dest_data_out_71_0, i_ffwd_dst_select6282754_gmm_substract_out_dest_data_out_70_0)
    BEGIN
        CASE (i_unnamed_gmm_substract2651_s) IS
            WHEN "0" => i_unnamed_gmm_substract2651_q <= i_ffwd_dst_select6342757_gmm_substract_out_dest_data_out_71_0;
            WHEN "1" => i_unnamed_gmm_substract2651_q <= i_ffwd_dst_select6282754_gmm_substract_out_dest_data_out_70_0;
            WHEN OTHERS => i_unnamed_gmm_substract2651_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- c_i32_2gr(CONSTANT,46)
    c_i32_2gr_q <= "00000000000000000000000000000010";

    -- i_unnamed_gmm_substract2643(LOGICAL,104)@2 + 1
    i_unnamed_gmm_substract2643_qi <= "1" WHEN redist0_i_acl_pop_i32_k766_01845_pop8_gmm_substract_out_data_out_1_q = c_i32_2gr_q ELSE "0";
    i_unnamed_gmm_substract2643_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_gmm_substract2643_qi, xout => i_unnamed_gmm_substract2643_q, clk => clock, aclr => resetn );

    -- i_unnamed_gmm_substract2654(MUX,107)@3 + 1
    i_unnamed_gmm_substract2654_s <= i_unnamed_gmm_substract2643_q;
    i_unnamed_gmm_substract2654_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_unnamed_gmm_substract2654_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_unnamed_gmm_substract2654_s) IS
                WHEN "0" => i_unnamed_gmm_substract2654_q <= i_unnamed_gmm_substract2651_q;
                WHEN "1" => i_unnamed_gmm_substract2654_q <= i_ffwd_dst_select6222751_gmm_substract_out_dest_data_out_69_0;
                WHEN OTHERS => i_unnamed_gmm_substract2654_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_add_i_i113_gmm_substract(ADD,69)@4
    i_add_i_i113_gmm_substract_a <= STD_LOGIC_VECTOR("0" & i_unnamed_gmm_substract2654_q);
    i_add_i_i113_gmm_substract_b <= STD_LOGIC_VECTOR("0" & i_b_w_sum_0_0_0_01844_replace_phi_gmm_substract_q);
    i_add_i_i113_gmm_substract_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add_i_i113_gmm_substract_a) + UNSIGNED(i_add_i_i113_gmm_substract_b));
    i_add_i_i113_gmm_substract_q <= i_add_i_i113_gmm_substract_o(8 downto 0);

    -- bgTrunc_i_add_i_i113_gmm_substract_sel_x(BITSELECT,2)@4
    bgTrunc_i_add_i_i113_gmm_substract_sel_x_b <= i_add_i_i113_gmm_substract_q(7 downto 0);

    -- i_acl_push_i8_b_w_sum_0_0_0_01844_push9_gmm_substract(BLACKBOX,68)@4
    -- out out_feedback_out_9@20000000
    -- out out_feedback_valid_out_9@20000000
    thei_acl_push_i8_b_w_sum_0_0_0_01844_push9_gmm_substract : i_acl_push_i8_b_w_sum_0_0_0_01844_push9_gmm_substract2655
    PORT MAP (
        in_data_in => bgTrunc_i_add_i_i113_gmm_substract_sel_x_b,
        in_feedback_stall_in_9 => i_acl_pop_i8_b_w_sum_0_0_0_01844_pop9_gmm_substract_out_feedback_stall_out_9,
        in_keep_going2804 => redist4_i_acl_pipeline_keep_going2804_gmm_substract_out_data_out_3_q,
        in_stall_in => GND_q,
        in_valid_in => redist10_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_9 => i_acl_push_i8_b_w_sum_0_0_0_01844_push9_gmm_substract_out_feedback_out_9,
        out_feedback_valid_out_9 => i_acl_push_i8_b_w_sum_0_0_0_01844_push9_gmm_substract_out_feedback_valid_out_9,
        clock => clock,
        resetn => resetn
    );

    -- c_i8_undef(CONSTANT,52)
    c_i8_undef_q <= "00000000";

    -- i_acl_pop_i8_b_w_sum_0_0_0_01844_pop9_gmm_substract(BLACKBOX,60)@3
    -- out out_feedback_stall_out_9@20000000
    thei_acl_pop_i8_b_w_sum_0_0_0_01844_pop9_gmm_substract : i_acl_pop_i8_b_w_sum_0_0_0_01844_pop9_gmm_substract2633
    PORT MAP (
        in_data_in => c_i8_undef_q,
        in_dir => redist6_sync_in_aunroll_x_in_c0_eni22824_1_2_q,
        in_feedback_in_9 => i_acl_push_i8_b_w_sum_0_0_0_01844_push9_gmm_substract_out_feedback_out_9,
        in_feedback_valid_in_9 => i_acl_push_i8_b_w_sum_0_0_0_01844_push9_gmm_substract_out_feedback_valid_out_9,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist9_sync_in_aunroll_x_in_i_valid_2_q,
        out_data_out => i_acl_pop_i8_b_w_sum_0_0_0_01844_pop9_gmm_substract_out_data_out,
        out_feedback_stall_out_9 => i_acl_pop_i8_b_w_sum_0_0_0_01844_pop9_gmm_substract_out_feedback_stall_out_9,
        clock => clock,
        resetn => resetn
    );

    -- i_b_w_sum_0_0_0_01844_replace_phi_gmm_substract(MUX,71)@3 + 1
    i_b_w_sum_0_0_0_01844_replace_phi_gmm_substract_s <= redist6_sync_in_aunroll_x_in_c0_eni22824_1_2_q;
    i_b_w_sum_0_0_0_01844_replace_phi_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_b_w_sum_0_0_0_01844_replace_phi_gmm_substract_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_b_w_sum_0_0_0_01844_replace_phi_gmm_substract_s) IS
                WHEN "0" => i_b_w_sum_0_0_0_01844_replace_phi_gmm_substract_q <= i_acl_pop_i8_b_w_sum_0_0_0_01844_pop9_gmm_substract_out_data_out;
                WHEN "1" => i_b_w_sum_0_0_0_01844_replace_phi_gmm_substract_q <= i_ffwd_dst_select6342756_gmm_substract_out_dest_data_out_71_0;
                WHEN OTHERS => i_b_w_sum_0_0_0_01844_replace_phi_gmm_substract_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_cmp_i_i119_gmm_substract(COMPARE,76)@4
    i_cmp_i_i119_gmm_substract_a <= STD_LOGIC_VECTOR("00" & i_b_w_sum_0_0_0_01844_replace_phi_gmm_substract_q);
    i_cmp_i_i119_gmm_substract_b <= STD_LOGIC_VECTOR("00" & i_syncbuf_bg_th_sync_buffer_gmm_substract_aunroll_x_out_buffer_out_0);
    i_cmp_i_i119_gmm_substract_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i119_gmm_substract_a) - UNSIGNED(i_cmp_i_i119_gmm_substract_b));
    i_cmp_i_i119_gmm_substract_c(0) <= i_cmp_i_i119_gmm_substract_o(9);

    -- i_b_1_gmm_substract(MUX,70)@4
    i_b_1_gmm_substract_s <= i_cmp_i_i119_gmm_substract_c;
    i_b_1_gmm_substract_combproc: PROCESS (i_b_1_gmm_substract_s, i_acl_pop_i32_b_01846_pop7_gmm_substract_out_data_out, redist1_i_acl_pop_i32_k766_01845_pop8_gmm_substract_out_data_out_3_q)
    BEGIN
        CASE (i_b_1_gmm_substract_s) IS
            WHEN "0" => i_b_1_gmm_substract_q <= i_acl_pop_i32_b_01846_pop7_gmm_substract_out_data_out;
            WHEN "1" => i_b_1_gmm_substract_q <= redist1_i_acl_pop_i32_k766_01845_pop8_gmm_substract_out_data_out_3_q;
            WHEN OTHERS => i_b_1_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- c_i4_1gr(CONSTANT,50)
    c_i4_1gr_q <= "0001";

    -- leftShiftStage0Idx1Rng1_uid127_i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_x(BITSELECT,126)@4
    leftShiftStage0Idx1Rng1_uid127_i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_x_in <= i_acl_pop_i4_cleanups2807_pop11_gmm_substract_out_data_out(2 downto 0);
    leftShiftStage0Idx1Rng1_uid127_i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_x_b <= leftShiftStage0Idx1Rng1_uid127_i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_x_in(2 downto 0);

    -- leftShiftStage0Idx1_uid128_i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_x(BITJOIN,127)@4
    leftShiftStage0Idx1_uid128_i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_x_q <= leftShiftStage0Idx1Rng1_uid127_i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_x_b & GND_q;

    -- i_xor2810_gmm_substract(LOGICAL,109)@4
    i_xor2810_gmm_substract_q <= i_first_cleanup2809_gmm_substract_q xor VCC_q;

    -- i_notcmp_gmm_substract(LOGICAL,94)@4
    i_notcmp_gmm_substract_q <= i_unnamed_gmm_substract2664_q xor VCC_q;

    -- i_or2811_gmm_substract(LOGICAL,95)@4
    i_or2811_gmm_substract_q <= i_notcmp_gmm_substract_q or i_xor2810_gmm_substract_q;

    -- i_cleanups_shl2808_gmm_substract_sel_x(BITSELECT,27)@4
    i_cleanups_shl2808_gmm_substract_sel_x_b <= std_logic_vector(resize(unsigned(i_or2811_gmm_substract_q(0 downto 0)), 4));

    -- i_cleanups_shl2808_gmm_substract_vt_select_0(BITSELECT,75)@4
    i_cleanups_shl2808_gmm_substract_vt_select_0_b <= i_cleanups_shl2808_gmm_substract_sel_x_b(0 downto 0);

    -- i_cleanups_shl2808_gmm_substract_vt_join(BITJOIN,74)@4
    i_cleanups_shl2808_gmm_substract_vt_join_q <= i_cleanups_shl2808_gmm_substract_vt_const_3_q & i_cleanups_shl2808_gmm_substract_vt_select_0_b;

    -- i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_narrow_x(BITSELECT,31)@4
    i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_narrow_x_b <= i_cleanups_shl2808_gmm_substract_vt_join_q(1 downto 0);

    -- leftShiftStageSel0Dto0_uid129_i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_x(BITSELECT,128)@4
    leftShiftStageSel0Dto0_uid129_i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_x_in <= i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_narrow_x_b(0 downto 0);
    leftShiftStageSel0Dto0_uid129_i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_x_b <= leftShiftStageSel0Dto0_uid129_i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_x_in(0 downto 0);

    -- leftShiftStage0_uid130_i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_x(MUX,129)@4
    leftShiftStage0_uid130_i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_x_s <= leftShiftStageSel0Dto0_uid129_i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_x_b;
    leftShiftStage0_uid130_i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_x_combproc: PROCESS (leftShiftStage0_uid130_i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_x_s, i_acl_pop_i4_cleanups2807_pop11_gmm_substract_out_data_out, leftShiftStage0Idx1_uid128_i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid130_i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid130_i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_x_q <= i_acl_pop_i4_cleanups2807_pop11_gmm_substract_out_data_out;
            WHEN "1" => leftShiftStage0_uid130_i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_x_q <= leftShiftStage0Idx1_uid128_i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid130_i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i4_cleanups2807_push11_gmm_substract(BLACKBOX,66)@4
    -- out out_feedback_out_11@20000000
    -- out out_feedback_valid_out_11@20000000
    thei_acl_push_i4_cleanups2807_push11_gmm_substract : i_acl_push_i4_cleanups2807_push11_gmm_substract2668
    PORT MAP (
        in_data_in => leftShiftStage0_uid130_i_next_cleanups2812_gmm_substract_gmm_substract2667_shift_x_q,
        in_feedback_stall_in_11 => i_acl_pop_i4_cleanups2807_pop11_gmm_substract_out_feedback_stall_out_11,
        in_keep_going2804 => redist4_i_acl_pipeline_keep_going2804_gmm_substract_out_data_out_3_q,
        in_stall_in => GND_q,
        in_valid_in => redist10_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_11 => i_acl_push_i4_cleanups2807_push11_gmm_substract_out_feedback_out_11,
        out_feedback_valid_out_11 => i_acl_push_i4_cleanups2807_push11_gmm_substract_out_feedback_valid_out_11,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i4_cleanups2807_pop11_gmm_substract(BLACKBOX,58)@4
    -- out out_feedback_stall_out_11@20000000
    thei_acl_pop_i4_cleanups2807_pop11_gmm_substract : i_acl_pop_i4_cleanups2807_pop11_gmm_substract2612
    PORT MAP (
        in_data_in => c_i4_7gr_q,
        in_dir => redist7_sync_in_aunroll_x_in_c0_eni22824_1_3_q,
        in_feedback_in_11 => i_acl_push_i4_cleanups2807_push11_gmm_substract_out_feedback_out_11,
        in_feedback_valid_in_11 => i_acl_push_i4_cleanups2807_push11_gmm_substract_out_feedback_valid_out_11,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist10_sync_in_aunroll_x_in_i_valid_3_q,
        out_data_out => i_acl_pop_i4_cleanups2807_pop11_gmm_substract_out_data_out,
        out_feedback_stall_out_11 => i_acl_pop_i4_cleanups2807_pop11_gmm_substract_out_feedback_stall_out_11,
        clock => clock,
        resetn => resetn
    );

    -- i_unnamed_gmm_substract2614(LOGICAL,96)@4
    i_unnamed_gmm_substract2614_q <= i_acl_pop_i4_cleanups2807_pop11_gmm_substract_out_data_out and c_i4_1gr_q;

    -- i_unnamed_gmm_substract2614_vt_select_0(BITSELECT,99)@4
    i_unnamed_gmm_substract2614_vt_select_0_b <= i_unnamed_gmm_substract2614_q(0 downto 0);

    -- i_unnamed_gmm_substract2614_vt_join(BITJOIN,98)@4
    i_unnamed_gmm_substract2614_vt_join_q <= i_cleanups_shl2808_gmm_substract_vt_const_3_q & i_unnamed_gmm_substract2614_vt_select_0_b;

    -- i_first_cleanup2809_gmm_substract(LOGICAL,85)@4
    i_first_cleanup2809_gmm_substract_q <= "1" WHEN i_unnamed_gmm_substract2614_vt_join_q /= c_i4_0gr_q ELSE "0";

    -- i_ffwd_src_unnamed_gmm_substract98_gmm_substract(BLACKBOX,84)@4
    -- out out_intel_reserved_ffwd_92_0@20000000
    thei_ffwd_src_unnamed_gmm_substract98_gmm_substract : i_ffwd_src_unnamed_gmm_substract98_gmm_substract2670
    PORT MAP (
        in_enable_in => i_first_cleanup2809_gmm_substract_q,
        in_src_data_in_92_0 => i_b_1_gmm_substract_q,
        in_stall_in => GND_q,
        in_valid_in => redist10_sync_in_aunroll_x_in_i_valid_3_q,
        out_intel_reserved_ffwd_92_0 => i_ffwd_src_unnamed_gmm_substract98_gmm_substract_out_intel_reserved_ffwd_92_0,
        clock => clock,
        resetn => resetn
    );

    -- i_masked2813_gmm_substract(LOGICAL,90)@4
    i_masked2813_gmm_substract_q <= i_first_cleanup2809_gmm_substract_q and i_notcmp_gmm_substract_q;

    -- redist4_i_acl_pipeline_keep_going2804_gmm_substract_out_data_out_3(DELAY,150)
    redist4_i_acl_pipeline_keep_going2804_gmm_substract_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist3_i_acl_pipeline_keep_going2804_gmm_substract_out_data_out_2_q, xout => redist4_i_acl_pipeline_keep_going2804_gmm_substract_out_data_out_3_q, clk => clock, aclr => resetn );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,38)@4
    out_c0_exi22829_0 <= GND_q;
    out_c0_exi22829_1 <= redist4_i_acl_pipeline_keep_going2804_gmm_substract_out_data_out_3_q;
    out_c0_exi22829_2 <= i_masked2813_gmm_substract_q;
    out_intel_reserved_ffwd_92_0 <= i_ffwd_src_unnamed_gmm_substract98_gmm_substract_out_intel_reserved_ffwd_92_0;
    out_o_valid <= redist10_sync_in_aunroll_x_in_i_valid_3_q;

    -- ext_sig_sync_out(GPOUT,53)
    out_aclp_to_limiter_i_acl_pipeline_keep_going2804_gmm_substract_exiting_valid_out <= i_acl_pipeline_keep_going2804_gmm_substract_out_exiting_valid_out;
    out_aclp_to_limiter_i_acl_pipeline_keep_going2804_gmm_substract_exiting_stall_out <= i_acl_pipeline_keep_going2804_gmm_substract_out_exiting_stall_out;

    -- pipeline_valid_out_sync(GPOUT,116)
    out_pipeline_valid_out <= i_acl_pipeline_keep_going2804_gmm_substract_out_pipeline_valid_out;

END normal;
