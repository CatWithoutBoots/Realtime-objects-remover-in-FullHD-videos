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

-- VHDL created from gmm_substract_function_wrapper
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

entity gmm_substract_function_wrapper is
    port (
        avst_iord_bl_do_data : in std_logic_vector(0 downto 0);  -- ufix1
        avst_iord_bl_do_valid : in std_logic_vector(0 downto 0);  -- ufix1
        avst_iord_bl_snk_data : in std_logic_vector(175 downto 0);  -- ufix176
        avst_iord_bl_snk_valid : in std_logic_vector(0 downto 0);  -- ufix1
        avst_iowr_bl_src_almostfull : in std_logic_vector(0 downto 0);  -- ufix1
        avst_iowr_bl_src_ready : in std_logic_vector(0 downto 0);  -- ufix1
        avst_iowr_nb_return_almostfull : in std_logic_vector(0 downto 0);  -- ufix1
        bg_th : in std_logic_vector(7 downto 0);  -- ufix8
        d : in std_logic_vector(7 downto 0);  -- ufix8
        in_alpha : in std_logic_vector(9 downto 0);  -- ufix10
        s : in std_logic_vector(7 downto 0);  -- ufix8
        stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        start : in std_logic_vector(0 downto 0);  -- ufix1
        valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        avst_iord_bl_do_ready : out std_logic_vector(0 downto 0);  -- ufix1
        avst_iord_bl_snk_ready : out std_logic_vector(0 downto 0);  -- ufix1
        avst_iowr_bl_src_data : out std_logic_vector(175 downto 0);  -- ufix176
        avst_iowr_bl_src_valid : out std_logic_vector(0 downto 0);  -- ufix1
        avst_iowr_nb_return_data : out std_logic_vector(0 downto 0);  -- ufix1
        avst_iowr_nb_return_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end gmm_substract_function_wrapper;

architecture normal of gmm_substract_function_wrapper is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component gmm_substract_function is
        port (
            in_arg_bg_th_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_d_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_in_alpha_0 : in std_logic_vector(9 downto 0);  -- Fixed Point
            in_arg_s_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_arg_do : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_return : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_snk : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_src : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_iord_bl_do_i_fifodata : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_iord_bl_do_i_fifovalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_iord_bl_snk_i_fifodata : in std_logic_vector(175 downto 0);  -- Fixed Point
            in_iord_bl_snk_i_fifovalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_iowr_bl_src_i_fifoready : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_iord_bl_do_o_fifoready : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_iord_bl_snk_o_fifoready : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_iowr_bl_src_o_fifodata : out std_logic_vector(175 downto 0);  -- Fixed Point
            out_iowr_bl_src_o_fifovalid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_iowr_nb_return_o_fifodata : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_iowr_nb_return_o_fifovalid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component iord_bl_snk_fifo_inst is
        port (
            in_stream_in_data : in std_logic_vector(175 downto 0);  -- Fixed Point
            in_stream_in_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stream_out_ready : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_stream_in_ready : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stream_out_data : out std_logic_vector(175 downto 0);  -- Fixed Point
            out_stream_out_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_0_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_1_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_1_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_2_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_3_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_4_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_5_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_6_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_7_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (9 downto 0);
    signal dupName_8_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_9_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_10_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal gmm_substract_function_aunroll_x_out_iord_bl_do_o_fifoready : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_function_aunroll_x_out_iord_bl_snk_o_fifoready : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_function_aunroll_x_out_iowr_bl_src_o_fifodata : STD_LOGIC_VECTOR (175 downto 0);
    signal gmm_substract_function_aunroll_x_out_iowr_bl_src_o_fifovalid : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_function_aunroll_x_out_iowr_nb_return_o_fifodata : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_function_aunroll_x_out_iowr_nb_return_o_fifovalid : STD_LOGIC_VECTOR (0 downto 0);
    signal adapt_scalar_trunc_in : STD_LOGIC_VECTOR (9 downto 0);
    signal adapt_scalar_trunc_q : STD_LOGIC_VECTOR (9 downto 0);
    signal do_const_q : STD_LOGIC_VECTOR (63 downto 0);
    signal iord_bl_snk_fifo_inst_out_stream_in_ready : STD_LOGIC_VECTOR (0 downto 0);
    signal iord_bl_snk_fifo_inst_out_stream_out_data : STD_LOGIC_VECTOR (175 downto 0);
    signal iord_bl_snk_fifo_inst_out_stream_out_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal ip_dsdk_adapt_bitselect_b : STD_LOGIC_VECTOR (7 downto 0);
    signal ip_dsdk_adapt_cast_b : STD_LOGIC_VECTOR (7 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- iord_bl_snk_fifo_inst(BLACKBOX,34)
    theiord_bl_snk_fifo_inst : iord_bl_snk_fifo_inst
    PORT MAP (
        in_stream_in_data => avst_iord_bl_snk_data,
        in_stream_in_valid => avst_iord_bl_snk_valid,
        in_stream_out_ready => gmm_substract_function_aunroll_x_out_iord_bl_snk_o_fifoready,
        out_stream_in_ready => iord_bl_snk_fifo_inst_out_stream_in_ready,
        out_stream_out_data => iord_bl_snk_fifo_inst_out_stream_out_data,
        out_stream_out_valid => iord_bl_snk_fifo_inst_out_stream_out_valid,
        clock => clock,
        resetn => resetn
    );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- do_const(CONSTANT,19)
    do_const_q <= "0000000000000000000000000000000000000000000000000000000000000000";

    -- dupName_8_ip_dsdk_adapt_bitselect_x(BITSELECT,12)
    dupName_8_ip_dsdk_adapt_bitselect_x_b <= s(7 downto 0);

    -- dupName_9_ip_dsdk_adapt_bitselect_x(BITSELECT,13)
    dupName_9_ip_dsdk_adapt_bitselect_x_b <= dupName_8_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_10_ip_dsdk_adapt_bitselect_x(BITSELECT,14)
    dupName_10_ip_dsdk_adapt_bitselect_x_b <= dupName_9_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_1_ip_dsdk_adapt_cast_x(BITSELECT,5)
    dupName_1_ip_dsdk_adapt_cast_x_b <= dupName_10_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_5_ip_dsdk_adapt_bitselect_x(BITSELECT,9)
    dupName_5_ip_dsdk_adapt_bitselect_x_b <= std_logic_vector(resize(unsigned(in_alpha(9 downto 0)), 16));

    -- dupName_6_ip_dsdk_adapt_bitselect_x(BITSELECT,10)
    dupName_6_ip_dsdk_adapt_bitselect_x_b <= dupName_5_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_7_ip_dsdk_adapt_bitselect_x(BITSELECT,11)
    dupName_7_ip_dsdk_adapt_bitselect_x_b <= dupName_6_ip_dsdk_adapt_bitselect_x_b(9 downto 0);

    -- adapt_scalar_trunc(ROUND,16)
    adapt_scalar_trunc_in <= dupName_7_ip_dsdk_adapt_bitselect_x_b;
    adapt_scalar_trunc_q <= adapt_scalar_trunc_in(9 downto 0);

    -- ip_dsdk_adapt_bitselect(BITSELECT,35)
    ip_dsdk_adapt_bitselect_b <= d(7 downto 0);

    -- dupName_0_ip_dsdk_adapt_bitselect_x(BITSELECT,2)
    dupName_0_ip_dsdk_adapt_bitselect_x_b <= ip_dsdk_adapt_bitselect_b(7 downto 0);

    -- dupName_1_ip_dsdk_adapt_bitselect_x(BITSELECT,4)
    dupName_1_ip_dsdk_adapt_bitselect_x_b <= dupName_0_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- ip_dsdk_adapt_cast(BITSELECT,36)
    ip_dsdk_adapt_cast_b <= dupName_1_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_2_ip_dsdk_adapt_bitselect_x(BITSELECT,6)
    dupName_2_ip_dsdk_adapt_bitselect_x_b <= bg_th(7 downto 0);

    -- dupName_3_ip_dsdk_adapt_bitselect_x(BITSELECT,7)
    dupName_3_ip_dsdk_adapt_bitselect_x_b <= dupName_2_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_4_ip_dsdk_adapt_bitselect_x(BITSELECT,8)
    dupName_4_ip_dsdk_adapt_bitselect_x_b <= dupName_3_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_0_ip_dsdk_adapt_cast_x(BITSELECT,3)
    dupName_0_ip_dsdk_adapt_cast_x_b <= dupName_4_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- gmm_substract_function_aunroll_x(BLACKBOX,15)
    thegmm_substract_function_aunroll_x : gmm_substract_function
    PORT MAP (
        in_arg_bg_th_0 => dupName_0_ip_dsdk_adapt_cast_x_b,
        in_arg_d_0 => ip_dsdk_adapt_cast_b,
        in_arg_in_alpha_0 => adapt_scalar_trunc_q,
        in_arg_s_0 => dupName_1_ip_dsdk_adapt_cast_x_b,
        in_arg_do => do_const_q,
        in_arg_return => do_const_q,
        in_arg_snk => do_const_q,
        in_arg_src => do_const_q,
        in_iord_bl_do_i_fifodata => avst_iord_bl_do_data,
        in_iord_bl_do_i_fifovalid => VCC_q,
        in_iord_bl_snk_i_fifodata => iord_bl_snk_fifo_inst_out_stream_out_data,
        in_iord_bl_snk_i_fifovalid => iord_bl_snk_fifo_inst_out_stream_out_valid,
        in_iowr_bl_src_i_fifoready => avst_iowr_bl_src_ready,
        in_stall_in => GND_q,
        in_valid_in => VCC_q,
        out_iord_bl_do_o_fifoready => gmm_substract_function_aunroll_x_out_iord_bl_do_o_fifoready,
        out_iord_bl_snk_o_fifoready => gmm_substract_function_aunroll_x_out_iord_bl_snk_o_fifoready,
        out_iowr_bl_src_o_fifodata => gmm_substract_function_aunroll_x_out_iowr_bl_src_o_fifodata,
        out_iowr_bl_src_o_fifovalid => gmm_substract_function_aunroll_x_out_iowr_bl_src_o_fifovalid,
        out_iowr_nb_return_o_fifodata => gmm_substract_function_aunroll_x_out_iowr_nb_return_o_fifodata,
        out_iowr_nb_return_o_fifovalid => gmm_substract_function_aunroll_x_out_iowr_nb_return_o_fifovalid,
        clock => clock,
        resetn => resetn
    );

    -- avst_iord_bl_do_ready(GPOUT,37)
    avst_iord_bl_do_ready <= gmm_substract_function_aunroll_x_out_iord_bl_do_o_fifoready;

    -- avst_iord_bl_snk_ready(GPOUT,38)
    avst_iord_bl_snk_ready <= iord_bl_snk_fifo_inst_out_stream_in_ready;

    -- avst_iowr_bl_src_data(GPOUT,39)
    avst_iowr_bl_src_data <= gmm_substract_function_aunroll_x_out_iowr_bl_src_o_fifodata;

    -- avst_iowr_bl_src_valid(GPOUT,40)
    avst_iowr_bl_src_valid <= gmm_substract_function_aunroll_x_out_iowr_bl_src_o_fifovalid;

    -- avst_iowr_nb_return_data(GPOUT,41)
    avst_iowr_nb_return_data <= gmm_substract_function_aunroll_x_out_iowr_nb_return_o_fifodata;

    -- avst_iowr_nb_return_valid(GPOUT,42)
    avst_iowr_nb_return_valid <= gmm_substract_function_aunroll_x_out_iowr_nb_return_o_fifovalid;

END normal;
