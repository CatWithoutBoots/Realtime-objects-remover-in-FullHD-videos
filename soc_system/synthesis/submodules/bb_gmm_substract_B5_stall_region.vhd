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

-- VHDL created from bb_gmm_substract_B5_stall_region
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

entity bb_gmm_substract_B5_stall_region is
    port (
        in_intel_reserved_ffwd_15_0_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_15_0_1 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_15_0_2 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_16_0_0 : in std_logic_vector(5 downto 0);  -- ufix6
        out_iowr_nb_return_o_fifodata : out std_logic_vector(0 downto 0);  -- ufix1
        out_iowr_nb_return_o_fifovalid : out std_logic_vector(0 downto 0);  -- ufix1
        in_intel_reserved_ffwd_10_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
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
        out_iowr_bl_src_o_fifodata : out std_logic_vector(175 downto 0);  -- ufix176
        out_iowr_bl_src_o_fifovalid : out std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_out_1 : out std_logic_vector(7 downto 0);  -- ufix8
        in_feedback_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        in_intel_reserved_ffwd_0_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gmm_substract_B5_stall_region;

architecture normal of bb_gmm_substract_B5_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract2881 is
        port (
            in_i_data_0 : in std_logic_vector(1 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_data_9 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_data_10 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_data_11 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_data_12 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_data_13 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_data_14 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_data_15 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_data_16 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_data_17 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_data_18 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_data_19 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_data_20 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_i_data_21 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_iowr_bl_src_i_fifoready : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_iowr_bl_src_o_fifodata : out std_logic_vector(175 downto 0);  -- Fixed Point
            out_iowr_bl_src_o_fifovalid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_ack : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract is
        port (
            in_intel_reserved_ffwd_15_0_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_15_0_1 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_15_0_2 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_16_0_0 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_unnamed_gmm_substract99_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_c0_exit2835_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit2835_1 : out std_logic_vector(1 downto 0);  -- Fixed Point
            out_c0_exit2835_2 : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_c0_exit2835_3 : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_c0_exit2835_4 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exit2835_5 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exit2835_6 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exit2835_7 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exit2835_8 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exit2835_9 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exit2835_10 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exit2835_11 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exit2835_12 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exit2835_13 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exit2835_14 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exit2835_15 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exit2835_16 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exit2835_17 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exit2835_18 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exit2835_19 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exit2835_20 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exit2835_21 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_c0_exit2835_22 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_throttle_push_gmm_substract2883 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_1 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract2882 is
        port (
            in_i_data : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_iowr_nb_return_o_fifodata : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_iowr_nb_return_o_fifovalid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_ack : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_out_iowr_bl_src_o_fifodata : STD_LOGIC_VECTOR (175 downto 0);
    signal i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_out_iowr_bl_src_o_fifovalid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_out_o_ack : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_1 : STD_LOGIC_VECTOR (1 downto 0);
    signal i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_2 : STD_LOGIC_VECTOR (5 downto 0);
    signal i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_3 : STD_LOGIC_VECTOR (5 downto 0);
    signal i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_4 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_5 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_6 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_7 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_8 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_9 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_10 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_11 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_12 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_13 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_14 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_15 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_16 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_17 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_18 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_19 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_20 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_21 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_22 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_throttle_push_gmm_substract_out_feedback_out_1 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_throttle_push_gmm_substract_out_feedback_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_throttle_push_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_throttle_push_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_out_iowr_nb_return_o_fifodata : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_out_iowr_nb_return_o_fifovalid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_out_o_ack : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_q : STD_LOGIC_VECTOR (158 downto 0);
    signal bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_b : STD_LOGIC_VECTOR (1 downto 0);
    signal bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_c : STD_LOGIC_VECTOR (5 downto 0);
    signal bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_d : STD_LOGIC_VECTOR (5 downto 0);
    signal bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_e : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_f : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_g : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_h : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_i : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_j : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_k : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_l : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_m : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_n : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_o : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_p : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_r : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_s : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_t : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_u : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_v : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_w : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_b : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i1_throttle_push_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i1_throttle_push_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i1_throttle_push_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_stall_entry(STALLENABLE,103)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_o_stall or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x(BLACKBOX,65)@0
    -- in in_i_stall@20000000
    -- out out_c0_exit2835_0@93
    -- out out_c0_exit2835_1@93
    -- out out_c0_exit2835_2@93
    -- out out_c0_exit2835_3@93
    -- out out_c0_exit2835_4@93
    -- out out_c0_exit2835_5@93
    -- out out_c0_exit2835_6@93
    -- out out_c0_exit2835_7@93
    -- out out_c0_exit2835_8@93
    -- out out_c0_exit2835_9@93
    -- out out_c0_exit2835_10@93
    -- out out_c0_exit2835_11@93
    -- out out_c0_exit2835_12@93
    -- out out_c0_exit2835_13@93
    -- out out_c0_exit2835_14@93
    -- out out_c0_exit2835_15@93
    -- out out_c0_exit2835_16@93
    -- out out_c0_exit2835_17@93
    -- out out_c0_exit2835_18@93
    -- out out_c0_exit2835_19@93
    -- out out_c0_exit2835_20@93
    -- out out_c0_exit2835_21@93
    -- out out_c0_exit2835_22@93
    -- out out_o_stall@20000000
    -- out out_o_valid@93
    thei_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x : i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract
    PORT MAP (
        in_intel_reserved_ffwd_15_0_0 => in_intel_reserved_ffwd_15_0_0,
        in_intel_reserved_ffwd_15_0_1 => in_intel_reserved_ffwd_15_0_1,
        in_intel_reserved_ffwd_15_0_2 => in_intel_reserved_ffwd_15_0_2,
        in_intel_reserved_ffwd_16_0_0 => in_intel_reserved_ffwd_16_0_0,
        in_unnamed_gmm_substract99_0 => GND_q,
        in_i_stall => SE_out_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_backStall,
        in_i_valid => SE_stall_entry_V0,
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
        out_c0_exit2835_1 => i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_1,
        out_c0_exit2835_2 => i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_2,
        out_c0_exit2835_3 => i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_3,
        out_c0_exit2835_4 => i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_4,
        out_c0_exit2835_5 => i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_5,
        out_c0_exit2835_6 => i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_6,
        out_c0_exit2835_7 => i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_7,
        out_c0_exit2835_8 => i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_8,
        out_c0_exit2835_9 => i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_9,
        out_c0_exit2835_10 => i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_10,
        out_c0_exit2835_11 => i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_11,
        out_c0_exit2835_12 => i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_12,
        out_c0_exit2835_13 => i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_13,
        out_c0_exit2835_14 => i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_14,
        out_c0_exit2835_15 => i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_15,
        out_c0_exit2835_16 => i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_16,
        out_c0_exit2835_17 => i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_17,
        out_c0_exit2835_18 => i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_18,
        out_c0_exit2835_19 => i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_19,
        out_c0_exit2835_20 => i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_20,
        out_c0_exit2835_21 => i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_21,
        out_c0_exit2835_22 => i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_22,
        out_o_stall => i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x(STALLENABLE,98)
    -- Valid signal propagation
    SE_out_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_V0 <= SE_out_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_backStall <= i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_out_o_stall or not (SE_out_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_wireValid <= i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_o_valid;

    -- bubble_join_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x(BITJOIN,88)
    bubble_join_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_q <= i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_22 & i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_21 & i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_20 & i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_19 & i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_18 & i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_17 & i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_16 & i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_15 & i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_14 & i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_13 & i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_12 & i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_11 & i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_10 & i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_9 & i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_8 & i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_7 & i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_6 & i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_5 & i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_4 & i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_3 & i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_2 & i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_out_c0_exit2835_1;

    -- bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x(BITSELECT,89)
    bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_q(1 downto 0));
    bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_q(7 downto 2));
    bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_q(13 downto 8));
    bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_q(21 downto 14));
    bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_q(29 downto 22));
    bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_q(37 downto 30));
    bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_q(45 downto 38));
    bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_q(53 downto 46));
    bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_q(61 downto 54));
    bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_q(69 downto 62));
    bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_q(77 downto 70));
    bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_m <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_q(85 downto 78));
    bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_n <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_q(93 downto 86));
    bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_o <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_q(101 downto 94));
    bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_p <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_q(109 downto 102));
    bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_q <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_q(117 downto 110));
    bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_r <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_q(125 downto 118));
    bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_s <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_q(133 downto 126));
    bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_t <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_q(141 downto 134));
    bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_u <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_q(149 downto 142));
    bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_v <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_q(157 downto 150));
    bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_w <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_q(158 downto 158));

    -- i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x(BLACKBOX,64)@93
    -- in in_i_stall@20000000
    -- out out_iowr_bl_src_o_fifodata@20000000
    -- out out_iowr_bl_src_o_fifovalid@20000000
    -- out out_o_stall@20000000
    thei_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x : i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract2881
    PORT MAP (
        in_i_data_0 => bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_b,
        in_i_data_1 => bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_c,
        in_i_data_2 => bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_d,
        in_i_data_3 => bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_e,
        in_i_data_4 => bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_f,
        in_i_data_5 => bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_g,
        in_i_data_6 => bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_h,
        in_i_data_7 => bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_i,
        in_i_data_8 => bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_j,
        in_i_data_9 => bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_k,
        in_i_data_10 => bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_l,
        in_i_data_11 => bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_m,
        in_i_data_12 => bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_n,
        in_i_data_13 => bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_o,
        in_i_data_14 => bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_p,
        in_i_data_15 => bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_q,
        in_i_data_16 => bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_r,
        in_i_data_17 => bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_s,
        in_i_data_18 => bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_t,
        in_i_data_19 => bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_u,
        in_i_data_20 => bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_v,
        in_i_data_21 => bubble_select_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_w,
        in_i_stall => SE_out_i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_backStall,
        in_i_valid => SE_out_i_sfc_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract_aunroll_x_V0,
        in_iowr_bl_src_i_fifoready => in_iowr_bl_src_i_fifoready,
        out_iowr_bl_src_o_fifodata => i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_out_iowr_bl_src_o_fifodata,
        out_iowr_bl_src_o_fifovalid => i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_out_iowr_bl_src_o_fifovalid,
        out_o_ack => i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_out_o_ack,
        out_o_stall => i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_out_o_stall,
        out_o_valid => i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x(STALLENABLE,96)
    -- Valid signal propagation
    SE_out_i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_V0 <= SE_out_i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_backStall <= i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_out_o_stall or not (SE_out_i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_wireValid <= i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_out_o_valid;

    -- SE_out_i_acl_push_i1_throttle_push_gmm_substract(STALLENABLE,100)
    -- Valid signal propagation
    SE_out_i_acl_push_i1_throttle_push_gmm_substract_V0 <= SE_out_i_acl_push_i1_throttle_push_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_acl_push_i1_throttle_push_gmm_substract_backStall <= in_stall_in or not (SE_out_i_acl_push_i1_throttle_push_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_acl_push_i1_throttle_push_gmm_substract_wireValid <= i_acl_push_i1_throttle_push_gmm_substract_out_valid_out;

    -- bubble_join_i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract(BITJOIN,92)
    bubble_join_i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_q <= i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_out_o_ack;

    -- bubble_select_i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract(BITSELECT,93)
    bubble_select_i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_q(0 downto 0));

    -- i_acl_push_i1_throttle_push_gmm_substract(BLACKBOX,75)@93
    -- in in_stall_in@20000000
    -- out out_data_out@94
    -- out out_feedback_out_1@20000000
    -- out out_feedback_valid_out_1@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@94
    thei_acl_push_i1_throttle_push_gmm_substract : i_acl_push_i1_throttle_push_gmm_substract2883
    PORT MAP (
        in_data_in => bubble_select_i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_b,
        in_feedback_stall_in_1 => in_feedback_stall_in_1,
        in_stall_in => SE_out_i_acl_push_i1_throttle_push_gmm_substract_backStall,
        in_valid_in => SE_out_i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_V0,
        out_feedback_out_1 => i_acl_push_i1_throttle_push_gmm_substract_out_feedback_out_1,
        out_feedback_valid_out_1 => i_acl_push_i1_throttle_push_gmm_substract_out_feedback_valid_out_1,
        out_stall_out => i_acl_push_i1_throttle_push_gmm_substract_out_stall_out,
        out_valid_out => i_acl_push_i1_throttle_push_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract(STALLENABLE,102)
    -- Valid signal propagation
    SE_out_i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_V0 <= SE_out_i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_backStall <= i_acl_push_i1_throttle_push_gmm_substract_out_stall_out or not (SE_out_i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_wireValid <= i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_out_o_valid;

    -- bubble_join_i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x(BITJOIN,85)
    bubble_join_i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_q <= i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_out_o_ack;

    -- bubble_select_i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x(BITSELECT,86)
    bubble_select_i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_q(0 downto 0));

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract(BLACKBOX,76)@93
    -- in in_i_stall@20000000
    -- out out_iowr_nb_return_o_fifodata@20000000
    -- out out_iowr_nb_return_o_fifovalid@20000000
    -- out out_o_stall@20000000
    thei_iowr_nb_return_unnamed_gmm_substract118_gmm_substract : i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract2882
    PORT MAP (
        in_i_data => GND_q,
        in_i_dependence => bubble_select_i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_b,
        in_i_stall => SE_out_i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_backStall,
        in_i_valid => SE_out_i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_V0,
        out_iowr_nb_return_o_fifodata => i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_out_iowr_nb_return_o_fifodata,
        out_iowr_nb_return_o_fifovalid => i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_out_iowr_nb_return_o_fifovalid,
        out_o_ack => i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_out_o_ack,
        out_o_stall => i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_out_o_stall,
        out_o_valid => i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,4)
    out_iowr_nb_return_o_fifodata <= i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_out_iowr_nb_return_o_fifodata;
    out_iowr_nb_return_o_fifovalid <= i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract_out_iowr_nb_return_o_fifovalid;

    -- dupName_0_sync_out_x(GPOUT,9)@94
    out_valid_out <= SE_out_i_acl_push_i1_throttle_push_gmm_substract_V0;

    -- ext_sig_sync_out(GPOUT,71)
    out_iowr_bl_src_o_fifodata <= i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_out_iowr_bl_src_o_fifodata;
    out_iowr_bl_src_o_fifovalid <= i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract_aunroll_x_out_iowr_bl_src_o_fifovalid;

    -- feedback_out_1_sync(GPOUT,72)
    out_feedback_out_1 <= i_acl_push_i1_throttle_push_gmm_substract_out_feedback_out_1;

    -- feedback_valid_out_1_sync(GPOUT,74)
    out_feedback_valid_out_1 <= i_acl_push_i1_throttle_push_gmm_substract_out_feedback_valid_out_1;

    -- sync_out(GPOUT,83)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
