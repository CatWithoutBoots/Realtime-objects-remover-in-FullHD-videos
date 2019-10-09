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

-- VHDL created from i_acl_pop_i8_pop31_gmm_substract2440
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

entity i_acl_pop_i8_pop31_gmm_substract2440 is
    port (
        in_data_in : in std_logic_vector(7 downto 0);  -- ufix8
        in_dir : in std_logic_vector(0 downto 0);  -- ufix1
        in_predicate : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_data_out : out std_logic_vector(7 downto 0);  -- ufix8
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_in_31 : in std_logic_vector(7 downto 0);  -- ufix8
        in_feedback_valid_in_31 : in std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_stall_out_31 : out std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_acl_pop_i8_pop31_gmm_substract2440;

architecture normal of i_acl_pop_i8_pop31_gmm_substract2440 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component acl_pop is
        generic (
            INF_LOOP : INTEGER;
            STYLE : STRING;
            COALESCE_DISTANCE : INTEGER := 1;
            DATA_WIDTH : INTEGER := 8
        );
        port (
            data_in : in std_logic_vector(7 downto 0);
            dir : in std_logic;
            feedback_in : in std_logic_vector(7 downto 0);
            feedback_valid_in : in std_logic;
            predicate : in std_logic;
            stall_in : in std_logic;
            valid_in : in std_logic;
            data_out : out std_logic_vector(7 downto 0);
            feedback_stall_out : out std_logic;
            stall_out : out std_logic;
            valid_out : out std_logic;
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal i_acl_pop_i8_pop31_gmm_substract2441_data_in : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_pop_i8_pop31_gmm_substract2441_dir : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i8_pop31_gmm_substract2441_dir_bitsignaltemp : std_logic;
    signal i_acl_pop_i8_pop31_gmm_substract2441_feedback_in : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_pop_i8_pop31_gmm_substract2441_feedback_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i8_pop31_gmm_substract2441_feedback_valid_in_bitsignaltemp : std_logic;
    signal i_acl_pop_i8_pop31_gmm_substract2441_predicate : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i8_pop31_gmm_substract2441_predicate_bitsignaltemp : std_logic;
    signal i_acl_pop_i8_pop31_gmm_substract2441_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i8_pop31_gmm_substract2441_stall_in_bitsignaltemp : std_logic;
    signal i_acl_pop_i8_pop31_gmm_substract2441_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i8_pop31_gmm_substract2441_valid_in_bitsignaltemp : std_logic;
    signal i_acl_pop_i8_pop31_gmm_substract2441_data_out : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_pop_i8_pop31_gmm_substract2441_feedback_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i8_pop31_gmm_substract2441_feedback_stall_out_bitsignaltemp : std_logic;
    signal i_acl_pop_i8_pop31_gmm_substract2441_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i8_pop31_gmm_substract2441_stall_out_bitsignaltemp : std_logic;
    signal i_acl_pop_i8_pop31_gmm_substract2441_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i8_pop31_gmm_substract2441_valid_out_bitsignaltemp : std_logic;

begin


    -- i_acl_pop_i8_pop31_gmm_substract2441(EXTIFACE,6)@4
    i_acl_pop_i8_pop31_gmm_substract2441_data_in <= in_data_in;
    i_acl_pop_i8_pop31_gmm_substract2441_dir <= in_dir;
    i_acl_pop_i8_pop31_gmm_substract2441_feedback_in <= in_feedback_in_31;
    i_acl_pop_i8_pop31_gmm_substract2441_feedback_valid_in <= in_feedback_valid_in_31;
    i_acl_pop_i8_pop31_gmm_substract2441_predicate <= in_predicate;
    i_acl_pop_i8_pop31_gmm_substract2441_stall_in <= in_stall_in;
    i_acl_pop_i8_pop31_gmm_substract2441_valid_in <= in_valid_in;
    i_acl_pop_i8_pop31_gmm_substract2441_dir_bitsignaltemp <= i_acl_pop_i8_pop31_gmm_substract2441_dir(0);
    i_acl_pop_i8_pop31_gmm_substract2441_feedback_valid_in_bitsignaltemp <= i_acl_pop_i8_pop31_gmm_substract2441_feedback_valid_in(0);
    i_acl_pop_i8_pop31_gmm_substract2441_predicate_bitsignaltemp <= i_acl_pop_i8_pop31_gmm_substract2441_predicate(0);
    i_acl_pop_i8_pop31_gmm_substract2441_stall_in_bitsignaltemp <= i_acl_pop_i8_pop31_gmm_substract2441_stall_in(0);
    i_acl_pop_i8_pop31_gmm_substract2441_valid_in_bitsignaltemp <= i_acl_pop_i8_pop31_gmm_substract2441_valid_in(0);
    i_acl_pop_i8_pop31_gmm_substract2441_feedback_stall_out(0) <= i_acl_pop_i8_pop31_gmm_substract2441_feedback_stall_out_bitsignaltemp;
    i_acl_pop_i8_pop31_gmm_substract2441_stall_out(0) <= i_acl_pop_i8_pop31_gmm_substract2441_stall_out_bitsignaltemp;
    i_acl_pop_i8_pop31_gmm_substract2441_valid_out(0) <= i_acl_pop_i8_pop31_gmm_substract2441_valid_out_bitsignaltemp;
    thei_acl_pop_i8_pop31_gmm_substract2441 : acl_pop
    GENERIC MAP (
        INF_LOOP => 0,
        STYLE => "REGULAR",
        COALESCE_DISTANCE => 1,
        DATA_WIDTH => 8
    )
    PORT MAP (
        data_in => in_data_in,
        dir => i_acl_pop_i8_pop31_gmm_substract2441_dir_bitsignaltemp,
        feedback_in => in_feedback_in_31,
        feedback_valid_in => i_acl_pop_i8_pop31_gmm_substract2441_feedback_valid_in_bitsignaltemp,
        predicate => i_acl_pop_i8_pop31_gmm_substract2441_predicate_bitsignaltemp,
        stall_in => i_acl_pop_i8_pop31_gmm_substract2441_stall_in_bitsignaltemp,
        valid_in => i_acl_pop_i8_pop31_gmm_substract2441_valid_in_bitsignaltemp,
        data_out => i_acl_pop_i8_pop31_gmm_substract2441_data_out,
        feedback_stall_out => i_acl_pop_i8_pop31_gmm_substract2441_feedback_stall_out_bitsignaltemp,
        stall_out => i_acl_pop_i8_pop31_gmm_substract2441_stall_out_bitsignaltemp,
        valid_out => i_acl_pop_i8_pop31_gmm_substract2441_valid_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_sync_out_x(GPOUT,3)@4
    out_data_out <= i_acl_pop_i8_pop31_gmm_substract2441_data_out;
    out_valid_out <= i_acl_pop_i8_pop31_gmm_substract2441_valid_out;

    -- feedback_sync_out(GPOUT,5)
    out_feedback_stall_out_31 <= i_acl_pop_i8_pop31_gmm_substract2441_feedback_stall_out;

    -- sync_out(GPOUT,9)@4
    out_stall_out <= i_acl_pop_i8_pop31_gmm_substract2441_stall_out;

END normal;
