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

-- VHDL created from loop_limiter_gmm_substract1
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

entity loop_limiter_gmm_substract1 is
    port (
        in_i_stall : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_stall_exit : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid_exit : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_stall : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end loop_limiter_gmm_substract1;

architecture normal of loop_limiter_gmm_substract1 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component acl_loop_limiter is
        generic (
            ENTRY_WIDTH : INTEGER := 1;
            EXIT_WIDTH : INTEGER := 1;
            THRESHOLD : INTEGER := 1;
            THRESHOLD_NO_DELAY : INTEGER := 1
        );
        port (
            i_stall : in std_logic;
            i_stall_exit : in std_logic;
            i_valid : in std_logic;
            i_valid_exit : in std_logic;
            o_stall : out std_logic;
            o_valid : out std_logic;
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal limiter_i_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal limiter_i_stall_bitsignaltemp : std_logic;
    signal limiter_i_stall_exit : STD_LOGIC_VECTOR (0 downto 0);
    signal limiter_i_stall_exit_bitsignaltemp : std_logic;
    signal limiter_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal limiter_i_valid_bitsignaltemp : std_logic;
    signal limiter_i_valid_exit : STD_LOGIC_VECTOR (0 downto 0);
    signal limiter_i_valid_exit_bitsignaltemp : std_logic;
    signal limiter_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal limiter_o_stall_bitsignaltemp : std_logic;
    signal limiter_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal limiter_o_valid_bitsignaltemp : std_logic;

begin


    -- limiter(EXTIFACE,6)
    limiter_i_stall <= in_i_stall;
    limiter_i_stall_exit <= in_i_stall_exit;
    limiter_i_valid <= in_i_valid;
    limiter_i_valid_exit <= in_i_valid_exit;
    limiter_i_stall_bitsignaltemp <= limiter_i_stall(0);
    limiter_i_stall_exit_bitsignaltemp <= limiter_i_stall_exit(0);
    limiter_i_valid_bitsignaltemp <= limiter_i_valid(0);
    limiter_i_valid_exit_bitsignaltemp <= limiter_i_valid_exit(0);
    limiter_o_stall(0) <= limiter_o_stall_bitsignaltemp;
    limiter_o_valid(0) <= limiter_o_valid_bitsignaltemp;
    thelimiter : acl_loop_limiter
    GENERIC MAP (
        ENTRY_WIDTH => 1,
        EXIT_WIDTH => 1,
        THRESHOLD => 1,
        THRESHOLD_NO_DELAY => 1
    )
    PORT MAP (
        i_stall => limiter_i_stall_bitsignaltemp,
        i_stall_exit => limiter_i_stall_exit_bitsignaltemp,
        i_valid => limiter_i_valid_bitsignaltemp,
        i_valid_exit => limiter_i_valid_exit_bitsignaltemp,
        o_stall => limiter_o_stall_bitsignaltemp,
        o_valid => limiter_o_valid_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- out_o_stall(GPOUT,7)
    out_o_stall <= limiter_o_stall;

    -- out_o_valid(GPOUT,8)
    out_o_valid <= limiter_o_valid;

END normal;
