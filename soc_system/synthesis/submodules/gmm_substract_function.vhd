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

-- VHDL created from gmm_substract_function
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

entity gmm_substract_function is
    port (
        in_arg_bg_th_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_arg_d_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_arg_in_alpha_0 : in std_logic_vector(9 downto 0);  -- ufix10
        in_arg_s_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_arg_do : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_return : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_snk : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_src : in std_logic_vector(63 downto 0);  -- ufix64
        in_iord_bl_do_i_fifodata : in std_logic_vector(0 downto 0);  -- ufix1
        in_iord_bl_do_i_fifovalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_iord_bl_snk_i_fifodata : in std_logic_vector(175 downto 0);  -- ufix176
        in_iord_bl_snk_i_fifovalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_iowr_bl_src_i_fifoready : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_iord_bl_do_o_fifoready : out std_logic_vector(0 downto 0);  -- ufix1
        out_iord_bl_snk_o_fifoready : out std_logic_vector(0 downto 0);  -- ufix1
        out_iowr_bl_src_o_fifodata : out std_logic_vector(175 downto 0);  -- ufix176
        out_iowr_bl_src_o_fifovalid : out std_logic_vector(0 downto 0);  -- ufix1
        out_iowr_nb_return_o_fifodata : out std_logic_vector(0 downto 0);  -- ufix1
        out_iowr_nb_return_o_fifovalid : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end gmm_substract_function;

architecture normal of gmm_substract_function is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_gmm_substract_B0_runOnce is
        port (
            in_bg_th_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_d_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_in_alpha_0 : in std_logic_vector(9 downto 0);  -- Fixed Point
            in_s_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gmm_substract_B1_start is
        port (
            in_bg_th_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_d_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_in_alpha_0 : in std_logic_vector(9 downto 0);  -- Fixed Point
            in_s_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_in_1 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_iord_bl_do_i_fifodata : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_iord_bl_do_i_fifovalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_iord_bl_snk_i_fifodata : in std_logic_vector(175 downto 0);  -- Fixed Point
            in_iord_bl_snk_i_fifovalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gmm_substract_B1_start_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gmm_substract_B1_start_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gmm_substract_B2 is
        port (
            in_bg_th_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_d_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_in_alpha_0 : in std_logic_vector(9 downto 0);  -- Fixed Point
            in_s_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_31_0 : in std_logic_vector(1 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_33_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_35_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_36_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_38_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_39_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_40_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_41_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_42_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_43_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_44_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_45_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_46_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_47_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_48_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_49_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_50_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_51_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_52_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_53_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_54_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_73_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_74_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_75_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_76_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_77_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_78_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_79_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_80_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_81_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_82_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_83_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_84_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_85_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_86_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_87_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_88_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_89_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_90_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_91_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_56_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_57_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_58_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_59_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_60_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_61_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_62_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_63_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_64_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_65_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_66_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_67_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_68_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_69_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_70_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_71_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_72_0 : out std_logic_vector(33 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gmm_substract_B2_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gmm_substract_B3 is
        port (
            in_bg_th_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_d_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_in_alpha_0 : in std_logic_vector(9 downto 0);  -- Fixed Point
            in_s_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_forked2782_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked2782_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gmm_substract_B3_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gmm_substract_B4 is
        port (
            in_bg_th_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_d_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_in_alpha_0 : in std_logic_vector(9 downto 0);  -- Fixed Point
            in_s_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_forked2755_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked2755_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked2801_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked2801_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_35_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_69_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_70_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_71_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_72_0 : in std_logic_vector(33 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_92_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gmm_substract_B4_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gmm_substract_B5 is
        port (
            in_bg_th_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_d_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_in_alpha_0 : in std_logic_vector(9 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_15_0_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_15_0_1 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_15_0_2 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_16_0_0 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_s_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
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
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_1 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_iowr_bl_src_o_fifodata : out std_logic_vector(175 downto 0);  -- Fixed Point
            out_iowr_bl_src_o_fifovalid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_iowr_nb_return_o_fifodata : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_iowr_nb_return_o_fifovalid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gmm_substract_B5_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pipeline_keep_going2804_gmm_substract_sr is
        port (
            in_i_data : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pipeline_keep_going2804_gmm_substract_valid_fifo is
        port (
            in_data_in : in std_logic_vector(1 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(1 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pipeline_keep_going_gmm_substract_sr is
        port (
            in_i_data : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pipeline_keep_going_gmm_substract_valid_fifo is
        port (
            in_data_in : in std_logic_vector(1 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(1 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component loop_limiter_gmm_substract0 is
        port (
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component loop_limiter_gmm_substract1 is
        port (
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B0_runOnce_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B0_runOnce_aunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_15_0_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_15_0_1 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_15_0_2 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_16_0_0 : STD_LOGIC_VECTOR (5 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_feedback_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_0_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_10_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_11_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_12_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_13_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_14_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_17_0 : STD_LOGIC_VECTOR (19 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_18_0 : STD_LOGIC_VECTOR (19 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_19_0 : STD_LOGIC_VECTOR (19 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_1_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_20_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_21_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_22_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_23_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_24_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_25_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_26_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_27_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_28_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_29_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_2_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_30_0 : STD_LOGIC_VECTOR (5 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_31_0 : STD_LOGIC_VECTOR (1 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_32_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_33_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_34_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_35_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_36_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_37_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_38_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_39_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_3_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_40_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_41_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_42_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_43_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_44_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_45_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_46_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_47_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_48_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_49_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_4_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_50_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_51_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_52_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_53_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_54_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_55_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_5_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_6_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_7_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_8_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_9_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_iord_bl_do_o_fifoready : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_iord_bl_snk_o_fifoready : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B1_start_aunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B1_start_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B1_start_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B1_start_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B1_start_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_56_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_57_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_58_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_59_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_60_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_61_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_62_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_63_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_64_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_65_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_66_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_67_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_68_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_69_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_70_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_71_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_72_0 : STD_LOGIC_VECTOR (33 downto 0);
    signal bb_gmm_substract_B2_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B2_aunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B2_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B2_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B3_aunroll_x_out_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B3_aunroll_x_out_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_73_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_74_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_75_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_76_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_77_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_78_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_79_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_80_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_81_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_82_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_83_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_84_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_85_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_86_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_87_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_88_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_89_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_90_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_91_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B3_aunroll_x_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B3_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B3_aunroll_x_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B3_aunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B3_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B3_sr_1_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B3_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B3_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B4_aunroll_x_out_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B4_aunroll_x_out_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B4_aunroll_x_out_intel_reserved_ffwd_92_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gmm_substract_B4_aunroll_x_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B4_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B4_aunroll_x_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B4_aunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B4_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B4_sr_1_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B4_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B4_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B5_aunroll_x_out_feedback_out_1 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B5_aunroll_x_out_feedback_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B5_aunroll_x_out_iowr_bl_src_o_fifodata : STD_LOGIC_VECTOR (175 downto 0);
    signal bb_gmm_substract_B5_aunroll_x_out_iowr_bl_src_o_fifovalid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B5_aunroll_x_out_iowr_nb_return_o_fifodata : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B5_aunroll_x_out_iowr_nb_return_o_fifovalid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B5_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B5_aunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B5_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B5_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_c_i2_0gr_x_q : STD_LOGIC_VECTOR (1 downto 0);
    signal i_acl_pipeline_keep_going2804_gmm_substract_sr_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going2804_gmm_substract_sr_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going2804_gmm_substract_valid_fifo_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going2804_gmm_substract_valid_fifo_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_gmm_substract_sr_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_gmm_substract_sr_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_gmm_substract_valid_fifo_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_gmm_substract_valid_fifo_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_gmm_substract0_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_gmm_substract0_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_gmm_substract1_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_gmm_substract1_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- bb_gmm_substract_B0_runOnce_aunroll_x(BLACKBOX,2)
    thebb_gmm_substract_B0_runOnce_aunroll_x : bb_gmm_substract_B0_runOnce
    PORT MAP (
        in_bg_th_0 => in_arg_bg_th_0,
        in_d_0 => in_arg_d_0,
        in_in_alpha_0 => in_arg_in_alpha_0,
        in_s_0 => in_arg_s_0,
        in_stall_in_0 => bb_gmm_substract_B1_start_sr_1_aunroll_x_out_o_stall,
        in_valid_in_0 => in_valid_in,
        out_stall_out_0 => bb_gmm_substract_B0_runOnce_aunroll_x_out_stall_out_0,
        out_valid_out_0 => bb_gmm_substract_B0_runOnce_aunroll_x_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- bb_gmm_substract_B1_start_sr_1_aunroll_x(BLACKBOX,5)
    thebb_gmm_substract_B1_start_sr_1_aunroll_x : bb_gmm_substract_B1_start_sr_1
    PORT MAP (
        in_i_data_0 => GND_q,
        in_i_stall => bb_gmm_substract_B1_start_aunroll_x_out_stall_out_1,
        in_i_valid => bb_gmm_substract_B0_runOnce_aunroll_x_out_valid_out_0,
        out_o_stall => bb_gmm_substract_B1_start_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_gmm_substract_B1_start_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_gmm_substract_B1_start_sr_0_aunroll_x(BLACKBOX,4)
    thebb_gmm_substract_B1_start_sr_0_aunroll_x : bb_gmm_substract_B1_start_sr_0
    PORT MAP (
        in_i_data_0 => GND_q,
        in_i_stall => bb_gmm_substract_B1_start_aunroll_x_out_stall_out_0,
        in_i_valid => bb_gmm_substract_B5_aunroll_x_out_valid_out_0,
        out_o_stall => bb_gmm_substract_B1_start_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_gmm_substract_B1_start_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_c_i2_0gr_x(CONSTANT,16)
    dupName_0_c_i2_0gr_x_q <= "00";

    -- i_acl_pipeline_keep_going_gmm_substract_valid_fifo(BLACKBOX,51)
    thei_acl_pipeline_keep_going_gmm_substract_valid_fifo : i_acl_pipeline_keep_going_gmm_substract_valid_fifo
    PORT MAP (
        in_data_in => dupName_0_c_i2_0gr_x_q,
        in_stall_in => bb_gmm_substract_B3_aunroll_x_out_stall_out_0,
        in_valid_in => i_acl_pipeline_keep_going_gmm_substract_sr_out_o_valid,
        out_stall_out => i_acl_pipeline_keep_going_gmm_substract_valid_fifo_out_stall_out,
        out_valid_out => i_acl_pipeline_keep_going_gmm_substract_valid_fifo_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pipeline_keep_going2804_gmm_substract_valid_fifo(BLACKBOX,49)
    thei_acl_pipeline_keep_going2804_gmm_substract_valid_fifo : i_acl_pipeline_keep_going2804_gmm_substract_valid_fifo
    PORT MAP (
        in_data_in => dupName_0_c_i2_0gr_x_q,
        in_stall_in => bb_gmm_substract_B4_aunroll_x_out_stall_out_0,
        in_valid_in => i_acl_pipeline_keep_going2804_gmm_substract_sr_out_o_valid,
        out_stall_out => i_acl_pipeline_keep_going2804_gmm_substract_valid_fifo_out_stall_out,
        out_valid_out => i_acl_pipeline_keep_going2804_gmm_substract_valid_fifo_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_gmm_substract_B5_sr_0_aunroll_x(BLACKBOX,13)
    thebb_gmm_substract_B5_sr_0_aunroll_x : bb_gmm_substract_B5_sr_0
    PORT MAP (
        in_i_data_0 => GND_q,
        in_i_stall => bb_gmm_substract_B5_aunroll_x_out_stall_out_0,
        in_i_valid => bb_gmm_substract_B4_aunroll_x_out_valid_out_0,
        out_o_stall => bb_gmm_substract_B5_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_gmm_substract_B5_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pipeline_keep_going2804_gmm_substract_sr(BLACKBOX,48)
    thei_acl_pipeline_keep_going2804_gmm_substract_sr : i_acl_pipeline_keep_going2804_gmm_substract_sr
    PORT MAP (
        in_i_data => GND_q,
        in_i_stall => i_acl_pipeline_keep_going2804_gmm_substract_valid_fifo_out_stall_out,
        in_i_valid => bb_gmm_substract_B4_aunroll_x_out_pipeline_valid_out,
        out_o_stall => i_acl_pipeline_keep_going2804_gmm_substract_sr_out_o_stall,
        out_o_valid => i_acl_pipeline_keep_going2804_gmm_substract_sr_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_gmm_substract_B4_aunroll_x(BLACKBOX,10)
    thebb_gmm_substract_B4_aunroll_x : bb_gmm_substract_B4
    PORT MAP (
        in_bg_th_0 => in_arg_bg_th_0,
        in_d_0 => in_arg_d_0,
        in_in_alpha_0 => in_arg_in_alpha_0,
        in_s_0 => in_arg_s_0,
        in_forked2755_0 => GND_q,
        in_forked2755_1 => bb_gmm_substract_B4_sr_1_aunroll_x_out_o_data_0,
        in_forked2801_0 => GND_q,
        in_forked2801_1 => bb_gmm_substract_B4_sr_1_aunroll_x_out_o_data_1,
        in_intel_reserved_ffwd_35_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_35_0,
        in_intel_reserved_ffwd_69_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_69_0,
        in_intel_reserved_ffwd_70_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_70_0,
        in_intel_reserved_ffwd_71_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_71_0,
        in_intel_reserved_ffwd_72_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_72_0,
        in_pipeline_stall_in => i_acl_pipeline_keep_going2804_gmm_substract_sr_out_o_stall,
        in_stall_in_0 => bb_gmm_substract_B5_sr_0_aunroll_x_out_o_stall,
        in_stall_in_1 => GND_q,
        in_valid_in_0 => i_acl_pipeline_keep_going2804_gmm_substract_valid_fifo_out_valid_out,
        in_valid_in_1 => bb_gmm_substract_B4_sr_1_aunroll_x_out_o_valid,
        out_exiting_stall_out => bb_gmm_substract_B4_aunroll_x_out_exiting_stall_out,
        out_exiting_valid_out => bb_gmm_substract_B4_aunroll_x_out_exiting_valid_out,
        out_intel_reserved_ffwd_92_0 => bb_gmm_substract_B4_aunroll_x_out_intel_reserved_ffwd_92_0,
        out_pipeline_valid_out => bb_gmm_substract_B4_aunroll_x_out_pipeline_valid_out,
        out_stall_out_0 => bb_gmm_substract_B4_aunroll_x_out_stall_out_0,
        out_stall_out_1 => bb_gmm_substract_B4_aunroll_x_out_stall_out_1,
        out_valid_out_0 => bb_gmm_substract_B4_aunroll_x_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- bb_gmm_substract_B4_sr_1_aunroll_x(BLACKBOX,11)
    thebb_gmm_substract_B4_sr_1_aunroll_x : bb_gmm_substract_B4_sr_1
    PORT MAP (
        in_i_data_0 => VCC_q,
        in_i_data_1 => VCC_q,
        in_i_stall => bb_gmm_substract_B4_aunroll_x_out_stall_out_1,
        in_i_valid => loop_limiter_gmm_substract0_out_o_valid,
        out_o_data_0 => bb_gmm_substract_B4_sr_1_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_gmm_substract_B4_sr_1_aunroll_x_out_o_data_1,
        out_o_stall => bb_gmm_substract_B4_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_gmm_substract_B4_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- loop_limiter_gmm_substract0(BLACKBOX,52)
    theloop_limiter_gmm_substract0 : loop_limiter_gmm_substract0
    PORT MAP (
        in_i_stall => bb_gmm_substract_B4_sr_1_aunroll_x_out_o_stall,
        in_i_stall_exit => bb_gmm_substract_B4_aunroll_x_out_exiting_stall_out,
        in_i_valid => bb_gmm_substract_B2_aunroll_x_out_valid_out_0,
        in_i_valid_exit => bb_gmm_substract_B4_aunroll_x_out_exiting_valid_out,
        out_o_stall => loop_limiter_gmm_substract0_out_o_stall,
        out_o_valid => loop_limiter_gmm_substract0_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_gmm_substract_B2_aunroll_x(BLACKBOX,6)
    thebb_gmm_substract_B2_aunroll_x : bb_gmm_substract_B2
    PORT MAP (
        in_bg_th_0 => in_arg_bg_th_0,
        in_d_0 => in_arg_d_0,
        in_in_alpha_0 => in_arg_in_alpha_0,
        in_s_0 => in_arg_s_0,
        in_intel_reserved_ffwd_31_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_31_0,
        in_intel_reserved_ffwd_33_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_33_0,
        in_intel_reserved_ffwd_35_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_35_0,
        in_intel_reserved_ffwd_36_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_36_0,
        in_intel_reserved_ffwd_38_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_38_0,
        in_intel_reserved_ffwd_39_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_39_0,
        in_intel_reserved_ffwd_40_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_40_0,
        in_intel_reserved_ffwd_41_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_41_0,
        in_intel_reserved_ffwd_42_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_42_0,
        in_intel_reserved_ffwd_43_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_43_0,
        in_intel_reserved_ffwd_44_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_44_0,
        in_intel_reserved_ffwd_45_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_45_0,
        in_intel_reserved_ffwd_46_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_46_0,
        in_intel_reserved_ffwd_47_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_47_0,
        in_intel_reserved_ffwd_48_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_48_0,
        in_intel_reserved_ffwd_49_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_49_0,
        in_intel_reserved_ffwd_50_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_50_0,
        in_intel_reserved_ffwd_51_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_51_0,
        in_intel_reserved_ffwd_52_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_52_0,
        in_intel_reserved_ffwd_53_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_53_0,
        in_intel_reserved_ffwd_54_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_54_0,
        in_intel_reserved_ffwd_73_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_73_0,
        in_intel_reserved_ffwd_74_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_74_0,
        in_intel_reserved_ffwd_75_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_75_0,
        in_intel_reserved_ffwd_76_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_76_0,
        in_intel_reserved_ffwd_77_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_77_0,
        in_intel_reserved_ffwd_78_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_78_0,
        in_intel_reserved_ffwd_79_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_79_0,
        in_intel_reserved_ffwd_80_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_80_0,
        in_intel_reserved_ffwd_81_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_81_0,
        in_intel_reserved_ffwd_82_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_82_0,
        in_intel_reserved_ffwd_83_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_83_0,
        in_intel_reserved_ffwd_84_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_84_0,
        in_intel_reserved_ffwd_85_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_85_0,
        in_intel_reserved_ffwd_86_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_86_0,
        in_intel_reserved_ffwd_87_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_87_0,
        in_intel_reserved_ffwd_88_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_88_0,
        in_intel_reserved_ffwd_89_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_89_0,
        in_intel_reserved_ffwd_90_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_90_0,
        in_intel_reserved_ffwd_91_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_91_0,
        in_stall_in_0 => loop_limiter_gmm_substract0_out_o_stall,
        in_valid_in_0 => bb_gmm_substract_B2_sr_0_aunroll_x_out_o_valid,
        out_intel_reserved_ffwd_56_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_56_0,
        out_intel_reserved_ffwd_57_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_57_0,
        out_intel_reserved_ffwd_58_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_58_0,
        out_intel_reserved_ffwd_59_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_59_0,
        out_intel_reserved_ffwd_60_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_60_0,
        out_intel_reserved_ffwd_61_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_61_0,
        out_intel_reserved_ffwd_62_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_62_0,
        out_intel_reserved_ffwd_63_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_63_0,
        out_intel_reserved_ffwd_64_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_64_0,
        out_intel_reserved_ffwd_65_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_65_0,
        out_intel_reserved_ffwd_66_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_66_0,
        out_intel_reserved_ffwd_67_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_67_0,
        out_intel_reserved_ffwd_68_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_68_0,
        out_intel_reserved_ffwd_69_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_69_0,
        out_intel_reserved_ffwd_70_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_70_0,
        out_intel_reserved_ffwd_71_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_71_0,
        out_intel_reserved_ffwd_72_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_72_0,
        out_stall_out_0 => bb_gmm_substract_B2_aunroll_x_out_stall_out_0,
        out_valid_out_0 => bb_gmm_substract_B2_aunroll_x_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_gmm_substract_B2_sr_0_aunroll_x(BLACKBOX,7)
    thebb_gmm_substract_B2_sr_0_aunroll_x : bb_gmm_substract_B2_sr_0
    PORT MAP (
        in_i_data_0 => GND_q,
        in_i_stall => bb_gmm_substract_B2_aunroll_x_out_stall_out_0,
        in_i_valid => bb_gmm_substract_B3_aunroll_x_out_valid_out_0,
        out_o_stall => bb_gmm_substract_B2_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_gmm_substract_B2_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pipeline_keep_going_gmm_substract_sr(BLACKBOX,50)
    thei_acl_pipeline_keep_going_gmm_substract_sr : i_acl_pipeline_keep_going_gmm_substract_sr
    PORT MAP (
        in_i_data => GND_q,
        in_i_stall => i_acl_pipeline_keep_going_gmm_substract_valid_fifo_out_stall_out,
        in_i_valid => bb_gmm_substract_B3_aunroll_x_out_pipeline_valid_out,
        out_o_stall => i_acl_pipeline_keep_going_gmm_substract_sr_out_o_stall,
        out_o_valid => i_acl_pipeline_keep_going_gmm_substract_sr_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_gmm_substract_B3_aunroll_x(BLACKBOX,8)
    thebb_gmm_substract_B3_aunroll_x : bb_gmm_substract_B3
    PORT MAP (
        in_bg_th_0 => in_arg_bg_th_0,
        in_d_0 => in_arg_d_0,
        in_in_alpha_0 => in_arg_in_alpha_0,
        in_s_0 => in_arg_s_0,
        in_forked2782_0 => GND_q,
        in_forked2782_1 => bb_gmm_substract_B3_sr_1_aunroll_x_out_o_data_1,
        in_forked_0 => GND_q,
        in_forked_1 => bb_gmm_substract_B3_sr_1_aunroll_x_out_o_data_0,
        in_intel_reserved_ffwd_20_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_20_0,
        in_intel_reserved_ffwd_21_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_21_0,
        in_intel_reserved_ffwd_22_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_22_0,
        in_intel_reserved_ffwd_23_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_23_0,
        in_intel_reserved_ffwd_24_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_24_0,
        in_intel_reserved_ffwd_25_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_25_0,
        in_intel_reserved_ffwd_26_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_26_0,
        in_intel_reserved_ffwd_27_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_27_0,
        in_intel_reserved_ffwd_28_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_28_0,
        in_intel_reserved_ffwd_33_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_33_0,
        in_intel_reserved_ffwd_36_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_36_0,
        in_intel_reserved_ffwd_38_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_38_0,
        in_intel_reserved_ffwd_39_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_39_0,
        in_intel_reserved_ffwd_40_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_40_0,
        in_intel_reserved_ffwd_41_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_41_0,
        in_intel_reserved_ffwd_51_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_51_0,
        in_intel_reserved_ffwd_52_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_52_0,
        in_intel_reserved_ffwd_54_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_54_0,
        in_intel_reserved_ffwd_55_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_55_0,
        in_pipeline_stall_in => i_acl_pipeline_keep_going_gmm_substract_sr_out_o_stall,
        in_stall_in_0 => bb_gmm_substract_B2_sr_0_aunroll_x_out_o_stall,
        in_stall_in_1 => GND_q,
        in_valid_in_0 => i_acl_pipeline_keep_going_gmm_substract_valid_fifo_out_valid_out,
        in_valid_in_1 => bb_gmm_substract_B3_sr_1_aunroll_x_out_o_valid,
        out_exiting_stall_out => bb_gmm_substract_B3_aunroll_x_out_exiting_stall_out,
        out_exiting_valid_out => bb_gmm_substract_B3_aunroll_x_out_exiting_valid_out,
        out_intel_reserved_ffwd_73_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_73_0,
        out_intel_reserved_ffwd_74_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_74_0,
        out_intel_reserved_ffwd_75_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_75_0,
        out_intel_reserved_ffwd_76_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_76_0,
        out_intel_reserved_ffwd_77_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_77_0,
        out_intel_reserved_ffwd_78_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_78_0,
        out_intel_reserved_ffwd_79_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_79_0,
        out_intel_reserved_ffwd_80_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_80_0,
        out_intel_reserved_ffwd_81_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_81_0,
        out_intel_reserved_ffwd_82_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_82_0,
        out_intel_reserved_ffwd_83_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_83_0,
        out_intel_reserved_ffwd_84_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_84_0,
        out_intel_reserved_ffwd_85_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_85_0,
        out_intel_reserved_ffwd_86_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_86_0,
        out_intel_reserved_ffwd_87_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_87_0,
        out_intel_reserved_ffwd_88_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_88_0,
        out_intel_reserved_ffwd_89_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_89_0,
        out_intel_reserved_ffwd_90_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_90_0,
        out_intel_reserved_ffwd_91_0 => bb_gmm_substract_B3_aunroll_x_out_intel_reserved_ffwd_91_0,
        out_pipeline_valid_out => bb_gmm_substract_B3_aunroll_x_out_pipeline_valid_out,
        out_stall_out_0 => bb_gmm_substract_B3_aunroll_x_out_stall_out_0,
        out_stall_out_1 => bb_gmm_substract_B3_aunroll_x_out_stall_out_1,
        out_valid_out_0 => bb_gmm_substract_B3_aunroll_x_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_gmm_substract_B3_sr_1_aunroll_x(BLACKBOX,9)
    thebb_gmm_substract_B3_sr_1_aunroll_x : bb_gmm_substract_B3_sr_1
    PORT MAP (
        in_i_data_0 => VCC_q,
        in_i_data_1 => VCC_q,
        in_i_stall => bb_gmm_substract_B3_aunroll_x_out_stall_out_1,
        in_i_valid => loop_limiter_gmm_substract1_out_o_valid,
        out_o_data_0 => bb_gmm_substract_B3_sr_1_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_gmm_substract_B3_sr_1_aunroll_x_out_o_data_1,
        out_o_stall => bb_gmm_substract_B3_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_gmm_substract_B3_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- loop_limiter_gmm_substract1(BLACKBOX,53)
    theloop_limiter_gmm_substract1 : loop_limiter_gmm_substract1
    PORT MAP (
        in_i_stall => bb_gmm_substract_B3_sr_1_aunroll_x_out_o_stall,
        in_i_stall_exit => bb_gmm_substract_B3_aunroll_x_out_exiting_stall_out,
        in_i_valid => bb_gmm_substract_B1_start_aunroll_x_out_valid_out_0,
        in_i_valid_exit => bb_gmm_substract_B3_aunroll_x_out_exiting_valid_out,
        out_o_stall => loop_limiter_gmm_substract1_out_o_stall,
        out_o_valid => loop_limiter_gmm_substract1_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_gmm_substract_B5_aunroll_x(BLACKBOX,12)
    thebb_gmm_substract_B5_aunroll_x : bb_gmm_substract_B5
    PORT MAP (
        in_bg_th_0 => in_arg_bg_th_0,
        in_d_0 => in_arg_d_0,
        in_in_alpha_0 => in_arg_in_alpha_0,
        in_intel_reserved_ffwd_15_0_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_15_0_0,
        in_intel_reserved_ffwd_15_0_1 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_15_0_1,
        in_intel_reserved_ffwd_15_0_2 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_15_0_2,
        in_intel_reserved_ffwd_16_0_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_16_0_0,
        in_s_0 => in_arg_s_0,
        in_feedback_stall_in_1 => bb_gmm_substract_B1_start_aunroll_x_out_feedback_stall_out_1,
        in_intel_reserved_ffwd_0_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_0_0,
        in_intel_reserved_ffwd_10_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_10_0,
        in_intel_reserved_ffwd_11_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_11_0,
        in_intel_reserved_ffwd_12_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_12_0,
        in_intel_reserved_ffwd_13_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_13_0,
        in_intel_reserved_ffwd_14_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_14_0,
        in_intel_reserved_ffwd_17_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_17_0,
        in_intel_reserved_ffwd_18_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_18_0,
        in_intel_reserved_ffwd_19_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_19_0,
        in_intel_reserved_ffwd_1_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_1_0,
        in_intel_reserved_ffwd_29_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_29_0,
        in_intel_reserved_ffwd_2_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_2_0,
        in_intel_reserved_ffwd_30_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_30_0,
        in_intel_reserved_ffwd_31_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_31_0,
        in_intel_reserved_ffwd_32_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_32_0,
        in_intel_reserved_ffwd_33_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_33_0,
        in_intel_reserved_ffwd_34_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_34_0,
        in_intel_reserved_ffwd_35_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_35_0,
        in_intel_reserved_ffwd_37_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_37_0,
        in_intel_reserved_ffwd_38_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_38_0,
        in_intel_reserved_ffwd_39_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_39_0,
        in_intel_reserved_ffwd_3_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_3_0,
        in_intel_reserved_ffwd_40_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_40_0,
        in_intel_reserved_ffwd_41_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_41_0,
        in_intel_reserved_ffwd_43_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_43_0,
        in_intel_reserved_ffwd_44_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_44_0,
        in_intel_reserved_ffwd_45_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_45_0,
        in_intel_reserved_ffwd_46_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_46_0,
        in_intel_reserved_ffwd_47_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_47_0,
        in_intel_reserved_ffwd_48_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_48_0,
        in_intel_reserved_ffwd_4_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_4_0,
        in_intel_reserved_ffwd_56_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_56_0,
        in_intel_reserved_ffwd_57_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_57_0,
        in_intel_reserved_ffwd_58_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_58_0,
        in_intel_reserved_ffwd_59_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_59_0,
        in_intel_reserved_ffwd_5_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_5_0,
        in_intel_reserved_ffwd_60_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_60_0,
        in_intel_reserved_ffwd_61_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_61_0,
        in_intel_reserved_ffwd_62_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_62_0,
        in_intel_reserved_ffwd_63_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_63_0,
        in_intel_reserved_ffwd_64_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_64_0,
        in_intel_reserved_ffwd_65_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_65_0,
        in_intel_reserved_ffwd_66_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_66_0,
        in_intel_reserved_ffwd_67_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_67_0,
        in_intel_reserved_ffwd_68_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_68_0,
        in_intel_reserved_ffwd_69_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_69_0,
        in_intel_reserved_ffwd_6_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_6_0,
        in_intel_reserved_ffwd_70_0 => bb_gmm_substract_B2_aunroll_x_out_intel_reserved_ffwd_70_0,
        in_intel_reserved_ffwd_7_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_7_0,
        in_intel_reserved_ffwd_8_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_8_0,
        in_intel_reserved_ffwd_92_0 => bb_gmm_substract_B4_aunroll_x_out_intel_reserved_ffwd_92_0,
        in_intel_reserved_ffwd_9_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_9_0,
        in_iowr_bl_src_i_fifoready => in_iowr_bl_src_i_fifoready,
        in_stall_in_0 => bb_gmm_substract_B1_start_sr_0_aunroll_x_out_o_stall,
        in_valid_in_0 => bb_gmm_substract_B5_sr_0_aunroll_x_out_o_valid,
        out_feedback_out_1 => bb_gmm_substract_B5_aunroll_x_out_feedback_out_1,
        out_feedback_valid_out_1 => bb_gmm_substract_B5_aunroll_x_out_feedback_valid_out_1,
        out_iowr_bl_src_o_fifodata => bb_gmm_substract_B5_aunroll_x_out_iowr_bl_src_o_fifodata,
        out_iowr_bl_src_o_fifovalid => bb_gmm_substract_B5_aunroll_x_out_iowr_bl_src_o_fifovalid,
        out_iowr_nb_return_o_fifodata => bb_gmm_substract_B5_aunroll_x_out_iowr_nb_return_o_fifodata,
        out_iowr_nb_return_o_fifovalid => bb_gmm_substract_B5_aunroll_x_out_iowr_nb_return_o_fifovalid,
        out_stall_out_0 => bb_gmm_substract_B5_aunroll_x_out_stall_out_0,
        out_valid_out_0 => bb_gmm_substract_B5_aunroll_x_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_gmm_substract_B1_start_aunroll_x(BLACKBOX,3)
    thebb_gmm_substract_B1_start_aunroll_x : bb_gmm_substract_B1_start
    PORT MAP (
        in_bg_th_0 => in_arg_bg_th_0,
        in_d_0 => in_arg_d_0,
        in_in_alpha_0 => in_arg_in_alpha_0,
        in_s_0 => in_arg_s_0,
        in_feedback_in_1 => bb_gmm_substract_B5_aunroll_x_out_feedback_out_1,
        in_feedback_valid_in_1 => bb_gmm_substract_B5_aunroll_x_out_feedback_valid_out_1,
        in_iord_bl_do_i_fifodata => in_iord_bl_do_i_fifodata,
        in_iord_bl_do_i_fifovalid => in_iord_bl_do_i_fifovalid,
        in_iord_bl_snk_i_fifodata => in_iord_bl_snk_i_fifodata,
        in_iord_bl_snk_i_fifovalid => in_iord_bl_snk_i_fifovalid,
        in_stall_in_0 => loop_limiter_gmm_substract1_out_o_stall,
        in_valid_in_0 => bb_gmm_substract_B1_start_sr_0_aunroll_x_out_o_valid,
        in_valid_in_1 => bb_gmm_substract_B1_start_sr_1_aunroll_x_out_o_valid,
        out_intel_reserved_ffwd_15_0_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_15_0_0,
        out_intel_reserved_ffwd_15_0_1 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_15_0_1,
        out_intel_reserved_ffwd_15_0_2 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_15_0_2,
        out_intel_reserved_ffwd_16_0_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_16_0_0,
        out_feedback_stall_out_1 => bb_gmm_substract_B1_start_aunroll_x_out_feedback_stall_out_1,
        out_intel_reserved_ffwd_0_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_0_0,
        out_intel_reserved_ffwd_10_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_10_0,
        out_intel_reserved_ffwd_11_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_11_0,
        out_intel_reserved_ffwd_12_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_12_0,
        out_intel_reserved_ffwd_13_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_13_0,
        out_intel_reserved_ffwd_14_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_14_0,
        out_intel_reserved_ffwd_17_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_17_0,
        out_intel_reserved_ffwd_18_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_18_0,
        out_intel_reserved_ffwd_19_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_19_0,
        out_intel_reserved_ffwd_1_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_1_0,
        out_intel_reserved_ffwd_20_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_20_0,
        out_intel_reserved_ffwd_21_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_21_0,
        out_intel_reserved_ffwd_22_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_22_0,
        out_intel_reserved_ffwd_23_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_23_0,
        out_intel_reserved_ffwd_24_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_24_0,
        out_intel_reserved_ffwd_25_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_25_0,
        out_intel_reserved_ffwd_26_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_26_0,
        out_intel_reserved_ffwd_27_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_27_0,
        out_intel_reserved_ffwd_28_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_28_0,
        out_intel_reserved_ffwd_29_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_29_0,
        out_intel_reserved_ffwd_2_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_2_0,
        out_intel_reserved_ffwd_30_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_30_0,
        out_intel_reserved_ffwd_31_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_31_0,
        out_intel_reserved_ffwd_32_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_32_0,
        out_intel_reserved_ffwd_33_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_33_0,
        out_intel_reserved_ffwd_34_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_34_0,
        out_intel_reserved_ffwd_35_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_35_0,
        out_intel_reserved_ffwd_36_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_36_0,
        out_intel_reserved_ffwd_37_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_37_0,
        out_intel_reserved_ffwd_38_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_38_0,
        out_intel_reserved_ffwd_39_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_39_0,
        out_intel_reserved_ffwd_3_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_3_0,
        out_intel_reserved_ffwd_40_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_40_0,
        out_intel_reserved_ffwd_41_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_41_0,
        out_intel_reserved_ffwd_42_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_42_0,
        out_intel_reserved_ffwd_43_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_43_0,
        out_intel_reserved_ffwd_44_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_44_0,
        out_intel_reserved_ffwd_45_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_45_0,
        out_intel_reserved_ffwd_46_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_46_0,
        out_intel_reserved_ffwd_47_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_47_0,
        out_intel_reserved_ffwd_48_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_48_0,
        out_intel_reserved_ffwd_49_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_49_0,
        out_intel_reserved_ffwd_4_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_4_0,
        out_intel_reserved_ffwd_50_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_50_0,
        out_intel_reserved_ffwd_51_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_51_0,
        out_intel_reserved_ffwd_52_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_52_0,
        out_intel_reserved_ffwd_53_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_53_0,
        out_intel_reserved_ffwd_54_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_54_0,
        out_intel_reserved_ffwd_55_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_55_0,
        out_intel_reserved_ffwd_5_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_5_0,
        out_intel_reserved_ffwd_6_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_6_0,
        out_intel_reserved_ffwd_7_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_7_0,
        out_intel_reserved_ffwd_8_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_8_0,
        out_intel_reserved_ffwd_9_0 => bb_gmm_substract_B1_start_aunroll_x_out_intel_reserved_ffwd_9_0,
        out_iord_bl_do_o_fifoready => bb_gmm_substract_B1_start_aunroll_x_out_iord_bl_do_o_fifoready,
        out_iord_bl_snk_o_fifoready => bb_gmm_substract_B1_start_aunroll_x_out_iord_bl_snk_o_fifoready,
        out_stall_out_0 => bb_gmm_substract_B1_start_aunroll_x_out_stall_out_0,
        out_stall_out_1 => bb_gmm_substract_B1_start_aunroll_x_out_stall_out_1,
        out_valid_out_0 => bb_gmm_substract_B1_start_aunroll_x_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- out_iord_bl_do_o_fifoready(GPOUT,54)
    out_iord_bl_do_o_fifoready <= bb_gmm_substract_B1_start_aunroll_x_out_iord_bl_do_o_fifoready;

    -- out_iord_bl_snk_o_fifoready(GPOUT,55)
    out_iord_bl_snk_o_fifoready <= bb_gmm_substract_B1_start_aunroll_x_out_iord_bl_snk_o_fifoready;

    -- out_iowr_bl_src_o_fifodata(GPOUT,56)
    out_iowr_bl_src_o_fifodata <= bb_gmm_substract_B5_aunroll_x_out_iowr_bl_src_o_fifodata;

    -- out_iowr_bl_src_o_fifovalid(GPOUT,57)
    out_iowr_bl_src_o_fifovalid <= bb_gmm_substract_B5_aunroll_x_out_iowr_bl_src_o_fifovalid;

    -- out_iowr_nb_return_o_fifodata(GPOUT,58)
    out_iowr_nb_return_o_fifodata <= bb_gmm_substract_B5_aunroll_x_out_iowr_nb_return_o_fifodata;

    -- out_iowr_nb_return_o_fifovalid(GPOUT,59)
    out_iowr_nb_return_o_fifovalid <= bb_gmm_substract_B5_aunroll_x_out_iowr_nb_return_o_fifovalid;

    -- out_stall_out(GPOUT,60)
    out_stall_out <= bb_gmm_substract_B0_runOnce_aunroll_x_out_stall_out_0;

    -- out_valid_out(GPOUT,61)
    out_valid_out <= GND_q;

END normal;
