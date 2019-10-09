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

-- VHDL created from i_ffwd_dst_unnamed_gmm_substract116_gmm_substract2878
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

entity i_ffwd_dst_unnamed_gmm_substract116_gmm_substract2878 is
    port (
        out_dest_data_out_15_0_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_dest_data_out_15_0_1 : out std_logic_vector(7 downto 0);  -- ufix8
        out_dest_data_out_15_0_2 : out std_logic_vector(7 downto 0);  -- ufix8
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_intel_reserved_ffwd_15_0_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_15_0_1 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_15_0_2 : in std_logic_vector(7 downto 0);  -- ufix8
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_ffwd_dst_unnamed_gmm_substract116_gmm_substract2878;

architecture normal of i_ffwd_dst_unnamed_gmm_substract116_gmm_substract2878 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component acl_dspba_buffer is
        generic (
            WIDTH : INTEGER := 24
        );
        port (
            buffer_in : in std_logic_vector(23 downto 0);
            buffer_out : out std_logic_vector(23 downto 0)
        );
    end component;


    signal dsdk_ip_array_adapt_bitjoin_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_ffwd_dst_unnamed_gmm_substract116_gmm_substract2879_buffer_in : STD_LOGIC_VECTOR (23 downto 0);
    signal i_ffwd_dst_unnamed_gmm_substract116_gmm_substract2879_buffer_out : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_d : STD_LOGIC_VECTOR (7 downto 0);

begin


    -- dsdk_ip_array_adapt_bitjoin(BITJOIN,39)@20000000
    dsdk_ip_array_adapt_bitjoin_q <= in_intel_reserved_ffwd_15_0_2 & in_intel_reserved_ffwd_15_0_1 & in_intel_reserved_ffwd_15_0_0;

    -- i_ffwd_dst_unnamed_gmm_substract116_gmm_substract2879(EXTIFACE,40)@90
    i_ffwd_dst_unnamed_gmm_substract116_gmm_substract2879_buffer_in <= dsdk_ip_array_adapt_bitjoin_q;
    thei_ffwd_dst_unnamed_gmm_substract116_gmm_substract2879 : acl_dspba_buffer
    GENERIC MAP (
        WIDTH => 24
    )
    PORT MAP (
        buffer_in => dsdk_ip_array_adapt_bitjoin_q,
        buffer_out => i_ffwd_dst_unnamed_gmm_substract116_gmm_substract2879_buffer_out
    );

    -- dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select(BITSELECT,45)@90
    dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_b <= i_ffwd_dst_unnamed_gmm_substract116_gmm_substract2879_buffer_out(7 downto 0);
    dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_c <= i_ffwd_dst_unnamed_gmm_substract116_gmm_substract2879_buffer_out(15 downto 8);
    dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_d <= i_ffwd_dst_unnamed_gmm_substract116_gmm_substract2879_buffer_out(23 downto 16);

    -- dupName_0_sync_out_aunroll_x(GPOUT,2)@90
    out_dest_data_out_15_0_0 <= dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_b;
    out_dest_data_out_15_0_1 <= dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_c;
    out_dest_data_out_15_0_2 <= dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_d;
    out_valid_out <= in_valid_in;

    -- sync_out(GPOUT,44)@90
    out_stall_out <= in_stall_in;

END normal;
