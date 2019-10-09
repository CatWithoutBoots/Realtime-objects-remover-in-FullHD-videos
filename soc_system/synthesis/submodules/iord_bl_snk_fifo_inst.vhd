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

-- VHDL created from iord_bl_snk_fifo_inst
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

entity iord_bl_snk_fifo_inst is
    port (
        in_stream_in_data : in std_logic_vector(175 downto 0);  -- ufix176
        in_stream_in_valid : in std_logic_vector(0 downto 0);  -- ufix1
        in_stream_out_ready : in std_logic_vector(0 downto 0);  -- ufix1
        out_stream_in_ready : out std_logic_vector(0 downto 0);  -- ufix1
        out_stream_out_data : out std_logic_vector(175 downto 0);  -- ufix176
        out_stream_out_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end iord_bl_snk_fifo_inst;

architecture normal of iord_bl_snk_fifo_inst is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component acl_stream_fifo is
        generic (
            ALMOST_FULL_VALUE : INTEGER := 64;
            DATA_W : INTEGER := 176;
            FIFO_DEPTH : INTEGER := 64;
            STALL_ON_ALMOSTFULL : INTEGER := 0;
            USES_PACKETS : INTEGER := 0
        );
        port (
            stream_in_data : in std_logic_vector(175 downto 0);
            stream_in_endofpacket : in std_logic;
            stream_in_startofpacket : in std_logic;
            stream_in_valid : in std_logic;
            stream_out_ready : in std_logic;
            stream_in_ready : out std_logic;
            stream_out_data : out std_logic_vector(175 downto 0);
            stream_out_valid : out std_logic;
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal iord_bl_snk_fifo_inst_internal_stream_in_data : STD_LOGIC_VECTOR (175 downto 0);
    signal iord_bl_snk_fifo_inst_internal_stream_in_endofpacket : STD_LOGIC_VECTOR (0 downto 0);
    signal iord_bl_snk_fifo_inst_internal_stream_in_endofpacket_bitsignaltemp : std_logic;
    signal iord_bl_snk_fifo_inst_internal_stream_in_startofpacket : STD_LOGIC_VECTOR (0 downto 0);
    signal iord_bl_snk_fifo_inst_internal_stream_in_startofpacket_bitsignaltemp : std_logic;
    signal iord_bl_snk_fifo_inst_internal_stream_in_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal iord_bl_snk_fifo_inst_internal_stream_in_valid_bitsignaltemp : std_logic;
    signal iord_bl_snk_fifo_inst_internal_stream_out_ready : STD_LOGIC_VECTOR (0 downto 0);
    signal iord_bl_snk_fifo_inst_internal_stream_out_ready_bitsignaltemp : std_logic;
    signal iord_bl_snk_fifo_inst_internal_stream_in_ready : STD_LOGIC_VECTOR (0 downto 0);
    signal iord_bl_snk_fifo_inst_internal_stream_in_ready_bitsignaltemp : std_logic;
    signal iord_bl_snk_fifo_inst_internal_stream_out_data : STD_LOGIC_VECTOR (175 downto 0);
    signal iord_bl_snk_fifo_inst_internal_stream_out_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal iord_bl_snk_fifo_inst_internal_stream_out_valid_bitsignaltemp : std_logic;

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- iord_bl_snk_fifo_inst_internal(EXTIFACE,6)
    iord_bl_snk_fifo_inst_internal_stream_in_data <= in_stream_in_data;
    iord_bl_snk_fifo_inst_internal_stream_in_endofpacket <= GND_q;
    iord_bl_snk_fifo_inst_internal_stream_in_startofpacket <= GND_q;
    iord_bl_snk_fifo_inst_internal_stream_in_valid <= in_stream_in_valid;
    iord_bl_snk_fifo_inst_internal_stream_out_ready <= in_stream_out_ready;
    iord_bl_snk_fifo_inst_internal_stream_in_endofpacket_bitsignaltemp <= iord_bl_snk_fifo_inst_internal_stream_in_endofpacket(0);
    iord_bl_snk_fifo_inst_internal_stream_in_startofpacket_bitsignaltemp <= iord_bl_snk_fifo_inst_internal_stream_in_startofpacket(0);
    iord_bl_snk_fifo_inst_internal_stream_in_valid_bitsignaltemp <= iord_bl_snk_fifo_inst_internal_stream_in_valid(0);
    iord_bl_snk_fifo_inst_internal_stream_out_ready_bitsignaltemp <= iord_bl_snk_fifo_inst_internal_stream_out_ready(0);
    iord_bl_snk_fifo_inst_internal_stream_in_ready(0) <= iord_bl_snk_fifo_inst_internal_stream_in_ready_bitsignaltemp;
    iord_bl_snk_fifo_inst_internal_stream_out_valid(0) <= iord_bl_snk_fifo_inst_internal_stream_out_valid_bitsignaltemp;
    theiord_bl_snk_fifo_inst_internal : acl_stream_fifo
    GENERIC MAP (
        ALMOST_FULL_VALUE => 64,
        DATA_W => 176,
        FIFO_DEPTH => 64,
        STALL_ON_ALMOSTFULL => 0,
        USES_PACKETS => 0
    )
    PORT MAP (
        stream_in_data => in_stream_in_data,
        stream_in_endofpacket => iord_bl_snk_fifo_inst_internal_stream_in_endofpacket_bitsignaltemp,
        stream_in_startofpacket => iord_bl_snk_fifo_inst_internal_stream_in_startofpacket_bitsignaltemp,
        stream_in_valid => iord_bl_snk_fifo_inst_internal_stream_in_valid_bitsignaltemp,
        stream_out_ready => iord_bl_snk_fifo_inst_internal_stream_out_ready_bitsignaltemp,
        stream_in_ready => iord_bl_snk_fifo_inst_internal_stream_in_ready_bitsignaltemp,
        stream_out_data => iord_bl_snk_fifo_inst_internal_stream_out_data,
        stream_out_valid => iord_bl_snk_fifo_inst_internal_stream_out_valid_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- out_stream_in_ready(GPOUT,7)
    out_stream_in_ready <= iord_bl_snk_fifo_inst_internal_stream_in_ready;

    -- out_stream_out_data(GPOUT,8)
    out_stream_out_data <= iord_bl_snk_fifo_inst_internal_stream_out_data;

    -- out_stream_out_valid(GPOUT,9)
    out_stream_out_valid <= iord_bl_snk_fifo_inst_internal_stream_out_valid;

END normal;
