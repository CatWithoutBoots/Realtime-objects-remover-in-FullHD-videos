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

-- VHDL created from i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract2882
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

entity i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract2882 is
    port (
        out_iowr_nb_return_o_fifovalid : out std_logic_vector(0 downto 0);  -- ufix1
        in_i_data : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_dependence : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_ack : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        out_iowr_nb_return_o_fifodata : out std_logic_vector(0 downto 0);  -- ufix1
        in_i_stall : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_stall : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract2882;

architecture normal of i_iowr_nb_return_unnamed_gmm_substract118_gmm_substract2882 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component st_write is
        generic (
            DATA_WIDTH : INTEGER := 1;
            ENABLED : INTEGER := 0;
            NON_BLOCKING : INTEGER := 1
        );
        port (
            i_data : in std_logic;
            i_endofpacket : in std_logic;
            i_fifoready : in std_logic;
            i_fifosize : in std_logic_vector(31 downto 0);
            i_predicate : in std_logic;
            i_stall : in std_logic;
            i_startofpacket : in std_logic;
            i_valid : in std_logic;
            o_ack : out std_logic;
            o_fifodata : out std_logic;
            o_fifovalid : out std_logic;
            o_stall : out std_logic;
            o_valid : out std_logic;
            profile_total_fifo_size_incr : out std_logic_vector(31 downto 0);
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c32_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal iowr_nb_i_data : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_nb_i_data_bitsignaltemp : std_logic;
    signal iowr_nb_i_endofpacket : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_nb_i_endofpacket_bitsignaltemp : std_logic;
    signal iowr_nb_i_fifoready : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_nb_i_fifoready_bitsignaltemp : std_logic;
    signal iowr_nb_i_fifosize : STD_LOGIC_VECTOR (31 downto 0);
    signal iowr_nb_i_predicate : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_nb_i_predicate_bitsignaltemp : std_logic;
    signal iowr_nb_i_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_nb_i_stall_bitsignaltemp : std_logic;
    signal iowr_nb_i_startofpacket : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_nb_i_startofpacket_bitsignaltemp : std_logic;
    signal iowr_nb_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_nb_i_valid_bitsignaltemp : std_logic;
    signal iowr_nb_o_ack : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_nb_o_ack_bitsignaltemp : std_logic;
    signal iowr_nb_o_fifodata : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_nb_o_fifodata_bitsignaltemp : std_logic;
    signal iowr_nb_o_fifovalid : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_nb_o_fifovalid_bitsignaltemp : std_logic;
    signal iowr_nb_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_nb_o_stall_bitsignaltemp : std_logic;
    signal iowr_nb_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal iowr_nb_o_valid_bitsignaltemp : std_logic;
    signal iowr_nb_profile_total_fifo_size_incr : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- c32_0(CONSTANT,6)
    c32_0_q <= "00000000000000000000000000000000";

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- iowr_nb(EXTIFACE,9)
    iowr_nb_i_data <= in_i_data;
    iowr_nb_i_endofpacket <= GND_q;
    iowr_nb_i_fifoready <= GND_q;
    iowr_nb_i_fifosize <= c32_0_q;
    iowr_nb_i_predicate <= GND_q;
    iowr_nb_i_stall <= in_i_stall;
    iowr_nb_i_startofpacket <= GND_q;
    iowr_nb_i_valid <= in_i_valid;
    iowr_nb_i_data_bitsignaltemp <= iowr_nb_i_data(0);
    iowr_nb_i_endofpacket_bitsignaltemp <= iowr_nb_i_endofpacket(0);
    iowr_nb_i_fifoready_bitsignaltemp <= iowr_nb_i_fifoready(0);
    iowr_nb_i_predicate_bitsignaltemp <= iowr_nb_i_predicate(0);
    iowr_nb_i_stall_bitsignaltemp <= iowr_nb_i_stall(0);
    iowr_nb_i_startofpacket_bitsignaltemp <= iowr_nb_i_startofpacket(0);
    iowr_nb_i_valid_bitsignaltemp <= iowr_nb_i_valid(0);
    iowr_nb_o_ack(0) <= iowr_nb_o_ack_bitsignaltemp;
    iowr_nb_o_fifodata(0) <= iowr_nb_o_fifodata_bitsignaltemp;
    iowr_nb_o_fifovalid(0) <= iowr_nb_o_fifovalid_bitsignaltemp;
    iowr_nb_o_stall(0) <= iowr_nb_o_stall_bitsignaltemp;
    iowr_nb_o_valid(0) <= iowr_nb_o_valid_bitsignaltemp;
    theiowr_nb : st_write
    GENERIC MAP (
        DATA_WIDTH => 1,
        ENABLED => 0,
        NON_BLOCKING => 1
    )
    PORT MAP (
        i_data => iowr_nb_i_data_bitsignaltemp,
        i_endofpacket => iowr_nb_i_endofpacket_bitsignaltemp,
        i_fifoready => iowr_nb_i_fifoready_bitsignaltemp,
        i_fifosize => c32_0_q,
        i_predicate => iowr_nb_i_predicate_bitsignaltemp,
        i_stall => iowr_nb_i_stall_bitsignaltemp,
        i_startofpacket => iowr_nb_i_startofpacket_bitsignaltemp,
        i_valid => iowr_nb_i_valid_bitsignaltemp,
        o_ack => iowr_nb_o_ack_bitsignaltemp,
        o_fifodata => iowr_nb_o_fifodata_bitsignaltemp,
        o_fifovalid => iowr_nb_o_fifovalid_bitsignaltemp,
        o_stall => iowr_nb_o_stall_bitsignaltemp,
        o_valid => iowr_nb_o_valid_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_regfree_osync_x(GPOUT,2)
    out_iowr_nb_return_o_fifovalid <= iowr_nb_o_fifovalid;

    -- dupName_0_sync_out_x(GPOUT,4)@93
    out_o_ack <= iowr_nb_o_ack;
    out_o_valid <= iowr_nb_o_valid;

    -- regfree_osync(GPOUT,10)
    out_iowr_nb_return_o_fifodata <= iowr_nb_o_fifodata;

    -- sync_out(GPOUT,12)@20000000
    out_o_stall <= iowr_nb_o_stall;

END normal;
