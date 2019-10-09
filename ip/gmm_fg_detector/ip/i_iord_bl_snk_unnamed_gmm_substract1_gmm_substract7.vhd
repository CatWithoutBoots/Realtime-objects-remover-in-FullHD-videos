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

-- VHDL created from i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract7
-- VHDL created on Mon Oct 07 15:56:19 2019


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

entity i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract7 is
    port (
        out_o_data_0 : out std_logic_vector(1 downto 0);  -- ufix2
        out_o_data_1 : out std_logic_vector(5 downto 0);  -- ufix6
        out_o_data_2 : out std_logic_vector(5 downto 0);  -- ufix6
        out_o_data_3 : out std_logic_vector(7 downto 0);  -- ufix8
        out_o_data_4 : out std_logic_vector(7 downto 0);  -- ufix8
        out_o_data_5 : out std_logic_vector(7 downto 0);  -- ufix8
        out_o_data_6 : out std_logic_vector(7 downto 0);  -- ufix8
        out_o_data_7 : out std_logic_vector(7 downto 0);  -- ufix8
        out_o_data_8 : out std_logic_vector(7 downto 0);  -- ufix8
        out_o_data_9 : out std_logic_vector(7 downto 0);  -- ufix8
        out_o_data_10 : out std_logic_vector(7 downto 0);  -- ufix8
        out_o_data_11 : out std_logic_vector(7 downto 0);  -- ufix8
        out_o_data_12 : out std_logic_vector(7 downto 0);  -- ufix8
        out_o_data_13 : out std_logic_vector(7 downto 0);  -- ufix8
        out_o_data_14 : out std_logic_vector(7 downto 0);  -- ufix8
        out_o_data_15 : out std_logic_vector(7 downto 0);  -- ufix8
        out_o_data_16 : out std_logic_vector(7 downto 0);  -- ufix8
        out_o_data_17 : out std_logic_vector(7 downto 0);  -- ufix8
        out_o_data_18 : out std_logic_vector(7 downto 0);  -- ufix8
        out_o_data_19 : out std_logic_vector(7 downto 0);  -- ufix8
        out_o_data_20 : out std_logic_vector(7 downto 0);  -- ufix8
        out_o_data_21 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        in_iord_bl_snk_i_fifovalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_dependence : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        in_iord_bl_snk_i_fifodata : in std_logic_vector(175 downto 0);  -- ufix176
        out_iord_bl_snk_o_fifoready : out std_logic_vector(0 downto 0);  -- ufix1
        in_i_stall : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_stall : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract7;

architecture normal of i_iord_bl_snk_unnamed_gmm_substract1_gmm_substract7 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component st_read is
        generic (
            DATA_WIDTH : INTEGER := 176;
            NON_BLOCKING : INTEGER := 0
        );
        port (
            i_fifodata : in std_logic_vector(175 downto 0);
            i_fifoendofpacket : in std_logic;
            i_fifosize : in std_logic_vector(31 downto 0);
            i_fifostartofpacket : in std_logic;
            i_fifovalid : in std_logic;
            i_init : in std_logic;
            i_predicate : in std_logic;
            i_stall : in std_logic;
            i_valid : in std_logic;
            o_data : out std_logic_vector(175 downto 0);
            o_fifoready : out std_logic;
            o_stall : out std_logic;
            o_valid : out std_logic;
            profile_total_fifo_size_incr : out std_logic_vector(31 downto 0);
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (5 downto 0);
    signal dupName_0_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (5 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_0_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_1_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (5 downto 0);
    signal dupName_1_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (5 downto 0);
    signal dupName_1_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_1_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_2_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_2_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_2_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (1 downto 0);
    signal dupName_2_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_3_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_3_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_4_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_4_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_5_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_5_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_6_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (5 downto 0);
    signal dupName_6_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_7_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_7_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_8_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_8_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_9_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_9_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_10_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (5 downto 0);
    signal dupName_10_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_11_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (119 downto 0);
    signal dupName_11_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_12_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (39 downto 0);
    signal dupName_12_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_13_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_13_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_14_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_14_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_15_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_15_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_16_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_16_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_17_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_18_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_19_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_20_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_21_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_22_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_23_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_24_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_25_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_26_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_27_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_28_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_29_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_30_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_31_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_32_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_33_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_34_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_35_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (39 downto 0);
    signal dupName_36_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_37_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_38_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_39_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_40_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_41_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_42_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_43_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_44_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_45_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_46_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_47_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_48_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_49_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_50_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_51_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_52_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_53_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_54_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_55_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_56_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_57_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_58_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (39 downto 0);
    signal dupName_59_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_60_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_61_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_62_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_63_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_64_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_65_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_66_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_67_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_68_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_69_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_70_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_71_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_72_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_73_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_74_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_75_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_76_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_77_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_78_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_79_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_80_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_81_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_82_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_83_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_84_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
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
    signal dupName_98_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal adapt_scalar_trunc_in : STD_LOGIC_VECTOR (1 downto 0);
    signal adapt_scalar_trunc_q : STD_LOGIC_VECTOR (1 downto 0);
    signal c32_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal iord_i_fifodata : STD_LOGIC_VECTOR (175 downto 0);
    signal iord_i_fifoendofpacket : STD_LOGIC_VECTOR (0 downto 0);
    signal iord_i_fifoendofpacket_bitsignaltemp : std_logic;
    signal iord_i_fifosize : STD_LOGIC_VECTOR (31 downto 0);
    signal iord_i_fifostartofpacket : STD_LOGIC_VECTOR (0 downto 0);
    signal iord_i_fifostartofpacket_bitsignaltemp : std_logic;
    signal iord_i_fifovalid : STD_LOGIC_VECTOR (0 downto 0);
    signal iord_i_fifovalid_bitsignaltemp : std_logic;
    signal iord_i_init : STD_LOGIC_VECTOR (0 downto 0);
    signal iord_i_init_bitsignaltemp : std_logic;
    signal iord_i_predicate : STD_LOGIC_VECTOR (0 downto 0);
    signal iord_i_predicate_bitsignaltemp : std_logic;
    signal iord_i_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal iord_i_stall_bitsignaltemp : std_logic;
    signal iord_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal iord_i_valid_bitsignaltemp : std_logic;
    signal iord_o_data : STD_LOGIC_VECTOR (175 downto 0);
    signal iord_o_fifoready : STD_LOGIC_VECTOR (0 downto 0);
    signal iord_o_fifoready_bitsignaltemp : std_logic;
    signal iord_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal iord_o_stall_bitsignaltemp : std_logic;
    signal iord_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal iord_o_valid_bitsignaltemp : std_logic;
    signal iord_profile_total_fifo_size_incr : STD_LOGIC_VECTOR (31 downto 0);
    signal ip_dsdk_adapt_bitselect_b : STD_LOGIC_VECTOR (7 downto 0);
    signal ip_dsdk_adapt_cast_b : STD_LOGIC_VECTOR (7 downto 0);

begin


    -- c32_0(CONSTANT,126)
    c32_0_q <= "00000000000000000000000000000000";

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- iord(EXTIFACE,129)
    iord_i_fifodata <= in_iord_bl_snk_i_fifodata;
    iord_i_fifoendofpacket <= GND_q;
    iord_i_fifosize <= c32_0_q;
    iord_i_fifostartofpacket <= GND_q;
    iord_i_fifovalid <= in_iord_bl_snk_i_fifovalid;
    iord_i_init <= GND_q;
    iord_i_predicate <= GND_q;
    iord_i_stall <= in_i_stall;
    iord_i_valid <= in_i_valid;
    iord_i_fifoendofpacket_bitsignaltemp <= iord_i_fifoendofpacket(0);
    iord_i_fifostartofpacket_bitsignaltemp <= iord_i_fifostartofpacket(0);
    iord_i_fifovalid_bitsignaltemp <= iord_i_fifovalid(0);
    iord_i_init_bitsignaltemp <= iord_i_init(0);
    iord_i_predicate_bitsignaltemp <= iord_i_predicate(0);
    iord_i_stall_bitsignaltemp <= iord_i_stall(0);
    iord_i_valid_bitsignaltemp <= iord_i_valid(0);
    iord_o_fifoready(0) <= iord_o_fifoready_bitsignaltemp;
    iord_o_stall(0) <= iord_o_stall_bitsignaltemp;
    iord_o_valid(0) <= iord_o_valid_bitsignaltemp;
    theiord : st_read
    GENERIC MAP (
        DATA_WIDTH => 176,
        NON_BLOCKING => 0
    )
    PORT MAP (
        i_fifodata => in_iord_bl_snk_i_fifodata,
        i_fifoendofpacket => iord_i_fifoendofpacket_bitsignaltemp,
        i_fifosize => c32_0_q,
        i_fifostartofpacket => iord_i_fifostartofpacket_bitsignaltemp,
        i_fifovalid => iord_i_fifovalid_bitsignaltemp,
        i_init => iord_i_init_bitsignaltemp,
        i_predicate => iord_i_predicate_bitsignaltemp,
        i_stall => iord_i_stall_bitsignaltemp,
        i_valid => iord_i_valid_bitsignaltemp,
        o_data => iord_o_data,
        o_fifoready => iord_o_fifoready_bitsignaltemp,
        o_stall => iord_o_stall_bitsignaltemp,
        o_valid => iord_o_valid_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- dupName_95_ip_dsdk_adapt_bitselect_x(BITSELECT,120)
    dupName_95_ip_dsdk_adapt_bitselect_x_b <= iord_o_data(175 downto 168);

    -- dupName_96_ip_dsdk_adapt_bitselect_x(BITSELECT,121)
    dupName_96_ip_dsdk_adapt_bitselect_x_b <= dupName_95_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_97_ip_dsdk_adapt_bitselect_x(BITSELECT,122)
    dupName_97_ip_dsdk_adapt_bitselect_x_b <= dupName_96_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_98_ip_dsdk_adapt_bitselect_x(BITSELECT,123)
    dupName_98_ip_dsdk_adapt_bitselect_x_b <= dupName_97_ip_dsdk_adapt_bitselect_x_b(0 downto 0);

    -- dupName_2_adapt_scalar_trunc_x(ROUND,11)
    dupName_2_adapt_scalar_trunc_x_in <= dupName_98_ip_dsdk_adapt_bitselect_x_b;
    dupName_2_adapt_scalar_trunc_x_q <= dupName_2_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_81_ip_dsdk_adapt_bitselect_x(BITSELECT,106)
    dupName_81_ip_dsdk_adapt_bitselect_x_b <= iord_o_data(167 downto 144);

    -- dupName_82_ip_dsdk_adapt_bitselect_x(BITSELECT,107)
    dupName_82_ip_dsdk_adapt_bitselect_x_b <= dupName_81_ip_dsdk_adapt_bitselect_x_b(23 downto 0);

    -- dupName_91_ip_dsdk_adapt_bitselect_x(BITSELECT,116)
    dupName_91_ip_dsdk_adapt_bitselect_x_b <= dupName_82_ip_dsdk_adapt_bitselect_x_b(23 downto 16);

    -- dupName_92_ip_dsdk_adapt_bitselect_x(BITSELECT,117)
    dupName_92_ip_dsdk_adapt_bitselect_x_b <= dupName_91_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_93_ip_dsdk_adapt_bitselect_x(BITSELECT,118)
    dupName_93_ip_dsdk_adapt_bitselect_x_b <= dupName_92_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_94_ip_dsdk_adapt_bitselect_x(BITSELECT,119)
    dupName_94_ip_dsdk_adapt_bitselect_x_b <= dupName_93_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_16_ip_dsdk_adapt_cast_x(BITSELECT,41)
    dupName_16_ip_dsdk_adapt_cast_x_b <= dupName_94_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_87_ip_dsdk_adapt_bitselect_x(BITSELECT,112)
    dupName_87_ip_dsdk_adapt_bitselect_x_b <= dupName_82_ip_dsdk_adapt_bitselect_x_b(15 downto 8);

    -- dupName_88_ip_dsdk_adapt_bitselect_x(BITSELECT,113)
    dupName_88_ip_dsdk_adapt_bitselect_x_b <= dupName_87_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_89_ip_dsdk_adapt_bitselect_x(BITSELECT,114)
    dupName_89_ip_dsdk_adapt_bitselect_x_b <= dupName_88_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_90_ip_dsdk_adapt_bitselect_x(BITSELECT,115)
    dupName_90_ip_dsdk_adapt_bitselect_x_b <= dupName_89_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_15_ip_dsdk_adapt_cast_x(BITSELECT,39)
    dupName_15_ip_dsdk_adapt_cast_x_b <= dupName_90_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_83_ip_dsdk_adapt_bitselect_x(BITSELECT,108)
    dupName_83_ip_dsdk_adapt_bitselect_x_b <= dupName_82_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_84_ip_dsdk_adapt_bitselect_x(BITSELECT,109)
    dupName_84_ip_dsdk_adapt_bitselect_x_b <= dupName_83_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_85_ip_dsdk_adapt_bitselect_x(BITSELECT,110)
    dupName_85_ip_dsdk_adapt_bitselect_x_b <= dupName_84_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_86_ip_dsdk_adapt_bitselect_x(BITSELECT,111)
    dupName_86_ip_dsdk_adapt_bitselect_x_b <= dupName_85_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_14_ip_dsdk_adapt_cast_x(BITSELECT,37)
    dupName_14_ip_dsdk_adapt_cast_x_b <= dupName_86_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_11_ip_dsdk_adapt_bitselect_x(BITSELECT,30)
    dupName_11_ip_dsdk_adapt_bitselect_x_b <= iord_o_data(143 downto 24);

    -- dupName_58_ip_dsdk_adapt_bitselect_x(BITSELECT,83)
    dupName_58_ip_dsdk_adapt_bitselect_x_b <= dupName_11_ip_dsdk_adapt_bitselect_x_b(119 downto 80);

    -- dupName_77_ip_dsdk_adapt_bitselect_x(BITSELECT,102)
    dupName_77_ip_dsdk_adapt_bitselect_x_b <= dupName_58_ip_dsdk_adapt_bitselect_x_b(39 downto 32);

    -- dupName_78_ip_dsdk_adapt_bitselect_x(BITSELECT,103)
    dupName_78_ip_dsdk_adapt_bitselect_x_b <= dupName_77_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_79_ip_dsdk_adapt_bitselect_x(BITSELECT,104)
    dupName_79_ip_dsdk_adapt_bitselect_x_b <= dupName_78_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_80_ip_dsdk_adapt_bitselect_x(BITSELECT,105)
    dupName_80_ip_dsdk_adapt_bitselect_x_b <= dupName_79_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_13_ip_dsdk_adapt_cast_x(BITSELECT,35)
    dupName_13_ip_dsdk_adapt_cast_x_b <= dupName_80_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_73_ip_dsdk_adapt_bitselect_x(BITSELECT,98)
    dupName_73_ip_dsdk_adapt_bitselect_x_b <= dupName_58_ip_dsdk_adapt_bitselect_x_b(31 downto 24);

    -- dupName_74_ip_dsdk_adapt_bitselect_x(BITSELECT,99)
    dupName_74_ip_dsdk_adapt_bitselect_x_b <= dupName_73_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_75_ip_dsdk_adapt_bitselect_x(BITSELECT,100)
    dupName_75_ip_dsdk_adapt_bitselect_x_b <= dupName_74_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_76_ip_dsdk_adapt_bitselect_x(BITSELECT,101)
    dupName_76_ip_dsdk_adapt_bitselect_x_b <= dupName_75_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_12_ip_dsdk_adapt_cast_x(BITSELECT,33)
    dupName_12_ip_dsdk_adapt_cast_x_b <= dupName_76_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_59_ip_dsdk_adapt_bitselect_x(BITSELECT,84)
    dupName_59_ip_dsdk_adapt_bitselect_x_b <= dupName_58_ip_dsdk_adapt_bitselect_x_b(23 downto 0);

    -- dupName_60_ip_dsdk_adapt_bitselect_x(BITSELECT,85)
    dupName_60_ip_dsdk_adapt_bitselect_x_b <= dupName_59_ip_dsdk_adapt_bitselect_x_b(23 downto 0);

    -- dupName_69_ip_dsdk_adapt_bitselect_x(BITSELECT,94)
    dupName_69_ip_dsdk_adapt_bitselect_x_b <= dupName_60_ip_dsdk_adapt_bitselect_x_b(23 downto 16);

    -- dupName_70_ip_dsdk_adapt_bitselect_x(BITSELECT,95)
    dupName_70_ip_dsdk_adapt_bitselect_x_b <= dupName_69_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_71_ip_dsdk_adapt_bitselect_x(BITSELECT,96)
    dupName_71_ip_dsdk_adapt_bitselect_x_b <= dupName_70_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_72_ip_dsdk_adapt_bitselect_x(BITSELECT,97)
    dupName_72_ip_dsdk_adapt_bitselect_x_b <= dupName_71_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_11_ip_dsdk_adapt_cast_x(BITSELECT,31)
    dupName_11_ip_dsdk_adapt_cast_x_b <= dupName_72_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_65_ip_dsdk_adapt_bitselect_x(BITSELECT,90)
    dupName_65_ip_dsdk_adapt_bitselect_x_b <= dupName_60_ip_dsdk_adapt_bitselect_x_b(15 downto 8);

    -- dupName_66_ip_dsdk_adapt_bitselect_x(BITSELECT,91)
    dupName_66_ip_dsdk_adapt_bitselect_x_b <= dupName_65_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_67_ip_dsdk_adapt_bitselect_x(BITSELECT,92)
    dupName_67_ip_dsdk_adapt_bitselect_x_b <= dupName_66_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_68_ip_dsdk_adapt_bitselect_x(BITSELECT,93)
    dupName_68_ip_dsdk_adapt_bitselect_x_b <= dupName_67_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_10_ip_dsdk_adapt_cast_x(BITSELECT,29)
    dupName_10_ip_dsdk_adapt_cast_x_b <= dupName_68_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_61_ip_dsdk_adapt_bitselect_x(BITSELECT,86)
    dupName_61_ip_dsdk_adapt_bitselect_x_b <= dupName_60_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_62_ip_dsdk_adapt_bitselect_x(BITSELECT,87)
    dupName_62_ip_dsdk_adapt_bitselect_x_b <= dupName_61_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_63_ip_dsdk_adapt_bitselect_x(BITSELECT,88)
    dupName_63_ip_dsdk_adapt_bitselect_x_b <= dupName_62_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_64_ip_dsdk_adapt_bitselect_x(BITSELECT,89)
    dupName_64_ip_dsdk_adapt_bitselect_x_b <= dupName_63_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_9_ip_dsdk_adapt_cast_x(BITSELECT,27)
    dupName_9_ip_dsdk_adapt_cast_x_b <= dupName_64_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_35_ip_dsdk_adapt_bitselect_x(BITSELECT,60)
    dupName_35_ip_dsdk_adapt_bitselect_x_b <= dupName_11_ip_dsdk_adapt_bitselect_x_b(79 downto 40);

    -- dupName_54_ip_dsdk_adapt_bitselect_x(BITSELECT,79)
    dupName_54_ip_dsdk_adapt_bitselect_x_b <= dupName_35_ip_dsdk_adapt_bitselect_x_b(39 downto 32);

    -- dupName_55_ip_dsdk_adapt_bitselect_x(BITSELECT,80)
    dupName_55_ip_dsdk_adapt_bitselect_x_b <= dupName_54_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_56_ip_dsdk_adapt_bitselect_x(BITSELECT,81)
    dupName_56_ip_dsdk_adapt_bitselect_x_b <= dupName_55_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_57_ip_dsdk_adapt_bitselect_x(BITSELECT,82)
    dupName_57_ip_dsdk_adapt_bitselect_x_b <= dupName_56_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_8_ip_dsdk_adapt_cast_x(BITSELECT,25)
    dupName_8_ip_dsdk_adapt_cast_x_b <= dupName_57_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_50_ip_dsdk_adapt_bitselect_x(BITSELECT,75)
    dupName_50_ip_dsdk_adapt_bitselect_x_b <= dupName_35_ip_dsdk_adapt_bitselect_x_b(31 downto 24);

    -- dupName_51_ip_dsdk_adapt_bitselect_x(BITSELECT,76)
    dupName_51_ip_dsdk_adapt_bitselect_x_b <= dupName_50_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_52_ip_dsdk_adapt_bitselect_x(BITSELECT,77)
    dupName_52_ip_dsdk_adapt_bitselect_x_b <= dupName_51_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_53_ip_dsdk_adapt_bitselect_x(BITSELECT,78)
    dupName_53_ip_dsdk_adapt_bitselect_x_b <= dupName_52_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_7_ip_dsdk_adapt_cast_x(BITSELECT,23)
    dupName_7_ip_dsdk_adapt_cast_x_b <= dupName_53_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_36_ip_dsdk_adapt_bitselect_x(BITSELECT,61)
    dupName_36_ip_dsdk_adapt_bitselect_x_b <= dupName_35_ip_dsdk_adapt_bitselect_x_b(23 downto 0);

    -- dupName_37_ip_dsdk_adapt_bitselect_x(BITSELECT,62)
    dupName_37_ip_dsdk_adapt_bitselect_x_b <= dupName_36_ip_dsdk_adapt_bitselect_x_b(23 downto 0);

    -- dupName_46_ip_dsdk_adapt_bitselect_x(BITSELECT,71)
    dupName_46_ip_dsdk_adapt_bitselect_x_b <= dupName_37_ip_dsdk_adapt_bitselect_x_b(23 downto 16);

    -- dupName_47_ip_dsdk_adapt_bitselect_x(BITSELECT,72)
    dupName_47_ip_dsdk_adapt_bitselect_x_b <= dupName_46_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_48_ip_dsdk_adapt_bitselect_x(BITSELECT,73)
    dupName_48_ip_dsdk_adapt_bitselect_x_b <= dupName_47_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_49_ip_dsdk_adapt_bitselect_x(BITSELECT,74)
    dupName_49_ip_dsdk_adapt_bitselect_x_b <= dupName_48_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_6_ip_dsdk_adapt_cast_x(BITSELECT,21)
    dupName_6_ip_dsdk_adapt_cast_x_b <= dupName_49_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_42_ip_dsdk_adapt_bitselect_x(BITSELECT,67)
    dupName_42_ip_dsdk_adapt_bitselect_x_b <= dupName_37_ip_dsdk_adapt_bitselect_x_b(15 downto 8);

    -- dupName_43_ip_dsdk_adapt_bitselect_x(BITSELECT,68)
    dupName_43_ip_dsdk_adapt_bitselect_x_b <= dupName_42_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_44_ip_dsdk_adapt_bitselect_x(BITSELECT,69)
    dupName_44_ip_dsdk_adapt_bitselect_x_b <= dupName_43_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_45_ip_dsdk_adapt_bitselect_x(BITSELECT,70)
    dupName_45_ip_dsdk_adapt_bitselect_x_b <= dupName_44_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_5_ip_dsdk_adapt_cast_x(BITSELECT,19)
    dupName_5_ip_dsdk_adapt_cast_x_b <= dupName_45_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_38_ip_dsdk_adapt_bitselect_x(BITSELECT,63)
    dupName_38_ip_dsdk_adapt_bitselect_x_b <= dupName_37_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_39_ip_dsdk_adapt_bitselect_x(BITSELECT,64)
    dupName_39_ip_dsdk_adapt_bitselect_x_b <= dupName_38_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_40_ip_dsdk_adapt_bitselect_x(BITSELECT,65)
    dupName_40_ip_dsdk_adapt_bitselect_x_b <= dupName_39_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_41_ip_dsdk_adapt_bitselect_x(BITSELECT,66)
    dupName_41_ip_dsdk_adapt_bitselect_x_b <= dupName_40_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_4_ip_dsdk_adapt_cast_x(BITSELECT,17)
    dupName_4_ip_dsdk_adapt_cast_x_b <= dupName_41_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_12_ip_dsdk_adapt_bitselect_x(BITSELECT,32)
    dupName_12_ip_dsdk_adapt_bitselect_x_b <= dupName_11_ip_dsdk_adapt_bitselect_x_b(39 downto 0);

    -- dupName_31_ip_dsdk_adapt_bitselect_x(BITSELECT,56)
    dupName_31_ip_dsdk_adapt_bitselect_x_b <= dupName_12_ip_dsdk_adapt_bitselect_x_b(39 downto 32);

    -- dupName_32_ip_dsdk_adapt_bitselect_x(BITSELECT,57)
    dupName_32_ip_dsdk_adapt_bitselect_x_b <= dupName_31_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_33_ip_dsdk_adapt_bitselect_x(BITSELECT,58)
    dupName_33_ip_dsdk_adapt_bitselect_x_b <= dupName_32_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_34_ip_dsdk_adapt_bitselect_x(BITSELECT,59)
    dupName_34_ip_dsdk_adapt_bitselect_x_b <= dupName_33_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_3_ip_dsdk_adapt_cast_x(BITSELECT,15)
    dupName_3_ip_dsdk_adapt_cast_x_b <= dupName_34_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_27_ip_dsdk_adapt_bitselect_x(BITSELECT,52)
    dupName_27_ip_dsdk_adapt_bitselect_x_b <= dupName_12_ip_dsdk_adapt_bitselect_x_b(31 downto 24);

    -- dupName_28_ip_dsdk_adapt_bitselect_x(BITSELECT,53)
    dupName_28_ip_dsdk_adapt_bitselect_x_b <= dupName_27_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_29_ip_dsdk_adapt_bitselect_x(BITSELECT,54)
    dupName_29_ip_dsdk_adapt_bitselect_x_b <= dupName_28_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_30_ip_dsdk_adapt_bitselect_x(BITSELECT,55)
    dupName_30_ip_dsdk_adapt_bitselect_x_b <= dupName_29_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_2_ip_dsdk_adapt_cast_x(BITSELECT,13)
    dupName_2_ip_dsdk_adapt_cast_x_b <= dupName_30_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_13_ip_dsdk_adapt_bitselect_x(BITSELECT,34)
    dupName_13_ip_dsdk_adapt_bitselect_x_b <= dupName_12_ip_dsdk_adapt_bitselect_x_b(23 downto 0);

    -- dupName_14_ip_dsdk_adapt_bitselect_x(BITSELECT,36)
    dupName_14_ip_dsdk_adapt_bitselect_x_b <= dupName_13_ip_dsdk_adapt_bitselect_x_b(23 downto 0);

    -- dupName_23_ip_dsdk_adapt_bitselect_x(BITSELECT,48)
    dupName_23_ip_dsdk_adapt_bitselect_x_b <= dupName_14_ip_dsdk_adapt_bitselect_x_b(23 downto 16);

    -- dupName_24_ip_dsdk_adapt_bitselect_x(BITSELECT,49)
    dupName_24_ip_dsdk_adapt_bitselect_x_b <= dupName_23_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_25_ip_dsdk_adapt_bitselect_x(BITSELECT,50)
    dupName_25_ip_dsdk_adapt_bitselect_x_b <= dupName_24_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_26_ip_dsdk_adapt_bitselect_x(BITSELECT,51)
    dupName_26_ip_dsdk_adapt_bitselect_x_b <= dupName_25_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_1_ip_dsdk_adapt_cast_x(BITSELECT,10)
    dupName_1_ip_dsdk_adapt_cast_x_b <= dupName_26_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_19_ip_dsdk_adapt_bitselect_x(BITSELECT,44)
    dupName_19_ip_dsdk_adapt_bitselect_x_b <= dupName_14_ip_dsdk_adapt_bitselect_x_b(15 downto 8);

    -- dupName_20_ip_dsdk_adapt_bitselect_x(BITSELECT,45)
    dupName_20_ip_dsdk_adapt_bitselect_x_b <= dupName_19_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_21_ip_dsdk_adapt_bitselect_x(BITSELECT,46)
    dupName_21_ip_dsdk_adapt_bitselect_x_b <= dupName_20_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_22_ip_dsdk_adapt_bitselect_x(BITSELECT,47)
    dupName_22_ip_dsdk_adapt_bitselect_x_b <= dupName_21_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_0_ip_dsdk_adapt_cast_x(BITSELECT,5)
    dupName_0_ip_dsdk_adapt_cast_x_b <= dupName_22_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_15_ip_dsdk_adapt_bitselect_x(BITSELECT,38)
    dupName_15_ip_dsdk_adapt_bitselect_x_b <= dupName_14_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_16_ip_dsdk_adapt_bitselect_x(BITSELECT,40)
    dupName_16_ip_dsdk_adapt_bitselect_x_b <= dupName_15_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_17_ip_dsdk_adapt_bitselect_x(BITSELECT,42)
    dupName_17_ip_dsdk_adapt_bitselect_x_b <= dupName_16_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_18_ip_dsdk_adapt_bitselect_x(BITSELECT,43)
    dupName_18_ip_dsdk_adapt_bitselect_x_b <= dupName_17_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- ip_dsdk_adapt_cast(BITSELECT,131)
    ip_dsdk_adapt_cast_b <= dupName_18_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_7_ip_dsdk_adapt_bitselect_x(BITSELECT,22)
    dupName_7_ip_dsdk_adapt_bitselect_x_b <= iord_o_data(23 downto 16);

    -- dupName_8_ip_dsdk_adapt_bitselect_x(BITSELECT,24)
    dupName_8_ip_dsdk_adapt_bitselect_x_b <= dupName_7_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_9_ip_dsdk_adapt_bitselect_x(BITSELECT,26)
    dupName_9_ip_dsdk_adapt_bitselect_x_b <= dupName_8_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_10_ip_dsdk_adapt_bitselect_x(BITSELECT,28)
    dupName_10_ip_dsdk_adapt_bitselect_x_b <= dupName_9_ip_dsdk_adapt_bitselect_x_b(5 downto 0);

    -- dupName_1_adapt_scalar_trunc_x(ROUND,8)
    dupName_1_adapt_scalar_trunc_x_in <= dupName_10_ip_dsdk_adapt_bitselect_x_b;
    dupName_1_adapt_scalar_trunc_x_q <= dupName_1_adapt_scalar_trunc_x_in(5 downto 0);

    -- dupName_3_ip_dsdk_adapt_bitselect_x(BITSELECT,14)
    dupName_3_ip_dsdk_adapt_bitselect_x_b <= iord_o_data(15 downto 8);

    -- dupName_4_ip_dsdk_adapt_bitselect_x(BITSELECT,16)
    dupName_4_ip_dsdk_adapt_bitselect_x_b <= dupName_3_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_5_ip_dsdk_adapt_bitselect_x(BITSELECT,18)
    dupName_5_ip_dsdk_adapt_bitselect_x_b <= dupName_4_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_6_ip_dsdk_adapt_bitselect_x(BITSELECT,20)
    dupName_6_ip_dsdk_adapt_bitselect_x_b <= dupName_5_ip_dsdk_adapt_bitselect_x_b(5 downto 0);

    -- dupName_0_adapt_scalar_trunc_x(ROUND,3)
    dupName_0_adapt_scalar_trunc_x_in <= dupName_6_ip_dsdk_adapt_bitselect_x_b;
    dupName_0_adapt_scalar_trunc_x_q <= dupName_0_adapt_scalar_trunc_x_in(5 downto 0);

    -- ip_dsdk_adapt_bitselect(BITSELECT,130)
    ip_dsdk_adapt_bitselect_b <= iord_o_data(7 downto 0);

    -- dupName_0_ip_dsdk_adapt_bitselect_x(BITSELECT,4)
    dupName_0_ip_dsdk_adapt_bitselect_x_b <= ip_dsdk_adapt_bitselect_b(7 downto 0);

    -- dupName_1_ip_dsdk_adapt_bitselect_x(BITSELECT,9)
    dupName_1_ip_dsdk_adapt_bitselect_x_b <= dupName_0_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_2_ip_dsdk_adapt_bitselect_x(BITSELECT,12)
    dupName_2_ip_dsdk_adapt_bitselect_x_b <= dupName_1_ip_dsdk_adapt_bitselect_x_b(1 downto 0);

    -- adapt_scalar_trunc(ROUND,124)
    adapt_scalar_trunc_in <= dupName_2_ip_dsdk_adapt_bitselect_x_b;
    adapt_scalar_trunc_q <= adapt_scalar_trunc_in(1 downto 0);

    -- dupName_0_sync_out_aunroll_x(GPOUT,2)@2
    out_o_data_0 <= adapt_scalar_trunc_q;
    out_o_data_1 <= dupName_0_adapt_scalar_trunc_x_q;
    out_o_data_2 <= dupName_1_adapt_scalar_trunc_x_q;
    out_o_data_3 <= ip_dsdk_adapt_cast_b;
    out_o_data_4 <= dupName_0_ip_dsdk_adapt_cast_x_b;
    out_o_data_5 <= dupName_1_ip_dsdk_adapt_cast_x_b;
    out_o_data_6 <= dupName_2_ip_dsdk_adapt_cast_x_b;
    out_o_data_7 <= dupName_3_ip_dsdk_adapt_cast_x_b;
    out_o_data_8 <= dupName_4_ip_dsdk_adapt_cast_x_b;
    out_o_data_9 <= dupName_5_ip_dsdk_adapt_cast_x_b;
    out_o_data_10 <= dupName_6_ip_dsdk_adapt_cast_x_b;
    out_o_data_11 <= dupName_7_ip_dsdk_adapt_cast_x_b;
    out_o_data_12 <= dupName_8_ip_dsdk_adapt_cast_x_b;
    out_o_data_13 <= dupName_9_ip_dsdk_adapt_cast_x_b;
    out_o_data_14 <= dupName_10_ip_dsdk_adapt_cast_x_b;
    out_o_data_15 <= dupName_11_ip_dsdk_adapt_cast_x_b;
    out_o_data_16 <= dupName_12_ip_dsdk_adapt_cast_x_b;
    out_o_data_17 <= dupName_13_ip_dsdk_adapt_cast_x_b;
    out_o_data_18 <= dupName_14_ip_dsdk_adapt_cast_x_b;
    out_o_data_19 <= dupName_15_ip_dsdk_adapt_cast_x_b;
    out_o_data_20 <= dupName_16_ip_dsdk_adapt_cast_x_b;
    out_o_data_21 <= dupName_2_adapt_scalar_trunc_x_q;
    out_o_valid <= iord_o_valid;

    -- regfree_osync(GPOUT,133)
    out_iord_bl_snk_o_fifoready <= iord_o_fifoready;

    -- sync_out(GPOUT,135)@20000000
    out_o_stall <= iord_o_stall;

END normal;
