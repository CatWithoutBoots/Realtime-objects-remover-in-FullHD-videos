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

-- VHDL created from i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract2881
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

entity i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract2881 is
    port (
        in_i_data_0 : in std_logic_vector(1 downto 0);  -- ufix2
        in_i_data_1 : in std_logic_vector(5 downto 0);  -- ufix6
        in_i_data_2 : in std_logic_vector(5 downto 0);  -- ufix6
        in_i_data_3 : in std_logic_vector(7 downto 0);  -- ufix8
        in_i_data_4 : in std_logic_vector(7 downto 0);  -- ufix8
        in_i_data_5 : in std_logic_vector(7 downto 0);  -- ufix8
        in_i_data_6 : in std_logic_vector(7 downto 0);  -- ufix8
        in_i_data_7 : in std_logic_vector(7 downto 0);  -- ufix8
        in_i_data_8 : in std_logic_vector(7 downto 0);  -- ufix8
        in_i_data_9 : in std_logic_vector(7 downto 0);  -- ufix8
        in_i_data_10 : in std_logic_vector(7 downto 0);  -- ufix8
        in_i_data_11 : in std_logic_vector(7 downto 0);  -- ufix8
        in_i_data_12 : in std_logic_vector(7 downto 0);  -- ufix8
        in_i_data_13 : in std_logic_vector(7 downto 0);  -- ufix8
        in_i_data_14 : in std_logic_vector(7 downto 0);  -- ufix8
        in_i_data_15 : in std_logic_vector(7 downto 0);  -- ufix8
        in_i_data_16 : in std_logic_vector(7 downto 0);  -- ufix8
        in_i_data_17 : in std_logic_vector(7 downto 0);  -- ufix8
        in_i_data_18 : in std_logic_vector(7 downto 0);  -- ufix8
        in_i_data_19 : in std_logic_vector(7 downto 0);  -- ufix8
        in_i_data_20 : in std_logic_vector(7 downto 0);  -- ufix8
        in_i_data_21 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_iowr_bl_src_o_fifovalid : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_ack : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        in_iowr_bl_src_i_fifoready : in std_logic_vector(0 downto 0);  -- ufix1
        out_iowr_bl_src_o_fifodata : out std_logic_vector(175 downto 0);  -- ufix176
        in_i_stall : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_stall : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract2881;

architecture normal of i_iowr_bl_src_unnamed_gmm_substract117_gmm_substract2881 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component st_write is
        generic (
            DATA_WIDTH : INTEGER := 176;
            DELAY_READY : INTEGER := 0;
            ENABLED : INTEGER := 0;
            NON_BLOCKING : INTEGER := 0
        );
        port (
            i_data : in std_logic_vector(175 downto 0);
            i_endofpacket : in std_logic;
            i_fifoready : in std_logic;
            i_fifosize : in std_logic_vector(31 downto 0);
            i_predicate : in std_logic;
            i_stall : in std_logic;
            i_startofpacket : in std_logic;
            i_valid : in std_logic;
            o_ack : out std_logic;
            o_fifodata : out std_logic_vector(175 downto 0);
            o_fifovalid : out std_logic;
            o_stall : out std_logic;
            o_valid : out std_logic;
            profile_total_fifo_size_incr : out std_logic_vector(31 downto 0);
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_0_c_i2_0gr_x_q : STD_LOGIC_VECTOR (1 downto 0);
    signal dupName_0_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_0_dsdk_ip_array_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_0_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_1_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_1_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_1_dsdk_ip_array_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_1_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_2_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_2_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_2_dsdk_ip_array_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_2_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_3_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_3_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_3_dsdk_ip_array_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_4_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_4_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_5_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_5_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_6_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_6_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_7_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_7_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_8_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_8_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_9_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_9_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (39 downto 0);
    signal dupName_10_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_10_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_11_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_11_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_12_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_12_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_13_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_13_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_14_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_14_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_15_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_15_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_16_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_16_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_17_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_17_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_18_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_18_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_19_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_19_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_20_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_20_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_21_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_21_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_22_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_22_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_23_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_23_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_24_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_24_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_25_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (39 downto 0);
    signal dupName_25_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_26_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_26_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (39 downto 0);
    signal dupName_27_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_27_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_28_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_28_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_29_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_29_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_30_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_30_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_31_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_31_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_32_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_32_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_33_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_33_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_34_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_34_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_35_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_35_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_36_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_36_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_37_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_37_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_38_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_38_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_39_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_39_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_40_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_40_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_41_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_41_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_42_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_42_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_43_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (39 downto 0);
    signal dupName_43_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (39 downto 0);
    signal dupName_44_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_44_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_45_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_45_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_46_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_46_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_47_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_47_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_48_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_48_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_49_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_49_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_50_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_50_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_51_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_51_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_52_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_52_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_53_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_53_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_54_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_54_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_55_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_55_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_56_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_56_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_57_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_57_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_58_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_58_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_59_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_59_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_60_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_60_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_61_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (39 downto 0);
    signal dupName_61_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_62_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (119 downto 0);
    signal dupName_62_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_63_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_63_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_64_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_64_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_65_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_65_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_66_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_66_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_67_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_67_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_68_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_68_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_69_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_69_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_70_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_70_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_71_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_71_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_72_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_72_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_73_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_74_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_75_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_76_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal agg_adapt_to_ufixed_cast_b : STD_LOGIC_VECTOR (7 downto 0);
    signal c32_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i6_0gr_q : STD_LOGIC_VECTOR (5 downto 0);
    signal c_i7_0gr_q : STD_LOGIC_VECTOR (6 downto 0);
    signal dsdk_ip_adapt_bitjoin_q : STD_LOGIC_VECTOR (175 downto 0);
    signal dsdk_ip_array_adapt_bitjoin_q : STD_LOGIC_VECTOR (119 downto 0);
    signal element_extension_q : STD_LOGIC_VECTOR (7 downto 0);
    signal iowr_i_data : STD_LOGIC_VECTOR (175 downto 0);
    signal iowr_i_endofpacket : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_i_endofpacket_bitsignaltemp : std_logic;
    signal iowr_i_fifoready : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_i_fifoready_bitsignaltemp : std_logic;
    signal iowr_i_fifosize : STD_LOGIC_VECTOR (31 downto 0);
    signal iowr_i_predicate : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_i_predicate_bitsignaltemp : std_logic;
    signal iowr_i_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_i_stall_bitsignaltemp : std_logic;
    signal iowr_i_startofpacket : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_i_startofpacket_bitsignaltemp : std_logic;
    signal iowr_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_i_valid_bitsignaltemp : std_logic;
    signal iowr_o_ack : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_o_ack_bitsignaltemp : std_logic;
    signal iowr_o_fifodata : STD_LOGIC_VECTOR (175 downto 0);
    signal iowr_o_fifovalid : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_o_fifovalid_bitsignaltemp : std_logic;
    signal iowr_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_o_stall_bitsignaltemp : std_logic;
    signal iowr_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_o_valid_bitsignaltemp : std_logic;
    signal iowr_profile_total_fifo_size_incr : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- c32_0(CONSTANT,164)
    c32_0_q <= "00000000000000000000000000000000";

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- c_i7_0gr(CONSTANT,168)
    c_i7_0gr_q <= "0000000";

    -- dupName_2_element_extension_x(BITJOIN,17)
    dupName_2_element_extension_x_q <= c_i7_0gr_q & in_i_data_21;

    -- dupName_72_dsdk_ip_adapt_bitjoin_x(BITJOIN,158)
    dupName_72_dsdk_ip_adapt_bitjoin_x_q <= dupName_2_element_extension_x_q;

    -- dupName_74_agg_adapt_to_ufixed_cast_x(BITSELECT,160)
    dupName_74_agg_adapt_to_ufixed_cast_x_b <= dupName_72_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_71_dsdk_ip_adapt_bitjoin_x(BITJOIN,156)
    dupName_71_dsdk_ip_adapt_bitjoin_x_q <= dupName_74_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_75_agg_adapt_to_ufixed_cast_x(BITSELECT,161)
    dupName_75_agg_adapt_to_ufixed_cast_x_b <= dupName_71_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_70_dsdk_ip_adapt_bitjoin_x(BITJOIN,154)
    dupName_70_dsdk_ip_adapt_bitjoin_x_q <= dupName_75_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_76_agg_adapt_to_ufixed_cast_x(BITSELECT,162)
    dupName_76_agg_adapt_to_ufixed_cast_x_b <= dupName_70_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_69_dsdk_ip_adapt_bitjoin_x(BITJOIN,152)
    dupName_69_dsdk_ip_adapt_bitjoin_x_q <= in_i_data_20;

    -- dupName_69_agg_adapt_to_ufixed_cast_x(BITSELECT,151)
    dupName_69_agg_adapt_to_ufixed_cast_x_b <= dupName_69_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_68_dsdk_ip_adapt_bitjoin_x(BITJOIN,150)
    dupName_68_dsdk_ip_adapt_bitjoin_x_q <= dupName_69_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_70_agg_adapt_to_ufixed_cast_x(BITSELECT,153)
    dupName_70_agg_adapt_to_ufixed_cast_x_b <= dupName_68_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_67_dsdk_ip_adapt_bitjoin_x(BITJOIN,148)
    dupName_67_dsdk_ip_adapt_bitjoin_x_q <= dupName_70_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_71_agg_adapt_to_ufixed_cast_x(BITSELECT,155)
    dupName_71_agg_adapt_to_ufixed_cast_x_b <= dupName_67_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_66_dsdk_ip_adapt_bitjoin_x(BITJOIN,146)
    dupName_66_dsdk_ip_adapt_bitjoin_x_q <= in_i_data_19;

    -- dupName_66_agg_adapt_to_ufixed_cast_x(BITSELECT,145)
    dupName_66_agg_adapt_to_ufixed_cast_x_b <= dupName_66_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_65_dsdk_ip_adapt_bitjoin_x(BITJOIN,144)
    dupName_65_dsdk_ip_adapt_bitjoin_x_q <= dupName_66_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_67_agg_adapt_to_ufixed_cast_x(BITSELECT,147)
    dupName_67_agg_adapt_to_ufixed_cast_x_b <= dupName_65_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_64_dsdk_ip_adapt_bitjoin_x(BITJOIN,142)
    dupName_64_dsdk_ip_adapt_bitjoin_x_q <= dupName_67_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_68_agg_adapt_to_ufixed_cast_x(BITSELECT,149)
    dupName_68_agg_adapt_to_ufixed_cast_x_b <= dupName_64_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_63_dsdk_ip_adapt_bitjoin_x(BITJOIN,140)
    dupName_63_dsdk_ip_adapt_bitjoin_x_q <= in_i_data_18;

    -- dupName_63_agg_adapt_to_ufixed_cast_x(BITSELECT,139)
    dupName_63_agg_adapt_to_ufixed_cast_x_b <= dupName_63_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_62_dsdk_ip_adapt_bitjoin_x(BITJOIN,138)
    dupName_62_dsdk_ip_adapt_bitjoin_x_q <= dupName_63_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_64_agg_adapt_to_ufixed_cast_x(BITSELECT,141)
    dupName_64_agg_adapt_to_ufixed_cast_x_b <= dupName_62_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_61_dsdk_ip_adapt_bitjoin_x(BITJOIN,136)
    dupName_61_dsdk_ip_adapt_bitjoin_x_q <= dupName_64_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_65_agg_adapt_to_ufixed_cast_x(BITSELECT,143)
    dupName_65_agg_adapt_to_ufixed_cast_x_b <= dupName_61_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_3_dsdk_ip_array_adapt_bitjoin_x(BITJOIN,20)
    dupName_3_dsdk_ip_array_adapt_bitjoin_x_q <= dupName_71_agg_adapt_to_ufixed_cast_x_b & dupName_68_agg_adapt_to_ufixed_cast_x_b & dupName_65_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_72_agg_adapt_to_ufixed_cast_x(BITSELECT,157)
    dupName_72_agg_adapt_to_ufixed_cast_x_b <= dupName_3_dsdk_ip_array_adapt_bitjoin_x_q(23 downto 0);

    -- dupName_60_dsdk_ip_adapt_bitjoin_x(BITJOIN,134)
    dupName_60_dsdk_ip_adapt_bitjoin_x_q <= dupName_72_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_73_agg_adapt_to_ufixed_cast_x(BITSELECT,159)
    dupName_73_agg_adapt_to_ufixed_cast_x_b <= dupName_60_dsdk_ip_adapt_bitjoin_x_q(23 downto 0);

    -- dupName_59_dsdk_ip_adapt_bitjoin_x(BITJOIN,132)
    dupName_59_dsdk_ip_adapt_bitjoin_x_q <= in_i_data_17;

    -- dupName_58_agg_adapt_to_ufixed_cast_x(BITSELECT,129)
    dupName_58_agg_adapt_to_ufixed_cast_x_b <= dupName_59_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_58_dsdk_ip_adapt_bitjoin_x(BITJOIN,130)
    dupName_58_dsdk_ip_adapt_bitjoin_x_q <= dupName_58_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_59_agg_adapt_to_ufixed_cast_x(BITSELECT,131)
    dupName_59_agg_adapt_to_ufixed_cast_x_b <= dupName_58_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_57_dsdk_ip_adapt_bitjoin_x(BITJOIN,128)
    dupName_57_dsdk_ip_adapt_bitjoin_x_q <= dupName_59_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_60_agg_adapt_to_ufixed_cast_x(BITSELECT,133)
    dupName_60_agg_adapt_to_ufixed_cast_x_b <= dupName_57_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_56_dsdk_ip_adapt_bitjoin_x(BITJOIN,126)
    dupName_56_dsdk_ip_adapt_bitjoin_x_q <= in_i_data_16;

    -- dupName_55_agg_adapt_to_ufixed_cast_x(BITSELECT,123)
    dupName_55_agg_adapt_to_ufixed_cast_x_b <= dupName_56_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_55_dsdk_ip_adapt_bitjoin_x(BITJOIN,124)
    dupName_55_dsdk_ip_adapt_bitjoin_x_q <= dupName_55_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_56_agg_adapt_to_ufixed_cast_x(BITSELECT,125)
    dupName_56_agg_adapt_to_ufixed_cast_x_b <= dupName_55_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_54_dsdk_ip_adapt_bitjoin_x(BITJOIN,122)
    dupName_54_dsdk_ip_adapt_bitjoin_x_q <= dupName_56_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_57_agg_adapt_to_ufixed_cast_x(BITSELECT,127)
    dupName_57_agg_adapt_to_ufixed_cast_x_b <= dupName_54_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_53_dsdk_ip_adapt_bitjoin_x(BITJOIN,120)
    dupName_53_dsdk_ip_adapt_bitjoin_x_q <= in_i_data_15;

    -- dupName_50_agg_adapt_to_ufixed_cast_x(BITSELECT,113)
    dupName_50_agg_adapt_to_ufixed_cast_x_b <= dupName_53_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_52_dsdk_ip_adapt_bitjoin_x(BITJOIN,118)
    dupName_52_dsdk_ip_adapt_bitjoin_x_q <= dupName_50_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_51_agg_adapt_to_ufixed_cast_x(BITSELECT,115)
    dupName_51_agg_adapt_to_ufixed_cast_x_b <= dupName_52_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_51_dsdk_ip_adapt_bitjoin_x(BITJOIN,116)
    dupName_51_dsdk_ip_adapt_bitjoin_x_q <= dupName_51_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_52_agg_adapt_to_ufixed_cast_x(BITSELECT,117)
    dupName_52_agg_adapt_to_ufixed_cast_x_b <= dupName_51_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_50_dsdk_ip_adapt_bitjoin_x(BITJOIN,114)
    dupName_50_dsdk_ip_adapt_bitjoin_x_q <= in_i_data_14;

    -- dupName_47_agg_adapt_to_ufixed_cast_x(BITSELECT,107)
    dupName_47_agg_adapt_to_ufixed_cast_x_b <= dupName_50_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_49_dsdk_ip_adapt_bitjoin_x(BITJOIN,112)
    dupName_49_dsdk_ip_adapt_bitjoin_x_q <= dupName_47_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_48_agg_adapt_to_ufixed_cast_x(BITSELECT,109)
    dupName_48_agg_adapt_to_ufixed_cast_x_b <= dupName_49_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_48_dsdk_ip_adapt_bitjoin_x(BITJOIN,110)
    dupName_48_dsdk_ip_adapt_bitjoin_x_q <= dupName_48_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_49_agg_adapt_to_ufixed_cast_x(BITSELECT,111)
    dupName_49_agg_adapt_to_ufixed_cast_x_b <= dupName_48_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_47_dsdk_ip_adapt_bitjoin_x(BITJOIN,108)
    dupName_47_dsdk_ip_adapt_bitjoin_x_q <= in_i_data_13;

    -- dupName_44_agg_adapt_to_ufixed_cast_x(BITSELECT,101)
    dupName_44_agg_adapt_to_ufixed_cast_x_b <= dupName_47_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_46_dsdk_ip_adapt_bitjoin_x(BITJOIN,106)
    dupName_46_dsdk_ip_adapt_bitjoin_x_q <= dupName_44_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_45_agg_adapt_to_ufixed_cast_x(BITSELECT,103)
    dupName_45_agg_adapt_to_ufixed_cast_x_b <= dupName_46_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_45_dsdk_ip_adapt_bitjoin_x(BITJOIN,104)
    dupName_45_dsdk_ip_adapt_bitjoin_x_q <= dupName_45_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_46_agg_adapt_to_ufixed_cast_x(BITSELECT,105)
    dupName_46_agg_adapt_to_ufixed_cast_x_b <= dupName_45_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_2_dsdk_ip_array_adapt_bitjoin_x(BITJOIN,16)
    dupName_2_dsdk_ip_array_adapt_bitjoin_x_q <= dupName_52_agg_adapt_to_ufixed_cast_x_b & dupName_49_agg_adapt_to_ufixed_cast_x_b & dupName_46_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_53_agg_adapt_to_ufixed_cast_x(BITSELECT,119)
    dupName_53_agg_adapt_to_ufixed_cast_x_b <= dupName_2_dsdk_ip_array_adapt_bitjoin_x_q(23 downto 0);

    -- dupName_44_dsdk_ip_adapt_bitjoin_x(BITJOIN,102)
    dupName_44_dsdk_ip_adapt_bitjoin_x_q <= dupName_53_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_54_agg_adapt_to_ufixed_cast_x(BITSELECT,121)
    dupName_54_agg_adapt_to_ufixed_cast_x_b <= dupName_44_dsdk_ip_adapt_bitjoin_x_q(23 downto 0);

    -- dupName_43_dsdk_ip_adapt_bitjoin_x(BITJOIN,100)
    dupName_43_dsdk_ip_adapt_bitjoin_x_q <= dupName_60_agg_adapt_to_ufixed_cast_x_b & dupName_57_agg_adapt_to_ufixed_cast_x_b & dupName_54_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_61_agg_adapt_to_ufixed_cast_x(BITSELECT,135)
    dupName_61_agg_adapt_to_ufixed_cast_x_b <= dupName_43_dsdk_ip_adapt_bitjoin_x_q(39 downto 0);

    -- dupName_42_dsdk_ip_adapt_bitjoin_x(BITJOIN,98)
    dupName_42_dsdk_ip_adapt_bitjoin_x_q <= in_i_data_12;

    -- dupName_40_agg_adapt_to_ufixed_cast_x(BITSELECT,93)
    dupName_40_agg_adapt_to_ufixed_cast_x_b <= dupName_42_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_41_dsdk_ip_adapt_bitjoin_x(BITJOIN,96)
    dupName_41_dsdk_ip_adapt_bitjoin_x_q <= dupName_40_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_41_agg_adapt_to_ufixed_cast_x(BITSELECT,95)
    dupName_41_agg_adapt_to_ufixed_cast_x_b <= dupName_41_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_40_dsdk_ip_adapt_bitjoin_x(BITJOIN,94)
    dupName_40_dsdk_ip_adapt_bitjoin_x_q <= dupName_41_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_42_agg_adapt_to_ufixed_cast_x(BITSELECT,97)
    dupName_42_agg_adapt_to_ufixed_cast_x_b <= dupName_40_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_39_dsdk_ip_adapt_bitjoin_x(BITJOIN,92)
    dupName_39_dsdk_ip_adapt_bitjoin_x_q <= in_i_data_11;

    -- dupName_37_agg_adapt_to_ufixed_cast_x(BITSELECT,87)
    dupName_37_agg_adapt_to_ufixed_cast_x_b <= dupName_39_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_38_dsdk_ip_adapt_bitjoin_x(BITJOIN,90)
    dupName_38_dsdk_ip_adapt_bitjoin_x_q <= dupName_37_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_38_agg_adapt_to_ufixed_cast_x(BITSELECT,89)
    dupName_38_agg_adapt_to_ufixed_cast_x_b <= dupName_38_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_37_dsdk_ip_adapt_bitjoin_x(BITJOIN,88)
    dupName_37_dsdk_ip_adapt_bitjoin_x_q <= dupName_38_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_39_agg_adapt_to_ufixed_cast_x(BITSELECT,91)
    dupName_39_agg_adapt_to_ufixed_cast_x_b <= dupName_37_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_36_dsdk_ip_adapt_bitjoin_x(BITJOIN,86)
    dupName_36_dsdk_ip_adapt_bitjoin_x_q <= in_i_data_10;

    -- dupName_32_agg_adapt_to_ufixed_cast_x(BITSELECT,77)
    dupName_32_agg_adapt_to_ufixed_cast_x_b <= dupName_36_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_35_dsdk_ip_adapt_bitjoin_x(BITJOIN,84)
    dupName_35_dsdk_ip_adapt_bitjoin_x_q <= dupName_32_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_33_agg_adapt_to_ufixed_cast_x(BITSELECT,79)
    dupName_33_agg_adapt_to_ufixed_cast_x_b <= dupName_35_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_34_dsdk_ip_adapt_bitjoin_x(BITJOIN,82)
    dupName_34_dsdk_ip_adapt_bitjoin_x_q <= dupName_33_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_34_agg_adapt_to_ufixed_cast_x(BITSELECT,81)
    dupName_34_agg_adapt_to_ufixed_cast_x_b <= dupName_34_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_33_dsdk_ip_adapt_bitjoin_x(BITJOIN,80)
    dupName_33_dsdk_ip_adapt_bitjoin_x_q <= in_i_data_9;

    -- dupName_29_agg_adapt_to_ufixed_cast_x(BITSELECT,71)
    dupName_29_agg_adapt_to_ufixed_cast_x_b <= dupName_33_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_32_dsdk_ip_adapt_bitjoin_x(BITJOIN,78)
    dupName_32_dsdk_ip_adapt_bitjoin_x_q <= dupName_29_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_30_agg_adapt_to_ufixed_cast_x(BITSELECT,73)
    dupName_30_agg_adapt_to_ufixed_cast_x_b <= dupName_32_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_31_dsdk_ip_adapt_bitjoin_x(BITJOIN,76)
    dupName_31_dsdk_ip_adapt_bitjoin_x_q <= dupName_30_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_31_agg_adapt_to_ufixed_cast_x(BITSELECT,75)
    dupName_31_agg_adapt_to_ufixed_cast_x_b <= dupName_31_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_30_dsdk_ip_adapt_bitjoin_x(BITJOIN,74)
    dupName_30_dsdk_ip_adapt_bitjoin_x_q <= in_i_data_8;

    -- dupName_26_agg_adapt_to_ufixed_cast_x(BITSELECT,65)
    dupName_26_agg_adapt_to_ufixed_cast_x_b <= dupName_30_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_29_dsdk_ip_adapt_bitjoin_x(BITJOIN,72)
    dupName_29_dsdk_ip_adapt_bitjoin_x_q <= dupName_26_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_27_agg_adapt_to_ufixed_cast_x(BITSELECT,67)
    dupName_27_agg_adapt_to_ufixed_cast_x_b <= dupName_29_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_28_dsdk_ip_adapt_bitjoin_x(BITJOIN,70)
    dupName_28_dsdk_ip_adapt_bitjoin_x_q <= dupName_27_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_28_agg_adapt_to_ufixed_cast_x(BITSELECT,69)
    dupName_28_agg_adapt_to_ufixed_cast_x_b <= dupName_28_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_1_dsdk_ip_array_adapt_bitjoin_x(BITJOIN,12)
    dupName_1_dsdk_ip_array_adapt_bitjoin_x_q <= dupName_34_agg_adapt_to_ufixed_cast_x_b & dupName_31_agg_adapt_to_ufixed_cast_x_b & dupName_28_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_35_agg_adapt_to_ufixed_cast_x(BITSELECT,83)
    dupName_35_agg_adapt_to_ufixed_cast_x_b <= dupName_1_dsdk_ip_array_adapt_bitjoin_x_q(23 downto 0);

    -- dupName_27_dsdk_ip_adapt_bitjoin_x(BITJOIN,68)
    dupName_27_dsdk_ip_adapt_bitjoin_x_q <= dupName_35_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_36_agg_adapt_to_ufixed_cast_x(BITSELECT,85)
    dupName_36_agg_adapt_to_ufixed_cast_x_b <= dupName_27_dsdk_ip_adapt_bitjoin_x_q(23 downto 0);

    -- dupName_26_dsdk_ip_adapt_bitjoin_x(BITJOIN,66)
    dupName_26_dsdk_ip_adapt_bitjoin_x_q <= dupName_42_agg_adapt_to_ufixed_cast_x_b & dupName_39_agg_adapt_to_ufixed_cast_x_b & dupName_36_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_43_agg_adapt_to_ufixed_cast_x(BITSELECT,99)
    dupName_43_agg_adapt_to_ufixed_cast_x_b <= dupName_26_dsdk_ip_adapt_bitjoin_x_q(39 downto 0);

    -- dupName_25_dsdk_ip_adapt_bitjoin_x(BITJOIN,64)
    dupName_25_dsdk_ip_adapt_bitjoin_x_q <= in_i_data_7;

    -- dupName_22_agg_adapt_to_ufixed_cast_x(BITSELECT,57)
    dupName_22_agg_adapt_to_ufixed_cast_x_b <= dupName_25_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_24_dsdk_ip_adapt_bitjoin_x(BITJOIN,62)
    dupName_24_dsdk_ip_adapt_bitjoin_x_q <= dupName_22_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_23_agg_adapt_to_ufixed_cast_x(BITSELECT,59)
    dupName_23_agg_adapt_to_ufixed_cast_x_b <= dupName_24_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_23_dsdk_ip_adapt_bitjoin_x(BITJOIN,60)
    dupName_23_dsdk_ip_adapt_bitjoin_x_q <= dupName_23_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_24_agg_adapt_to_ufixed_cast_x(BITSELECT,61)
    dupName_24_agg_adapt_to_ufixed_cast_x_b <= dupName_23_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_22_dsdk_ip_adapt_bitjoin_x(BITJOIN,58)
    dupName_22_dsdk_ip_adapt_bitjoin_x_q <= in_i_data_6;

    -- dupName_19_agg_adapt_to_ufixed_cast_x(BITSELECT,51)
    dupName_19_agg_adapt_to_ufixed_cast_x_b <= dupName_22_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_21_dsdk_ip_adapt_bitjoin_x(BITJOIN,56)
    dupName_21_dsdk_ip_adapt_bitjoin_x_q <= dupName_19_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_20_agg_adapt_to_ufixed_cast_x(BITSELECT,53)
    dupName_20_agg_adapt_to_ufixed_cast_x_b <= dupName_21_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_20_dsdk_ip_adapt_bitjoin_x(BITJOIN,54)
    dupName_20_dsdk_ip_adapt_bitjoin_x_q <= dupName_20_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_21_agg_adapt_to_ufixed_cast_x(BITSELECT,55)
    dupName_21_agg_adapt_to_ufixed_cast_x_b <= dupName_20_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_19_dsdk_ip_adapt_bitjoin_x(BITJOIN,52)
    dupName_19_dsdk_ip_adapt_bitjoin_x_q <= in_i_data_5;

    -- dupName_14_agg_adapt_to_ufixed_cast_x(BITSELECT,41)
    dupName_14_agg_adapt_to_ufixed_cast_x_b <= dupName_19_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_18_dsdk_ip_adapt_bitjoin_x(BITJOIN,50)
    dupName_18_dsdk_ip_adapt_bitjoin_x_q <= dupName_14_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_15_agg_adapt_to_ufixed_cast_x(BITSELECT,43)
    dupName_15_agg_adapt_to_ufixed_cast_x_b <= dupName_18_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_17_dsdk_ip_adapt_bitjoin_x(BITJOIN,48)
    dupName_17_dsdk_ip_adapt_bitjoin_x_q <= dupName_15_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_16_agg_adapt_to_ufixed_cast_x(BITSELECT,45)
    dupName_16_agg_adapt_to_ufixed_cast_x_b <= dupName_17_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_16_dsdk_ip_adapt_bitjoin_x(BITJOIN,46)
    dupName_16_dsdk_ip_adapt_bitjoin_x_q <= in_i_data_4;

    -- dupName_11_agg_adapt_to_ufixed_cast_x(BITSELECT,35)
    dupName_11_agg_adapt_to_ufixed_cast_x_b <= dupName_16_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_15_dsdk_ip_adapt_bitjoin_x(BITJOIN,44)
    dupName_15_dsdk_ip_adapt_bitjoin_x_q <= dupName_11_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_12_agg_adapt_to_ufixed_cast_x(BITSELECT,37)
    dupName_12_agg_adapt_to_ufixed_cast_x_b <= dupName_15_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_14_dsdk_ip_adapt_bitjoin_x(BITJOIN,42)
    dupName_14_dsdk_ip_adapt_bitjoin_x_q <= dupName_12_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_13_agg_adapt_to_ufixed_cast_x(BITSELECT,39)
    dupName_13_agg_adapt_to_ufixed_cast_x_b <= dupName_14_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_13_dsdk_ip_adapt_bitjoin_x(BITJOIN,40)
    dupName_13_dsdk_ip_adapt_bitjoin_x_q <= in_i_data_3;

    -- dupName_8_agg_adapt_to_ufixed_cast_x(BITSELECT,29)
    dupName_8_agg_adapt_to_ufixed_cast_x_b <= dupName_13_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_12_dsdk_ip_adapt_bitjoin_x(BITJOIN,38)
    dupName_12_dsdk_ip_adapt_bitjoin_x_q <= dupName_8_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_9_agg_adapt_to_ufixed_cast_x(BITSELECT,31)
    dupName_9_agg_adapt_to_ufixed_cast_x_b <= dupName_12_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_11_dsdk_ip_adapt_bitjoin_x(BITJOIN,36)
    dupName_11_dsdk_ip_adapt_bitjoin_x_q <= dupName_9_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_10_agg_adapt_to_ufixed_cast_x(BITSELECT,33)
    dupName_10_agg_adapt_to_ufixed_cast_x_b <= dupName_11_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_0_dsdk_ip_array_adapt_bitjoin_x(BITJOIN,6)
    dupName_0_dsdk_ip_array_adapt_bitjoin_x_q <= dupName_16_agg_adapt_to_ufixed_cast_x_b & dupName_13_agg_adapt_to_ufixed_cast_x_b & dupName_10_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_17_agg_adapt_to_ufixed_cast_x(BITSELECT,47)
    dupName_17_agg_adapt_to_ufixed_cast_x_b <= dupName_0_dsdk_ip_array_adapt_bitjoin_x_q(23 downto 0);

    -- dupName_10_dsdk_ip_adapt_bitjoin_x(BITJOIN,34)
    dupName_10_dsdk_ip_adapt_bitjoin_x_q <= dupName_17_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_18_agg_adapt_to_ufixed_cast_x(BITSELECT,49)
    dupName_18_agg_adapt_to_ufixed_cast_x_b <= dupName_10_dsdk_ip_adapt_bitjoin_x_q(23 downto 0);

    -- dupName_9_dsdk_ip_adapt_bitjoin_x(BITJOIN,32)
    dupName_9_dsdk_ip_adapt_bitjoin_x_q <= dupName_24_agg_adapt_to_ufixed_cast_x_b & dupName_21_agg_adapt_to_ufixed_cast_x_b & dupName_18_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_25_agg_adapt_to_ufixed_cast_x(BITSELECT,63)
    dupName_25_agg_adapt_to_ufixed_cast_x_b <= dupName_9_dsdk_ip_adapt_bitjoin_x_q(39 downto 0);

    -- dsdk_ip_array_adapt_bitjoin(BITJOIN,171)
    dsdk_ip_array_adapt_bitjoin_q <= dupName_61_agg_adapt_to_ufixed_cast_x_b & dupName_43_agg_adapt_to_ufixed_cast_x_b & dupName_25_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_62_agg_adapt_to_ufixed_cast_x(BITSELECT,137)
    dupName_62_agg_adapt_to_ufixed_cast_x_b <= dsdk_ip_array_adapt_bitjoin_q(119 downto 0);

    -- dupName_0_c_i2_0gr_x(CONSTANT,4)
    dupName_0_c_i2_0gr_x_q <= "00";

    -- dupName_1_element_extension_x(BITJOIN,13)
    dupName_1_element_extension_x_q <= dupName_0_c_i2_0gr_x_q & in_i_data_2;

    -- dupName_8_dsdk_ip_adapt_bitjoin_x(BITJOIN,30)
    dupName_8_dsdk_ip_adapt_bitjoin_x_q <= dupName_1_element_extension_x_q;

    -- dupName_5_agg_adapt_to_ufixed_cast_x(BITSELECT,23)
    dupName_5_agg_adapt_to_ufixed_cast_x_b <= dupName_8_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_7_dsdk_ip_adapt_bitjoin_x(BITJOIN,28)
    dupName_7_dsdk_ip_adapt_bitjoin_x_q <= dupName_5_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_6_agg_adapt_to_ufixed_cast_x(BITSELECT,25)
    dupName_6_agg_adapt_to_ufixed_cast_x_b <= dupName_7_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_6_dsdk_ip_adapt_bitjoin_x(BITJOIN,26)
    dupName_6_dsdk_ip_adapt_bitjoin_x_q <= dupName_6_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_7_agg_adapt_to_ufixed_cast_x(BITSELECT,27)
    dupName_7_agg_adapt_to_ufixed_cast_x_b <= dupName_6_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_0_element_extension_x(BITJOIN,7)
    dupName_0_element_extension_x_q <= dupName_0_c_i2_0gr_x_q & in_i_data_1;

    -- dupName_5_dsdk_ip_adapt_bitjoin_x(BITJOIN,24)
    dupName_5_dsdk_ip_adapt_bitjoin_x_q <= dupName_0_element_extension_x_q;

    -- dupName_2_agg_adapt_to_ufixed_cast_x(BITSELECT,14)
    dupName_2_agg_adapt_to_ufixed_cast_x_b <= dupName_5_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_4_dsdk_ip_adapt_bitjoin_x(BITJOIN,22)
    dupName_4_dsdk_ip_adapt_bitjoin_x_q <= dupName_2_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_3_agg_adapt_to_ufixed_cast_x(BITSELECT,18)
    dupName_3_agg_adapt_to_ufixed_cast_x_b <= dupName_4_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_3_dsdk_ip_adapt_bitjoin_x(BITJOIN,19)
    dupName_3_dsdk_ip_adapt_bitjoin_x_q <= dupName_3_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_4_agg_adapt_to_ufixed_cast_x(BITSELECT,21)
    dupName_4_agg_adapt_to_ufixed_cast_x_b <= dupName_3_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- c_i6_0gr(CONSTANT,167)
    c_i6_0gr_q <= "000000";

    -- element_extension(BITJOIN,172)
    element_extension_q <= c_i6_0gr_q & in_i_data_0;

    -- dupName_2_dsdk_ip_adapt_bitjoin_x(BITJOIN,15)
    dupName_2_dsdk_ip_adapt_bitjoin_x_q <= element_extension_q;

    -- agg_adapt_to_ufixed_cast(BITSELECT,163)
    agg_adapt_to_ufixed_cast_b <= dupName_2_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_1_dsdk_ip_adapt_bitjoin_x(BITJOIN,11)
    dupName_1_dsdk_ip_adapt_bitjoin_x_q <= agg_adapt_to_ufixed_cast_b;

    -- dupName_0_agg_adapt_to_ufixed_cast_x(BITSELECT,3)
    dupName_0_agg_adapt_to_ufixed_cast_x_b <= dupName_1_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dupName_0_dsdk_ip_adapt_bitjoin_x(BITJOIN,5)
    dupName_0_dsdk_ip_adapt_bitjoin_x_q <= dupName_0_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_1_agg_adapt_to_ufixed_cast_x(BITSELECT,10)
    dupName_1_agg_adapt_to_ufixed_cast_x_b <= dupName_0_dsdk_ip_adapt_bitjoin_x_q(7 downto 0);

    -- dsdk_ip_adapt_bitjoin(BITJOIN,170)
    dsdk_ip_adapt_bitjoin_q <= dupName_76_agg_adapt_to_ufixed_cast_x_b & dupName_73_agg_adapt_to_ufixed_cast_x_b & dupName_62_agg_adapt_to_ufixed_cast_x_b & dupName_7_agg_adapt_to_ufixed_cast_x_b & dupName_4_agg_adapt_to_ufixed_cast_x_b & dupName_1_agg_adapt_to_ufixed_cast_x_b;

    -- iowr(EXTIFACE,173)
    iowr_i_data <= dsdk_ip_adapt_bitjoin_q;
    iowr_i_endofpacket <= GND_q;
    iowr_i_fifoready <= in_iowr_bl_src_i_fifoready;
    iowr_i_fifosize <= c32_0_q;
    iowr_i_predicate <= GND_q;
    iowr_i_stall <= in_i_stall;
    iowr_i_startofpacket <= GND_q;
    iowr_i_valid <= in_i_valid;
    iowr_i_endofpacket_bitsignaltemp <= iowr_i_endofpacket(0);
    iowr_i_fifoready_bitsignaltemp <= iowr_i_fifoready(0);
    iowr_i_predicate_bitsignaltemp <= iowr_i_predicate(0);
    iowr_i_stall_bitsignaltemp <= iowr_i_stall(0);
    iowr_i_startofpacket_bitsignaltemp <= iowr_i_startofpacket(0);
    iowr_i_valid_bitsignaltemp <= iowr_i_valid(0);
    iowr_o_ack(0) <= iowr_o_ack_bitsignaltemp;
    iowr_o_fifovalid(0) <= iowr_o_fifovalid_bitsignaltemp;
    iowr_o_stall(0) <= iowr_o_stall_bitsignaltemp;
    iowr_o_valid(0) <= iowr_o_valid_bitsignaltemp;
    theiowr : st_write
    GENERIC MAP (
        DATA_WIDTH => 176,
        DELAY_READY => 0,
        ENABLED => 0,
        NON_BLOCKING => 0
    )
    PORT MAP (
        i_data => dsdk_ip_adapt_bitjoin_q,
        i_endofpacket => iowr_i_endofpacket_bitsignaltemp,
        i_fifoready => iowr_i_fifoready_bitsignaltemp,
        i_fifosize => c32_0_q,
        i_predicate => iowr_i_predicate_bitsignaltemp,
        i_stall => iowr_i_stall_bitsignaltemp,
        i_startofpacket => iowr_i_startofpacket_bitsignaltemp,
        i_valid => iowr_i_valid_bitsignaltemp,
        o_ack => iowr_o_ack_bitsignaltemp,
        o_fifodata => iowr_o_fifodata,
        o_fifovalid => iowr_o_fifovalid_bitsignaltemp,
        o_stall => iowr_o_stall_bitsignaltemp,
        o_valid => iowr_o_valid_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_regfree_osync_x(GPOUT,8)
    out_iowr_bl_src_o_fifovalid <= iowr_o_fifovalid;

    -- dupName_0_sync_out_x(GPOUT,9)@93
    out_o_ack <= iowr_o_ack;
    out_o_valid <= iowr_o_valid;

    -- regfree_osync(GPOUT,175)
    out_iowr_bl_src_o_fifodata <= iowr_o_fifodata;

    -- sync_out(GPOUT,177)@20000000
    out_o_stall <= iowr_o_stall;

END normal;
