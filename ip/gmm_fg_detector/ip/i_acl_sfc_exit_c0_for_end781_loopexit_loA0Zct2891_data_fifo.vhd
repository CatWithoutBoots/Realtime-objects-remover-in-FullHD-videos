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

-- VHDL created from i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_subA0Zstract2891_data_fifo
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

entity i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_subA0Zstract2891_data_fifo is
    port (
        in_data_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_1 : in std_logic_vector(1 downto 0);  -- ufix2
        in_data_in_2 : in std_logic_vector(5 downto 0);  -- ufix6
        in_data_in_3 : in std_logic_vector(5 downto 0);  -- ufix6
        in_data_in_4 : in std_logic_vector(7 downto 0);  -- ufix8
        in_data_in_5 : in std_logic_vector(7 downto 0);  -- ufix8
        in_data_in_6 : in std_logic_vector(7 downto 0);  -- ufix8
        in_data_in_7 : in std_logic_vector(7 downto 0);  -- ufix8
        in_data_in_8 : in std_logic_vector(7 downto 0);  -- ufix8
        in_data_in_9 : in std_logic_vector(7 downto 0);  -- ufix8
        in_data_in_10 : in std_logic_vector(7 downto 0);  -- ufix8
        in_data_in_11 : in std_logic_vector(7 downto 0);  -- ufix8
        in_data_in_12 : in std_logic_vector(7 downto 0);  -- ufix8
        in_data_in_13 : in std_logic_vector(7 downto 0);  -- ufix8
        in_data_in_14 : in std_logic_vector(7 downto 0);  -- ufix8
        in_data_in_15 : in std_logic_vector(7 downto 0);  -- ufix8
        in_data_in_16 : in std_logic_vector(7 downto 0);  -- ufix8
        in_data_in_17 : in std_logic_vector(7 downto 0);  -- ufix8
        in_data_in_18 : in std_logic_vector(7 downto 0);  -- ufix8
        in_data_in_19 : in std_logic_vector(7 downto 0);  -- ufix8
        in_data_in_20 : in std_logic_vector(7 downto 0);  -- ufix8
        in_data_in_21 : in std_logic_vector(7 downto 0);  -- ufix8
        in_data_in_22 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_1 : out std_logic_vector(1 downto 0);  -- ufix2
        out_data_out_2 : out std_logic_vector(5 downto 0);  -- ufix6
        out_data_out_3 : out std_logic_vector(5 downto 0);  -- ufix6
        out_data_out_4 : out std_logic_vector(7 downto 0);  -- ufix8
        out_data_out_5 : out std_logic_vector(7 downto 0);  -- ufix8
        out_data_out_6 : out std_logic_vector(7 downto 0);  -- ufix8
        out_data_out_7 : out std_logic_vector(7 downto 0);  -- ufix8
        out_data_out_8 : out std_logic_vector(7 downto 0);  -- ufix8
        out_data_out_9 : out std_logic_vector(7 downto 0);  -- ufix8
        out_data_out_10 : out std_logic_vector(7 downto 0);  -- ufix8
        out_data_out_11 : out std_logic_vector(7 downto 0);  -- ufix8
        out_data_out_12 : out std_logic_vector(7 downto 0);  -- ufix8
        out_data_out_13 : out std_logic_vector(7 downto 0);  -- ufix8
        out_data_out_14 : out std_logic_vector(7 downto 0);  -- ufix8
        out_data_out_15 : out std_logic_vector(7 downto 0);  -- ufix8
        out_data_out_16 : out std_logic_vector(7 downto 0);  -- ufix8
        out_data_out_17 : out std_logic_vector(7 downto 0);  -- ufix8
        out_data_out_18 : out std_logic_vector(7 downto 0);  -- ufix8
        out_data_out_19 : out std_logic_vector(7 downto 0);  -- ufix8
        out_data_out_20 : out std_logic_vector(7 downto 0);  -- ufix8
        out_data_out_21 : out std_logic_vector(7 downto 0);  -- ufix8
        out_data_out_22 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_subA0Zstract2891_data_fifo;

architecture normal of i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_subA0Zstract2891_data_fifo is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component acl_data_fifo is
        generic (
            DEPTH : INTEGER;
            ALLOW_FULL_WRITE : INTEGER := 1;
            DATA_WIDTH : INTEGER := 184;
            IMPL : STRING := "ram"
        );
        port (
            data_in : in std_logic_vector(183 downto 0);
            stall_in : in std_logic;
            valid_in : in std_logic;
            data_out : out std_logic_vector(183 downto 0);
            stall_out : out std_logic;
            valid_out : out std_logic;
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal dupName_0_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (1 downto 0);
    signal dupName_0_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (1 downto 0);
    signal dupName_0_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_0_c_i2_0gr_x_q : STD_LOGIC_VECTOR (1 downto 0);
    signal dupName_0_c_i7_0gr_x_q : STD_LOGIC_VECTOR (6 downto 0);
    signal dupName_0_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (175 downto 0);
    signal dupName_0_dsdk_ip_array_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_0_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (175 downto 0);
    signal dupName_0_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_1_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (5 downto 0);
    signal dupName_1_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (5 downto 0);
    signal dupName_1_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_1_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_1_dsdk_ip_array_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_1_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_1_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_1_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_2_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (5 downto 0);
    signal dupName_2_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (5 downto 0);
    signal dupName_2_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_2_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_2_dsdk_ip_array_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_2_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_2_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_2_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_3_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_3_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_3_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_3_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_3_dsdk_ip_array_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_3_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_3_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_3_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_4_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_4_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_4_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (1 downto 0);
    signal dupName_4_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_5_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_5_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_5_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_5_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_6_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_6_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_6_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_6_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_7_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_7_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_7_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_7_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_8_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_8_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_8_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (5 downto 0);
    signal dupName_8_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_9_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_9_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_9_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_9_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_10_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_10_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (39 downto 0);
    signal dupName_10_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_10_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_11_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_11_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_11_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_11_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_12_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_12_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_12_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (5 downto 0);
    signal dupName_12_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_13_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_13_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_13_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (119 downto 0);
    signal dupName_13_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_14_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_14_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_14_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (39 downto 0);
    signal dupName_14_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_15_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_15_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_15_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_15_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_16_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_16_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_16_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_16_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_17_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_17_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_17_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_18_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_18_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_18_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_19_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_19_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_19_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_20_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_20_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_20_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_21_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_21_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_21_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_22_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_22_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_22_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_23_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_23_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_23_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_24_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_24_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_24_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_25_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (39 downto 0);
    signal dupName_25_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_25_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_26_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_26_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_26_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_27_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_27_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (39 downto 0);
    signal dupName_27_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_28_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_28_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_28_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_29_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_29_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_29_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_30_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_30_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_30_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_31_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_31_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_31_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_32_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_32_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_32_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_33_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_33_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_33_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_34_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_34_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_34_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_35_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_35_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_35_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_36_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_36_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_36_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_37_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_37_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_37_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (39 downto 0);
    signal dupName_38_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_38_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_38_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_39_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_39_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_39_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_40_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_40_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_40_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_41_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_41_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_41_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_42_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_42_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_42_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_43_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (39 downto 0);
    signal dupName_43_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_43_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_44_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_44_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (39 downto 0);
    signal dupName_44_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_45_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_45_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_45_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_46_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_46_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_46_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_47_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_47_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_47_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_48_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_48_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_48_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_49_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_49_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_49_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_50_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_50_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_50_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_51_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_51_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_51_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_52_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_52_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_52_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_53_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_53_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_53_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_54_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_54_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_54_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_55_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_55_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_55_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_56_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_56_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_56_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_57_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_57_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_57_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_58_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_58_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_58_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_59_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_59_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_59_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_60_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_60_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_60_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (39 downto 0);
    signal dupName_61_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (39 downto 0);
    signal dupName_61_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_61_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_62_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (119 downto 0);
    signal dupName_62_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_62_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_63_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_63_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_63_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_64_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_64_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_64_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_65_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_65_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_65_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_66_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_66_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_66_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_67_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_67_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_67_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_68_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_68_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_68_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_69_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_69_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_69_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_70_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_70_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_70_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_71_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_71_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_71_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_72_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_72_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_72_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_73_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_73_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_73_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_74_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_74_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_75_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_75_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_76_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_76_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_77_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (175 downto 0);
    signal dupName_77_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_78_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_79_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_80_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_81_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_82_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_83_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_84_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_85_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_86_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_87_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_88_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_89_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_90_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_91_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_92_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_93_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_94_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_95_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_96_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_97_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_98_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_99_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_100_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal adapt_scalar_trunc_in : STD_LOGIC_VECTOR (0 downto 0);
    signal adapt_scalar_trunc_q : STD_LOGIC_VECTOR (0 downto 0);
    signal agg_adapt_to_ufixed_cast_b : STD_LOGIC_VECTOR (7 downto 0);
    signal c_i6_0gr_q : STD_LOGIC_VECTOR (5 downto 0);
    signal dsdk_ip_adapt_bitjoin_q : STD_LOGIC_VECTOR (183 downto 0);
    signal dsdk_ip_array_adapt_bitjoin_q : STD_LOGIC_VECTOR (119 downto 0);
    signal element_extension_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892_data_in : STD_LOGIC_VECTOR (183 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892_stall_in_bitsignaltemp : std_logic;
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892_valid_in_bitsignaltemp : std_logic;
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892_data_out : STD_LOGIC_VECTOR (183 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892_stall_out_bitsignaltemp : std_logic;
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892_valid_out_bitsignaltemp : std_logic;
    signal ip_dsdk_adapt_bitselect_b : STD_LOGIC_VECTOR (0 downto 0);
    signal ip_dsdk_adapt_cast_b : STD_LOGIC_VECTOR (7 downto 0);

begin


    -- dupName_0_c_i7_0gr_x(CONSTANT,7)
    dupName_0_c_i7_0gr_x_q <= "0000000";

    -- dupName_3_element_extension_x(BITJOIN,31)
    dupName_3_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_22;

    -- dupName_73_dsdk_ip_adapt_bitjoin_x(BITJOIN,255)
    dupName_73_dsdk_ip_adapt_bitjoin_x_q <= dupName_3_element_extension_x_q;

    -- dupName_74_agg_adapt_to_ufixed_cast_x(BITSELECT,257)
    dupName_74_agg_adapt_to_ufixed_cast_x_b <= dupName_73_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_72_dsdk_ip_adapt_bitjoin_x(BITJOIN,252)
    dupName_72_dsdk_ip_adapt_bitjoin_x_q <= dupName_74_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_75_agg_adapt_to_ufixed_cast_x(BITSELECT,259)
    dupName_75_agg_adapt_to_ufixed_cast_x_b <= dupName_72_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_71_dsdk_ip_adapt_bitjoin_x(BITJOIN,249)
    dupName_71_dsdk_ip_adapt_bitjoin_x_q <= dupName_75_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_76_agg_adapt_to_ufixed_cast_x(BITSELECT,261)
    dupName_76_agg_adapt_to_ufixed_cast_x_b <= dupName_71_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_70_dsdk_ip_adapt_bitjoin_x(BITJOIN,246)
    dupName_70_dsdk_ip_adapt_bitjoin_x_q <= in_data_in_21;

    -- dupName_69_agg_adapt_to_ufixed_cast_x(BITSELECT,242)
    dupName_69_agg_adapt_to_ufixed_cast_x_b <= dupName_70_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_69_dsdk_ip_adapt_bitjoin_x(BITJOIN,243)
    dupName_69_dsdk_ip_adapt_bitjoin_x_q <= dupName_69_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_70_agg_adapt_to_ufixed_cast_x(BITSELECT,245)
    dupName_70_agg_adapt_to_ufixed_cast_x_b <= dupName_69_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_68_dsdk_ip_adapt_bitjoin_x(BITJOIN,240)
    dupName_68_dsdk_ip_adapt_bitjoin_x_q <= dupName_70_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_71_agg_adapt_to_ufixed_cast_x(BITSELECT,248)
    dupName_71_agg_adapt_to_ufixed_cast_x_b <= dupName_68_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_67_dsdk_ip_adapt_bitjoin_x(BITJOIN,237)
    dupName_67_dsdk_ip_adapt_bitjoin_x_q <= in_data_in_20;

    -- dupName_66_agg_adapt_to_ufixed_cast_x(BITSELECT,233)
    dupName_66_agg_adapt_to_ufixed_cast_x_b <= dupName_67_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_66_dsdk_ip_adapt_bitjoin_x(BITJOIN,234)
    dupName_66_dsdk_ip_adapt_bitjoin_x_q <= dupName_66_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_67_agg_adapt_to_ufixed_cast_x(BITSELECT,236)
    dupName_67_agg_adapt_to_ufixed_cast_x_b <= dupName_66_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_65_dsdk_ip_adapt_bitjoin_x(BITJOIN,231)
    dupName_65_dsdk_ip_adapt_bitjoin_x_q <= dupName_67_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_68_agg_adapt_to_ufixed_cast_x(BITSELECT,239)
    dupName_68_agg_adapt_to_ufixed_cast_x_b <= dupName_65_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_64_dsdk_ip_adapt_bitjoin_x(BITJOIN,228)
    dupName_64_dsdk_ip_adapt_bitjoin_x_q <= in_data_in_19;

    -- dupName_63_agg_adapt_to_ufixed_cast_x(BITSELECT,224)
    dupName_63_agg_adapt_to_ufixed_cast_x_b <= dupName_64_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_63_dsdk_ip_adapt_bitjoin_x(BITJOIN,225)
    dupName_63_dsdk_ip_adapt_bitjoin_x_q <= dupName_63_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_64_agg_adapt_to_ufixed_cast_x(BITSELECT,227)
    dupName_64_agg_adapt_to_ufixed_cast_x_b <= dupName_63_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_62_dsdk_ip_adapt_bitjoin_x(BITJOIN,222)
    dupName_62_dsdk_ip_adapt_bitjoin_x_q <= dupName_64_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_65_agg_adapt_to_ufixed_cast_x(BITSELECT,230)
    dupName_65_agg_adapt_to_ufixed_cast_x_b <= dupName_62_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_3_dsdk_ip_array_adapt_bitjoin_x(BITJOIN,30)
    dupName_3_dsdk_ip_array_adapt_bitjoin_x_q <= dupName_71_agg_adapt_to_ufixed_cast_x_b & dupName_68_agg_adapt_to_ufixed_cast_x_b & dupName_65_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_72_agg_adapt_to_ufixed_cast_x(BITSELECT,251)
    dupName_72_agg_adapt_to_ufixed_cast_x_b <= dupName_3_dsdk_ip_array_adapt_bitjoin_x_q(23 downto 0);

    -- dupName_61_dsdk_ip_adapt_bitjoin_x(BITJOIN,219)
    dupName_61_dsdk_ip_adapt_bitjoin_x_q <= dupName_72_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_73_agg_adapt_to_ufixed_cast_x(BITSELECT,254)
    dupName_73_agg_adapt_to_ufixed_cast_x_b <= dupName_61_dsdk_ip_adapt_bitjoin_x_q(23 downto 0);

    -- dupName_60_dsdk_ip_adapt_bitjoin_x(BITJOIN,216)
    dupName_60_dsdk_ip_adapt_bitjoin_x_q <= in_data_in_18;

    -- dupName_58_agg_adapt_to_ufixed_cast_x(BITSELECT,209)
    dupName_58_agg_adapt_to_ufixed_cast_x_b <= dupName_60_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_59_dsdk_ip_adapt_bitjoin_x(BITJOIN,213)
    dupName_59_dsdk_ip_adapt_bitjoin_x_q <= dupName_58_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_59_agg_adapt_to_ufixed_cast_x(BITSELECT,212)
    dupName_59_agg_adapt_to_ufixed_cast_x_b <= dupName_59_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_58_dsdk_ip_adapt_bitjoin_x(BITJOIN,210)
    dupName_58_dsdk_ip_adapt_bitjoin_x_q <= dupName_59_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_60_agg_adapt_to_ufixed_cast_x(BITSELECT,215)
    dupName_60_agg_adapt_to_ufixed_cast_x_b <= dupName_58_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_57_dsdk_ip_adapt_bitjoin_x(BITJOIN,207)
    dupName_57_dsdk_ip_adapt_bitjoin_x_q <= in_data_in_17;

    -- dupName_55_agg_adapt_to_ufixed_cast_x(BITSELECT,200)
    dupName_55_agg_adapt_to_ufixed_cast_x_b <= dupName_57_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_56_dsdk_ip_adapt_bitjoin_x(BITJOIN,204)
    dupName_56_dsdk_ip_adapt_bitjoin_x_q <= dupName_55_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_56_agg_adapt_to_ufixed_cast_x(BITSELECT,203)
    dupName_56_agg_adapt_to_ufixed_cast_x_b <= dupName_56_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_55_dsdk_ip_adapt_bitjoin_x(BITJOIN,201)
    dupName_55_dsdk_ip_adapt_bitjoin_x_q <= dupName_56_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_57_agg_adapt_to_ufixed_cast_x(BITSELECT,206)
    dupName_57_agg_adapt_to_ufixed_cast_x_b <= dupName_55_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_54_dsdk_ip_adapt_bitjoin_x(BITJOIN,198)
    dupName_54_dsdk_ip_adapt_bitjoin_x_q <= in_data_in_16;

    -- dupName_50_agg_adapt_to_ufixed_cast_x(BITSELECT,185)
    dupName_50_agg_adapt_to_ufixed_cast_x_b <= dupName_54_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_53_dsdk_ip_adapt_bitjoin_x(BITJOIN,195)
    dupName_53_dsdk_ip_adapt_bitjoin_x_q <= dupName_50_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_51_agg_adapt_to_ufixed_cast_x(BITSELECT,188)
    dupName_51_agg_adapt_to_ufixed_cast_x_b <= dupName_53_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_52_dsdk_ip_adapt_bitjoin_x(BITJOIN,192)
    dupName_52_dsdk_ip_adapt_bitjoin_x_q <= dupName_51_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_52_agg_adapt_to_ufixed_cast_x(BITSELECT,191)
    dupName_52_agg_adapt_to_ufixed_cast_x_b <= dupName_52_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_51_dsdk_ip_adapt_bitjoin_x(BITJOIN,189)
    dupName_51_dsdk_ip_adapt_bitjoin_x_q <= in_data_in_15;

    -- dupName_47_agg_adapt_to_ufixed_cast_x(BITSELECT,176)
    dupName_47_agg_adapt_to_ufixed_cast_x_b <= dupName_51_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_50_dsdk_ip_adapt_bitjoin_x(BITJOIN,186)
    dupName_50_dsdk_ip_adapt_bitjoin_x_q <= dupName_47_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_48_agg_adapt_to_ufixed_cast_x(BITSELECT,179)
    dupName_48_agg_adapt_to_ufixed_cast_x_b <= dupName_50_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_49_dsdk_ip_adapt_bitjoin_x(BITJOIN,183)
    dupName_49_dsdk_ip_adapt_bitjoin_x_q <= dupName_48_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_49_agg_adapt_to_ufixed_cast_x(BITSELECT,182)
    dupName_49_agg_adapt_to_ufixed_cast_x_b <= dupName_49_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_48_dsdk_ip_adapt_bitjoin_x(BITJOIN,180)
    dupName_48_dsdk_ip_adapt_bitjoin_x_q <= in_data_in_14;

    -- dupName_44_agg_adapt_to_ufixed_cast_x(BITSELECT,167)
    dupName_44_agg_adapt_to_ufixed_cast_x_b <= dupName_48_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_47_dsdk_ip_adapt_bitjoin_x(BITJOIN,177)
    dupName_47_dsdk_ip_adapt_bitjoin_x_q <= dupName_44_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_45_agg_adapt_to_ufixed_cast_x(BITSELECT,170)
    dupName_45_agg_adapt_to_ufixed_cast_x_b <= dupName_47_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_46_dsdk_ip_adapt_bitjoin_x(BITJOIN,174)
    dupName_46_dsdk_ip_adapt_bitjoin_x_q <= dupName_45_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_46_agg_adapt_to_ufixed_cast_x(BITSELECT,173)
    dupName_46_agg_adapt_to_ufixed_cast_x_b <= dupName_46_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_2_dsdk_ip_array_adapt_bitjoin_x(BITJOIN,23)
    dupName_2_dsdk_ip_array_adapt_bitjoin_x_q <= dupName_52_agg_adapt_to_ufixed_cast_x_b & dupName_49_agg_adapt_to_ufixed_cast_x_b & dupName_46_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_53_agg_adapt_to_ufixed_cast_x(BITSELECT,194)
    dupName_53_agg_adapt_to_ufixed_cast_x_b <= dupName_2_dsdk_ip_array_adapt_bitjoin_x_q(23 downto 0);

    -- dupName_45_dsdk_ip_adapt_bitjoin_x(BITJOIN,171)
    dupName_45_dsdk_ip_adapt_bitjoin_x_q <= dupName_53_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_54_agg_adapt_to_ufixed_cast_x(BITSELECT,197)
    dupName_54_agg_adapt_to_ufixed_cast_x_b <= dupName_45_dsdk_ip_adapt_bitjoin_x_q(23 downto 0);

    -- dupName_44_dsdk_ip_adapt_bitjoin_x(BITJOIN,168)
    dupName_44_dsdk_ip_adapt_bitjoin_x_q <= dupName_60_agg_adapt_to_ufixed_cast_x_b & dupName_57_agg_adapt_to_ufixed_cast_x_b & dupName_54_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_61_agg_adapt_to_ufixed_cast_x(BITSELECT,218)
    dupName_61_agg_adapt_to_ufixed_cast_x_b <= dupName_44_dsdk_ip_adapt_bitjoin_x_q(39 downto 0);

    -- dupName_43_dsdk_ip_adapt_bitjoin_x(BITJOIN,165)
    dupName_43_dsdk_ip_adapt_bitjoin_x_q <= in_data_in_13;

    -- dupName_40_agg_adapt_to_ufixed_cast_x(BITSELECT,155)
    dupName_40_agg_adapt_to_ufixed_cast_x_b <= dupName_43_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_42_dsdk_ip_adapt_bitjoin_x(BITJOIN,162)
    dupName_42_dsdk_ip_adapt_bitjoin_x_q <= dupName_40_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_41_agg_adapt_to_ufixed_cast_x(BITSELECT,158)
    dupName_41_agg_adapt_to_ufixed_cast_x_b <= dupName_42_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_41_dsdk_ip_adapt_bitjoin_x(BITJOIN,159)
    dupName_41_dsdk_ip_adapt_bitjoin_x_q <= dupName_41_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_42_agg_adapt_to_ufixed_cast_x(BITSELECT,161)
    dupName_42_agg_adapt_to_ufixed_cast_x_b <= dupName_41_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_40_dsdk_ip_adapt_bitjoin_x(BITJOIN,156)
    dupName_40_dsdk_ip_adapt_bitjoin_x_q <= in_data_in_12;

    -- dupName_37_agg_adapt_to_ufixed_cast_x(BITSELECT,146)
    dupName_37_agg_adapt_to_ufixed_cast_x_b <= dupName_40_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_39_dsdk_ip_adapt_bitjoin_x(BITJOIN,153)
    dupName_39_dsdk_ip_adapt_bitjoin_x_q <= dupName_37_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_38_agg_adapt_to_ufixed_cast_x(BITSELECT,149)
    dupName_38_agg_adapt_to_ufixed_cast_x_b <= dupName_39_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_38_dsdk_ip_adapt_bitjoin_x(BITJOIN,150)
    dupName_38_dsdk_ip_adapt_bitjoin_x_q <= dupName_38_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_39_agg_adapt_to_ufixed_cast_x(BITSELECT,152)
    dupName_39_agg_adapt_to_ufixed_cast_x_b <= dupName_38_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_37_dsdk_ip_adapt_bitjoin_x(BITJOIN,147)
    dupName_37_dsdk_ip_adapt_bitjoin_x_q <= in_data_in_11;

    -- dupName_32_agg_adapt_to_ufixed_cast_x(BITSELECT,131)
    dupName_32_agg_adapt_to_ufixed_cast_x_b <= dupName_37_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_36_dsdk_ip_adapt_bitjoin_x(BITJOIN,144)
    dupName_36_dsdk_ip_adapt_bitjoin_x_q <= dupName_32_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_33_agg_adapt_to_ufixed_cast_x(BITSELECT,134)
    dupName_33_agg_adapt_to_ufixed_cast_x_b <= dupName_36_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_35_dsdk_ip_adapt_bitjoin_x(BITJOIN,141)
    dupName_35_dsdk_ip_adapt_bitjoin_x_q <= dupName_33_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_34_agg_adapt_to_ufixed_cast_x(BITSELECT,137)
    dupName_34_agg_adapt_to_ufixed_cast_x_b <= dupName_35_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_34_dsdk_ip_adapt_bitjoin_x(BITJOIN,138)
    dupName_34_dsdk_ip_adapt_bitjoin_x_q <= in_data_in_10;

    -- dupName_29_agg_adapt_to_ufixed_cast_x(BITSELECT,122)
    dupName_29_agg_adapt_to_ufixed_cast_x_b <= dupName_34_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_33_dsdk_ip_adapt_bitjoin_x(BITJOIN,135)
    dupName_33_dsdk_ip_adapt_bitjoin_x_q <= dupName_29_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_30_agg_adapt_to_ufixed_cast_x(BITSELECT,125)
    dupName_30_agg_adapt_to_ufixed_cast_x_b <= dupName_33_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_32_dsdk_ip_adapt_bitjoin_x(BITJOIN,132)
    dupName_32_dsdk_ip_adapt_bitjoin_x_q <= dupName_30_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_31_agg_adapt_to_ufixed_cast_x(BITSELECT,128)
    dupName_31_agg_adapt_to_ufixed_cast_x_b <= dupName_32_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_31_dsdk_ip_adapt_bitjoin_x(BITJOIN,129)
    dupName_31_dsdk_ip_adapt_bitjoin_x_q <= in_data_in_9;

    -- dupName_26_agg_adapt_to_ufixed_cast_x(BITSELECT,113)
    dupName_26_agg_adapt_to_ufixed_cast_x_b <= dupName_31_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_30_dsdk_ip_adapt_bitjoin_x(BITJOIN,126)
    dupName_30_dsdk_ip_adapt_bitjoin_x_q <= dupName_26_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_27_agg_adapt_to_ufixed_cast_x(BITSELECT,116)
    dupName_27_agg_adapt_to_ufixed_cast_x_b <= dupName_30_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_29_dsdk_ip_adapt_bitjoin_x(BITJOIN,123)
    dupName_29_dsdk_ip_adapt_bitjoin_x_q <= dupName_27_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_28_agg_adapt_to_ufixed_cast_x(BITSELECT,119)
    dupName_28_agg_adapt_to_ufixed_cast_x_b <= dupName_29_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_1_dsdk_ip_array_adapt_bitjoin_x(BITJOIN,16)
    dupName_1_dsdk_ip_array_adapt_bitjoin_x_q <= dupName_34_agg_adapt_to_ufixed_cast_x_b & dupName_31_agg_adapt_to_ufixed_cast_x_b & dupName_28_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_35_agg_adapt_to_ufixed_cast_x(BITSELECT,140)
    dupName_35_agg_adapt_to_ufixed_cast_x_b <= dupName_1_dsdk_ip_array_adapt_bitjoin_x_q(23 downto 0);

    -- dupName_28_dsdk_ip_adapt_bitjoin_x(BITJOIN,120)
    dupName_28_dsdk_ip_adapt_bitjoin_x_q <= dupName_35_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_36_agg_adapt_to_ufixed_cast_x(BITSELECT,143)
    dupName_36_agg_adapt_to_ufixed_cast_x_b <= dupName_28_dsdk_ip_adapt_bitjoin_x_q(23 downto 0);

    -- dupName_27_dsdk_ip_adapt_bitjoin_x(BITJOIN,117)
    dupName_27_dsdk_ip_adapt_bitjoin_x_q <= dupName_42_agg_adapt_to_ufixed_cast_x_b & dupName_39_agg_adapt_to_ufixed_cast_x_b & dupName_36_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_43_agg_adapt_to_ufixed_cast_x(BITSELECT,164)
    dupName_43_agg_adapt_to_ufixed_cast_x_b <= dupName_27_dsdk_ip_adapt_bitjoin_x_q(39 downto 0);

    -- dupName_26_dsdk_ip_adapt_bitjoin_x(BITJOIN,114)
    dupName_26_dsdk_ip_adapt_bitjoin_x_q <= in_data_in_8;

    -- dupName_22_agg_adapt_to_ufixed_cast_x(BITSELECT,101)
    dupName_22_agg_adapt_to_ufixed_cast_x_b <= dupName_26_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_25_dsdk_ip_adapt_bitjoin_x(BITJOIN,111)
    dupName_25_dsdk_ip_adapt_bitjoin_x_q <= dupName_22_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_23_agg_adapt_to_ufixed_cast_x(BITSELECT,104)
    dupName_23_agg_adapt_to_ufixed_cast_x_b <= dupName_25_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_24_dsdk_ip_adapt_bitjoin_x(BITJOIN,108)
    dupName_24_dsdk_ip_adapt_bitjoin_x_q <= dupName_23_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_24_agg_adapt_to_ufixed_cast_x(BITSELECT,107)
    dupName_24_agg_adapt_to_ufixed_cast_x_b <= dupName_24_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_23_dsdk_ip_adapt_bitjoin_x(BITJOIN,105)
    dupName_23_dsdk_ip_adapt_bitjoin_x_q <= in_data_in_7;

    -- dupName_19_agg_adapt_to_ufixed_cast_x(BITSELECT,92)
    dupName_19_agg_adapt_to_ufixed_cast_x_b <= dupName_23_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_22_dsdk_ip_adapt_bitjoin_x(BITJOIN,102)
    dupName_22_dsdk_ip_adapt_bitjoin_x_q <= dupName_19_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_20_agg_adapt_to_ufixed_cast_x(BITSELECT,95)
    dupName_20_agg_adapt_to_ufixed_cast_x_b <= dupName_22_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_21_dsdk_ip_adapt_bitjoin_x(BITJOIN,99)
    dupName_21_dsdk_ip_adapt_bitjoin_x_q <= dupName_20_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_21_agg_adapt_to_ufixed_cast_x(BITSELECT,98)
    dupName_21_agg_adapt_to_ufixed_cast_x_b <= dupName_21_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_20_dsdk_ip_adapt_bitjoin_x(BITJOIN,96)
    dupName_20_dsdk_ip_adapt_bitjoin_x_q <= in_data_in_6;

    -- dupName_14_agg_adapt_to_ufixed_cast_x(BITSELECT,74)
    dupName_14_agg_adapt_to_ufixed_cast_x_b <= dupName_20_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_19_dsdk_ip_adapt_bitjoin_x(BITJOIN,93)
    dupName_19_dsdk_ip_adapt_bitjoin_x_q <= dupName_14_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_15_agg_adapt_to_ufixed_cast_x(BITSELECT,78)
    dupName_15_agg_adapt_to_ufixed_cast_x_b <= dupName_19_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_18_dsdk_ip_adapt_bitjoin_x(BITJOIN,90)
    dupName_18_dsdk_ip_adapt_bitjoin_x_q <= dupName_15_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_16_agg_adapt_to_ufixed_cast_x(BITSELECT,82)
    dupName_16_agg_adapt_to_ufixed_cast_x_b <= dupName_18_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_17_dsdk_ip_adapt_bitjoin_x(BITJOIN,87)
    dupName_17_dsdk_ip_adapt_bitjoin_x_q <= in_data_in_5;

    -- dupName_11_agg_adapt_to_ufixed_cast_x(BITSELECT,62)
    dupName_11_agg_adapt_to_ufixed_cast_x_b <= dupName_17_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_16_dsdk_ip_adapt_bitjoin_x(BITJOIN,83)
    dupName_16_dsdk_ip_adapt_bitjoin_x_q <= dupName_11_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_12_agg_adapt_to_ufixed_cast_x(BITSELECT,66)
    dupName_12_agg_adapt_to_ufixed_cast_x_b <= dupName_16_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_15_dsdk_ip_adapt_bitjoin_x(BITJOIN,79)
    dupName_15_dsdk_ip_adapt_bitjoin_x_q <= dupName_12_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_13_agg_adapt_to_ufixed_cast_x(BITSELECT,70)
    dupName_13_agg_adapt_to_ufixed_cast_x_b <= dupName_15_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_14_dsdk_ip_adapt_bitjoin_x(BITJOIN,75)
    dupName_14_dsdk_ip_adapt_bitjoin_x_q <= in_data_in_4;

    -- dupName_8_agg_adapt_to_ufixed_cast_x(BITSELECT,50)
    dupName_8_agg_adapt_to_ufixed_cast_x_b <= dupName_14_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_13_dsdk_ip_adapt_bitjoin_x(BITJOIN,71)
    dupName_13_dsdk_ip_adapt_bitjoin_x_q <= dupName_8_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_9_agg_adapt_to_ufixed_cast_x(BITSELECT,54)
    dupName_9_agg_adapt_to_ufixed_cast_x_b <= dupName_13_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_12_dsdk_ip_adapt_bitjoin_x(BITJOIN,67)
    dupName_12_dsdk_ip_adapt_bitjoin_x_q <= dupName_9_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_10_agg_adapt_to_ufixed_cast_x(BITSELECT,58)
    dupName_10_agg_adapt_to_ufixed_cast_x_b <= dupName_12_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_0_dsdk_ip_array_adapt_bitjoin_x(BITJOIN,9)
    dupName_0_dsdk_ip_array_adapt_bitjoin_x_q <= dupName_16_agg_adapt_to_ufixed_cast_x_b & dupName_13_agg_adapt_to_ufixed_cast_x_b & dupName_10_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_17_agg_adapt_to_ufixed_cast_x(BITSELECT,86)
    dupName_17_agg_adapt_to_ufixed_cast_x_b <= dupName_0_dsdk_ip_array_adapt_bitjoin_x_q(23 downto 0);

    -- dupName_11_dsdk_ip_adapt_bitjoin_x(BITJOIN,63)
    dupName_11_dsdk_ip_adapt_bitjoin_x_q <= dupName_17_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_18_agg_adapt_to_ufixed_cast_x(BITSELECT,89)
    dupName_18_agg_adapt_to_ufixed_cast_x_b <= dupName_11_dsdk_ip_adapt_bitjoin_x_q(23 downto 0);

    -- dupName_10_dsdk_ip_adapt_bitjoin_x(BITJOIN,59)
    dupName_10_dsdk_ip_adapt_bitjoin_x_q <= dupName_24_agg_adapt_to_ufixed_cast_x_b & dupName_21_agg_adapt_to_ufixed_cast_x_b & dupName_18_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_25_agg_adapt_to_ufixed_cast_x(BITSELECT,110)
    dupName_25_agg_adapt_to_ufixed_cast_x_b <= dupName_10_dsdk_ip_adapt_bitjoin_x_q(39 downto 0);

    -- dsdk_ip_array_adapt_bitjoin(BITJOIN,294)
    dsdk_ip_array_adapt_bitjoin_q <= dupName_61_agg_adapt_to_ufixed_cast_x_b & dupName_43_agg_adapt_to_ufixed_cast_x_b & dupName_25_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_62_agg_adapt_to_ufixed_cast_x(BITSELECT,221)
    dupName_62_agg_adapt_to_ufixed_cast_x_b <= dsdk_ip_array_adapt_bitjoin_q(119 downto 0);

    -- dupName_0_c_i2_0gr_x(CONSTANT,6)
    dupName_0_c_i2_0gr_x_q <= "00";

    -- dupName_2_element_extension_x(BITJOIN,24)
    dupName_2_element_extension_x_q <= dupName_0_c_i2_0gr_x_q & in_data_in_3;

    -- dupName_9_dsdk_ip_adapt_bitjoin_x(BITJOIN,55)
    dupName_9_dsdk_ip_adapt_bitjoin_x_q <= dupName_2_element_extension_x_q;

    -- dupName_5_agg_adapt_to_ufixed_cast_x(BITSELECT,38)
    dupName_5_agg_adapt_to_ufixed_cast_x_b <= dupName_9_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_8_dsdk_ip_adapt_bitjoin_x(BITJOIN,51)
    dupName_8_dsdk_ip_adapt_bitjoin_x_q <= dupName_5_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_6_agg_adapt_to_ufixed_cast_x(BITSELECT,42)
    dupName_6_agg_adapt_to_ufixed_cast_x_b <= dupName_8_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_7_dsdk_ip_adapt_bitjoin_x(BITJOIN,47)
    dupName_7_dsdk_ip_adapt_bitjoin_x_q <= dupName_6_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_7_agg_adapt_to_ufixed_cast_x(BITSELECT,46)
    dupName_7_agg_adapt_to_ufixed_cast_x_b <= dupName_7_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_1_element_extension_x(BITJOIN,17)
    dupName_1_element_extension_x_q <= dupName_0_c_i2_0gr_x_q & in_data_in_2;

    -- dupName_6_dsdk_ip_adapt_bitjoin_x(BITJOIN,43)
    dupName_6_dsdk_ip_adapt_bitjoin_x_q <= dupName_1_element_extension_x_q;

    -- dupName_2_agg_adapt_to_ufixed_cast_x(BITSELECT,21)
    dupName_2_agg_adapt_to_ufixed_cast_x_b <= dupName_6_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_5_dsdk_ip_adapt_bitjoin_x(BITJOIN,39)
    dupName_5_dsdk_ip_adapt_bitjoin_x_q <= dupName_2_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_3_agg_adapt_to_ufixed_cast_x(BITSELECT,28)
    dupName_3_agg_adapt_to_ufixed_cast_x_b <= dupName_5_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_4_dsdk_ip_adapt_bitjoin_x(BITJOIN,35)
    dupName_4_dsdk_ip_adapt_bitjoin_x_q <= dupName_3_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_4_agg_adapt_to_ufixed_cast_x(BITSELECT,34)
    dupName_4_agg_adapt_to_ufixed_cast_x_b <= dupName_4_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- c_i6_0gr(CONSTANT,291)
    c_i6_0gr_q <= "000000";

    -- dupName_0_element_extension_x(BITJOIN,10)
    dupName_0_element_extension_x_q <= c_i6_0gr_q & in_data_in_1;

    -- dupName_3_dsdk_ip_adapt_bitjoin_x(BITJOIN,29)
    dupName_3_dsdk_ip_adapt_bitjoin_x_q <= dupName_0_element_extension_x_q;

    -- agg_adapt_to_ufixed_cast(BITSELECT,289)
    agg_adapt_to_ufixed_cast_b <= dupName_3_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_2_dsdk_ip_adapt_bitjoin_x(BITJOIN,22)
    dupName_2_dsdk_ip_adapt_bitjoin_x_q <= agg_adapt_to_ufixed_cast_b;

    -- dupName_0_agg_adapt_to_ufixed_cast_x(BITSELECT,5)
    dupName_0_agg_adapt_to_ufixed_cast_x_b <= dupName_2_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_1_dsdk_ip_adapt_bitjoin_x(BITJOIN,15)
    dupName_1_dsdk_ip_adapt_bitjoin_x_q <= dupName_0_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_1_agg_adapt_to_ufixed_cast_x(BITSELECT,14)
    dupName_1_agg_adapt_to_ufixed_cast_x_b <= dupName_1_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_0_dsdk_ip_adapt_bitjoin_x(BITJOIN,8)
    dupName_0_dsdk_ip_adapt_bitjoin_x_q <= dupName_76_agg_adapt_to_ufixed_cast_x_b & dupName_73_agg_adapt_to_ufixed_cast_x_b & dupName_62_agg_adapt_to_ufixed_cast_x_b & dupName_7_agg_adapt_to_ufixed_cast_x_b & dupName_4_agg_adapt_to_ufixed_cast_x_b & dupName_1_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_77_agg_adapt_to_ufixed_cast_x(BITSELECT,263)
    dupName_77_agg_adapt_to_ufixed_cast_x_b <= dupName_0_dsdk_ip_adapt_bitjoin_x_q(175 downto 0);

    -- element_extension(BITJOIN,295)
    element_extension_q <= dupName_0_c_i7_0gr_x_q & in_data_in_0;

    -- dsdk_ip_adapt_bitjoin(BITJOIN,293)
    dsdk_ip_adapt_bitjoin_q <= dupName_77_agg_adapt_to_ufixed_cast_x_b & element_extension_q;

    -- i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892(EXTIFACE,296)
    i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892_data_in <= dsdk_ip_adapt_bitjoin_q;
    i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892_stall_in <= in_stall_in;
    i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892_valid_in <= in_valid_in;
    i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892_stall_in_bitsignaltemp <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892_stall_in(0);
    i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892_valid_in_bitsignaltemp <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892_valid_in(0);
    i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892_stall_out(0) <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892_stall_out_bitsignaltemp;
    i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892_valid_out(0) <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892_valid_out_bitsignaltemp;
    thei_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892 : acl_data_fifo
    GENERIC MAP (
        DEPTH => 128,
        ALLOW_FULL_WRITE => 1,
        DATA_WIDTH => 184,
        IMPL => "ram"
    )
    PORT MAP (
        data_in => dsdk_ip_adapt_bitjoin_q,
        stall_in => i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892_stall_in_bitsignaltemp,
        valid_in => i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892_valid_in_bitsignaltemp,
        data_out => i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892_data_out,
        stall_out => i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892_stall_out_bitsignaltemp,
        valid_out => i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892_valid_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ip_dsdk_adapt_bitselect_x(BITSELECT,11)
    dupName_0_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892_data_out(183 downto 8);

    -- dupName_97_ip_dsdk_adapt_bitselect_x(BITSELECT,284)
    dupName_97_ip_dsdk_adapt_bitselect_x_b <= dupName_0_ip_dsdk_adapt_bitselect_x_b(175 downto 168);

    -- dupName_98_ip_dsdk_adapt_bitselect_x(BITSELECT,285)
    dupName_98_ip_dsdk_adapt_bitselect_x_b <= dupName_97_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_99_ip_dsdk_adapt_bitselect_x(BITSELECT,286)
    dupName_99_ip_dsdk_adapt_bitselect_x_b <= dupName_98_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_100_ip_dsdk_adapt_bitselect_x(BITSELECT,287)
    dupName_100_ip_dsdk_adapt_bitselect_x_b <= dupName_99_ip_dsdk_adapt_bitselect_x_b(0 downto 0);

    -- dupName_3_adapt_scalar_trunc_x(ROUND,27)
    dupName_3_adapt_scalar_trunc_x_in <= dupName_100_ip_dsdk_adapt_bitselect_x_b;
    dupName_3_adapt_scalar_trunc_x_q <= dupName_3_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_83_ip_dsdk_adapt_bitselect_x(BITSELECT,270)
    dupName_83_ip_dsdk_adapt_bitselect_x_b <= dupName_0_ip_dsdk_adapt_bitselect_x_b(167 downto 144);

    -- dupName_84_ip_dsdk_adapt_bitselect_x(BITSELECT,271)
    dupName_84_ip_dsdk_adapt_bitselect_x_b <= dupName_83_ip_dsdk_adapt_bitselect_x_b(23 downto 0);

    -- dupName_93_ip_dsdk_adapt_bitselect_x(BITSELECT,280)
    dupName_93_ip_dsdk_adapt_bitselect_x_b <= dupName_84_ip_dsdk_adapt_bitselect_x_b(23 downto 16);

    -- dupName_94_ip_dsdk_adapt_bitselect_x(BITSELECT,281)
    dupName_94_ip_dsdk_adapt_bitselect_x_b <= dupName_93_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_95_ip_dsdk_adapt_bitselect_x(BITSELECT,282)
    dupName_95_ip_dsdk_adapt_bitselect_x_b <= dupName_94_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_96_ip_dsdk_adapt_bitselect_x(BITSELECT,283)
    dupName_96_ip_dsdk_adapt_bitselect_x_b <= dupName_95_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_16_ip_dsdk_adapt_cast_x(BITSELECT,85)
    dupName_16_ip_dsdk_adapt_cast_x_b <= dupName_96_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_89_ip_dsdk_adapt_bitselect_x(BITSELECT,276)
    dupName_89_ip_dsdk_adapt_bitselect_x_b <= dupName_84_ip_dsdk_adapt_bitselect_x_b(15 downto 8);

    -- dupName_90_ip_dsdk_adapt_bitselect_x(BITSELECT,277)
    dupName_90_ip_dsdk_adapt_bitselect_x_b <= dupName_89_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_91_ip_dsdk_adapt_bitselect_x(BITSELECT,278)
    dupName_91_ip_dsdk_adapt_bitselect_x_b <= dupName_90_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_92_ip_dsdk_adapt_bitselect_x(BITSELECT,279)
    dupName_92_ip_dsdk_adapt_bitselect_x_b <= dupName_91_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_15_ip_dsdk_adapt_cast_x(BITSELECT,81)
    dupName_15_ip_dsdk_adapt_cast_x_b <= dupName_92_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_85_ip_dsdk_adapt_bitselect_x(BITSELECT,272)
    dupName_85_ip_dsdk_adapt_bitselect_x_b <= dupName_84_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_86_ip_dsdk_adapt_bitselect_x(BITSELECT,273)
    dupName_86_ip_dsdk_adapt_bitselect_x_b <= dupName_85_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_87_ip_dsdk_adapt_bitselect_x(BITSELECT,274)
    dupName_87_ip_dsdk_adapt_bitselect_x_b <= dupName_86_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_88_ip_dsdk_adapt_bitselect_x(BITSELECT,275)
    dupName_88_ip_dsdk_adapt_bitselect_x_b <= dupName_87_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_14_ip_dsdk_adapt_cast_x(BITSELECT,77)
    dupName_14_ip_dsdk_adapt_cast_x_b <= dupName_88_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_13_ip_dsdk_adapt_bitselect_x(BITSELECT,72)
    dupName_13_ip_dsdk_adapt_bitselect_x_b <= dupName_0_ip_dsdk_adapt_bitselect_x_b(143 downto 24);

    -- dupName_60_ip_dsdk_adapt_bitselect_x(BITSELECT,217)
    dupName_60_ip_dsdk_adapt_bitselect_x_b <= dupName_13_ip_dsdk_adapt_bitselect_x_b(119 downto 80);

    -- dupName_79_ip_dsdk_adapt_bitselect_x(BITSELECT,266)
    dupName_79_ip_dsdk_adapt_bitselect_x_b <= dupName_60_ip_dsdk_adapt_bitselect_x_b(39 downto 32);

    -- dupName_80_ip_dsdk_adapt_bitselect_x(BITSELECT,267)
    dupName_80_ip_dsdk_adapt_bitselect_x_b <= dupName_79_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_81_ip_dsdk_adapt_bitselect_x(BITSELECT,268)
    dupName_81_ip_dsdk_adapt_bitselect_x_b <= dupName_80_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_82_ip_dsdk_adapt_bitselect_x(BITSELECT,269)
    dupName_82_ip_dsdk_adapt_bitselect_x_b <= dupName_81_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_13_ip_dsdk_adapt_cast_x(BITSELECT,73)
    dupName_13_ip_dsdk_adapt_cast_x_b <= dupName_82_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_75_ip_dsdk_adapt_bitselect_x(BITSELECT,260)
    dupName_75_ip_dsdk_adapt_bitselect_x_b <= dupName_60_ip_dsdk_adapt_bitselect_x_b(31 downto 24);

    -- dupName_76_ip_dsdk_adapt_bitselect_x(BITSELECT,262)
    dupName_76_ip_dsdk_adapt_bitselect_x_b <= dupName_75_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_77_ip_dsdk_adapt_bitselect_x(BITSELECT,264)
    dupName_77_ip_dsdk_adapt_bitselect_x_b <= dupName_76_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_78_ip_dsdk_adapt_bitselect_x(BITSELECT,265)
    dupName_78_ip_dsdk_adapt_bitselect_x_b <= dupName_77_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_12_ip_dsdk_adapt_cast_x(BITSELECT,69)
    dupName_12_ip_dsdk_adapt_cast_x_b <= dupName_78_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_61_ip_dsdk_adapt_bitselect_x(BITSELECT,220)
    dupName_61_ip_dsdk_adapt_bitselect_x_b <= dupName_60_ip_dsdk_adapt_bitselect_x_b(23 downto 0);

    -- dupName_62_ip_dsdk_adapt_bitselect_x(BITSELECT,223)
    dupName_62_ip_dsdk_adapt_bitselect_x_b <= dupName_61_ip_dsdk_adapt_bitselect_x_b(23 downto 0);

    -- dupName_71_ip_dsdk_adapt_bitselect_x(BITSELECT,250)
    dupName_71_ip_dsdk_adapt_bitselect_x_b <= dupName_62_ip_dsdk_adapt_bitselect_x_b(23 downto 16);

    -- dupName_72_ip_dsdk_adapt_bitselect_x(BITSELECT,253)
    dupName_72_ip_dsdk_adapt_bitselect_x_b <= dupName_71_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_73_ip_dsdk_adapt_bitselect_x(BITSELECT,256)
    dupName_73_ip_dsdk_adapt_bitselect_x_b <= dupName_72_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_74_ip_dsdk_adapt_bitselect_x(BITSELECT,258)
    dupName_74_ip_dsdk_adapt_bitselect_x_b <= dupName_73_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_11_ip_dsdk_adapt_cast_x(BITSELECT,65)
    dupName_11_ip_dsdk_adapt_cast_x_b <= dupName_74_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_67_ip_dsdk_adapt_bitselect_x(BITSELECT,238)
    dupName_67_ip_dsdk_adapt_bitselect_x_b <= dupName_62_ip_dsdk_adapt_bitselect_x_b(15 downto 8);

    -- dupName_68_ip_dsdk_adapt_bitselect_x(BITSELECT,241)
    dupName_68_ip_dsdk_adapt_bitselect_x_b <= dupName_67_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_69_ip_dsdk_adapt_bitselect_x(BITSELECT,244)
    dupName_69_ip_dsdk_adapt_bitselect_x_b <= dupName_68_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_70_ip_dsdk_adapt_bitselect_x(BITSELECT,247)
    dupName_70_ip_dsdk_adapt_bitselect_x_b <= dupName_69_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_10_ip_dsdk_adapt_cast_x(BITSELECT,61)
    dupName_10_ip_dsdk_adapt_cast_x_b <= dupName_70_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_63_ip_dsdk_adapt_bitselect_x(BITSELECT,226)
    dupName_63_ip_dsdk_adapt_bitselect_x_b <= dupName_62_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_64_ip_dsdk_adapt_bitselect_x(BITSELECT,229)
    dupName_64_ip_dsdk_adapt_bitselect_x_b <= dupName_63_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_65_ip_dsdk_adapt_bitselect_x(BITSELECT,232)
    dupName_65_ip_dsdk_adapt_bitselect_x_b <= dupName_64_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_66_ip_dsdk_adapt_bitselect_x(BITSELECT,235)
    dupName_66_ip_dsdk_adapt_bitselect_x_b <= dupName_65_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_9_ip_dsdk_adapt_cast_x(BITSELECT,57)
    dupName_9_ip_dsdk_adapt_cast_x_b <= dupName_66_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_37_ip_dsdk_adapt_bitselect_x(BITSELECT,148)
    dupName_37_ip_dsdk_adapt_bitselect_x_b <= dupName_13_ip_dsdk_adapt_bitselect_x_b(79 downto 40);

    -- dupName_56_ip_dsdk_adapt_bitselect_x(BITSELECT,205)
    dupName_56_ip_dsdk_adapt_bitselect_x_b <= dupName_37_ip_dsdk_adapt_bitselect_x_b(39 downto 32);

    -- dupName_57_ip_dsdk_adapt_bitselect_x(BITSELECT,208)
    dupName_57_ip_dsdk_adapt_bitselect_x_b <= dupName_56_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_58_ip_dsdk_adapt_bitselect_x(BITSELECT,211)
    dupName_58_ip_dsdk_adapt_bitselect_x_b <= dupName_57_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_59_ip_dsdk_adapt_bitselect_x(BITSELECT,214)
    dupName_59_ip_dsdk_adapt_bitselect_x_b <= dupName_58_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_8_ip_dsdk_adapt_cast_x(BITSELECT,53)
    dupName_8_ip_dsdk_adapt_cast_x_b <= dupName_59_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_52_ip_dsdk_adapt_bitselect_x(BITSELECT,193)
    dupName_52_ip_dsdk_adapt_bitselect_x_b <= dupName_37_ip_dsdk_adapt_bitselect_x_b(31 downto 24);

    -- dupName_53_ip_dsdk_adapt_bitselect_x(BITSELECT,196)
    dupName_53_ip_dsdk_adapt_bitselect_x_b <= dupName_52_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_54_ip_dsdk_adapt_bitselect_x(BITSELECT,199)
    dupName_54_ip_dsdk_adapt_bitselect_x_b <= dupName_53_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_55_ip_dsdk_adapt_bitselect_x(BITSELECT,202)
    dupName_55_ip_dsdk_adapt_bitselect_x_b <= dupName_54_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_7_ip_dsdk_adapt_cast_x(BITSELECT,49)
    dupName_7_ip_dsdk_adapt_cast_x_b <= dupName_55_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_38_ip_dsdk_adapt_bitselect_x(BITSELECT,151)
    dupName_38_ip_dsdk_adapt_bitselect_x_b <= dupName_37_ip_dsdk_adapt_bitselect_x_b(23 downto 0);

    -- dupName_39_ip_dsdk_adapt_bitselect_x(BITSELECT,154)
    dupName_39_ip_dsdk_adapt_bitselect_x_b <= dupName_38_ip_dsdk_adapt_bitselect_x_b(23 downto 0);

    -- dupName_48_ip_dsdk_adapt_bitselect_x(BITSELECT,181)
    dupName_48_ip_dsdk_adapt_bitselect_x_b <= dupName_39_ip_dsdk_adapt_bitselect_x_b(23 downto 16);

    -- dupName_49_ip_dsdk_adapt_bitselect_x(BITSELECT,184)
    dupName_49_ip_dsdk_adapt_bitselect_x_b <= dupName_48_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_50_ip_dsdk_adapt_bitselect_x(BITSELECT,187)
    dupName_50_ip_dsdk_adapt_bitselect_x_b <= dupName_49_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_51_ip_dsdk_adapt_bitselect_x(BITSELECT,190)
    dupName_51_ip_dsdk_adapt_bitselect_x_b <= dupName_50_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_6_ip_dsdk_adapt_cast_x(BITSELECT,45)
    dupName_6_ip_dsdk_adapt_cast_x_b <= dupName_51_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_44_ip_dsdk_adapt_bitselect_x(BITSELECT,169)
    dupName_44_ip_dsdk_adapt_bitselect_x_b <= dupName_39_ip_dsdk_adapt_bitselect_x_b(15 downto 8);

    -- dupName_45_ip_dsdk_adapt_bitselect_x(BITSELECT,172)
    dupName_45_ip_dsdk_adapt_bitselect_x_b <= dupName_44_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_46_ip_dsdk_adapt_bitselect_x(BITSELECT,175)
    dupName_46_ip_dsdk_adapt_bitselect_x_b <= dupName_45_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_47_ip_dsdk_adapt_bitselect_x(BITSELECT,178)
    dupName_47_ip_dsdk_adapt_bitselect_x_b <= dupName_46_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_5_ip_dsdk_adapt_cast_x(BITSELECT,41)
    dupName_5_ip_dsdk_adapt_cast_x_b <= dupName_47_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_40_ip_dsdk_adapt_bitselect_x(BITSELECT,157)
    dupName_40_ip_dsdk_adapt_bitselect_x_b <= dupName_39_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_41_ip_dsdk_adapt_bitselect_x(BITSELECT,160)
    dupName_41_ip_dsdk_adapt_bitselect_x_b <= dupName_40_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_42_ip_dsdk_adapt_bitselect_x(BITSELECT,163)
    dupName_42_ip_dsdk_adapt_bitselect_x_b <= dupName_41_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_43_ip_dsdk_adapt_bitselect_x(BITSELECT,166)
    dupName_43_ip_dsdk_adapt_bitselect_x_b <= dupName_42_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_4_ip_dsdk_adapt_cast_x(BITSELECT,37)
    dupName_4_ip_dsdk_adapt_cast_x_b <= dupName_43_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_14_ip_dsdk_adapt_bitselect_x(BITSELECT,76)
    dupName_14_ip_dsdk_adapt_bitselect_x_b <= dupName_13_ip_dsdk_adapt_bitselect_x_b(39 downto 0);

    -- dupName_33_ip_dsdk_adapt_bitselect_x(BITSELECT,136)
    dupName_33_ip_dsdk_adapt_bitselect_x_b <= dupName_14_ip_dsdk_adapt_bitselect_x_b(39 downto 32);

    -- dupName_34_ip_dsdk_adapt_bitselect_x(BITSELECT,139)
    dupName_34_ip_dsdk_adapt_bitselect_x_b <= dupName_33_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_35_ip_dsdk_adapt_bitselect_x(BITSELECT,142)
    dupName_35_ip_dsdk_adapt_bitselect_x_b <= dupName_34_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_36_ip_dsdk_adapt_bitselect_x(BITSELECT,145)
    dupName_36_ip_dsdk_adapt_bitselect_x_b <= dupName_35_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_3_ip_dsdk_adapt_cast_x(BITSELECT,33)
    dupName_3_ip_dsdk_adapt_cast_x_b <= dupName_36_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_29_ip_dsdk_adapt_bitselect_x(BITSELECT,124)
    dupName_29_ip_dsdk_adapt_bitselect_x_b <= dupName_14_ip_dsdk_adapt_bitselect_x_b(31 downto 24);

    -- dupName_30_ip_dsdk_adapt_bitselect_x(BITSELECT,127)
    dupName_30_ip_dsdk_adapt_bitselect_x_b <= dupName_29_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_31_ip_dsdk_adapt_bitselect_x(BITSELECT,130)
    dupName_31_ip_dsdk_adapt_bitselect_x_b <= dupName_30_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_32_ip_dsdk_adapt_bitselect_x(BITSELECT,133)
    dupName_32_ip_dsdk_adapt_bitselect_x_b <= dupName_31_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_2_ip_dsdk_adapt_cast_x(BITSELECT,26)
    dupName_2_ip_dsdk_adapt_cast_x_b <= dupName_32_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_15_ip_dsdk_adapt_bitselect_x(BITSELECT,80)
    dupName_15_ip_dsdk_adapt_bitselect_x_b <= dupName_14_ip_dsdk_adapt_bitselect_x_b(23 downto 0);

    -- dupName_16_ip_dsdk_adapt_bitselect_x(BITSELECT,84)
    dupName_16_ip_dsdk_adapt_bitselect_x_b <= dupName_15_ip_dsdk_adapt_bitselect_x_b(23 downto 0);

    -- dupName_25_ip_dsdk_adapt_bitselect_x(BITSELECT,112)
    dupName_25_ip_dsdk_adapt_bitselect_x_b <= dupName_16_ip_dsdk_adapt_bitselect_x_b(23 downto 16);

    -- dupName_26_ip_dsdk_adapt_bitselect_x(BITSELECT,115)
    dupName_26_ip_dsdk_adapt_bitselect_x_b <= dupName_25_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_27_ip_dsdk_adapt_bitselect_x(BITSELECT,118)
    dupName_27_ip_dsdk_adapt_bitselect_x_b <= dupName_26_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_28_ip_dsdk_adapt_bitselect_x(BITSELECT,121)
    dupName_28_ip_dsdk_adapt_bitselect_x_b <= dupName_27_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_1_ip_dsdk_adapt_cast_x(BITSELECT,19)
    dupName_1_ip_dsdk_adapt_cast_x_b <= dupName_28_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_21_ip_dsdk_adapt_bitselect_x(BITSELECT,100)
    dupName_21_ip_dsdk_adapt_bitselect_x_b <= dupName_16_ip_dsdk_adapt_bitselect_x_b(15 downto 8);

    -- dupName_22_ip_dsdk_adapt_bitselect_x(BITSELECT,103)
    dupName_22_ip_dsdk_adapt_bitselect_x_b <= dupName_21_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_23_ip_dsdk_adapt_bitselect_x(BITSELECT,106)
    dupName_23_ip_dsdk_adapt_bitselect_x_b <= dupName_22_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_24_ip_dsdk_adapt_bitselect_x(BITSELECT,109)
    dupName_24_ip_dsdk_adapt_bitselect_x_b <= dupName_23_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_0_ip_dsdk_adapt_cast_x(BITSELECT,12)
    dupName_0_ip_dsdk_adapt_cast_x_b <= dupName_24_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_17_ip_dsdk_adapt_bitselect_x(BITSELECT,88)
    dupName_17_ip_dsdk_adapt_bitselect_x_b <= dupName_16_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_18_ip_dsdk_adapt_bitselect_x(BITSELECT,91)
    dupName_18_ip_dsdk_adapt_bitselect_x_b <= dupName_17_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_19_ip_dsdk_adapt_bitselect_x(BITSELECT,94)
    dupName_19_ip_dsdk_adapt_bitselect_x_b <= dupName_18_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_20_ip_dsdk_adapt_bitselect_x(BITSELECT,97)
    dupName_20_ip_dsdk_adapt_bitselect_x_b <= dupName_19_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- ip_dsdk_adapt_cast(BITSELECT,298)
    ip_dsdk_adapt_cast_b <= dupName_20_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_9_ip_dsdk_adapt_bitselect_x(BITSELECT,56)
    dupName_9_ip_dsdk_adapt_bitselect_x_b <= dupName_0_ip_dsdk_adapt_bitselect_x_b(23 downto 16);

    -- dupName_10_ip_dsdk_adapt_bitselect_x(BITSELECT,60)
    dupName_10_ip_dsdk_adapt_bitselect_x_b <= dupName_9_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_11_ip_dsdk_adapt_bitselect_x(BITSELECT,64)
    dupName_11_ip_dsdk_adapt_bitselect_x_b <= dupName_10_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_12_ip_dsdk_adapt_bitselect_x(BITSELECT,68)
    dupName_12_ip_dsdk_adapt_bitselect_x_b <= dupName_11_ip_dsdk_adapt_bitselect_x_b(5 downto 0);

    -- dupName_2_adapt_scalar_trunc_x(ROUND,20)
    dupName_2_adapt_scalar_trunc_x_in <= dupName_12_ip_dsdk_adapt_bitselect_x_b;
    dupName_2_adapt_scalar_trunc_x_q <= dupName_2_adapt_scalar_trunc_x_in(5 downto 0);

    -- dupName_5_ip_dsdk_adapt_bitselect_x(BITSELECT,40)
    dupName_5_ip_dsdk_adapt_bitselect_x_b <= dupName_0_ip_dsdk_adapt_bitselect_x_b(15 downto 8);

    -- dupName_6_ip_dsdk_adapt_bitselect_x(BITSELECT,44)
    dupName_6_ip_dsdk_adapt_bitselect_x_b <= dupName_5_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_7_ip_dsdk_adapt_bitselect_x(BITSELECT,48)
    dupName_7_ip_dsdk_adapt_bitselect_x_b <= dupName_6_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_8_ip_dsdk_adapt_bitselect_x(BITSELECT,52)
    dupName_8_ip_dsdk_adapt_bitselect_x_b <= dupName_7_ip_dsdk_adapt_bitselect_x_b(5 downto 0);

    -- dupName_1_adapt_scalar_trunc_x(ROUND,13)
    dupName_1_adapt_scalar_trunc_x_in <= dupName_8_ip_dsdk_adapt_bitselect_x_b;
    dupName_1_adapt_scalar_trunc_x_q <= dupName_1_adapt_scalar_trunc_x_in(5 downto 0);

    -- dupName_1_ip_dsdk_adapt_bitselect_x(BITSELECT,18)
    dupName_1_ip_dsdk_adapt_bitselect_x_b <= dupName_0_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_2_ip_dsdk_adapt_bitselect_x(BITSELECT,25)
    dupName_2_ip_dsdk_adapt_bitselect_x_b <= dupName_1_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_3_ip_dsdk_adapt_bitselect_x(BITSELECT,32)
    dupName_3_ip_dsdk_adapt_bitselect_x_b <= dupName_2_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_4_ip_dsdk_adapt_bitselect_x(BITSELECT,36)
    dupName_4_ip_dsdk_adapt_bitselect_x_b <= dupName_3_ip_dsdk_adapt_bitselect_x_b(1 downto 0);

    -- dupName_0_adapt_scalar_trunc_x(ROUND,4)
    dupName_0_adapt_scalar_trunc_x_in <= dupName_4_ip_dsdk_adapt_bitselect_x_b;
    dupName_0_adapt_scalar_trunc_x_q <= dupName_0_adapt_scalar_trunc_x_in(1 downto 0);

    -- ip_dsdk_adapt_bitselect(BITSELECT,297)
    ip_dsdk_adapt_bitselect_b <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892_data_out(0 downto 0);

    -- adapt_scalar_trunc(ROUND,288)
    adapt_scalar_trunc_in <= ip_dsdk_adapt_bitselect_b;
    adapt_scalar_trunc_q <= adapt_scalar_trunc_in(0 downto 0);

    -- dupName_0_sync_out_aunroll_x(GPOUT,3)@20000003
    out_data_out_0 <= adapt_scalar_trunc_q;
    out_data_out_1 <= dupName_0_adapt_scalar_trunc_x_q;
    out_data_out_2 <= dupName_1_adapt_scalar_trunc_x_q;
    out_data_out_3 <= dupName_2_adapt_scalar_trunc_x_q;
    out_data_out_4 <= ip_dsdk_adapt_cast_b;
    out_data_out_5 <= dupName_0_ip_dsdk_adapt_cast_x_b;
    out_data_out_6 <= dupName_1_ip_dsdk_adapt_cast_x_b;
    out_data_out_7 <= dupName_2_ip_dsdk_adapt_cast_x_b;
    out_data_out_8 <= dupName_3_ip_dsdk_adapt_cast_x_b;
    out_data_out_9 <= dupName_4_ip_dsdk_adapt_cast_x_b;
    out_data_out_10 <= dupName_5_ip_dsdk_adapt_cast_x_b;
    out_data_out_11 <= dupName_6_ip_dsdk_adapt_cast_x_b;
    out_data_out_12 <= dupName_7_ip_dsdk_adapt_cast_x_b;
    out_data_out_13 <= dupName_8_ip_dsdk_adapt_cast_x_b;
    out_data_out_14 <= dupName_9_ip_dsdk_adapt_cast_x_b;
    out_data_out_15 <= dupName_10_ip_dsdk_adapt_cast_x_b;
    out_data_out_16 <= dupName_11_ip_dsdk_adapt_cast_x_b;
    out_data_out_17 <= dupName_12_ip_dsdk_adapt_cast_x_b;
    out_data_out_18 <= dupName_13_ip_dsdk_adapt_cast_x_b;
    out_data_out_19 <= dupName_14_ip_dsdk_adapt_cast_x_b;
    out_data_out_20 <= dupName_15_ip_dsdk_adapt_cast_x_b;
    out_data_out_21 <= dupName_16_ip_dsdk_adapt_cast_x_b;
    out_data_out_22 <= dupName_3_adapt_scalar_trunc_x_q;
    out_valid_out <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892_valid_out;

    -- sync_out(GPOUT,300)@20000000
    out_stall_out <= i_acl_sfc_exit_c0_for_end781_loopexit_loopexit_gmm_substract_c0_exit2835_gmm_substract2892_stall_out;

END normal;
