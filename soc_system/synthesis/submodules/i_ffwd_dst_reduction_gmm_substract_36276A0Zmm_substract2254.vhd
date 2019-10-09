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

-- VHDL created from i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract2254
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

entity i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract2254 is
    port (
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_dest_data_out_75_0 : out std_logic_vector(8 downto 0);  -- ufix9
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_intel_reserved_ffwd_75_0 : in std_logic_vector(8 downto 0);  -- ufix9
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract2254;

architecture normal of i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract2254 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component acl_dspba_buffer is
        generic (
            WIDTH : INTEGER := 16
        );
        port (
            buffer_in : in std_logic_vector(15 downto 0);
            buffer_out : out std_logic_vector(15 downto 0)
        );
    end component;


    signal adapt_scalar_trunc_in : STD_LOGIC_VECTOR (8 downto 0);
    signal adapt_scalar_trunc_q : STD_LOGIC_VECTOR (8 downto 0);
    signal c_i7_0gr_q : STD_LOGIC_VECTOR (6 downto 0);
    signal element_extension_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract2255_buffer_in : STD_LOGIC_VECTOR (15 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract2255_buffer_out : STD_LOGIC_VECTOR (15 downto 0);

begin


    -- c_i7_0gr(CONSTANT,5)
    c_i7_0gr_q <= "0000000";

    -- element_extension(BITJOIN,6)
    element_extension_q <= c_i7_0gr_q & in_intel_reserved_ffwd_75_0;

    -- i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract2255(EXTIFACE,7)
    i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract2255_buffer_in <= element_extension_q;
    thei_ffwd_dst_reduction_gmm_substract_362760_gmm_substract2255 : acl_dspba_buffer
    GENERIC MAP (
        WIDTH => 16
    )
    PORT MAP (
        buffer_in => element_extension_q,
        buffer_out => i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract2255_buffer_out
    );

    -- adapt_scalar_trunc(ROUND,4)
    adapt_scalar_trunc_in <= i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract2255_buffer_out(8 downto 0);
    adapt_scalar_trunc_q <= adapt_scalar_trunc_in(8 downto 0);

    -- dupName_0_sync_out_x(GPOUT,3)@0
    out_dest_data_out_75_0 <= adapt_scalar_trunc_q;
    out_valid_out <= in_valid_in;

    -- sync_out(GPOUT,10)@20000000
    out_stall_out <= in_stall_in;

END normal;
