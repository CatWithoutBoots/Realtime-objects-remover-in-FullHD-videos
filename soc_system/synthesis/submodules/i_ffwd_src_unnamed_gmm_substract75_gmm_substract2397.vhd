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

-- VHDL created from i_ffwd_src_unnamed_gmm_substract75_gmm_substract2397
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

entity i_ffwd_src_unnamed_gmm_substract75_gmm_substract2397 is
    port (
        in_enable_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_src_data_in_71_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_intel_reserved_ffwd_71_0 : out std_logic_vector(7 downto 0);  -- ufix8
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_ffwd_src_unnamed_gmm_substract75_gmm_substract2397;

architecture normal of i_ffwd_src_unnamed_gmm_substract75_gmm_substract2397 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component acl_ffwdsrc is
        generic (
            WIDTH : INTEGER := 8
        );
        port (
            enable_in : in std_logic;
            source_in : in std_logic_vector(7 downto 0);
            valid_in : in std_logic;
            source_out : out std_logic_vector(7 downto 0);
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal i_ffwd_src_unnamed_gmm_substract75_gmm_substract2398_enable_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract75_gmm_substract2398_enable_in_bitsignaltemp : std_logic;
    signal i_ffwd_src_unnamed_gmm_substract75_gmm_substract2398_source_in : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract75_gmm_substract2398_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract75_gmm_substract2398_valid_in_bitsignaltemp : std_logic;
    signal i_ffwd_src_unnamed_gmm_substract75_gmm_substract2398_source_out : STD_LOGIC_VECTOR (7 downto 0);
    signal ip_dsdk_adapt_cast_b : STD_LOGIC_VECTOR (7 downto 0);

begin


    -- dupName_0_sync_out_x(GPOUT,3)@1
    out_valid_out <= in_valid_in;

    -- i_ffwd_src_unnamed_gmm_substract75_gmm_substract2398(EXTIFACE,4)
    i_ffwd_src_unnamed_gmm_substract75_gmm_substract2398_enable_in <= in_enable_in;
    i_ffwd_src_unnamed_gmm_substract75_gmm_substract2398_source_in <= in_src_data_in_71_0;
    i_ffwd_src_unnamed_gmm_substract75_gmm_substract2398_valid_in <= in_valid_in;
    i_ffwd_src_unnamed_gmm_substract75_gmm_substract2398_enable_in_bitsignaltemp <= i_ffwd_src_unnamed_gmm_substract75_gmm_substract2398_enable_in(0);
    i_ffwd_src_unnamed_gmm_substract75_gmm_substract2398_valid_in_bitsignaltemp <= i_ffwd_src_unnamed_gmm_substract75_gmm_substract2398_valid_in(0);
    thei_ffwd_src_unnamed_gmm_substract75_gmm_substract2398 : acl_ffwdsrc
    GENERIC MAP (
        WIDTH => 8
    )
    PORT MAP (
        enable_in => i_ffwd_src_unnamed_gmm_substract75_gmm_substract2398_enable_in_bitsignaltemp,
        source_in => in_src_data_in_71_0,
        valid_in => i_ffwd_src_unnamed_gmm_substract75_gmm_substract2398_valid_in_bitsignaltemp,
        source_out => i_ffwd_src_unnamed_gmm_substract75_gmm_substract2398_source_out,
        clock => clock,
        resetn => resetn
    );

    -- ip_dsdk_adapt_cast(BITSELECT,5)
    ip_dsdk_adapt_cast_b <= i_ffwd_src_unnamed_gmm_substract75_gmm_substract2398_source_out(7 downto 0);

    -- regfree_osync(GPOUT,6)
    out_intel_reserved_ffwd_71_0 <= ip_dsdk_adapt_cast_b;

    -- sync_out(GPOUT,8)@20000000
    out_stall_out <= in_stall_in;

END normal;
