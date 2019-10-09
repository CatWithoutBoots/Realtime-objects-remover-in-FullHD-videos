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

-- VHDL created from bb_gmm_substract_B2_stall_region
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

entity bb_gmm_substract_B2_stall_region is
    port (
        in_intel_reserved_ffwd_33_0 : in std_logic_vector(15 downto 0);  -- ufix16
        out_intel_reserved_ffwd_57_0 : out std_logic_vector(7 downto 0);  -- ufix8
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_intel_reserved_ffwd_35_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_intel_reserved_ffwd_58_0 : out std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_36_0 : in std_logic_vector(15 downto 0);  -- ufix16
        out_intel_reserved_ffwd_59_0 : out std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_38_0 : in std_logic_vector(15 downto 0);  -- ufix16
        out_intel_reserved_ffwd_60_0 : out std_logic_vector(15 downto 0);  -- ufix16
        in_intel_reserved_ffwd_39_0 : in std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_61_0 : out std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_40_0 : in std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_62_0 : out std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_41_0 : in std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_63_0 : out std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_42_0 : in std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_64_0 : out std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_43_0 : in std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_65_0 : out std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_44_0 : in std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_66_0 : out std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_45_0 : in std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_67_0 : out std_logic_vector(15 downto 0);  -- ufix16
        in_intel_reserved_ffwd_46_0 : in std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_68_0 : out std_logic_vector(15 downto 0);  -- ufix16
        in_intel_reserved_ffwd_47_0 : in std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_69_0 : out std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_48_0 : in std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_70_0 : out std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_49_0 : in std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_71_0 : out std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_50_0 : in std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_72_0 : out std_logic_vector(33 downto 0);  -- ufix34
        in_intel_reserved_ffwd_51_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_intel_reserved_ffwd_52_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_intel_reserved_ffwd_53_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_intel_reserved_ffwd_54_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_intel_reserved_ffwd_73_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_intel_reserved_ffwd_74_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_75_0 : in std_logic_vector(8 downto 0);  -- ufix9
        in_intel_reserved_ffwd_76_0 : in std_logic_vector(8 downto 0);  -- ufix9
        in_intel_reserved_ffwd_77_0 : in std_logic_vector(8 downto 0);  -- ufix9
        in_intel_reserved_ffwd_78_0 : in std_logic_vector(8 downto 0);  -- ufix9
        in_intel_reserved_ffwd_79_0 : in std_logic_vector(8 downto 0);  -- ufix9
        in_intel_reserved_ffwd_80_0 : in std_logic_vector(8 downto 0);  -- ufix9
        in_intel_reserved_ffwd_81_0 : in std_logic_vector(8 downto 0);  -- ufix9
        in_intel_reserved_ffwd_82_0 : in std_logic_vector(8 downto 0);  -- ufix9
        in_intel_reserved_ffwd_83_0 : in std_logic_vector(8 downto 0);  -- ufix9
        in_intel_reserved_ffwd_84_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_intel_reserved_ffwd_85_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_intel_reserved_ffwd_86_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_intel_reserved_ffwd_87_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_intel_reserved_ffwd_88_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_intel_reserved_ffwd_89_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_90_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_91_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_31_0 : in std_logic_vector(1 downto 0);  -- ufix2
        out_intel_reserved_ffwd_56_0 : out std_logic_vector(7 downto 0);  -- ufix8
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gmm_substract_B2_stall_region;

architecture normal of bb_gmm_substract_B2_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_ffwd_dst_acl_3762631_gmm_substract2360 is
        port (
            in_intel_reserved_ffwd_31_0 : in std_logic_vector(1 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_31_0 : out std_logic_vector(1 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_3772638_gmm_substract2348 is
        port (
            in_intel_reserved_ffwd_33_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_33_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_3772640_gmm_substract2322 is
        port (
            in_intel_reserved_ffwd_33_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_33_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_3832672_gmm_substract2324 is
        port (
            in_intel_reserved_ffwd_36_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_36_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_3832673_gmm_substract2350 is
        port (
            in_intel_reserved_ffwd_36_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_36_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_3892685_gmm_substract2344 is
        port (
            in_intel_reserved_ffwd_38_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_38_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_3972689_gmm_substract2356 is
        port (
            in_intel_reserved_ffwd_39_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_39_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_3972691_gmm_substract2326 is
        port (
            in_intel_reserved_ffwd_39_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_39_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_4002696_gmm_substract2328 is
        port (
            in_intel_reserved_ffwd_40_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_40_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_4002698_gmm_substract2358 is
        port (
            in_intel_reserved_ffwd_40_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_40_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_4032701_gmm_substract2352 is
        port (
            in_intel_reserved_ffwd_41_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_41_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_cmp_i_i_i1372734_gmm_substract2272 is
        port (
            in_intel_reserved_ffwd_53_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_53_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract2274 is
        port (
            in_intel_reserved_ffwd_35_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_35_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_div_i_i2726_gmm_substract2276 is
        port (
            in_intel_reserved_ffwd_51_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_51_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_div_i_i_12731_gmm_substract2278 is
        port (
            in_intel_reserved_ffwd_52_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_52_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_extract_t22922705_gmm_substract2318 is
        port (
            in_intel_reserved_ffwd_42_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_42_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_extract_t22922706_gmm_substract2306 is
        port (
            in_intel_reserved_ffwd_42_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_42_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_extract_t22962707_gmm_substract2336 is
        port (
            in_intel_reserved_ffwd_43_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_43_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_extract_t22962709_gmm_substract2310 is
        port (
            in_intel_reserved_ffwd_43_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_43_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_extract_t23002710_gmm_substract2340 is
        port (
            in_intel_reserved_ffwd_44_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_44_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_extract_t23002712_gmm_substract2314 is
        port (
            in_intel_reserved_ffwd_44_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_44_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_extract_t23042713_gmm_substract2308 is
        port (
            in_intel_reserved_ffwd_45_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_45_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_extract_t23042715_gmm_substract2320 is
        port (
            in_intel_reserved_ffwd_45_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_45_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_extract_t23082716_gmm_substract2330 is
        port (
            in_intel_reserved_ffwd_46_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_46_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_extract_t23122718_gmm_substract2332 is
        port (
            in_intel_reserved_ffwd_47_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_47_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_extract_t23162720_gmm_substract2334 is
        port (
            in_intel_reserved_ffwd_48_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_48_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_extract_t23202722_gmm_substract2312 is
        port (
            in_intel_reserved_ffwd_49_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_49_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_extract_t23202723_gmm_substract2338 is
        port (
            in_intel_reserved_ffwd_49_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_49_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_extract_t23242724_gmm_substract2316 is
        port (
            in_intel_reserved_ffwd_50_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_50_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_extract_t23242725_gmm_substract2342 is
        port (
            in_intel_reserved_ffwd_50_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_50_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_reduction_gmm_substract_322758_gmm_substract2284 is
        port (
            in_intel_reserved_ffwd_73_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_73_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_reduction_gmm_substract_342759_gmm_substract2288 is
        port (
            in_intel_reserved_ffwd_74_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_74_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract2254 is
        port (
            in_intel_reserved_ffwd_75_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_75_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_reduction_gmm_substract_382761_gmm_substract2256 is
        port (
            in_intel_reserved_ffwd_76_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_76_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract2258 is
        port (
            in_intel_reserved_ffwd_77_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_77_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract2260 is
        port (
            in_intel_reserved_ffwd_78_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_78_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_reduction_gmm_substract_442764_gmm_substract2262 is
        port (
            in_intel_reserved_ffwd_79_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_79_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract2264 is
        port (
            in_intel_reserved_ffwd_80_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_80_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract2266 is
        port (
            in_intel_reserved_ffwd_81_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_81_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_reduction_gmm_substract_502767_gmm_substract2268 is
        port (
            in_intel_reserved_ffwd_82_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_82_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract2270 is
        port (
            in_intel_reserved_ffwd_83_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_83_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract2346 is
        port (
            in_intel_reserved_ffwd_84_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_84_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_reduction_gmm_substract_562770_gmm_substract2292 is
        port (
            in_intel_reserved_ffwd_85_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_85_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract2286 is
        port (
            in_intel_reserved_ffwd_85_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_85_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract2294 is
        port (
            in_intel_reserved_ffwd_86_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_86_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract2280 is
        port (
            in_intel_reserved_ffwd_87_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_87_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract2282 is
        port (
            in_intel_reserved_ffwd_88_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_88_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract2354 is
        port (
            in_intel_reserved_ffwd_89_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_89_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_reduction_gmm_substract_682776_gmm_substract2300 is
        port (
            in_intel_reserved_ffwd_90_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_90_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_reduction_gmm_substract_682777_gmm_substract2296 is
        port (
            in_intel_reserved_ffwd_90_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_90_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract2290 is
        port (
            in_intel_reserved_ffwd_90_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_90_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract2302 is
        port (
            in_intel_reserved_ffwd_91_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_91_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract2298 is
        port (
            in_intel_reserved_ffwd_91_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_91_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_unnamed_gmm_substract59_gmm_substract2304 is
        port (
            in_intel_reserved_ffwd_54_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_54_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract60_gmm_substract2367 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_56_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_56_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract61_gmm_substract2369 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_57_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_57_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract62_gmm_substract2371 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_58_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_58_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract63_gmm_substract2373 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_59_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_59_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract64_gmm_substract2375 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_60_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_60_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract65_gmm_substract2377 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_61_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_61_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract66_gmm_substract2379 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_62_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_62_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract67_gmm_substract2381 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_63_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_63_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract68_gmm_substract2383 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_64_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_64_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract69_gmm_substract2385 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_65_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_65_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract70_gmm_substract2387 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_66_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_66_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract71_gmm_substract2389 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_67_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_67_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract72_gmm_substract2391 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_68_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_68_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract73_gmm_substract2393 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_69_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_69_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract74_gmm_substract2395 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_70_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_70_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract75_gmm_substract2397 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_71_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_71_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_src_unnamed_gmm_substract76_gmm_substract2399 is
        port (
            in_enable_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_src_data_in_72_0 : in std_logic_vector(33 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_72_0 : out std_logic_vector(33 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component acl_valid_fifo_counter is
        generic (
            DEPTH : INTEGER := 0;
            ASYNC_RESET : INTEGER := 1;
            STRICT_DEPTH : INTEGER := 0;
            ALLOW_FULL_WRITE : INTEGER := 0
        );
        port (
            clock : in std_logic;
            resetn : in std_logic;
            valid_in : in std_logic;
            stall_in : in std_logic;
            valid_out : out std_logic;
            stall_out : out std_logic;
            full : out std_logic
        );
    end component;






    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_op2816_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (33 downto 0);
    signal bgTrunc_i_op_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_extract_t651_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_extract_t652_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_extract_t653_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_extract_t654_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_extract_t655_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_extract_t656_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_extract_t657_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_extract_t658_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_extract_t_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_unnamed_gmm_substract2362_sel_x_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_unnamed_gmm_substract2365_sel_x_b : STD_LOGIC_VECTOR (33 downto 0);
    signal c_i2_1gr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal c_i33_2gr_q : STD_LOGIC_VECTOR (32 downto 0);
    signal c_i34_1gr_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_acl_429_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_429_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_430_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_430_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_431_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_431_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_432_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_432_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_433_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_433_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_434_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_434_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_435_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_435_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_436_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_436_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_437_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_437_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_438_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_438_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_439_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_439_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_cmp_i_i129_1_gmm_substract_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp_i_i129_1_gmm_substract_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp_i_i129_1_gmm_substract_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp_i_i129_1_gmm_substract_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i134_not_gmm_substract_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp_i_i134_not_gmm_substract_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp_i_i134_not_gmm_substract_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp_i_i134_not_gmm_substract_n : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i_i137_not_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_acl_3762631_gmm_substract_out_dest_data_out_31_0 : STD_LOGIC_VECTOR (1 downto 0);
    signal i_ffwd_dst_acl_3762631_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_acl_3762631_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_acl_3772638_gmm_substract_out_dest_data_out_33_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_ffwd_dst_acl_3772638_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_acl_3772638_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_acl_3772640_gmm_substract_out_dest_data_out_33_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_ffwd_dst_acl_3772640_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_acl_3772640_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_acl_3832672_gmm_substract_out_dest_data_out_36_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_ffwd_dst_acl_3832672_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_acl_3832672_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_acl_3832673_gmm_substract_out_dest_data_out_36_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_ffwd_dst_acl_3832673_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_acl_3832673_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_acl_3892685_gmm_substract_out_dest_data_out_38_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_ffwd_dst_acl_3892685_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_acl_3892685_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_acl_3972689_gmm_substract_out_dest_data_out_39_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_acl_3972689_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_acl_3972689_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_acl_3972691_gmm_substract_out_dest_data_out_39_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_acl_3972691_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_acl_3972691_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_acl_4002696_gmm_substract_out_dest_data_out_40_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_acl_4002696_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_acl_4002696_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_acl_4002698_gmm_substract_out_dest_data_out_40_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_acl_4002698_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_acl_4002698_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_acl_4032701_gmm_substract_out_dest_data_out_41_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_acl_4032701_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_acl_4032701_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i1372734_gmm_substract_out_dest_data_out_53_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i1372734_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i1372734_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_out_dest_data_out_35_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_div_i_i2726_gmm_substract_out_dest_data_out_51_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_ffwd_dst_div_i_i2726_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_div_i_i2726_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_div_i_i_12731_gmm_substract_out_dest_data_out_52_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_ffwd_dst_div_i_i_12731_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_div_i_i_12731_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t22922705_gmm_substract_out_dest_data_out_42_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_extract_t22922705_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t22922705_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t22922706_gmm_substract_out_dest_data_out_42_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_extract_t22922706_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t22922706_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t22962707_gmm_substract_out_dest_data_out_43_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_extract_t22962707_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t22962707_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t22962709_gmm_substract_out_dest_data_out_43_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_extract_t22962709_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t22962709_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t23002710_gmm_substract_out_dest_data_out_44_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_extract_t23002710_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t23002710_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t23002712_gmm_substract_out_dest_data_out_44_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_extract_t23002712_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t23002712_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t23042713_gmm_substract_out_dest_data_out_45_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_extract_t23042713_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t23042713_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t23042715_gmm_substract_out_dest_data_out_45_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_extract_t23042715_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t23042715_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t23082716_gmm_substract_out_dest_data_out_46_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_extract_t23082716_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t23082716_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t23122718_gmm_substract_out_dest_data_out_47_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_extract_t23122718_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t23122718_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t23162720_gmm_substract_out_dest_data_out_48_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_extract_t23162720_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t23162720_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t23202722_gmm_substract_out_dest_data_out_49_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_extract_t23202722_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t23202722_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t23202723_gmm_substract_out_dest_data_out_49_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_extract_t23202723_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t23202723_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t23242724_gmm_substract_out_dest_data_out_50_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_extract_t23242724_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t23242724_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t23242725_gmm_substract_out_dest_data_out_50_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_extract_t23242725_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t23242725_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_322758_gmm_substract_out_dest_data_out_73_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_322758_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_322758_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_342759_gmm_substract_out_dest_data_out_74_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_342759_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_342759_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_out_dest_data_out_75_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_382761_gmm_substract_out_dest_data_out_76_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_382761_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_382761_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_out_dest_data_out_77_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_out_dest_data_out_78_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_442764_gmm_substract_out_dest_data_out_79_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_442764_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_442764_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_out_dest_data_out_80_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_out_dest_data_out_81_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_502767_gmm_substract_out_dest_data_out_82_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_502767_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_502767_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_out_dest_data_out_83_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_out_dest_data_out_84_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_562770_gmm_substract_out_dest_data_out_85_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_562770_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_562770_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_out_dest_data_out_85_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_out_dest_data_out_86_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract_out_dest_data_out_87_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract_out_dest_data_out_88_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_out_dest_data_out_89_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_682776_gmm_substract_out_dest_data_out_90_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_682776_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_682776_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_682777_gmm_substract_out_dest_data_out_90_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_682777_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_682777_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_out_dest_data_out_90_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_out_dest_data_out_91_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_out_dest_data_out_91_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract60_gmm_substract_out_intel_reserved_ffwd_56_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract60_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract60_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract61_gmm_substract_out_intel_reserved_ffwd_57_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract61_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract61_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract62_gmm_substract_out_intel_reserved_ffwd_58_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract62_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract62_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract63_gmm_substract_out_intel_reserved_ffwd_59_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract63_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract63_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract64_gmm_substract_out_intel_reserved_ffwd_60_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract64_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract64_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract65_gmm_substract_out_intel_reserved_ffwd_61_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract65_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract65_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract66_gmm_substract_out_intel_reserved_ffwd_62_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract66_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract66_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract67_gmm_substract_out_intel_reserved_ffwd_63_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract67_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract67_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract68_gmm_substract_out_intel_reserved_ffwd_64_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract68_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract68_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract69_gmm_substract_out_intel_reserved_ffwd_65_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract69_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract69_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract70_gmm_substract_out_intel_reserved_ffwd_66_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract70_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract70_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract71_gmm_substract_out_intel_reserved_ffwd_67_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract71_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract71_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract72_gmm_substract_out_intel_reserved_ffwd_68_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract72_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract72_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract73_gmm_substract_out_intel_reserved_ffwd_69_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract73_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract73_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract74_gmm_substract_out_intel_reserved_ffwd_70_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract74_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract74_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract75_gmm_substract_out_intel_reserved_ffwd_71_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract75_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract75_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract76_gmm_substract_out_intel_reserved_ffwd_72_0 : STD_LOGIC_VECTOR (33 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract76_gmm_substract_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_src_unnamed_gmm_substract76_gmm_substract_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_from_if_then612542_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_not_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_op2816_gmm_substract_a : STD_LOGIC_VECTOR (34 downto 0);
    signal i_op2816_gmm_substract_b : STD_LOGIC_VECTOR (34 downto 0);
    signal i_op2816_gmm_substract_o : STD_LOGIC_VECTOR (34 downto 0);
    signal i_op2816_gmm_substract_q : STD_LOGIC_VECTOR (34 downto 0);
    signal i_op_gmm_substract_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_op_gmm_substract_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_op_gmm_substract_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_op_gmm_substract_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_select543_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select543_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select544_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select544_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select548_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select548_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select550_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select550_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select554_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select554_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select556_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select556_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select560_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select560_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select562_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select562_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select566_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select566_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_select568_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select568_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_select572_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select572_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select574_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select574_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select580_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select580_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select586_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select586_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select592_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select592_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select596_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select596_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select598_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select598_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select602_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select602_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select604_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select604_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select610_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select610_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_select614_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select614_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_select616_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select616_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_select622_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select622_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select626_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select626_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select628_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select628_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select634_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select634_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_unnamed_gmm_substract2362_vt_const_32_q : STD_LOGIC_VECTOR (30 downto 0);
    signal i_unnamed_gmm_substract2362_vt_join_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_unnamed_gmm_substract2362_vt_select_1_b : STD_LOGIC_VECTOR (1 downto 0);
    signal i_unnamed_gmm_substract2363_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gmm_substract2363_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gmm_substract2365_vt_join_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_unnamed_gmm_substract2365_vt_select_32_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_unnamed_gmm_substract2366_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gmm_substract2366_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist0_i_unnamed_gmm_substract2363_q_2_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_not_gmm_substract_q_1_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_bgTrunc_i_op_gmm_substract_sel_x_b_1_0_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist4_bgTrunc_i_op2816_gmm_substract_sel_x_b_1_0_q : STD_LOGIC_VECTOR (33 downto 0);
    signal bubble_join_i_ffwd_dst_acl_3762631_gmm_substract_q : STD_LOGIC_VECTOR (1 downto 0);
    signal bubble_select_i_ffwd_dst_acl_3762631_gmm_substract_b : STD_LOGIC_VECTOR (1 downto 0);
    signal bubble_join_i_ffwd_dst_acl_3772638_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_ffwd_dst_acl_3772638_gmm_substract_b : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_join_i_ffwd_dst_acl_3772640_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_ffwd_dst_acl_3772640_gmm_substract_b : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_join_i_ffwd_dst_acl_3832672_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_ffwd_dst_acl_3832672_gmm_substract_b : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_join_i_ffwd_dst_acl_3832673_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_ffwd_dst_acl_3832673_gmm_substract_b : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_join_i_ffwd_dst_acl_3892685_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_ffwd_dst_acl_3892685_gmm_substract_b : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_join_i_ffwd_dst_acl_3972689_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_ffwd_dst_acl_3972689_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_join_i_ffwd_dst_acl_3972691_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_ffwd_dst_acl_3972691_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_join_i_ffwd_dst_acl_4002696_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_ffwd_dst_acl_4002696_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_join_i_ffwd_dst_acl_4002698_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_ffwd_dst_acl_4002698_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_join_i_ffwd_dst_acl_4032701_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_ffwd_dst_acl_4032701_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_join_i_ffwd_dst_cmp_i_i_i1372734_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_ffwd_dst_cmp_i_i_i1372734_gmm_substract_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_ffwd_dst_div_i_i2726_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_ffwd_dst_div_i_i2726_gmm_substract_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_ffwd_dst_div_i_i_12731_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_ffwd_dst_div_i_i_12731_gmm_substract_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_ffwd_dst_extract_t22922705_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_ffwd_dst_extract_t22922705_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_join_i_ffwd_dst_extract_t22922706_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_ffwd_dst_extract_t22922706_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_join_i_ffwd_dst_extract_t22962707_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_ffwd_dst_extract_t22962707_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_join_i_ffwd_dst_extract_t22962709_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_ffwd_dst_extract_t22962709_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_join_i_ffwd_dst_extract_t23002710_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_ffwd_dst_extract_t23002710_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_join_i_ffwd_dst_extract_t23002712_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_ffwd_dst_extract_t23002712_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_join_i_ffwd_dst_extract_t23042713_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_ffwd_dst_extract_t23042713_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_join_i_ffwd_dst_extract_t23042715_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_ffwd_dst_extract_t23042715_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_join_i_ffwd_dst_extract_t23082716_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_ffwd_dst_extract_t23082716_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_join_i_ffwd_dst_extract_t23122718_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_ffwd_dst_extract_t23122718_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_join_i_ffwd_dst_extract_t23162720_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_ffwd_dst_extract_t23162720_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_join_i_ffwd_dst_extract_t23202722_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_ffwd_dst_extract_t23202722_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_join_i_ffwd_dst_extract_t23202723_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_ffwd_dst_extract_t23202723_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_join_i_ffwd_dst_extract_t23242724_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_ffwd_dst_extract_t23242724_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_join_i_ffwd_dst_extract_t23242725_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_ffwd_dst_extract_t23242725_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_join_i_ffwd_dst_reduction_gmm_substract_322758_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_ffwd_dst_reduction_gmm_substract_322758_gmm_substract_b : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_join_i_ffwd_dst_reduction_gmm_substract_342759_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_ffwd_dst_reduction_gmm_substract_342759_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_join_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal bubble_select_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_b : STD_LOGIC_VECTOR (8 downto 0);
    signal bubble_join_i_ffwd_dst_reduction_gmm_substract_382761_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal bubble_select_i_ffwd_dst_reduction_gmm_substract_382761_gmm_substract_b : STD_LOGIC_VECTOR (8 downto 0);
    signal bubble_join_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal bubble_select_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_b : STD_LOGIC_VECTOR (8 downto 0);
    signal bubble_join_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal bubble_select_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_b : STD_LOGIC_VECTOR (8 downto 0);
    signal bubble_join_i_ffwd_dst_reduction_gmm_substract_442764_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal bubble_select_i_ffwd_dst_reduction_gmm_substract_442764_gmm_substract_b : STD_LOGIC_VECTOR (8 downto 0);
    signal bubble_join_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal bubble_select_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_b : STD_LOGIC_VECTOR (8 downto 0);
    signal bubble_join_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal bubble_select_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_b : STD_LOGIC_VECTOR (8 downto 0);
    signal bubble_join_i_ffwd_dst_reduction_gmm_substract_502767_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal bubble_select_i_ffwd_dst_reduction_gmm_substract_502767_gmm_substract_b : STD_LOGIC_VECTOR (8 downto 0);
    signal bubble_join_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal bubble_select_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_b : STD_LOGIC_VECTOR (8 downto 0);
    signal bubble_join_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_b : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_join_i_ffwd_dst_reduction_gmm_substract_562770_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_ffwd_dst_reduction_gmm_substract_562770_gmm_substract_b : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_join_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_b : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_join_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_b : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_join_i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_join_i_ffwd_dst_reduction_gmm_substract_682776_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_ffwd_dst_reduction_gmm_substract_682776_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_join_i_ffwd_dst_reduction_gmm_substract_682777_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_ffwd_dst_reduction_gmm_substract_682777_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_join_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_join_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_join_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_select_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bubble_join_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_b : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_R_v_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_R_v_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_R_v_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_R_v_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_R_v_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_R_v_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_s_tv_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_s_tv_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_s_tv_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_s_tv_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_s_tv_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_s_tv_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i129_1_gmm_substract_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i134_not_gmm_substract_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i134_not_gmm_substract_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i134_not_gmm_substract_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i134_not_gmm_substract_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i134_not_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp_i_i134_not_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_acl_3762631_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_acl_3762631_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_acl_3762631_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_acl_4002696_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_acl_4002696_gmm_substract_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_acl_4002696_gmm_substract_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_acl_4002696_gmm_substract_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_acl_4002696_gmm_substract_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_acl_4002696_gmm_substract_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_acl_4002696_gmm_substract_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_acl_4002696_gmm_substract_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_acl_4002696_gmm_substract_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_acl_4002696_gmm_substract_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_acl_4002696_gmm_substract_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_acl_4002696_gmm_substract_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_acl_4002696_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_acl_4002696_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_acl_4002696_gmm_substract_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_div_i_i2726_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_div_i_i2726_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_div_i_i2726_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_div_i_i_12731_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_div_i_i_12731_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_div_i_i_12731_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_toReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_fromReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_consumed6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_toReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_fromReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_consumed7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_toReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_fromReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_consumed8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_toReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_fromReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_consumed9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_or7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_or8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_V8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_from_if_then612542_gmm_substract_V9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_gmm_substract2363_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_gmm_substract2363_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_gmm_substract2363_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_gmm_substract2363_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_gmm_substract2363_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_gmm_substract2363_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_unnamed_gmm_substract2363_q_2_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_unnamed_gmm_substract2363_q_2_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_unnamed_gmm_substract2363_q_2_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_unnamed_gmm_substract2363_q_2_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_unnamed_gmm_substract2363_q_2_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_unnamed_gmm_substract2363_q_2_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_R_v_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_R_v_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_R_v_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_R_v_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_R_v_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_R_v_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_R_v_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_R_v_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_R_v_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_s_tv_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_s_tv_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_s_tv_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_s_tv_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_s_tv_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_s_tv_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_s_tv_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_s_tv_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_s_tv_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_or7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_or8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_or9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_V8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_V9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_not_gmm_substract_q_1_0_V10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_1_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_1_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_1_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_1_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_17 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_18 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_19 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_20 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_21 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_22 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_23 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_24 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_25 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_26 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_27 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_28 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_29 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_30 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_31 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_32 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_33 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_34 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_R_v_35 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_17 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_18 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_19 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_20 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_21 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_22 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_23 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_24 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_25 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_26 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_27 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_28 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_29 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_30 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_31 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_32 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_33 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_34 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_s_tv_35 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or8 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or9 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or12 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or13 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or14 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or15 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or16 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or17 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or18 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or19 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or20 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or21 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or22 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or23 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or24 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or25 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or26 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or27 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or28 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or29 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or30 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or31 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or32 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or33 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_or34 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V8 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V9 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V12 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V13 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V14 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V15 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V16 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V17 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V18 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V19 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V20 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V21 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V22 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V23 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V24 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V25 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V26 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V27 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V28 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V29 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V30 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V31 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V32 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V33 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V34 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_V35 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_r_data0 : STD_LOGIC_VECTOR (7 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_D0 : STD_LOGIC_VECTOR (7 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_r_data0 : STD_LOGIC_VECTOR (15 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_D0 : STD_LOGIC_VECTOR (15 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_r_data0 : STD_LOGIC_VECTOR (7 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_D0 : STD_LOGIC_VECTOR (7 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_r_data0 : STD_LOGIC_VECTOR (7 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_D0 : STD_LOGIC_VECTOR (7 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_r_data0 : STD_LOGIC_VECTOR (7 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_D0 : STD_LOGIC_VECTOR (7 downto 0);
    signal SR_SE_i_unnamed_gmm_substract2363_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_gmm_substract2363_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_gmm_substract2363_r_data0 : STD_LOGIC_VECTOR (1 downto 0);
    signal SR_SE_i_unnamed_gmm_substract2363_r_data1 : STD_LOGIC_VECTOR (32 downto 0);
    signal SR_SE_i_unnamed_gmm_substract2363_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_gmm_substract2363_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_gmm_substract2363_D0 : STD_LOGIC_VECTOR (1 downto 0);
    signal SR_SE_i_unnamed_gmm_substract2363_D1 : STD_LOGIC_VECTOR (32 downto 0);
    signal SR_bubble_out_stall_entry_2_reg_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_stall_entry_2_reg_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_stall_entry_2_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_stall_entry_2_reg_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp_i_i134_not_gmm_substract_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp_i_i134_not_gmm_substract_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp_i_i134_not_gmm_substract_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp_i_i134_not_gmm_substract_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_cmp_i_i134_not_gmm_substract_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_cmp_i_i134_not_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp_i_i134_not_gmm_substract_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp_i_i134_not_gmm_substract_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_cmp_i_i134_not_gmm_substract_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp_i_i129_1_gmm_substract_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp_i_i129_1_gmm_substract_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp_i_i129_1_gmm_substract_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp_i_i129_1_gmm_substract_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_cmp_i_i129_1_gmm_substract_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_cmp_i_i129_1_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp_i_i129_1_gmm_substract_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp_i_i129_1_gmm_substract_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_cmp_i_i129_1_gmm_substract_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_i_not_gmm_substract_q_1_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_i_not_gmm_substract_q_1_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_i_not_gmm_substract_q_1_0_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_i_not_gmm_substract_q_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_i_not_gmm_substract_q_1_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_i_not_gmm_substract_q_1_0_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_r_data0 : STD_LOGIC_VECTOR (7 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_D0 : STD_LOGIC_VECTOR (7 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_r_data0 : STD_LOGIC_VECTOR (7 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_D0 : STD_LOGIC_VECTOR (7 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_r_data0 : STD_LOGIC_VECTOR (7 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_D0 : STD_LOGIC_VECTOR (7 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_r_data0 : STD_LOGIC_VECTOR (7 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_D0 : STD_LOGIC_VECTOR (7 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_r_data0 : STD_LOGIC_VECTOR (15 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_D0 : STD_LOGIC_VECTOR (15 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_r_data0 : STD_LOGIC_VECTOR (7 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_D0 : STD_LOGIC_VECTOR (7 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_r_data0 : STD_LOGIC_VECTOR (7 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_D0 : STD_LOGIC_VECTOR (7 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_r_data0 : STD_LOGIC_VECTOR (7 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_D0 : STD_LOGIC_VECTOR (7 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_r_data0 : STD_LOGIC_VECTOR (7 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_D0 : STD_LOGIC_VECTOR (7 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_r_data0 : STD_LOGIC_VECTOR (15 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_D0 : STD_LOGIC_VECTOR (15 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_r_data0 : STD_LOGIC_VECTOR (7 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_D0 : STD_LOGIC_VECTOR (7 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_V : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_out_i_ffwd_dst_extract_t23202722_gmm_substract(STALLENABLE,700)
    -- Valid signal propagation
    SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_V0 <= SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_backStall <= i_ffwd_src_unnamed_gmm_substract61_gmm_substract_out_stall_out or not (SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_wireValid <= SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_V;

    -- SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract(STALLENABLE,752)
    -- Valid signal propagation
    SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_V0 <= SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_backStall <= i_ffwd_src_unnamed_gmm_substract74_gmm_substract_out_stall_out or not (SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_wireValid <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_V;

    -- bubble_join_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract(BITJOIN,544)
    bubble_join_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_q <= i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_out_dest_data_out_91_0;

    -- bubble_select_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract(BITSELECT,545)
    bubble_select_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_q(7 downto 0));

    -- bubble_join_i_ffwd_dst_reduction_gmm_substract_682777_gmm_substract(BITJOIN,535)
    bubble_join_i_ffwd_dst_reduction_gmm_substract_682777_gmm_substract_q <= i_ffwd_dst_reduction_gmm_substract_682777_gmm_substract_out_dest_data_out_90_0;

    -- bubble_select_i_ffwd_dst_reduction_gmm_substract_682777_gmm_substract(BITSELECT,536)
    bubble_select_i_ffwd_dst_reduction_gmm_substract_682777_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_reduction_gmm_substract_682777_gmm_substract_q(7 downto 0));

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- bubble_join_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract(BITJOIN,520)
    bubble_join_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_q <= i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_out_dest_data_out_86_0;

    -- bubble_select_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract(BITSELECT,521)
    bubble_select_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_q(15 downto 0));

    -- bubble_join_i_ffwd_dst_reduction_gmm_substract_562770_gmm_substract(BITJOIN,514)
    bubble_join_i_ffwd_dst_reduction_gmm_substract_562770_gmm_substract_q <= i_ffwd_dst_reduction_gmm_substract_562770_gmm_substract_out_dest_data_out_85_0;

    -- bubble_select_i_ffwd_dst_reduction_gmm_substract_562770_gmm_substract(BITSELECT,515)
    bubble_select_i_ffwd_dst_reduction_gmm_substract_562770_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_reduction_gmm_substract_562770_gmm_substract_q(15 downto 0));

    -- i_acl_437_gmm_substract(MUX,228)@1
    i_acl_437_gmm_substract_s <= i_cmp_i_i129_1_gmm_substract_c;
    i_acl_437_gmm_substract_combproc: PROCESS (i_acl_437_gmm_substract_s, bubble_select_i_ffwd_dst_reduction_gmm_substract_562770_gmm_substract_b, bubble_select_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_b)
    BEGIN
        CASE (i_acl_437_gmm_substract_s) IS
            WHEN "0" => i_acl_437_gmm_substract_q <= bubble_select_i_ffwd_dst_reduction_gmm_substract_562770_gmm_substract_b;
            WHEN "1" => i_acl_437_gmm_substract_q <= bubble_select_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_b;
            WHEN OTHERS => i_acl_437_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- bubble_join_i_ffwd_dst_acl_3832673_gmm_substract(BITJOIN,400)
    bubble_join_i_ffwd_dst_acl_3832673_gmm_substract_q <= i_ffwd_dst_acl_3832673_gmm_substract_out_dest_data_out_36_0;

    -- bubble_select_i_ffwd_dst_acl_3832673_gmm_substract(BITSELECT,401)
    bubble_select_i_ffwd_dst_acl_3832673_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_acl_3832673_gmm_substract_q(15 downto 0));

    -- bubble_join_i_ffwd_dst_acl_3772638_gmm_substract(BITJOIN,391)
    bubble_join_i_ffwd_dst_acl_3772638_gmm_substract_q <= i_ffwd_dst_acl_3772638_gmm_substract_out_dest_data_out_33_0;

    -- bubble_select_i_ffwd_dst_acl_3772638_gmm_substract(BITSELECT,392)
    bubble_select_i_ffwd_dst_acl_3772638_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_acl_3772638_gmm_substract_q(15 downto 0));

    -- SE_i_cmp_i_i134_not_gmm_substract(STALLENABLE,645)
    -- Valid signal propagation
    SE_i_cmp_i_i134_not_gmm_substract_V0 <= SE_i_cmp_i_i134_not_gmm_substract_R_v_0;
    -- Stall signal propagation
    SE_i_cmp_i_i134_not_gmm_substract_s_tv_0 <= SE_i_from_if_then612542_gmm_substract_backStall and SE_i_cmp_i_i134_not_gmm_substract_R_v_0;
    -- Backward Enable generation
    SE_i_cmp_i_i134_not_gmm_substract_backEN <= not (SE_i_cmp_i_i134_not_gmm_substract_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_cmp_i_i134_not_gmm_substract_v_s_0 <= SE_i_cmp_i_i134_not_gmm_substract_backEN and SR_SE_i_cmp_i_i134_not_gmm_substract_V;
    -- Backward Stall generation
    SE_i_cmp_i_i134_not_gmm_substract_backStall <= not (SE_i_cmp_i_i134_not_gmm_substract_backEN);
    SE_i_cmp_i_i134_not_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_cmp_i_i134_not_gmm_substract_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_cmp_i_i134_not_gmm_substract_backEN = "0") THEN
                SE_i_cmp_i_i134_not_gmm_substract_R_v_0 <= SE_i_cmp_i_i134_not_gmm_substract_R_v_0 and SE_i_cmp_i_i134_not_gmm_substract_s_tv_0;
            ELSE
                SE_i_cmp_i_i134_not_gmm_substract_R_v_0 <= SE_i_cmp_i_i134_not_gmm_substract_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_join_i_ffwd_dst_div_i_i_12731_gmm_substract(BITJOIN,430)
    bubble_join_i_ffwd_dst_div_i_i_12731_gmm_substract_q <= i_ffwd_dst_div_i_i_12731_gmm_substract_out_dest_data_out_52_0;

    -- bubble_select_i_ffwd_dst_div_i_i_12731_gmm_substract(BITSELECT,431)
    bubble_select_i_ffwd_dst_div_i_i_12731_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_div_i_i_12731_gmm_substract_q(31 downto 0));

    -- bubble_join_i_ffwd_dst_div_i_i2726_gmm_substract(BITJOIN,427)
    bubble_join_i_ffwd_dst_div_i_i2726_gmm_substract_q <= i_ffwd_dst_div_i_i2726_gmm_substract_out_dest_data_out_51_0;

    -- bubble_select_i_ffwd_dst_div_i_i2726_gmm_substract(BITSELECT,428)
    bubble_select_i_ffwd_dst_div_i_i2726_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_div_i_i2726_gmm_substract_q(31 downto 0));

    -- SE_out_i_ffwd_dst_div_i_i_12731_gmm_substract(STALLENABLE,676)
    -- Valid signal propagation
    SE_out_i_ffwd_dst_div_i_i_12731_gmm_substract_V0 <= SE_out_i_ffwd_dst_div_i_i_12731_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_dst_div_i_i_12731_gmm_substract_backStall <= SR_SE_i_cmp_i_i134_not_gmm_substract_backStall or not (SE_out_i_ffwd_dst_div_i_i_12731_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_dst_div_i_i_12731_gmm_substract_wireValid <= i_ffwd_dst_div_i_i_12731_gmm_substract_out_valid_out;

    -- SE_out_i_ffwd_dst_div_i_i2726_gmm_substract(STALLENABLE,674)
    -- Valid signal propagation
    SE_out_i_ffwd_dst_div_i_i2726_gmm_substract_V0 <= SE_out_i_ffwd_dst_div_i_i2726_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_dst_div_i_i2726_gmm_substract_backStall <= SR_SE_i_cmp_i_i134_not_gmm_substract_backStall or not (SE_out_i_ffwd_dst_div_i_i2726_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_dst_div_i_i2726_gmm_substract_wireValid <= i_ffwd_dst_div_i_i2726_gmm_substract_out_valid_out;

    -- SR_SE_i_cmp_i_i134_not_gmm_substract(STALLREG,1249)
    SR_SE_i_cmp_i_i134_not_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_cmp_i_i134_not_gmm_substract_r_valid <= (others => '0');
            SR_SE_i_cmp_i_i134_not_gmm_substract_r_data0 <= (others => '-');
            SR_SE_i_cmp_i_i134_not_gmm_substract_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_cmp_i_i134_not_gmm_substract_r_valid <= SE_i_cmp_i_i134_not_gmm_substract_backStall and (SR_SE_i_cmp_i_i134_not_gmm_substract_r_valid or SR_SE_i_cmp_i_i134_not_gmm_substract_i_valid);

            IF (SR_SE_i_cmp_i_i134_not_gmm_substract_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_cmp_i_i134_not_gmm_substract_r_data0 <= bubble_select_i_ffwd_dst_div_i_i2726_gmm_substract_b;
                SR_SE_i_cmp_i_i134_not_gmm_substract_r_data1 <= bubble_select_i_ffwd_dst_div_i_i_12731_gmm_substract_b;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_cmp_i_i134_not_gmm_substract_and0 <= SE_out_i_ffwd_dst_div_i_i2726_gmm_substract_V0;
    SR_SE_i_cmp_i_i134_not_gmm_substract_i_valid <= SE_out_i_ffwd_dst_div_i_i_12731_gmm_substract_V0 and SR_SE_i_cmp_i_i134_not_gmm_substract_and0;
    -- Stall signal propagation
    SR_SE_i_cmp_i_i134_not_gmm_substract_backStall <= SR_SE_i_cmp_i_i134_not_gmm_substract_r_valid or not (SR_SE_i_cmp_i_i134_not_gmm_substract_i_valid);

    -- Valid
    SR_SE_i_cmp_i_i134_not_gmm_substract_V <= SR_SE_i_cmp_i_i134_not_gmm_substract_r_valid WHEN SR_SE_i_cmp_i_i134_not_gmm_substract_r_valid = "1" ELSE SR_SE_i_cmp_i_i134_not_gmm_substract_i_valid;

    -- Data0
    SR_SE_i_cmp_i_i134_not_gmm_substract_D0 <= SR_SE_i_cmp_i_i134_not_gmm_substract_r_data0 WHEN SR_SE_i_cmp_i_i134_not_gmm_substract_r_valid = "1" ELSE bubble_select_i_ffwd_dst_div_i_i2726_gmm_substract_b;
    -- Data1
    SR_SE_i_cmp_i_i134_not_gmm_substract_D1 <= SR_SE_i_cmp_i_i134_not_gmm_substract_r_data1 WHEN SR_SE_i_cmp_i_i134_not_gmm_substract_r_valid = "1" ELSE bubble_select_i_ffwd_dst_div_i_i_12731_gmm_substract_b;

    -- i_cmp_i_i134_not_gmm_substract(COMPARE,232)@0 + 1
    i_cmp_i_i134_not_gmm_substract_a <= STD_LOGIC_VECTOR("00" & SR_SE_i_cmp_i_i134_not_gmm_substract_D0);
    i_cmp_i_i134_not_gmm_substract_b <= STD_LOGIC_VECTOR("00" & SR_SE_i_cmp_i_i134_not_gmm_substract_D1);
    i_cmp_i_i134_not_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp_i_i134_not_gmm_substract_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_cmp_i_i134_not_gmm_substract_backEN = "1") THEN
                i_cmp_i_i134_not_gmm_substract_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i134_not_gmm_substract_a) - UNSIGNED(i_cmp_i_i134_not_gmm_substract_b));
            END IF;
        END IF;
    END PROCESS;
    i_cmp_i_i134_not_gmm_substract_n(0) <= not (i_cmp_i_i134_not_gmm_substract_o(33));

    -- SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0(STALLENABLE,829)
    -- Valid signal propagation
    SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_V0 <= SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_s_tv_0 <= SE_i_from_if_then612542_gmm_substract_backStall and SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_backEN <= not (SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_v_s_0 <= SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_backEN and SR_SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_V;
    -- Backward Stall generation
    SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_backStall <= not (SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_backEN);
    SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_backEN = "0") THEN
                SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_R_v_0 <= SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_R_v_0 and SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_s_tv_0;
            ELSE
                SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_R_v_0 <= SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_join_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract(BITJOIN,547)
    bubble_join_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_q <= i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0;

    -- bubble_select_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract(BITSELECT,548)
    bubble_select_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_q(0 downto 0));

    -- SE_out_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract(STALLENABLE,754)
    -- Valid signal propagation
    SE_out_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_V0 <= SE_out_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_backStall <= SR_SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_backStall or not (SE_out_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_wireValid <= i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_valid_out;

    -- SR_SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0(STALLREG,1250)
    SR_SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_r_valid <= (others => '0');
            SR_SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_r_valid <= SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_backStall and (SR_SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_r_valid or SR_SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_i_valid);

            IF (SR_SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_r_data0 <= STD_LOGIC_VECTOR(bubble_select_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_i_valid <= SE_out_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_V0;
    -- Stall signal propagation
    SR_SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_backStall <= SR_SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_r_valid or not (SR_SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_i_valid);

    -- Valid
    SR_SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_V <= SR_SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_r_valid WHEN SR_SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_r_valid = "1" ELSE SR_SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_i_valid;

    SR_SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_D0 <= SR_SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_r_data0 WHEN SR_SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_r_valid = "1" ELSE bubble_select_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_b;

    -- redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0(REG,384)
    redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_backEN = "1") THEN
                redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- i_from_if_then612542_gmm_substract(LOGICAL,314)@1
    i_from_if_then612542_gmm_substract_q <= redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_q and i_cmp_i_i134_not_gmm_substract_n;

    -- i_select614_gmm_substract(MUX,338)@1
    i_select614_gmm_substract_s <= i_from_if_then612542_gmm_substract_q;
    i_select614_gmm_substract_combproc: PROCESS (i_select614_gmm_substract_s, bubble_select_i_ffwd_dst_acl_3772638_gmm_substract_b, bubble_select_i_ffwd_dst_acl_3832673_gmm_substract_b)
    BEGIN
        CASE (i_select614_gmm_substract_s) IS
            WHEN "0" => i_select614_gmm_substract_q <= bubble_select_i_ffwd_dst_acl_3772638_gmm_substract_b;
            WHEN "1" => i_select614_gmm_substract_q <= bubble_select_i_ffwd_dst_acl_3832673_gmm_substract_b;
            WHEN OTHERS => i_select614_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_select616_gmm_substract(MUX,339)@1
    i_select616_gmm_substract_s <= redist1_i_not_gmm_substract_q_1_0_q;
    i_select616_gmm_substract_combproc: PROCESS (i_select616_gmm_substract_s, i_select614_gmm_substract_q, i_acl_437_gmm_substract_q)
    BEGIN
        CASE (i_select616_gmm_substract_s) IS
            WHEN "0" => i_select616_gmm_substract_q <= i_select614_gmm_substract_q;
            WHEN "1" => i_select616_gmm_substract_q <= i_acl_437_gmm_substract_q;
            WHEN OTHERS => i_select616_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- SR_bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg(STALLREG,1272)
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_r_valid <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_r_valid <= bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_backStall and (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_r_valid or SR_bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_i_valid);

            IF (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_r_valid = "0") THEN
                -- Data(s)
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_i_valid <= SE_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_V0;
    -- Stall signal propagation
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_backStall <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_r_valid or not (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_i_valid);

    -- Valid
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_V <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_r_valid WHEN SR_bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_r_valid = "1" ELSE SR_bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_i_valid;


    -- SE_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract(STALLENABLE,780)
    -- Valid signal propagation
    SE_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_V0 <= SE_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_backStall <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_backStall or not (SE_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_wireValid <= i_ffwd_src_unnamed_gmm_substract72_gmm_substract_out_valid_out;

    -- i_ffwd_src_unnamed_gmm_substract72_gmm_substract(BLACKBOX,309)@1
    -- in in_stall_in@20000000
    -- out out_intel_reserved_ffwd_68_0@20000000
    -- out out_stall_out@20000000
    thei_ffwd_src_unnamed_gmm_substract72_gmm_substract : i_ffwd_src_unnamed_gmm_substract72_gmm_substract2391
    PORT MAP (
        in_enable_in => VCC_q,
        in_src_data_in_68_0 => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_D0,
        in_stall_in => SE_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_backStall,
        in_valid_in => SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_V0,
        out_intel_reserved_ffwd_68_0 => i_ffwd_src_unnamed_gmm_substract72_gmm_substract_out_intel_reserved_ffwd_68_0,
        out_stall_out => i_ffwd_src_unnamed_gmm_substract72_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_src_unnamed_gmm_substract72_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract(STALLENABLE,736)
    -- Valid signal propagation
    SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_V0 <= SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_backStall <= i_ffwd_src_unnamed_gmm_substract72_gmm_substract_out_stall_out or not (SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_wireValid <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_V;

    -- SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract(STALLREG,1271)
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_r_valid <= (others => '0');
            SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_r_valid <= SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_backStall and (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_r_valid or SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_i_valid);

            IF (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_r_valid = "0") THEN
                -- Data(s)
                SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_r_data0 <= i_select616_gmm_substract_q;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_and0 <= i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_out_valid_out;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_and1 <= i_ffwd_dst_reduction_gmm_substract_562770_gmm_substract_out_valid_out and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_and0;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_and2 <= i_ffwd_dst_acl_3832673_gmm_substract_out_valid_out and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_and1;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_and3 <= i_ffwd_dst_acl_3772638_gmm_substract_out_valid_out and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_and2;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_and4 <= SE_i_from_if_then612542_gmm_substract_V8 and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_and3;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_and5 <= SE_i_cmp_i_i129_1_gmm_substract_V5 and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_and4;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_i_valid <= SE_redist1_i_not_gmm_substract_q_1_0_V8 and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_and5;
    -- Stall signal propagation
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_backStall <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_r_valid or not (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_i_valid);

    -- Valid
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_V <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_r_valid WHEN SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_r_valid = "1" ELSE SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_i_valid;

    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_D0 <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_r_data0 WHEN SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_r_valid = "1" ELSE i_select616_gmm_substract_q;

    -- i_ffwd_dst_acl_3832673_gmm_substract(BLACKBOX,247)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_acl_3832673_gmm_substract : i_ffwd_dst_acl_3832673_gmm_substract2350
    PORT MAP (
        in_intel_reserved_ffwd_36_0 => in_intel_reserved_ffwd_36_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V33,
        out_dest_data_out_36_0 => i_ffwd_dst_acl_3832673_gmm_substract_out_dest_data_out_36_0,
        out_stall_out => i_ffwd_dst_acl_3832673_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_acl_3832673_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_acl_3772638_gmm_substract(BLACKBOX,244)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_acl_3772638_gmm_substract : i_ffwd_dst_acl_3772638_gmm_substract2348
    PORT MAP (
        in_intel_reserved_ffwd_33_0 => in_intel_reserved_ffwd_33_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V32,
        out_dest_data_out_33_0 => i_ffwd_dst_acl_3772638_gmm_substract_out_dest_data_out_33_0,
        out_stall_out => i_ffwd_dst_acl_3772638_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_acl_3772638_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract(BITJOIN,499)
    bubble_join_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_q <= i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_out_dest_data_out_80_0;

    -- bubble_select_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract(BITSELECT,500)
    bubble_select_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_q(8 downto 0));

    -- i_extract_t655_gmm_substract_sel_x(BITSELECT,205)@1
    i_extract_t655_gmm_substract_sel_x_b <= bubble_select_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_b(7 downto 0);

    -- bubble_join_i_ffwd_dst_reduction_gmm_substract_442764_gmm_substract(BITJOIN,496)
    bubble_join_i_ffwd_dst_reduction_gmm_substract_442764_gmm_substract_q <= i_ffwd_dst_reduction_gmm_substract_442764_gmm_substract_out_dest_data_out_79_0;

    -- bubble_select_i_ffwd_dst_reduction_gmm_substract_442764_gmm_substract(BITSELECT,497)
    bubble_select_i_ffwd_dst_reduction_gmm_substract_442764_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_reduction_gmm_substract_442764_gmm_substract_q(8 downto 0));

    -- i_extract_t654_gmm_substract_sel_x(BITSELECT,204)@1
    i_extract_t654_gmm_substract_sel_x_b <= bubble_select_i_ffwd_dst_reduction_gmm_substract_442764_gmm_substract_b(7 downto 0);

    -- i_acl_433_gmm_substract(MUX,224)@1
    i_acl_433_gmm_substract_s <= i_cmp_i_i129_1_gmm_substract_c;
    i_acl_433_gmm_substract_combproc: PROCESS (i_acl_433_gmm_substract_s, i_extract_t654_gmm_substract_sel_x_b, i_extract_t655_gmm_substract_sel_x_b)
    BEGIN
        CASE (i_acl_433_gmm_substract_s) IS
            WHEN "0" => i_acl_433_gmm_substract_q <= i_extract_t654_gmm_substract_sel_x_b;
            WHEN "1" => i_acl_433_gmm_substract_q <= i_extract_t655_gmm_substract_sel_x_b;
            WHEN OTHERS => i_acl_433_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- bubble_join_i_ffwd_dst_extract_t23242725_gmm_substract(BITJOIN,475)
    bubble_join_i_ffwd_dst_extract_t23242725_gmm_substract_q <= i_ffwd_dst_extract_t23242725_gmm_substract_out_dest_data_out_50_0;

    -- bubble_select_i_ffwd_dst_extract_t23242725_gmm_substract(BITSELECT,476)
    bubble_select_i_ffwd_dst_extract_t23242725_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_extract_t23242725_gmm_substract_q(7 downto 0));

    -- bubble_join_i_ffwd_dst_extract_t23002710_gmm_substract(BITJOIN,445)
    bubble_join_i_ffwd_dst_extract_t23002710_gmm_substract_q <= i_ffwd_dst_extract_t23002710_gmm_substract_out_dest_data_out_44_0;

    -- bubble_select_i_ffwd_dst_extract_t23002710_gmm_substract(BITSELECT,446)
    bubble_select_i_ffwd_dst_extract_t23002710_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_extract_t23002710_gmm_substract_q(7 downto 0));

    -- i_select602_gmm_substract(MUX,335)@1
    i_select602_gmm_substract_s <= i_from_if_then612542_gmm_substract_q;
    i_select602_gmm_substract_combproc: PROCESS (i_select602_gmm_substract_s, bubble_select_i_ffwd_dst_extract_t23002710_gmm_substract_b, bubble_select_i_ffwd_dst_extract_t23242725_gmm_substract_b)
    BEGIN
        CASE (i_select602_gmm_substract_s) IS
            WHEN "0" => i_select602_gmm_substract_q <= bubble_select_i_ffwd_dst_extract_t23002710_gmm_substract_b;
            WHEN "1" => i_select602_gmm_substract_q <= bubble_select_i_ffwd_dst_extract_t23242725_gmm_substract_b;
            WHEN OTHERS => i_select602_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_select604_gmm_substract(MUX,336)@1
    i_select604_gmm_substract_s <= redist1_i_not_gmm_substract_q_1_0_q;
    i_select604_gmm_substract_combproc: PROCESS (i_select604_gmm_substract_s, i_select602_gmm_substract_q, i_acl_433_gmm_substract_q)
    BEGIN
        CASE (i_select604_gmm_substract_s) IS
            WHEN "0" => i_select604_gmm_substract_q <= i_select602_gmm_substract_q;
            WHEN "1" => i_select604_gmm_substract_q <= i_acl_433_gmm_substract_q;
            WHEN OTHERS => i_select604_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_434_gmm_substract(MUX,225)@1
    i_acl_434_gmm_substract_s <= i_cmp_i_i129_1_gmm_substract_c;
    i_acl_434_gmm_substract_combproc: PROCESS (i_acl_434_gmm_substract_s, i_extract_t655_gmm_substract_sel_x_b, i_extract_t654_gmm_substract_sel_x_b)
    BEGIN
        CASE (i_acl_434_gmm_substract_s) IS
            WHEN "0" => i_acl_434_gmm_substract_q <= i_extract_t655_gmm_substract_sel_x_b;
            WHEN "1" => i_acl_434_gmm_substract_q <= i_extract_t654_gmm_substract_sel_x_b;
            WHEN OTHERS => i_acl_434_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- bubble_join_i_ffwd_dst_extract_t23002712_gmm_substract(BITJOIN,448)
    bubble_join_i_ffwd_dst_extract_t23002712_gmm_substract_q <= i_ffwd_dst_extract_t23002712_gmm_substract_out_dest_data_out_44_0;

    -- bubble_select_i_ffwd_dst_extract_t23002712_gmm_substract(BITSELECT,449)
    bubble_select_i_ffwd_dst_extract_t23002712_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_extract_t23002712_gmm_substract_q(7 downto 0));

    -- bubble_join_i_ffwd_dst_extract_t23242724_gmm_substract(BITJOIN,472)
    bubble_join_i_ffwd_dst_extract_t23242724_gmm_substract_q <= i_ffwd_dst_extract_t23242724_gmm_substract_out_dest_data_out_50_0;

    -- bubble_select_i_ffwd_dst_extract_t23242724_gmm_substract(BITSELECT,473)
    bubble_select_i_ffwd_dst_extract_t23242724_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_extract_t23242724_gmm_substract_q(7 downto 0));

    -- i_select554_gmm_substract(MUX,322)@1
    i_select554_gmm_substract_s <= i_from_if_then612542_gmm_substract_q;
    i_select554_gmm_substract_combproc: PROCESS (i_select554_gmm_substract_s, bubble_select_i_ffwd_dst_extract_t23242724_gmm_substract_b, bubble_select_i_ffwd_dst_extract_t23002712_gmm_substract_b)
    BEGIN
        CASE (i_select554_gmm_substract_s) IS
            WHEN "0" => i_select554_gmm_substract_q <= bubble_select_i_ffwd_dst_extract_t23242724_gmm_substract_b;
            WHEN "1" => i_select554_gmm_substract_q <= bubble_select_i_ffwd_dst_extract_t23002712_gmm_substract_b;
            WHEN OTHERS => i_select554_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_select556_gmm_substract(MUX,323)@1
    i_select556_gmm_substract_s <= redist1_i_not_gmm_substract_q_1_0_q;
    i_select556_gmm_substract_combproc: PROCESS (i_select556_gmm_substract_s, i_select554_gmm_substract_q, i_acl_434_gmm_substract_q)
    BEGIN
        CASE (i_select556_gmm_substract_s) IS
            WHEN "0" => i_select556_gmm_substract_q <= i_select554_gmm_substract_q;
            WHEN "1" => i_select556_gmm_substract_q <= i_acl_434_gmm_substract_q;
            WHEN OTHERS => i_select556_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- SR_bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg(STALLREG,1258)
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_r_valid <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_r_valid <= bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_backStall and (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_r_valid or SR_bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_i_valid);

            IF (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_r_valid = "0") THEN
                -- Data(s)
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_i_valid <= SE_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_V0;
    -- Stall signal propagation
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_backStall <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_r_valid or not (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_i_valid);

    -- Valid
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_V <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_r_valid WHEN SR_bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_r_valid = "1" ELSE SR_bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_i_valid;


    -- SE_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract(STALLENABLE,760)
    -- Valid signal propagation
    SE_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_V0 <= SE_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_backStall <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_backStall or not (SE_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_wireValid <= i_ffwd_src_unnamed_gmm_substract62_gmm_substract_out_valid_out;

    -- i_ffwd_src_unnamed_gmm_substract62_gmm_substract(BLACKBOX,299)@1
    -- in in_stall_in@20000000
    -- out out_intel_reserved_ffwd_58_0@20000000
    -- out out_stall_out@20000000
    thei_ffwd_src_unnamed_gmm_substract62_gmm_substract : i_ffwd_src_unnamed_gmm_substract62_gmm_substract2371
    PORT MAP (
        in_enable_in => VCC_q,
        in_src_data_in_58_0 => SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_D0,
        in_stall_in => SE_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_backStall,
        in_valid_in => SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_V0,
        out_intel_reserved_ffwd_58_0 => i_ffwd_src_unnamed_gmm_substract62_gmm_substract_out_intel_reserved_ffwd_58_0,
        out_stall_out => i_ffwd_src_unnamed_gmm_substract62_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_src_unnamed_gmm_substract62_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_ffwd_dst_extract_t23242724_gmm_substract(STALLENABLE,704)
    -- Valid signal propagation
    SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_V0 <= SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_backStall <= i_ffwd_src_unnamed_gmm_substract62_gmm_substract_out_stall_out or not (SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_wireValid <= SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_V;

    -- SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract(STALLREG,1257)
    SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_r_valid <= (others => '0');
            SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_r_valid <= SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_backStall and (SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_r_valid or SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_i_valid);

            IF (SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_r_valid = "0") THEN
                -- Data(s)
                SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_r_data0 <= i_select556_gmm_substract_q;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_and0 <= i_ffwd_dst_extract_t23242724_gmm_substract_out_valid_out;
    SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_and1 <= i_ffwd_dst_extract_t23002712_gmm_substract_out_valid_out and SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_and0;
    SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_and2 <= SE_i_from_if_then612542_gmm_substract_V2 and SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_and1;
    SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_and3 <= SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_V1 and SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_and2;
    SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_i_valid <= SE_redist1_i_not_gmm_substract_q_1_0_V2 and SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_and3;
    -- Stall signal propagation
    SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_backStall <= SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_r_valid or not (SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_i_valid);

    -- Valid
    SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_V <= SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_r_valid WHEN SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_r_valid = "1" ELSE SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_i_valid;

    SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_D0 <= SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_r_data0 WHEN SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_r_valid = "1" ELSE i_select556_gmm_substract_q;

    -- SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract(STALLENABLE,722)
    SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_fromReg0 <= (others => '0');
            SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_fromReg0 <= SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_toReg0;
            -- Succesor 1
            SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_fromReg1 <= SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_consumed0 <= (not (SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_backStall) and SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_wireValid) or SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_fromReg0;
    SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_consumed1 <= (not (SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_backStall) and SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_wireValid) or SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_fromReg1;
    -- Consuming
    SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_StallValid <= SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_backStall and SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_wireValid;
    SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_toReg0 <= SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_StallValid and SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_consumed0;
    SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_toReg1 <= SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_StallValid and SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_consumed1;
    -- Backward Stall generation
    SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_or0 <= SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_consumed0;
    SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_wireStall <= not (SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_consumed1 and SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_or0);
    SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_backStall <= SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_wireStall;
    -- Valid signal propagation
    SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_V0 <= SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_wireValid and not (SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_fromReg0);
    SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_V1 <= SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_wireValid and not (SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_and0 <= i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_out_valid_out;
    SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_and1 <= i_ffwd_dst_reduction_gmm_substract_442764_gmm_substract_out_valid_out and SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_and0;
    SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_wireValid <= SE_i_cmp_i_i129_1_gmm_substract_V3 and SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_and1;

    -- SR_bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg(STALLREG,1270)
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_r_valid <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_r_valid <= bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_backStall and (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_r_valid or SR_bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_i_valid);

            IF (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_r_valid = "0") THEN
                -- Data(s)
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_i_valid <= SE_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_V0;
    -- Stall signal propagation
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_backStall <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_r_valid or not (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_i_valid);

    -- Valid
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_V <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_r_valid WHEN SR_bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_r_valid = "1" ELSE SR_bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_i_valid;


    -- SE_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract(STALLENABLE,776)
    -- Valid signal propagation
    SE_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_V0 <= SE_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_backStall <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_backStall or not (SE_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_wireValid <= i_ffwd_src_unnamed_gmm_substract70_gmm_substract_out_valid_out;

    -- i_ffwd_src_unnamed_gmm_substract70_gmm_substract(BLACKBOX,307)@1
    -- in in_stall_in@20000000
    -- out out_intel_reserved_ffwd_66_0@20000000
    -- out out_stall_out@20000000
    thei_ffwd_src_unnamed_gmm_substract70_gmm_substract : i_ffwd_src_unnamed_gmm_substract70_gmm_substract2387
    PORT MAP (
        in_enable_in => VCC_q,
        in_src_data_in_66_0 => SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_D0,
        in_stall_in => SE_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_backStall,
        in_valid_in => SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_V0,
        out_intel_reserved_ffwd_66_0 => i_ffwd_src_unnamed_gmm_substract70_gmm_substract_out_intel_reserved_ffwd_66_0,
        out_stall_out => i_ffwd_src_unnamed_gmm_substract70_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_src_unnamed_gmm_substract70_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_ffwd_dst_extract_t23242725_gmm_substract(STALLENABLE,706)
    -- Valid signal propagation
    SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_V0 <= SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_backStall <= i_ffwd_src_unnamed_gmm_substract70_gmm_substract_out_stall_out or not (SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_wireValid <= SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_V;

    -- SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract(STALLREG,1269)
    SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_r_valid <= (others => '0');
            SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_r_valid <= SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_backStall and (SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_r_valid or SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_i_valid);

            IF (SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_r_valid = "0") THEN
                -- Data(s)
                SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_r_data0 <= i_select604_gmm_substract_q;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_and0 <= i_ffwd_dst_extract_t23242725_gmm_substract_out_valid_out;
    SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_and1 <= i_ffwd_dst_extract_t23002710_gmm_substract_out_valid_out and SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_and0;
    SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_and2 <= SE_i_from_if_then612542_gmm_substract_V7 and SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_and1;
    SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_and3 <= SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_V0 and SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_and2;
    SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_i_valid <= SE_redist1_i_not_gmm_substract_q_1_0_V7 and SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_and3;
    -- Stall signal propagation
    SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_backStall <= SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_r_valid or not (SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_i_valid);

    -- Valid
    SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_V <= SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_r_valid WHEN SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_r_valid = "1" ELSE SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_i_valid;

    SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_D0 <= SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_r_data0 WHEN SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_r_valid = "1" ELSE i_select604_gmm_substract_q;

    -- i_ffwd_dst_extract_t23242725_gmm_substract(BLACKBOX,272)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_extract_t23242725_gmm_substract : i_ffwd_dst_extract_t23242725_gmm_substract2342
    PORT MAP (
        in_intel_reserved_ffwd_50_0 => in_intel_reserved_ffwd_50_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V31,
        out_dest_data_out_50_0 => i_ffwd_dst_extract_t23242725_gmm_substract_out_dest_data_out_50_0,
        out_stall_out => i_ffwd_dst_extract_t23242725_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_extract_t23242725_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_extract_t23002710_gmm_substract(BLACKBOX,262)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_extract_t23002710_gmm_substract : i_ffwd_dst_extract_t23002710_gmm_substract2340
    PORT MAP (
        in_intel_reserved_ffwd_44_0 => in_intel_reserved_ffwd_44_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V30,
        out_dest_data_out_44_0 => i_ffwd_dst_extract_t23002710_gmm_substract_out_dest_data_out_44_0,
        out_stall_out => i_ffwd_dst_extract_t23002710_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_extract_t23002710_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract(BITJOIN,490)
    bubble_join_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_q <= i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_out_dest_data_out_77_0;

    -- bubble_select_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract(BITSELECT,491)
    bubble_select_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_q(8 downto 0));

    -- i_extract_t652_gmm_substract_sel_x(BITSELECT,202)@1
    i_extract_t652_gmm_substract_sel_x_b <= bubble_select_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_b(7 downto 0);

    -- bubble_join_i_ffwd_dst_reduction_gmm_substract_382761_gmm_substract(BITJOIN,487)
    bubble_join_i_ffwd_dst_reduction_gmm_substract_382761_gmm_substract_q <= i_ffwd_dst_reduction_gmm_substract_382761_gmm_substract_out_dest_data_out_76_0;

    -- bubble_select_i_ffwd_dst_reduction_gmm_substract_382761_gmm_substract(BITSELECT,488)
    bubble_select_i_ffwd_dst_reduction_gmm_substract_382761_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_reduction_gmm_substract_382761_gmm_substract_q(8 downto 0));

    -- i_extract_t651_gmm_substract_sel_x(BITSELECT,201)@1
    i_extract_t651_gmm_substract_sel_x_b <= bubble_select_i_ffwd_dst_reduction_gmm_substract_382761_gmm_substract_b(7 downto 0);

    -- i_acl_431_gmm_substract(MUX,222)@1
    i_acl_431_gmm_substract_s <= i_cmp_i_i129_1_gmm_substract_c;
    i_acl_431_gmm_substract_combproc: PROCESS (i_acl_431_gmm_substract_s, i_extract_t651_gmm_substract_sel_x_b, i_extract_t652_gmm_substract_sel_x_b)
    BEGIN
        CASE (i_acl_431_gmm_substract_s) IS
            WHEN "0" => i_acl_431_gmm_substract_q <= i_extract_t651_gmm_substract_sel_x_b;
            WHEN "1" => i_acl_431_gmm_substract_q <= i_extract_t652_gmm_substract_sel_x_b;
            WHEN OTHERS => i_acl_431_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- bubble_join_i_ffwd_dst_extract_t23202723_gmm_substract(BITJOIN,469)
    bubble_join_i_ffwd_dst_extract_t23202723_gmm_substract_q <= i_ffwd_dst_extract_t23202723_gmm_substract_out_dest_data_out_49_0;

    -- bubble_select_i_ffwd_dst_extract_t23202723_gmm_substract(BITSELECT,470)
    bubble_select_i_ffwd_dst_extract_t23202723_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_extract_t23202723_gmm_substract_q(7 downto 0));

    -- bubble_join_i_ffwd_dst_extract_t22962707_gmm_substract(BITJOIN,439)
    bubble_join_i_ffwd_dst_extract_t22962707_gmm_substract_q <= i_ffwd_dst_extract_t22962707_gmm_substract_out_dest_data_out_43_0;

    -- bubble_select_i_ffwd_dst_extract_t22962707_gmm_substract(BITSELECT,440)
    bubble_select_i_ffwd_dst_extract_t22962707_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_extract_t22962707_gmm_substract_q(7 downto 0));

    -- i_select596_gmm_substract(MUX,333)@1
    i_select596_gmm_substract_s <= i_from_if_then612542_gmm_substract_q;
    i_select596_gmm_substract_combproc: PROCESS (i_select596_gmm_substract_s, bubble_select_i_ffwd_dst_extract_t22962707_gmm_substract_b, bubble_select_i_ffwd_dst_extract_t23202723_gmm_substract_b)
    BEGIN
        CASE (i_select596_gmm_substract_s) IS
            WHEN "0" => i_select596_gmm_substract_q <= bubble_select_i_ffwd_dst_extract_t22962707_gmm_substract_b;
            WHEN "1" => i_select596_gmm_substract_q <= bubble_select_i_ffwd_dst_extract_t23202723_gmm_substract_b;
            WHEN OTHERS => i_select596_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_select598_gmm_substract(MUX,334)@1
    i_select598_gmm_substract_s <= redist1_i_not_gmm_substract_q_1_0_q;
    i_select598_gmm_substract_combproc: PROCESS (i_select598_gmm_substract_s, i_select596_gmm_substract_q, i_acl_431_gmm_substract_q)
    BEGIN
        CASE (i_select598_gmm_substract_s) IS
            WHEN "0" => i_select598_gmm_substract_q <= i_select596_gmm_substract_q;
            WHEN "1" => i_select598_gmm_substract_q <= i_acl_431_gmm_substract_q;
            WHEN OTHERS => i_select598_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract(STALLENABLE,716)
    SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_fromReg0 <= (others => '0');
            SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_fromReg0 <= SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_toReg0;
            -- Succesor 1
            SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_fromReg1 <= SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_consumed0 <= (not (SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_backStall) and SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_wireValid) or SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_fromReg0;
    SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_consumed1 <= (not (SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_backStall) and SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_wireValid) or SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_fromReg1;
    -- Consuming
    SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_StallValid <= SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_backStall and SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_wireValid;
    SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_toReg0 <= SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_StallValid and SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_consumed0;
    SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_toReg1 <= SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_StallValid and SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_consumed1;
    -- Backward Stall generation
    SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_or0 <= SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_consumed0;
    SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_wireStall <= not (SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_consumed1 and SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_or0);
    SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_backStall <= SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_wireStall;
    -- Valid signal propagation
    SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_V0 <= SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_wireValid and not (SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_fromReg0);
    SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_V1 <= SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_wireValid and not (SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_and0 <= i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_out_valid_out;
    SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_and1 <= i_ffwd_dst_reduction_gmm_substract_382761_gmm_substract_out_valid_out and SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_and0;
    SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_wireValid <= SE_i_cmp_i_i129_1_gmm_substract_V2 and SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_and1;

    -- SR_bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg(STALLREG,1268)
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_r_valid <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_r_valid <= bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_backStall and (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_r_valid or SR_bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_i_valid);

            IF (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_r_valid = "0") THEN
                -- Data(s)
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_i_valid <= SE_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_V0;
    -- Stall signal propagation
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_backStall <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_r_valid or not (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_i_valid);

    -- Valid
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_V <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_r_valid WHEN SR_bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_r_valid = "1" ELSE SR_bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_i_valid;


    -- SE_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract(STALLENABLE,774)
    -- Valid signal propagation
    SE_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_V0 <= SE_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_backStall <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_backStall or not (SE_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_wireValid <= i_ffwd_src_unnamed_gmm_substract69_gmm_substract_out_valid_out;

    -- i_ffwd_src_unnamed_gmm_substract69_gmm_substract(BLACKBOX,306)@1
    -- in in_stall_in@20000000
    -- out out_intel_reserved_ffwd_65_0@20000000
    -- out out_stall_out@20000000
    thei_ffwd_src_unnamed_gmm_substract69_gmm_substract : i_ffwd_src_unnamed_gmm_substract69_gmm_substract2385
    PORT MAP (
        in_enable_in => VCC_q,
        in_src_data_in_65_0 => SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_D0,
        in_stall_in => SE_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_backStall,
        in_valid_in => SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_V0,
        out_intel_reserved_ffwd_65_0 => i_ffwd_src_unnamed_gmm_substract69_gmm_substract_out_intel_reserved_ffwd_65_0,
        out_stall_out => i_ffwd_src_unnamed_gmm_substract69_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_src_unnamed_gmm_substract69_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_ffwd_dst_extract_t23202723_gmm_substract(STALLENABLE,702)
    -- Valid signal propagation
    SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_V0 <= SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_backStall <= i_ffwd_src_unnamed_gmm_substract69_gmm_substract_out_stall_out or not (SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_wireValid <= SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_V;

    -- SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract(STALLREG,1267)
    SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_r_valid <= (others => '0');
            SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_r_valid <= SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_backStall and (SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_r_valid or SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_i_valid);

            IF (SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_r_valid = "0") THEN
                -- Data(s)
                SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_r_data0 <= i_select598_gmm_substract_q;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_and0 <= i_ffwd_dst_extract_t23202723_gmm_substract_out_valid_out;
    SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_and1 <= i_ffwd_dst_extract_t22962707_gmm_substract_out_valid_out and SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_and0;
    SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_and2 <= SE_i_from_if_then612542_gmm_substract_V6 and SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_and1;
    SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_and3 <= SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_V0 and SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_and2;
    SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_i_valid <= SE_redist1_i_not_gmm_substract_q_1_0_V6 and SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_and3;
    -- Stall signal propagation
    SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_backStall <= SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_r_valid or not (SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_i_valid);

    -- Valid
    SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_V <= SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_r_valid WHEN SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_r_valid = "1" ELSE SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_i_valid;

    SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_D0 <= SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_r_data0 WHEN SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_r_valid = "1" ELSE i_select598_gmm_substract_q;

    -- i_ffwd_dst_extract_t23202723_gmm_substract(BLACKBOX,270)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_extract_t23202723_gmm_substract : i_ffwd_dst_extract_t23202723_gmm_substract2338
    PORT MAP (
        in_intel_reserved_ffwd_49_0 => in_intel_reserved_ffwd_49_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V29,
        out_dest_data_out_49_0 => i_ffwd_dst_extract_t23202723_gmm_substract_out_dest_data_out_49_0,
        out_stall_out => i_ffwd_dst_extract_t23202723_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_extract_t23202723_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_extract_t22962707_gmm_substract(BLACKBOX,260)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_extract_t22962707_gmm_substract : i_ffwd_dst_extract_t22962707_gmm_substract2336
    PORT MAP (
        in_intel_reserved_ffwd_43_0 => in_intel_reserved_ffwd_43_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V28,
        out_dest_data_out_43_0 => i_ffwd_dst_extract_t22962707_gmm_substract_out_dest_data_out_43_0,
        out_stall_out => i_ffwd_dst_extract_t22962707_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_extract_t22962707_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_ffwd_dst_reduction_gmm_substract_682776_gmm_substract(BITJOIN,532)
    bubble_join_i_ffwd_dst_reduction_gmm_substract_682776_gmm_substract_q <= i_ffwd_dst_reduction_gmm_substract_682776_gmm_substract_out_dest_data_out_90_0;

    -- bubble_select_i_ffwd_dst_reduction_gmm_substract_682776_gmm_substract(BITSELECT,533)
    bubble_select_i_ffwd_dst_reduction_gmm_substract_682776_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_reduction_gmm_substract_682776_gmm_substract_q(7 downto 0));

    -- bubble_join_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract(BITJOIN,541)
    bubble_join_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_q <= i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_out_dest_data_out_91_0;

    -- bubble_select_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract(BITSELECT,542)
    bubble_select_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_q(7 downto 0));

    -- i_acl_439_gmm_substract(MUX,230)@1
    i_acl_439_gmm_substract_s <= i_cmp_i_i129_1_gmm_substract_c;
    i_acl_439_gmm_substract_combproc: PROCESS (i_acl_439_gmm_substract_s, bubble_select_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_b, bubble_select_i_ffwd_dst_reduction_gmm_substract_682776_gmm_substract_b)
    BEGIN
        CASE (i_acl_439_gmm_substract_s) IS
            WHEN "0" => i_acl_439_gmm_substract_q <= bubble_select_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_b;
            WHEN "1" => i_acl_439_gmm_substract_q <= bubble_select_i_ffwd_dst_reduction_gmm_substract_682776_gmm_substract_b;
            WHEN OTHERS => i_acl_439_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- bubble_join_i_ffwd_dst_acl_3972691_gmm_substract(BITJOIN,409)
    bubble_join_i_ffwd_dst_acl_3972691_gmm_substract_q <= i_ffwd_dst_acl_3972691_gmm_substract_out_dest_data_out_39_0;

    -- bubble_select_i_ffwd_dst_acl_3972691_gmm_substract(BITSELECT,410)
    bubble_select_i_ffwd_dst_acl_3972691_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_acl_3972691_gmm_substract_q(7 downto 0));

    -- bubble_join_i_ffwd_dst_acl_4002696_gmm_substract(BITJOIN,412)
    bubble_join_i_ffwd_dst_acl_4002696_gmm_substract_q <= i_ffwd_dst_acl_4002696_gmm_substract_out_dest_data_out_40_0;

    -- bubble_select_i_ffwd_dst_acl_4002696_gmm_substract(BITSELECT,413)
    bubble_select_i_ffwd_dst_acl_4002696_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_acl_4002696_gmm_substract_q(7 downto 0));

    -- i_select572_gmm_substract(MUX,328)@1
    i_select572_gmm_substract_s <= i_from_if_then612542_gmm_substract_q;
    i_select572_gmm_substract_combproc: PROCESS (i_select572_gmm_substract_s, bubble_select_i_ffwd_dst_acl_4002696_gmm_substract_b, bubble_select_i_ffwd_dst_acl_3972691_gmm_substract_b)
    BEGIN
        CASE (i_select572_gmm_substract_s) IS
            WHEN "0" => i_select572_gmm_substract_q <= bubble_select_i_ffwd_dst_acl_4002696_gmm_substract_b;
            WHEN "1" => i_select572_gmm_substract_q <= bubble_select_i_ffwd_dst_acl_3972691_gmm_substract_b;
            WHEN OTHERS => i_select572_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_select634_gmm_substract(MUX,343)@1
    i_select634_gmm_substract_s <= redist1_i_not_gmm_substract_q_1_0_q;
    i_select634_gmm_substract_combproc: PROCESS (i_select634_gmm_substract_s, i_select572_gmm_substract_q, i_acl_439_gmm_substract_q)
    BEGIN
        CASE (i_select634_gmm_substract_s) IS
            WHEN "0" => i_select634_gmm_substract_q <= i_select572_gmm_substract_q;
            WHEN "1" => i_select634_gmm_substract_q <= i_acl_439_gmm_substract_q;
            WHEN OTHERS => i_select634_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- SR_bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg(STALLREG,1266)
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_r_valid <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_r_valid <= bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_backStall and (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_r_valid or SR_bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_i_valid);

            IF (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_r_valid = "0") THEN
                -- Data(s)
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_i_valid <= SE_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_V0;
    -- Stall signal propagation
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_backStall <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_r_valid or not (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_i_valid);

    -- Valid
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_V <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_r_valid WHEN SR_bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_r_valid = "1" ELSE SR_bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_i_valid;


    -- SE_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract(STALLENABLE,786)
    -- Valid signal propagation
    SE_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_V0 <= SE_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_backStall <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_backStall or not (SE_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_wireValid <= i_ffwd_src_unnamed_gmm_substract75_gmm_substract_out_valid_out;

    -- i_ffwd_src_unnamed_gmm_substract75_gmm_substract(BLACKBOX,312)@1
    -- in in_stall_in@20000000
    -- out out_intel_reserved_ffwd_71_0@20000000
    -- out out_stall_out@20000000
    thei_ffwd_src_unnamed_gmm_substract75_gmm_substract : i_ffwd_src_unnamed_gmm_substract75_gmm_substract2397
    PORT MAP (
        in_enable_in => VCC_q,
        in_src_data_in_71_0 => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_D0,
        in_stall_in => SE_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_backStall,
        in_valid_in => SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_V0,
        out_intel_reserved_ffwd_71_0 => i_ffwd_src_unnamed_gmm_substract75_gmm_substract_out_intel_reserved_ffwd_71_0,
        out_stall_out => i_ffwd_src_unnamed_gmm_substract75_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_src_unnamed_gmm_substract75_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract(STALLENABLE,750)
    -- Valid signal propagation
    SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_V0 <= SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_backStall <= i_ffwd_src_unnamed_gmm_substract75_gmm_substract_out_stall_out or not (SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_wireValid <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_V;

    -- SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract(STALLREG,1265)
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_r_valid <= (others => '0');
            SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_r_valid <= SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_backStall and (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_r_valid or SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_i_valid);

            IF (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_r_valid = "0") THEN
                -- Data(s)
                SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_r_data0 <= i_select634_gmm_substract_q;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_and0 <= i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_out_valid_out;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_and1 <= i_ffwd_dst_reduction_gmm_substract_682776_gmm_substract_out_valid_out and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_and0;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_and2 <= SE_i_cmp_i_i129_1_gmm_substract_V7 and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_and1;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_and3 <= SE_out_i_ffwd_dst_acl_4002696_gmm_substract_V1 and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_and2;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_i_valid <= SE_redist1_i_not_gmm_substract_q_1_0_V10 and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_and3;
    -- Stall signal propagation
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_backStall <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_r_valid or not (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_i_valid);

    -- Valid
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_V <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_r_valid WHEN SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_r_valid = "1" ELSE SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_i_valid;

    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_D0 <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_r_data0 WHEN SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_r_valid = "1" ELSE i_select634_gmm_substract_q;

    -- bubble_join_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract(BITJOIN,538)
    bubble_join_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_q <= i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_out_dest_data_out_90_0;

    -- bubble_select_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract(BITSELECT,539)
    bubble_select_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_q(7 downto 0));

    -- bubble_join_i_ffwd_dst_reduction_gmm_substract_342759_gmm_substract(BITJOIN,481)
    bubble_join_i_ffwd_dst_reduction_gmm_substract_342759_gmm_substract_q <= i_ffwd_dst_reduction_gmm_substract_342759_gmm_substract_out_dest_data_out_74_0;

    -- bubble_select_i_ffwd_dst_reduction_gmm_substract_342759_gmm_substract(BITSELECT,482)
    bubble_select_i_ffwd_dst_reduction_gmm_substract_342759_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_reduction_gmm_substract_342759_gmm_substract_q(7 downto 0));

    -- i_acl_430_gmm_substract(MUX,221)@1
    i_acl_430_gmm_substract_s <= i_cmp_i_i129_1_gmm_substract_c;
    i_acl_430_gmm_substract_combproc: PROCESS (i_acl_430_gmm_substract_s, bubble_select_i_ffwd_dst_reduction_gmm_substract_342759_gmm_substract_b, bubble_select_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_b)
    BEGIN
        CASE (i_acl_430_gmm_substract_s) IS
            WHEN "0" => i_acl_430_gmm_substract_q <= bubble_select_i_ffwd_dst_reduction_gmm_substract_342759_gmm_substract_b;
            WHEN "1" => i_acl_430_gmm_substract_q <= bubble_select_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_b;
            WHEN OTHERS => i_acl_430_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_select574_gmm_substract(MUX,329)@1
    i_select574_gmm_substract_s <= redist1_i_not_gmm_substract_q_1_0_q;
    i_select574_gmm_substract_combproc: PROCESS (i_select574_gmm_substract_s, i_select572_gmm_substract_q, i_acl_430_gmm_substract_q)
    BEGIN
        CASE (i_select574_gmm_substract_s) IS
            WHEN "0" => i_select574_gmm_substract_q <= i_select572_gmm_substract_q;
            WHEN "1" => i_select574_gmm_substract_q <= i_acl_430_gmm_substract_q;
            WHEN OTHERS => i_select574_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- SR_bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg(STALLREG,1264)
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_r_valid <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_r_valid <= bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_backStall and (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_r_valid or SR_bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_i_valid);

            IF (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_r_valid = "0") THEN
                -- Data(s)
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_i_valid <= SE_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_V0;
    -- Stall signal propagation
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_backStall <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_r_valid or not (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_i_valid);

    -- Valid
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_V <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_r_valid WHEN SR_bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_r_valid = "1" ELSE SR_bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_i_valid;


    -- SE_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract(STALLENABLE,766)
    -- Valid signal propagation
    SE_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_V0 <= SE_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_backStall <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_backStall or not (SE_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_wireValid <= i_ffwd_src_unnamed_gmm_substract65_gmm_substract_out_valid_out;

    -- i_ffwd_src_unnamed_gmm_substract65_gmm_substract(BLACKBOX,302)@1
    -- in in_stall_in@20000000
    -- out out_intel_reserved_ffwd_61_0@20000000
    -- out out_stall_out@20000000
    thei_ffwd_src_unnamed_gmm_substract65_gmm_substract : i_ffwd_src_unnamed_gmm_substract65_gmm_substract2377
    PORT MAP (
        in_enable_in => VCC_q,
        in_src_data_in_61_0 => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_D0,
        in_stall_in => SE_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_backStall,
        in_valid_in => SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_V0,
        out_intel_reserved_ffwd_61_0 => i_ffwd_src_unnamed_gmm_substract65_gmm_substract_out_intel_reserved_ffwd_61_0,
        out_stall_out => i_ffwd_src_unnamed_gmm_substract65_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_src_unnamed_gmm_substract65_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract(STALLENABLE,748)
    -- Valid signal propagation
    SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_V0 <= SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_backStall <= i_ffwd_src_unnamed_gmm_substract65_gmm_substract_out_stall_out or not (SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_wireValid <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_V;

    -- SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract(STALLREG,1263)
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_r_valid <= (others => '0');
            SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_r_valid <= SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_backStall and (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_r_valid or SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_i_valid);

            IF (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_r_valid = "0") THEN
                -- Data(s)
                SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_r_data0 <= i_select574_gmm_substract_q;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_and0 <= i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_out_valid_out;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_and1 <= i_ffwd_dst_reduction_gmm_substract_342759_gmm_substract_out_valid_out and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_and0;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_and2 <= SE_i_cmp_i_i129_1_gmm_substract_V1 and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_and1;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_and3 <= SE_out_i_ffwd_dst_acl_4002696_gmm_substract_V0 and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_and2;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_i_valid <= SE_redist1_i_not_gmm_substract_q_1_0_V5 and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_and3;
    -- Stall signal propagation
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_backStall <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_r_valid or not (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_i_valid);

    -- Valid
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_V <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_r_valid WHEN SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_r_valid = "1" ELSE SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_i_valid;

    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_D0 <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_r_data0 WHEN SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_r_valid = "1" ELSE i_select574_gmm_substract_q;

    -- SE_out_i_ffwd_dst_acl_4002696_gmm_substract(STALLENABLE,664)
    SE_out_i_ffwd_dst_acl_4002696_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_ffwd_dst_acl_4002696_gmm_substract_fromReg0 <= (others => '0');
            SE_out_i_ffwd_dst_acl_4002696_gmm_substract_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_ffwd_dst_acl_4002696_gmm_substract_fromReg0 <= SE_out_i_ffwd_dst_acl_4002696_gmm_substract_toReg0;
            -- Succesor 1
            SE_out_i_ffwd_dst_acl_4002696_gmm_substract_fromReg1 <= SE_out_i_ffwd_dst_acl_4002696_gmm_substract_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_ffwd_dst_acl_4002696_gmm_substract_consumed0 <= (not (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_backStall) and SE_out_i_ffwd_dst_acl_4002696_gmm_substract_wireValid) or SE_out_i_ffwd_dst_acl_4002696_gmm_substract_fromReg0;
    SE_out_i_ffwd_dst_acl_4002696_gmm_substract_consumed1 <= (not (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_backStall) and SE_out_i_ffwd_dst_acl_4002696_gmm_substract_wireValid) or SE_out_i_ffwd_dst_acl_4002696_gmm_substract_fromReg1;
    -- Consuming
    SE_out_i_ffwd_dst_acl_4002696_gmm_substract_StallValid <= SE_out_i_ffwd_dst_acl_4002696_gmm_substract_backStall and SE_out_i_ffwd_dst_acl_4002696_gmm_substract_wireValid;
    SE_out_i_ffwd_dst_acl_4002696_gmm_substract_toReg0 <= SE_out_i_ffwd_dst_acl_4002696_gmm_substract_StallValid and SE_out_i_ffwd_dst_acl_4002696_gmm_substract_consumed0;
    SE_out_i_ffwd_dst_acl_4002696_gmm_substract_toReg1 <= SE_out_i_ffwd_dst_acl_4002696_gmm_substract_StallValid and SE_out_i_ffwd_dst_acl_4002696_gmm_substract_consumed1;
    -- Backward Stall generation
    SE_out_i_ffwd_dst_acl_4002696_gmm_substract_or0 <= SE_out_i_ffwd_dst_acl_4002696_gmm_substract_consumed0;
    SE_out_i_ffwd_dst_acl_4002696_gmm_substract_wireStall <= not (SE_out_i_ffwd_dst_acl_4002696_gmm_substract_consumed1 and SE_out_i_ffwd_dst_acl_4002696_gmm_substract_or0);
    SE_out_i_ffwd_dst_acl_4002696_gmm_substract_backStall <= SE_out_i_ffwd_dst_acl_4002696_gmm_substract_wireStall;
    -- Valid signal propagation
    SE_out_i_ffwd_dst_acl_4002696_gmm_substract_V0 <= SE_out_i_ffwd_dst_acl_4002696_gmm_substract_wireValid and not (SE_out_i_ffwd_dst_acl_4002696_gmm_substract_fromReg0);
    SE_out_i_ffwd_dst_acl_4002696_gmm_substract_V1 <= SE_out_i_ffwd_dst_acl_4002696_gmm_substract_wireValid and not (SE_out_i_ffwd_dst_acl_4002696_gmm_substract_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_dst_acl_4002696_gmm_substract_and0 <= i_ffwd_dst_acl_4002696_gmm_substract_out_valid_out;
    SE_out_i_ffwd_dst_acl_4002696_gmm_substract_and1 <= i_ffwd_dst_acl_3972691_gmm_substract_out_valid_out and SE_out_i_ffwd_dst_acl_4002696_gmm_substract_and0;
    SE_out_i_ffwd_dst_acl_4002696_gmm_substract_wireValid <= SE_i_from_if_then612542_gmm_substract_V5 and SE_out_i_ffwd_dst_acl_4002696_gmm_substract_and1;

    -- i_ffwd_dst_acl_4002696_gmm_substract(BLACKBOX,251)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_acl_4002696_gmm_substract : i_ffwd_dst_acl_4002696_gmm_substract2328
    PORT MAP (
        in_intel_reserved_ffwd_40_0 => in_intel_reserved_ffwd_40_0,
        in_stall_in => SE_out_i_ffwd_dst_acl_4002696_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V27,
        out_dest_data_out_40_0 => i_ffwd_dst_acl_4002696_gmm_substract_out_dest_data_out_40_0,
        out_stall_out => i_ffwd_dst_acl_4002696_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_acl_4002696_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_acl_3972691_gmm_substract(BLACKBOX,250)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_acl_3972691_gmm_substract : i_ffwd_dst_acl_3972691_gmm_substract2326
    PORT MAP (
        in_intel_reserved_ffwd_39_0 => in_intel_reserved_ffwd_39_0,
        in_stall_in => SE_out_i_ffwd_dst_acl_4002696_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V26,
        out_dest_data_out_39_0 => i_ffwd_dst_acl_3972691_gmm_substract_out_dest_data_out_39_0,
        out_stall_out => i_ffwd_dst_acl_3972691_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_acl_3972691_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract(BITJOIN,517)
    bubble_join_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_q <= i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_out_dest_data_out_85_0;

    -- bubble_select_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract(BITSELECT,518)
    bubble_select_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_q(15 downto 0));

    -- bubble_join_i_ffwd_dst_reduction_gmm_substract_322758_gmm_substract(BITJOIN,478)
    bubble_join_i_ffwd_dst_reduction_gmm_substract_322758_gmm_substract_q <= i_ffwd_dst_reduction_gmm_substract_322758_gmm_substract_out_dest_data_out_73_0;

    -- bubble_select_i_ffwd_dst_reduction_gmm_substract_322758_gmm_substract(BITSELECT,479)
    bubble_select_i_ffwd_dst_reduction_gmm_substract_322758_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_reduction_gmm_substract_322758_gmm_substract_q(15 downto 0));

    -- i_acl_429_gmm_substract(MUX,220)@1
    i_acl_429_gmm_substract_s <= i_cmp_i_i129_1_gmm_substract_c;
    i_acl_429_gmm_substract_combproc: PROCESS (i_acl_429_gmm_substract_s, bubble_select_i_ffwd_dst_reduction_gmm_substract_322758_gmm_substract_b, bubble_select_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_b)
    BEGIN
        CASE (i_acl_429_gmm_substract_s) IS
            WHEN "0" => i_acl_429_gmm_substract_q <= bubble_select_i_ffwd_dst_reduction_gmm_substract_322758_gmm_substract_b;
            WHEN "1" => i_acl_429_gmm_substract_q <= bubble_select_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_b;
            WHEN OTHERS => i_acl_429_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- bubble_join_i_ffwd_dst_acl_3772640_gmm_substract(BITJOIN,394)
    bubble_join_i_ffwd_dst_acl_3772640_gmm_substract_q <= i_ffwd_dst_acl_3772640_gmm_substract_out_dest_data_out_33_0;

    -- bubble_select_i_ffwd_dst_acl_3772640_gmm_substract(BITSELECT,395)
    bubble_select_i_ffwd_dst_acl_3772640_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_acl_3772640_gmm_substract_q(15 downto 0));

    -- bubble_join_i_ffwd_dst_acl_3832672_gmm_substract(BITJOIN,397)
    bubble_join_i_ffwd_dst_acl_3832672_gmm_substract_q <= i_ffwd_dst_acl_3832672_gmm_substract_out_dest_data_out_36_0;

    -- bubble_select_i_ffwd_dst_acl_3832672_gmm_substract(BITSELECT,398)
    bubble_select_i_ffwd_dst_acl_3832672_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_acl_3832672_gmm_substract_q(15 downto 0));

    -- i_select566_gmm_substract(MUX,326)@1
    i_select566_gmm_substract_s <= i_from_if_then612542_gmm_substract_q;
    i_select566_gmm_substract_combproc: PROCESS (i_select566_gmm_substract_s, bubble_select_i_ffwd_dst_acl_3832672_gmm_substract_b, bubble_select_i_ffwd_dst_acl_3772640_gmm_substract_b)
    BEGIN
        CASE (i_select566_gmm_substract_s) IS
            WHEN "0" => i_select566_gmm_substract_q <= bubble_select_i_ffwd_dst_acl_3832672_gmm_substract_b;
            WHEN "1" => i_select566_gmm_substract_q <= bubble_select_i_ffwd_dst_acl_3772640_gmm_substract_b;
            WHEN OTHERS => i_select566_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_select568_gmm_substract(MUX,327)@1
    i_select568_gmm_substract_s <= redist1_i_not_gmm_substract_q_1_0_q;
    i_select568_gmm_substract_combproc: PROCESS (i_select568_gmm_substract_s, i_select566_gmm_substract_q, i_acl_429_gmm_substract_q)
    BEGIN
        CASE (i_select568_gmm_substract_s) IS
            WHEN "0" => i_select568_gmm_substract_q <= i_select566_gmm_substract_q;
            WHEN "1" => i_select568_gmm_substract_q <= i_acl_429_gmm_substract_q;
            WHEN OTHERS => i_select568_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- SR_bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg(STALLREG,1262)
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_r_valid <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_r_valid <= bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_backStall and (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_r_valid or SR_bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_i_valid);

            IF (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_r_valid = "0") THEN
                -- Data(s)
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_i_valid <= SE_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_V0;
    -- Stall signal propagation
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_backStall <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_r_valid or not (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_i_valid);

    -- Valid
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_V <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_r_valid WHEN SR_bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_r_valid = "1" ELSE SR_bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_i_valid;


    -- SE_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract(STALLENABLE,764)
    -- Valid signal propagation
    SE_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_V0 <= SE_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_backStall <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_backStall or not (SE_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_wireValid <= i_ffwd_src_unnamed_gmm_substract64_gmm_substract_out_valid_out;

    -- i_ffwd_src_unnamed_gmm_substract64_gmm_substract(BLACKBOX,301)@1
    -- in in_stall_in@20000000
    -- out out_intel_reserved_ffwd_60_0@20000000
    -- out out_stall_out@20000000
    thei_ffwd_src_unnamed_gmm_substract64_gmm_substract : i_ffwd_src_unnamed_gmm_substract64_gmm_substract2375
    PORT MAP (
        in_enable_in => VCC_q,
        in_src_data_in_60_0 => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_D0,
        in_stall_in => SE_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_backStall,
        in_valid_in => SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_V0,
        out_intel_reserved_ffwd_60_0 => i_ffwd_src_unnamed_gmm_substract64_gmm_substract_out_intel_reserved_ffwd_60_0,
        out_stall_out => i_ffwd_src_unnamed_gmm_substract64_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_src_unnamed_gmm_substract64_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract(STALLENABLE,734)
    -- Valid signal propagation
    SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_V0 <= SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_backStall <= i_ffwd_src_unnamed_gmm_substract64_gmm_substract_out_stall_out or not (SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_wireValid <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_V;

    -- SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract(STALLREG,1261)
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_r_valid <= (others => '0');
            SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_r_valid <= SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_backStall and (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_r_valid or SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_i_valid);

            IF (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_r_valid = "0") THEN
                -- Data(s)
                SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_r_data0 <= i_select568_gmm_substract_q;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_and0 <= i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_out_valid_out;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_and1 <= i_ffwd_dst_reduction_gmm_substract_322758_gmm_substract_out_valid_out and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_and0;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_and2 <= i_ffwd_dst_acl_3832672_gmm_substract_out_valid_out and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_and1;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_and3 <= i_ffwd_dst_acl_3772640_gmm_substract_out_valid_out and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_and2;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_and4 <= SE_i_from_if_then612542_gmm_substract_V4 and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_and3;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_and5 <= SE_i_cmp_i_i129_1_gmm_substract_V0 and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_and4;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_i_valid <= SE_redist1_i_not_gmm_substract_q_1_0_V4 and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_and5;
    -- Stall signal propagation
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_backStall <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_r_valid or not (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_i_valid);

    -- Valid
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_V <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_r_valid WHEN SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_r_valid = "1" ELSE SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_i_valid;

    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_D0 <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_r_data0 WHEN SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_r_valid = "1" ELSE i_select568_gmm_substract_q;

    -- i_ffwd_dst_acl_3832672_gmm_substract(BLACKBOX,246)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_acl_3832672_gmm_substract : i_ffwd_dst_acl_3832672_gmm_substract2324
    PORT MAP (
        in_intel_reserved_ffwd_36_0 => in_intel_reserved_ffwd_36_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V25,
        out_dest_data_out_36_0 => i_ffwd_dst_acl_3832672_gmm_substract_out_dest_data_out_36_0,
        out_stall_out => i_ffwd_dst_acl_3832672_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_acl_3832672_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_acl_3772640_gmm_substract(BLACKBOX,245)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_acl_3772640_gmm_substract : i_ffwd_dst_acl_3772640_gmm_substract2322
    PORT MAP (
        in_intel_reserved_ffwd_33_0 => in_intel_reserved_ffwd_33_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V24,
        out_dest_data_out_33_0 => i_ffwd_dst_acl_3772640_gmm_substract_out_dest_data_out_33_0,
        out_stall_out => i_ffwd_dst_acl_3772640_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_acl_3772640_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_ffwd_dst_reduction_gmm_substract_502767_gmm_substract(BITJOIN,505)
    bubble_join_i_ffwd_dst_reduction_gmm_substract_502767_gmm_substract_q <= i_ffwd_dst_reduction_gmm_substract_502767_gmm_substract_out_dest_data_out_82_0;

    -- bubble_select_i_ffwd_dst_reduction_gmm_substract_502767_gmm_substract(BITSELECT,506)
    bubble_select_i_ffwd_dst_reduction_gmm_substract_502767_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_reduction_gmm_substract_502767_gmm_substract_q(8 downto 0));

    -- i_extract_t657_gmm_substract_sel_x(BITSELECT,207)@1
    i_extract_t657_gmm_substract_sel_x_b <= bubble_select_i_ffwd_dst_reduction_gmm_substract_502767_gmm_substract_b(7 downto 0);

    -- bubble_join_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract(BITJOIN,508)
    bubble_join_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_q <= i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_out_dest_data_out_83_0;

    -- bubble_select_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract(BITSELECT,509)
    bubble_select_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_q(8 downto 0));

    -- i_extract_t658_gmm_substract_sel_x(BITSELECT,208)@1
    i_extract_t658_gmm_substract_sel_x_b <= bubble_select_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_b(7 downto 0);

    -- i_acl_436_gmm_substract(MUX,227)@1
    i_acl_436_gmm_substract_s <= i_cmp_i_i129_1_gmm_substract_c;
    i_acl_436_gmm_substract_combproc: PROCESS (i_acl_436_gmm_substract_s, i_extract_t658_gmm_substract_sel_x_b, i_extract_t657_gmm_substract_sel_x_b)
    BEGIN
        CASE (i_acl_436_gmm_substract_s) IS
            WHEN "0" => i_acl_436_gmm_substract_q <= i_extract_t658_gmm_substract_sel_x_b;
            WHEN "1" => i_acl_436_gmm_substract_q <= i_extract_t657_gmm_substract_sel_x_b;
            WHEN OTHERS => i_acl_436_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- bubble_join_i_ffwd_dst_extract_t23042715_gmm_substract(BITJOIN,454)
    bubble_join_i_ffwd_dst_extract_t23042715_gmm_substract_q <= i_ffwd_dst_extract_t23042715_gmm_substract_out_dest_data_out_45_0;

    -- bubble_select_i_ffwd_dst_extract_t23042715_gmm_substract(BITSELECT,455)
    bubble_select_i_ffwd_dst_extract_t23042715_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_extract_t23042715_gmm_substract_q(7 downto 0));

    -- bubble_join_i_ffwd_dst_extract_t22922705_gmm_substract(BITJOIN,433)
    bubble_join_i_ffwd_dst_extract_t22922705_gmm_substract_q <= i_ffwd_dst_extract_t22922705_gmm_substract_out_dest_data_out_42_0;

    -- bubble_select_i_ffwd_dst_extract_t22922705_gmm_substract(BITSELECT,434)
    bubble_select_i_ffwd_dst_extract_t22922705_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_extract_t22922705_gmm_substract_q(7 downto 0));

    -- i_select560_gmm_substract(MUX,324)@1
    i_select560_gmm_substract_s <= i_from_if_then612542_gmm_substract_q;
    i_select560_gmm_substract_combproc: PROCESS (i_select560_gmm_substract_s, bubble_select_i_ffwd_dst_extract_t22922705_gmm_substract_b, bubble_select_i_ffwd_dst_extract_t23042715_gmm_substract_b)
    BEGIN
        CASE (i_select560_gmm_substract_s) IS
            WHEN "0" => i_select560_gmm_substract_q <= bubble_select_i_ffwd_dst_extract_t22922705_gmm_substract_b;
            WHEN "1" => i_select560_gmm_substract_q <= bubble_select_i_ffwd_dst_extract_t23042715_gmm_substract_b;
            WHEN OTHERS => i_select560_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_select562_gmm_substract(MUX,325)@1
    i_select562_gmm_substract_s <= redist1_i_not_gmm_substract_q_1_0_q;
    i_select562_gmm_substract_combproc: PROCESS (i_select562_gmm_substract_s, i_select560_gmm_substract_q, i_acl_436_gmm_substract_q)
    BEGIN
        CASE (i_select562_gmm_substract_s) IS
            WHEN "0" => i_select562_gmm_substract_q <= i_select560_gmm_substract_q;
            WHEN "1" => i_select562_gmm_substract_q <= i_acl_436_gmm_substract_q;
            WHEN OTHERS => i_select562_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_435_gmm_substract(MUX,226)@1
    i_acl_435_gmm_substract_s <= i_cmp_i_i129_1_gmm_substract_c;
    i_acl_435_gmm_substract_combproc: PROCESS (i_acl_435_gmm_substract_s, i_extract_t657_gmm_substract_sel_x_b, i_extract_t658_gmm_substract_sel_x_b)
    BEGIN
        CASE (i_acl_435_gmm_substract_s) IS
            WHEN "0" => i_acl_435_gmm_substract_q <= i_extract_t657_gmm_substract_sel_x_b;
            WHEN "1" => i_acl_435_gmm_substract_q <= i_extract_t658_gmm_substract_sel_x_b;
            WHEN OTHERS => i_acl_435_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- bubble_join_i_ffwd_dst_extract_t22922706_gmm_substract(BITJOIN,436)
    bubble_join_i_ffwd_dst_extract_t22922706_gmm_substract_q <= i_ffwd_dst_extract_t22922706_gmm_substract_out_dest_data_out_42_0;

    -- bubble_select_i_ffwd_dst_extract_t22922706_gmm_substract(BITSELECT,437)
    bubble_select_i_ffwd_dst_extract_t22922706_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_extract_t22922706_gmm_substract_q(7 downto 0));

    -- bubble_join_i_ffwd_dst_extract_t23042713_gmm_substract(BITJOIN,451)
    bubble_join_i_ffwd_dst_extract_t23042713_gmm_substract_q <= i_ffwd_dst_extract_t23042713_gmm_substract_out_dest_data_out_45_0;

    -- bubble_select_i_ffwd_dst_extract_t23042713_gmm_substract(BITSELECT,452)
    bubble_select_i_ffwd_dst_extract_t23042713_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_extract_t23042713_gmm_substract_q(7 downto 0));

    -- i_select543_gmm_substract(MUX,318)@1
    i_select543_gmm_substract_s <= i_from_if_then612542_gmm_substract_q;
    i_select543_gmm_substract_combproc: PROCESS (i_select543_gmm_substract_s, bubble_select_i_ffwd_dst_extract_t23042713_gmm_substract_b, bubble_select_i_ffwd_dst_extract_t22922706_gmm_substract_b)
    BEGIN
        CASE (i_select543_gmm_substract_s) IS
            WHEN "0" => i_select543_gmm_substract_q <= bubble_select_i_ffwd_dst_extract_t23042713_gmm_substract_b;
            WHEN "1" => i_select543_gmm_substract_q <= bubble_select_i_ffwd_dst_extract_t22922706_gmm_substract_b;
            WHEN OTHERS => i_select543_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_select544_gmm_substract(MUX,319)@1
    i_select544_gmm_substract_s <= redist1_i_not_gmm_substract_q_1_0_q;
    i_select544_gmm_substract_combproc: PROCESS (i_select544_gmm_substract_s, i_select543_gmm_substract_q, i_acl_435_gmm_substract_q)
    BEGIN
        CASE (i_select544_gmm_substract_s) IS
            WHEN "0" => i_select544_gmm_substract_q <= i_select543_gmm_substract_q;
            WHEN "1" => i_select544_gmm_substract_q <= i_acl_435_gmm_substract_q;
            WHEN OTHERS => i_select544_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- SR_bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg(STALLREG,1254)
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_r_valid <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_r_valid <= bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_backStall and (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_r_valid or SR_bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_i_valid);

            IF (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_r_valid = "0") THEN
                -- Data(s)
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_i_valid <= SE_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_V0;
    -- Stall signal propagation
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_backStall <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_r_valid or not (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_i_valid);

    -- Valid
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_V <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_r_valid WHEN SR_bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_r_valid = "1" ELSE SR_bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_i_valid;


    -- SE_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract(STALLENABLE,756)
    -- Valid signal propagation
    SE_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_V0 <= SE_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_backStall <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_backStall or not (SE_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_wireValid <= i_ffwd_src_unnamed_gmm_substract60_gmm_substract_out_valid_out;

    -- i_ffwd_src_unnamed_gmm_substract60_gmm_substract(BLACKBOX,297)@1
    -- in in_stall_in@20000000
    -- out out_intel_reserved_ffwd_56_0@20000000
    -- out out_stall_out@20000000
    thei_ffwd_src_unnamed_gmm_substract60_gmm_substract : i_ffwd_src_unnamed_gmm_substract60_gmm_substract2367
    PORT MAP (
        in_enable_in => VCC_q,
        in_src_data_in_56_0 => SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_D0,
        in_stall_in => SE_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_backStall,
        in_valid_in => SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_V0,
        out_intel_reserved_ffwd_56_0 => i_ffwd_src_unnamed_gmm_substract60_gmm_substract_out_intel_reserved_ffwd_56_0,
        out_stall_out => i_ffwd_src_unnamed_gmm_substract60_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_src_unnamed_gmm_substract60_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_ffwd_dst_extract_t23042713_gmm_substract(STALLENABLE,690)
    -- Valid signal propagation
    SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_V0 <= SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_backStall <= i_ffwd_src_unnamed_gmm_substract60_gmm_substract_out_stall_out or not (SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_wireValid <= SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_V;

    -- SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract(STALLREG,1253)
    SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_r_valid <= (others => '0');
            SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_r_valid <= SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_backStall and (SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_r_valid or SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_i_valid);

            IF (SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_r_valid = "0") THEN
                -- Data(s)
                SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_r_data0 <= i_select544_gmm_substract_q;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_and0 <= i_ffwd_dst_extract_t23042713_gmm_substract_out_valid_out;
    SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_and1 <= i_ffwd_dst_extract_t22922706_gmm_substract_out_valid_out and SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_and0;
    SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_and2 <= SE_i_from_if_then612542_gmm_substract_V0 and SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_and1;
    SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_and3 <= SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_V0 and SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_and2;
    SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_i_valid <= SE_redist1_i_not_gmm_substract_q_1_0_V0 and SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_and3;
    -- Stall signal propagation
    SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_backStall <= SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_r_valid or not (SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_i_valid);

    -- Valid
    SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_V <= SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_r_valid WHEN SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_r_valid = "1" ELSE SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_i_valid;

    SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_D0 <= SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_r_data0 WHEN SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_r_valid = "1" ELSE i_select544_gmm_substract_q;

    -- SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract(STALLENABLE,728)
    SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_fromReg0 <= (others => '0');
            SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_fromReg0 <= SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_toReg0;
            -- Succesor 1
            SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_fromReg1 <= SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_consumed0 <= (not (SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_backStall) and SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_wireValid) or SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_fromReg0;
    SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_consumed1 <= (not (SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_backStall) and SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_wireValid) or SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_fromReg1;
    -- Consuming
    SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_StallValid <= SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_backStall and SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_wireValid;
    SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_toReg0 <= SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_StallValid and SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_consumed0;
    SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_toReg1 <= SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_StallValid and SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_consumed1;
    -- Backward Stall generation
    SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_or0 <= SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_consumed0;
    SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_wireStall <= not (SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_consumed1 and SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_or0);
    SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_backStall <= SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_wireStall;
    -- Valid signal propagation
    SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_V0 <= SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_wireValid and not (SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_fromReg0);
    SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_V1 <= SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_wireValid and not (SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_and0 <= i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_out_valid_out;
    SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_and1 <= i_ffwd_dst_reduction_gmm_substract_502767_gmm_substract_out_valid_out and SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_and0;
    SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_wireValid <= SE_i_cmp_i_i129_1_gmm_substract_V4 and SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_and1;

    -- SR_bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg(STALLREG,1260)
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_r_valid <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_r_valid <= bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_backStall and (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_r_valid or SR_bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_i_valid);

            IF (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_r_valid = "0") THEN
                -- Data(s)
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_i_valid <= SE_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_V0;
    -- Stall signal propagation
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_backStall <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_r_valid or not (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_i_valid);

    -- Valid
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_V <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_r_valid WHEN SR_bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_r_valid = "1" ELSE SR_bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_i_valid;


    -- SE_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract(STALLENABLE,762)
    -- Valid signal propagation
    SE_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_V0 <= SE_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_backStall <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_backStall or not (SE_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_wireValid <= i_ffwd_src_unnamed_gmm_substract63_gmm_substract_out_valid_out;

    -- i_ffwd_src_unnamed_gmm_substract63_gmm_substract(BLACKBOX,300)@1
    -- in in_stall_in@20000000
    -- out out_intel_reserved_ffwd_59_0@20000000
    -- out out_stall_out@20000000
    thei_ffwd_src_unnamed_gmm_substract63_gmm_substract : i_ffwd_src_unnamed_gmm_substract63_gmm_substract2373
    PORT MAP (
        in_enable_in => VCC_q,
        in_src_data_in_59_0 => SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_D0,
        in_stall_in => SE_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_backStall,
        in_valid_in => SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_V0,
        out_intel_reserved_ffwd_59_0 => i_ffwd_src_unnamed_gmm_substract63_gmm_substract_out_intel_reserved_ffwd_59_0,
        out_stall_out => i_ffwd_src_unnamed_gmm_substract63_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_src_unnamed_gmm_substract63_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_ffwd_dst_extract_t23042715_gmm_substract(STALLENABLE,692)
    -- Valid signal propagation
    SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_V0 <= SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_backStall <= i_ffwd_src_unnamed_gmm_substract63_gmm_substract_out_stall_out or not (SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_wireValid <= SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_V;

    -- SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract(STALLREG,1259)
    SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_r_valid <= (others => '0');
            SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_r_valid <= SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_backStall and (SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_r_valid or SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_i_valid);

            IF (SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_r_valid = "0") THEN
                -- Data(s)
                SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_r_data0 <= i_select562_gmm_substract_q;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_and0 <= i_ffwd_dst_extract_t23042715_gmm_substract_out_valid_out;
    SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_and1 <= i_ffwd_dst_extract_t22922705_gmm_substract_out_valid_out and SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_and0;
    SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_and2 <= SE_i_from_if_then612542_gmm_substract_V3 and SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_and1;
    SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_and3 <= SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_V1 and SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_and2;
    SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_i_valid <= SE_redist1_i_not_gmm_substract_q_1_0_V3 and SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_and3;
    -- Stall signal propagation
    SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_backStall <= SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_r_valid or not (SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_i_valid);

    -- Valid
    SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_V <= SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_r_valid WHEN SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_r_valid = "1" ELSE SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_i_valid;

    SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_D0 <= SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_r_data0 WHEN SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_r_valid = "1" ELSE i_select562_gmm_substract_q;

    -- i_ffwd_dst_extract_t23042715_gmm_substract(BLACKBOX,265)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_extract_t23042715_gmm_substract : i_ffwd_dst_extract_t23042715_gmm_substract2320
    PORT MAP (
        in_intel_reserved_ffwd_45_0 => in_intel_reserved_ffwd_45_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V23,
        out_dest_data_out_45_0 => i_ffwd_dst_extract_t23042715_gmm_substract_out_dest_data_out_45_0,
        out_stall_out => i_ffwd_dst_extract_t23042715_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_extract_t23042715_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_extract_t22922705_gmm_substract(BLACKBOX,258)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_extract_t22922705_gmm_substract : i_ffwd_dst_extract_t22922705_gmm_substract2318
    PORT MAP (
        in_intel_reserved_ffwd_42_0 => in_intel_reserved_ffwd_42_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V22,
        out_dest_data_out_42_0 => i_ffwd_dst_extract_t22922705_gmm_substract_out_dest_data_out_42_0,
        out_stall_out => i_ffwd_dst_extract_t22922705_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_extract_t22922705_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_extract_t23242724_gmm_substract(BLACKBOX,271)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_extract_t23242724_gmm_substract : i_ffwd_dst_extract_t23242724_gmm_substract2316
    PORT MAP (
        in_intel_reserved_ffwd_50_0 => in_intel_reserved_ffwd_50_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V21,
        out_dest_data_out_50_0 => i_ffwd_dst_extract_t23242724_gmm_substract_out_dest_data_out_50_0,
        out_stall_out => i_ffwd_dst_extract_t23242724_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_extract_t23242724_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_extract_t23002712_gmm_substract(BLACKBOX,263)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_extract_t23002712_gmm_substract : i_ffwd_dst_extract_t23002712_gmm_substract2314
    PORT MAP (
        in_intel_reserved_ffwd_44_0 => in_intel_reserved_ffwd_44_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V20,
        out_dest_data_out_44_0 => i_ffwd_dst_extract_t23002712_gmm_substract_out_dest_data_out_44_0,
        out_stall_out => i_ffwd_dst_extract_t23002712_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_extract_t23002712_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_extract_t23202722_gmm_substract(BLACKBOX,269)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_extract_t23202722_gmm_substract : i_ffwd_dst_extract_t23202722_gmm_substract2312
    PORT MAP (
        in_intel_reserved_ffwd_49_0 => in_intel_reserved_ffwd_49_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V19,
        out_dest_data_out_49_0 => i_ffwd_dst_extract_t23202722_gmm_substract_out_dest_data_out_49_0,
        out_stall_out => i_ffwd_dst_extract_t23202722_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_extract_t23202722_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_extract_t22962709_gmm_substract(BLACKBOX,261)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_extract_t22962709_gmm_substract : i_ffwd_dst_extract_t22962709_gmm_substract2310
    PORT MAP (
        in_intel_reserved_ffwd_43_0 => in_intel_reserved_ffwd_43_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V18,
        out_dest_data_out_43_0 => i_ffwd_dst_extract_t22962709_gmm_substract_out_dest_data_out_43_0,
        out_stall_out => i_ffwd_dst_extract_t22962709_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_extract_t22962709_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_extract_t23042713_gmm_substract(BLACKBOX,264)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_extract_t23042713_gmm_substract : i_ffwd_dst_extract_t23042713_gmm_substract2308
    PORT MAP (
        in_intel_reserved_ffwd_45_0 => in_intel_reserved_ffwd_45_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V17,
        out_dest_data_out_45_0 => i_ffwd_dst_extract_t23042713_gmm_substract_out_dest_data_out_45_0,
        out_stall_out => i_ffwd_dst_extract_t23042713_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_extract_t23042713_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_extract_t22922706_gmm_substract(BLACKBOX,259)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_extract_t22922706_gmm_substract : i_ffwd_dst_extract_t22922706_gmm_substract2306
    PORT MAP (
        in_intel_reserved_ffwd_42_0 => in_intel_reserved_ffwd_42_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V16,
        out_dest_data_out_42_0 => i_ffwd_dst_extract_t22922706_gmm_substract_out_dest_data_out_42_0,
        out_stall_out => i_ffwd_dst_extract_t22922706_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_extract_t22922706_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract(BLACKBOX,294)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_reduction_gmm_substract_702779_gmm_substract : i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract2302
    PORT MAP (
        in_intel_reserved_ffwd_91_0 => in_intel_reserved_ffwd_91_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V15,
        out_dest_data_out_91_0 => i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_out_dest_data_out_91_0,
        out_stall_out => i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_reduction_gmm_substract_682776_gmm_substract(BLACKBOX,291)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_reduction_gmm_substract_682776_gmm_substract : i_ffwd_dst_reduction_gmm_substract_682776_gmm_substract2300
    PORT MAP (
        in_intel_reserved_ffwd_90_0 => in_intel_reserved_ffwd_90_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V14,
        out_dest_data_out_90_0 => i_ffwd_dst_reduction_gmm_substract_682776_gmm_substract_out_dest_data_out_90_0,
        out_stall_out => i_ffwd_dst_reduction_gmm_substract_682776_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_reduction_gmm_substract_682776_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract(BLACKBOX,287)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_reduction_gmm_substract_582772_gmm_substract : i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract2294
    PORT MAP (
        in_intel_reserved_ffwd_86_0 => in_intel_reserved_ffwd_86_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V11,
        out_dest_data_out_86_0 => i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_out_dest_data_out_86_0,
        out_stall_out => i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_reduction_gmm_substract_562770_gmm_substract(BLACKBOX,285)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_reduction_gmm_substract_562770_gmm_substract : i_ffwd_dst_reduction_gmm_substract_562770_gmm_substract2292
    PORT MAP (
        in_intel_reserved_ffwd_85_0 => in_intel_reserved_ffwd_85_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V10,
        out_dest_data_out_85_0 => i_ffwd_dst_reduction_gmm_substract_562770_gmm_substract_out_dest_data_out_85_0,
        out_stall_out => i_ffwd_dst_reduction_gmm_substract_562770_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_reduction_gmm_substract_562770_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract(BLACKBOX,293)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_reduction_gmm_substract_682778_gmm_substract : i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract2290
    PORT MAP (
        in_intel_reserved_ffwd_90_0 => in_intel_reserved_ffwd_90_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V9,
        out_dest_data_out_90_0 => i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_out_dest_data_out_90_0,
        out_stall_out => i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_reduction_gmm_substract_342759_gmm_substract(BLACKBOX,274)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_reduction_gmm_substract_342759_gmm_substract : i_ffwd_dst_reduction_gmm_substract_342759_gmm_substract2288
    PORT MAP (
        in_intel_reserved_ffwd_74_0 => in_intel_reserved_ffwd_74_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V8,
        out_dest_data_out_74_0 => i_ffwd_dst_reduction_gmm_substract_342759_gmm_substract_out_dest_data_out_74_0,
        out_stall_out => i_ffwd_dst_reduction_gmm_substract_342759_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_reduction_gmm_substract_342759_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract(BLACKBOX,286)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_reduction_gmm_substract_562771_gmm_substract : i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract2286
    PORT MAP (
        in_intel_reserved_ffwd_85_0 => in_intel_reserved_ffwd_85_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V7,
        out_dest_data_out_85_0 => i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_out_dest_data_out_85_0,
        out_stall_out => i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_reduction_gmm_substract_322758_gmm_substract(BLACKBOX,273)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_reduction_gmm_substract_322758_gmm_substract : i_ffwd_dst_reduction_gmm_substract_322758_gmm_substract2284
    PORT MAP (
        in_intel_reserved_ffwd_73_0 => in_intel_reserved_ffwd_73_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V6,
        out_dest_data_out_73_0 => i_ffwd_dst_reduction_gmm_substract_322758_gmm_substract_out_dest_data_out_73_0,
        out_stall_out => i_ffwd_dst_reduction_gmm_substract_322758_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_reduction_gmm_substract_322758_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract(BLACKBOX,283)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_reduction_gmm_substract_522768_gmm_substract : i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract2270
    PORT MAP (
        in_intel_reserved_ffwd_83_0 => in_intel_reserved_ffwd_83_0,
        in_stall_in => SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V5,
        out_dest_data_out_83_0 => i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_out_dest_data_out_83_0,
        out_stall_out => i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_reduction_gmm_substract_502767_gmm_substract(BLACKBOX,282)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_reduction_gmm_substract_502767_gmm_substract : i_ffwd_dst_reduction_gmm_substract_502767_gmm_substract2268
    PORT MAP (
        in_intel_reserved_ffwd_82_0 => in_intel_reserved_ffwd_82_0,
        in_stall_in => SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V4,
        out_dest_data_out_82_0 => i_ffwd_dst_reduction_gmm_substract_502767_gmm_substract_out_dest_data_out_82_0,
        out_stall_out => i_ffwd_dst_reduction_gmm_substract_502767_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_reduction_gmm_substract_502767_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract(BLACKBOX,280)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_reduction_gmm_substract_462765_gmm_substract : i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract2264
    PORT MAP (
        in_intel_reserved_ffwd_80_0 => in_intel_reserved_ffwd_80_0,
        in_stall_in => SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V3,
        out_dest_data_out_80_0 => i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_out_dest_data_out_80_0,
        out_stall_out => i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_reduction_gmm_substract_442764_gmm_substract(BLACKBOX,279)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_reduction_gmm_substract_442764_gmm_substract : i_ffwd_dst_reduction_gmm_substract_442764_gmm_substract2262
    PORT MAP (
        in_intel_reserved_ffwd_79_0 => in_intel_reserved_ffwd_79_0,
        in_stall_in => SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V2,
        out_dest_data_out_79_0 => i_ffwd_dst_reduction_gmm_substract_442764_gmm_substract_out_dest_data_out_79_0,
        out_stall_out => i_ffwd_dst_reduction_gmm_substract_442764_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_reduction_gmm_substract_442764_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract(BLACKBOX,277)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_reduction_gmm_substract_402762_gmm_substract : i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract2258
    PORT MAP (
        in_intel_reserved_ffwd_77_0 => in_intel_reserved_ffwd_77_0,
        in_stall_in => SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V1,
        out_dest_data_out_77_0 => i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_out_dest_data_out_77_0,
        out_stall_out => i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_reduction_gmm_substract_382761_gmm_substract(BLACKBOX,276)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_reduction_gmm_substract_382761_gmm_substract : i_ffwd_dst_reduction_gmm_substract_382761_gmm_substract2256
    PORT MAP (
        in_intel_reserved_ffwd_76_0 => in_intel_reserved_ffwd_76_0,
        in_stall_in => SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V0,
        out_dest_data_out_76_0 => i_ffwd_dst_reduction_gmm_substract_382761_gmm_substract_out_dest_data_out_76_0,
        out_stall_out => i_ffwd_dst_reduction_gmm_substract_382761_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_reduction_gmm_substract_382761_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_out_stall_entry_2_reg(STALLENABLE,1206)
    -- Valid signal propagation
    bubble_out_stall_entry_2_reg_V0 <= bubble_out_stall_entry_2_reg_R_v_0;
    bubble_out_stall_entry_2_reg_V1 <= bubble_out_stall_entry_2_reg_R_v_1;
    bubble_out_stall_entry_2_reg_V2 <= bubble_out_stall_entry_2_reg_R_v_2;
    bubble_out_stall_entry_2_reg_V3 <= bubble_out_stall_entry_2_reg_R_v_3;
    bubble_out_stall_entry_2_reg_V4 <= bubble_out_stall_entry_2_reg_R_v_4;
    bubble_out_stall_entry_2_reg_V5 <= bubble_out_stall_entry_2_reg_R_v_5;
    bubble_out_stall_entry_2_reg_V6 <= bubble_out_stall_entry_2_reg_R_v_6;
    bubble_out_stall_entry_2_reg_V7 <= bubble_out_stall_entry_2_reg_R_v_7;
    bubble_out_stall_entry_2_reg_V8 <= bubble_out_stall_entry_2_reg_R_v_8;
    bubble_out_stall_entry_2_reg_V9 <= bubble_out_stall_entry_2_reg_R_v_9;
    bubble_out_stall_entry_2_reg_V10 <= bubble_out_stall_entry_2_reg_R_v_10;
    bubble_out_stall_entry_2_reg_V11 <= bubble_out_stall_entry_2_reg_R_v_11;
    bubble_out_stall_entry_2_reg_V12 <= bubble_out_stall_entry_2_reg_R_v_12;
    bubble_out_stall_entry_2_reg_V13 <= bubble_out_stall_entry_2_reg_R_v_13;
    bubble_out_stall_entry_2_reg_V14 <= bubble_out_stall_entry_2_reg_R_v_14;
    bubble_out_stall_entry_2_reg_V15 <= bubble_out_stall_entry_2_reg_R_v_15;
    bubble_out_stall_entry_2_reg_V16 <= bubble_out_stall_entry_2_reg_R_v_16;
    bubble_out_stall_entry_2_reg_V17 <= bubble_out_stall_entry_2_reg_R_v_17;
    bubble_out_stall_entry_2_reg_V18 <= bubble_out_stall_entry_2_reg_R_v_18;
    bubble_out_stall_entry_2_reg_V19 <= bubble_out_stall_entry_2_reg_R_v_19;
    bubble_out_stall_entry_2_reg_V20 <= bubble_out_stall_entry_2_reg_R_v_20;
    bubble_out_stall_entry_2_reg_V21 <= bubble_out_stall_entry_2_reg_R_v_21;
    bubble_out_stall_entry_2_reg_V22 <= bubble_out_stall_entry_2_reg_R_v_22;
    bubble_out_stall_entry_2_reg_V23 <= bubble_out_stall_entry_2_reg_R_v_23;
    bubble_out_stall_entry_2_reg_V24 <= bubble_out_stall_entry_2_reg_R_v_24;
    bubble_out_stall_entry_2_reg_V25 <= bubble_out_stall_entry_2_reg_R_v_25;
    bubble_out_stall_entry_2_reg_V26 <= bubble_out_stall_entry_2_reg_R_v_26;
    bubble_out_stall_entry_2_reg_V27 <= bubble_out_stall_entry_2_reg_R_v_27;
    bubble_out_stall_entry_2_reg_V28 <= bubble_out_stall_entry_2_reg_R_v_28;
    bubble_out_stall_entry_2_reg_V29 <= bubble_out_stall_entry_2_reg_R_v_29;
    bubble_out_stall_entry_2_reg_V30 <= bubble_out_stall_entry_2_reg_R_v_30;
    bubble_out_stall_entry_2_reg_V31 <= bubble_out_stall_entry_2_reg_R_v_31;
    bubble_out_stall_entry_2_reg_V32 <= bubble_out_stall_entry_2_reg_R_v_32;
    bubble_out_stall_entry_2_reg_V33 <= bubble_out_stall_entry_2_reg_R_v_33;
    bubble_out_stall_entry_2_reg_V34 <= bubble_out_stall_entry_2_reg_R_v_34;
    bubble_out_stall_entry_2_reg_V35 <= bubble_out_stall_entry_2_reg_R_v_35;
    -- Stall signal propagation
    bubble_out_stall_entry_2_reg_s_tv_0 <= i_ffwd_dst_reduction_gmm_substract_382761_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_0;
    bubble_out_stall_entry_2_reg_s_tv_1 <= i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_1;
    bubble_out_stall_entry_2_reg_s_tv_2 <= i_ffwd_dst_reduction_gmm_substract_442764_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_2;
    bubble_out_stall_entry_2_reg_s_tv_3 <= i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_3;
    bubble_out_stall_entry_2_reg_s_tv_4 <= i_ffwd_dst_reduction_gmm_substract_502767_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_4;
    bubble_out_stall_entry_2_reg_s_tv_5 <= i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_5;
    bubble_out_stall_entry_2_reg_s_tv_6 <= i_ffwd_dst_reduction_gmm_substract_322758_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_6;
    bubble_out_stall_entry_2_reg_s_tv_7 <= i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_7;
    bubble_out_stall_entry_2_reg_s_tv_8 <= i_ffwd_dst_reduction_gmm_substract_342759_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_8;
    bubble_out_stall_entry_2_reg_s_tv_9 <= i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_9;
    bubble_out_stall_entry_2_reg_s_tv_10 <= i_ffwd_dst_reduction_gmm_substract_562770_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_10;
    bubble_out_stall_entry_2_reg_s_tv_11 <= i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_11;
    bubble_out_stall_entry_2_reg_s_tv_12 <= i_ffwd_dst_reduction_gmm_substract_682777_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_12;
    bubble_out_stall_entry_2_reg_s_tv_13 <= i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_13;
    bubble_out_stall_entry_2_reg_s_tv_14 <= i_ffwd_dst_reduction_gmm_substract_682776_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_14;
    bubble_out_stall_entry_2_reg_s_tv_15 <= i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_15;
    bubble_out_stall_entry_2_reg_s_tv_16 <= i_ffwd_dst_extract_t22922706_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_16;
    bubble_out_stall_entry_2_reg_s_tv_17 <= i_ffwd_dst_extract_t23042713_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_17;
    bubble_out_stall_entry_2_reg_s_tv_18 <= i_ffwd_dst_extract_t22962709_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_18;
    bubble_out_stall_entry_2_reg_s_tv_19 <= i_ffwd_dst_extract_t23202722_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_19;
    bubble_out_stall_entry_2_reg_s_tv_20 <= i_ffwd_dst_extract_t23002712_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_20;
    bubble_out_stall_entry_2_reg_s_tv_21 <= i_ffwd_dst_extract_t23242724_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_21;
    bubble_out_stall_entry_2_reg_s_tv_22 <= i_ffwd_dst_extract_t22922705_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_22;
    bubble_out_stall_entry_2_reg_s_tv_23 <= i_ffwd_dst_extract_t23042715_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_23;
    bubble_out_stall_entry_2_reg_s_tv_24 <= i_ffwd_dst_acl_3772640_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_24;
    bubble_out_stall_entry_2_reg_s_tv_25 <= i_ffwd_dst_acl_3832672_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_25;
    bubble_out_stall_entry_2_reg_s_tv_26 <= i_ffwd_dst_acl_3972691_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_26;
    bubble_out_stall_entry_2_reg_s_tv_27 <= i_ffwd_dst_acl_4002696_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_27;
    bubble_out_stall_entry_2_reg_s_tv_28 <= i_ffwd_dst_extract_t22962707_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_28;
    bubble_out_stall_entry_2_reg_s_tv_29 <= i_ffwd_dst_extract_t23202723_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_29;
    bubble_out_stall_entry_2_reg_s_tv_30 <= i_ffwd_dst_extract_t23002710_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_30;
    bubble_out_stall_entry_2_reg_s_tv_31 <= i_ffwd_dst_extract_t23242725_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_31;
    bubble_out_stall_entry_2_reg_s_tv_32 <= i_ffwd_dst_acl_3772638_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_32;
    bubble_out_stall_entry_2_reg_s_tv_33 <= i_ffwd_dst_acl_3832673_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_33;
    bubble_out_stall_entry_2_reg_s_tv_34 <= i_ffwd_dst_acl_3972689_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_34;
    bubble_out_stall_entry_2_reg_s_tv_35 <= i_ffwd_dst_acl_4002698_gmm_substract_out_stall_out and bubble_out_stall_entry_2_reg_R_v_35;
    -- Backward Enable generation
    bubble_out_stall_entry_2_reg_or0 <= bubble_out_stall_entry_2_reg_s_tv_0;
    bubble_out_stall_entry_2_reg_or1 <= bubble_out_stall_entry_2_reg_s_tv_1 or bubble_out_stall_entry_2_reg_or0;
    bubble_out_stall_entry_2_reg_or2 <= bubble_out_stall_entry_2_reg_s_tv_2 or bubble_out_stall_entry_2_reg_or1;
    bubble_out_stall_entry_2_reg_or3 <= bubble_out_stall_entry_2_reg_s_tv_3 or bubble_out_stall_entry_2_reg_or2;
    bubble_out_stall_entry_2_reg_or4 <= bubble_out_stall_entry_2_reg_s_tv_4 or bubble_out_stall_entry_2_reg_or3;
    bubble_out_stall_entry_2_reg_or5 <= bubble_out_stall_entry_2_reg_s_tv_5 or bubble_out_stall_entry_2_reg_or4;
    bubble_out_stall_entry_2_reg_or6 <= bubble_out_stall_entry_2_reg_s_tv_6 or bubble_out_stall_entry_2_reg_or5;
    bubble_out_stall_entry_2_reg_or7 <= bubble_out_stall_entry_2_reg_s_tv_7 or bubble_out_stall_entry_2_reg_or6;
    bubble_out_stall_entry_2_reg_or8 <= bubble_out_stall_entry_2_reg_s_tv_8 or bubble_out_stall_entry_2_reg_or7;
    bubble_out_stall_entry_2_reg_or9 <= bubble_out_stall_entry_2_reg_s_tv_9 or bubble_out_stall_entry_2_reg_or8;
    bubble_out_stall_entry_2_reg_or10 <= bubble_out_stall_entry_2_reg_s_tv_10 or bubble_out_stall_entry_2_reg_or9;
    bubble_out_stall_entry_2_reg_or11 <= bubble_out_stall_entry_2_reg_s_tv_11 or bubble_out_stall_entry_2_reg_or10;
    bubble_out_stall_entry_2_reg_or12 <= bubble_out_stall_entry_2_reg_s_tv_12 or bubble_out_stall_entry_2_reg_or11;
    bubble_out_stall_entry_2_reg_or13 <= bubble_out_stall_entry_2_reg_s_tv_13 or bubble_out_stall_entry_2_reg_or12;
    bubble_out_stall_entry_2_reg_or14 <= bubble_out_stall_entry_2_reg_s_tv_14 or bubble_out_stall_entry_2_reg_or13;
    bubble_out_stall_entry_2_reg_or15 <= bubble_out_stall_entry_2_reg_s_tv_15 or bubble_out_stall_entry_2_reg_or14;
    bubble_out_stall_entry_2_reg_or16 <= bubble_out_stall_entry_2_reg_s_tv_16 or bubble_out_stall_entry_2_reg_or15;
    bubble_out_stall_entry_2_reg_or17 <= bubble_out_stall_entry_2_reg_s_tv_17 or bubble_out_stall_entry_2_reg_or16;
    bubble_out_stall_entry_2_reg_or18 <= bubble_out_stall_entry_2_reg_s_tv_18 or bubble_out_stall_entry_2_reg_or17;
    bubble_out_stall_entry_2_reg_or19 <= bubble_out_stall_entry_2_reg_s_tv_19 or bubble_out_stall_entry_2_reg_or18;
    bubble_out_stall_entry_2_reg_or20 <= bubble_out_stall_entry_2_reg_s_tv_20 or bubble_out_stall_entry_2_reg_or19;
    bubble_out_stall_entry_2_reg_or21 <= bubble_out_stall_entry_2_reg_s_tv_21 or bubble_out_stall_entry_2_reg_or20;
    bubble_out_stall_entry_2_reg_or22 <= bubble_out_stall_entry_2_reg_s_tv_22 or bubble_out_stall_entry_2_reg_or21;
    bubble_out_stall_entry_2_reg_or23 <= bubble_out_stall_entry_2_reg_s_tv_23 or bubble_out_stall_entry_2_reg_or22;
    bubble_out_stall_entry_2_reg_or24 <= bubble_out_stall_entry_2_reg_s_tv_24 or bubble_out_stall_entry_2_reg_or23;
    bubble_out_stall_entry_2_reg_or25 <= bubble_out_stall_entry_2_reg_s_tv_25 or bubble_out_stall_entry_2_reg_or24;
    bubble_out_stall_entry_2_reg_or26 <= bubble_out_stall_entry_2_reg_s_tv_26 or bubble_out_stall_entry_2_reg_or25;
    bubble_out_stall_entry_2_reg_or27 <= bubble_out_stall_entry_2_reg_s_tv_27 or bubble_out_stall_entry_2_reg_or26;
    bubble_out_stall_entry_2_reg_or28 <= bubble_out_stall_entry_2_reg_s_tv_28 or bubble_out_stall_entry_2_reg_or27;
    bubble_out_stall_entry_2_reg_or29 <= bubble_out_stall_entry_2_reg_s_tv_29 or bubble_out_stall_entry_2_reg_or28;
    bubble_out_stall_entry_2_reg_or30 <= bubble_out_stall_entry_2_reg_s_tv_30 or bubble_out_stall_entry_2_reg_or29;
    bubble_out_stall_entry_2_reg_or31 <= bubble_out_stall_entry_2_reg_s_tv_31 or bubble_out_stall_entry_2_reg_or30;
    bubble_out_stall_entry_2_reg_or32 <= bubble_out_stall_entry_2_reg_s_tv_32 or bubble_out_stall_entry_2_reg_or31;
    bubble_out_stall_entry_2_reg_or33 <= bubble_out_stall_entry_2_reg_s_tv_33 or bubble_out_stall_entry_2_reg_or32;
    bubble_out_stall_entry_2_reg_or34 <= bubble_out_stall_entry_2_reg_s_tv_34 or bubble_out_stall_entry_2_reg_or33;
    bubble_out_stall_entry_2_reg_backEN <= not (bubble_out_stall_entry_2_reg_s_tv_35 or bubble_out_stall_entry_2_reg_or34);
    -- Determine whether to write valid data into the first register stage
    bubble_out_stall_entry_2_reg_v_s_0 <= bubble_out_stall_entry_2_reg_backEN and SR_bubble_out_stall_entry_2_reg_V;
    -- Backward Stall generation
    bubble_out_stall_entry_2_reg_backStall <= not (bubble_out_stall_entry_2_reg_backEN);
    bubble_out_stall_entry_2_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            bubble_out_stall_entry_2_reg_R_v_0 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_1 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_2 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_3 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_4 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_5 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_6 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_7 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_8 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_9 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_10 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_11 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_12 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_13 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_14 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_15 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_16 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_17 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_18 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_19 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_20 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_21 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_22 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_23 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_24 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_25 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_26 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_27 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_28 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_29 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_30 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_31 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_32 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_33 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_34 <= (others => '0');
            bubble_out_stall_entry_2_reg_R_v_35 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_0 <= bubble_out_stall_entry_2_reg_R_v_0 and bubble_out_stall_entry_2_reg_s_tv_0;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_0 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_1 <= bubble_out_stall_entry_2_reg_R_v_1 and bubble_out_stall_entry_2_reg_s_tv_1;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_1 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_2 <= bubble_out_stall_entry_2_reg_R_v_2 and bubble_out_stall_entry_2_reg_s_tv_2;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_2 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_3 <= bubble_out_stall_entry_2_reg_R_v_3 and bubble_out_stall_entry_2_reg_s_tv_3;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_3 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_4 <= bubble_out_stall_entry_2_reg_R_v_4 and bubble_out_stall_entry_2_reg_s_tv_4;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_4 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_5 <= bubble_out_stall_entry_2_reg_R_v_5 and bubble_out_stall_entry_2_reg_s_tv_5;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_5 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_6 <= bubble_out_stall_entry_2_reg_R_v_6 and bubble_out_stall_entry_2_reg_s_tv_6;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_6 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_7 <= bubble_out_stall_entry_2_reg_R_v_7 and bubble_out_stall_entry_2_reg_s_tv_7;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_7 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_8 <= bubble_out_stall_entry_2_reg_R_v_8 and bubble_out_stall_entry_2_reg_s_tv_8;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_8 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_9 <= bubble_out_stall_entry_2_reg_R_v_9 and bubble_out_stall_entry_2_reg_s_tv_9;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_9 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_10 <= bubble_out_stall_entry_2_reg_R_v_10 and bubble_out_stall_entry_2_reg_s_tv_10;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_10 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_11 <= bubble_out_stall_entry_2_reg_R_v_11 and bubble_out_stall_entry_2_reg_s_tv_11;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_11 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_12 <= bubble_out_stall_entry_2_reg_R_v_12 and bubble_out_stall_entry_2_reg_s_tv_12;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_12 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_13 <= bubble_out_stall_entry_2_reg_R_v_13 and bubble_out_stall_entry_2_reg_s_tv_13;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_13 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_14 <= bubble_out_stall_entry_2_reg_R_v_14 and bubble_out_stall_entry_2_reg_s_tv_14;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_14 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_15 <= bubble_out_stall_entry_2_reg_R_v_15 and bubble_out_stall_entry_2_reg_s_tv_15;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_15 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_16 <= bubble_out_stall_entry_2_reg_R_v_16 and bubble_out_stall_entry_2_reg_s_tv_16;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_16 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_17 <= bubble_out_stall_entry_2_reg_R_v_17 and bubble_out_stall_entry_2_reg_s_tv_17;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_17 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_18 <= bubble_out_stall_entry_2_reg_R_v_18 and bubble_out_stall_entry_2_reg_s_tv_18;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_18 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_19 <= bubble_out_stall_entry_2_reg_R_v_19 and bubble_out_stall_entry_2_reg_s_tv_19;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_19 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_20 <= bubble_out_stall_entry_2_reg_R_v_20 and bubble_out_stall_entry_2_reg_s_tv_20;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_20 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_21 <= bubble_out_stall_entry_2_reg_R_v_21 and bubble_out_stall_entry_2_reg_s_tv_21;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_21 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_22 <= bubble_out_stall_entry_2_reg_R_v_22 and bubble_out_stall_entry_2_reg_s_tv_22;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_22 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_23 <= bubble_out_stall_entry_2_reg_R_v_23 and bubble_out_stall_entry_2_reg_s_tv_23;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_23 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_24 <= bubble_out_stall_entry_2_reg_R_v_24 and bubble_out_stall_entry_2_reg_s_tv_24;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_24 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_25 <= bubble_out_stall_entry_2_reg_R_v_25 and bubble_out_stall_entry_2_reg_s_tv_25;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_25 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_26 <= bubble_out_stall_entry_2_reg_R_v_26 and bubble_out_stall_entry_2_reg_s_tv_26;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_26 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_27 <= bubble_out_stall_entry_2_reg_R_v_27 and bubble_out_stall_entry_2_reg_s_tv_27;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_27 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_28 <= bubble_out_stall_entry_2_reg_R_v_28 and bubble_out_stall_entry_2_reg_s_tv_28;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_28 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_29 <= bubble_out_stall_entry_2_reg_R_v_29 and bubble_out_stall_entry_2_reg_s_tv_29;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_29 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_30 <= bubble_out_stall_entry_2_reg_R_v_30 and bubble_out_stall_entry_2_reg_s_tv_30;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_30 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_31 <= bubble_out_stall_entry_2_reg_R_v_31 and bubble_out_stall_entry_2_reg_s_tv_31;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_31 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_32 <= bubble_out_stall_entry_2_reg_R_v_32 and bubble_out_stall_entry_2_reg_s_tv_32;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_32 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_33 <= bubble_out_stall_entry_2_reg_R_v_33 and bubble_out_stall_entry_2_reg_s_tv_33;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_33 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_34 <= bubble_out_stall_entry_2_reg_R_v_34 and bubble_out_stall_entry_2_reg_s_tv_34;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_34 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

            IF (bubble_out_stall_entry_2_reg_backEN = "0") THEN
                bubble_out_stall_entry_2_reg_R_v_35 <= bubble_out_stall_entry_2_reg_R_v_35 and bubble_out_stall_entry_2_reg_s_tv_35;
            ELSE
                bubble_out_stall_entry_2_reg_R_v_35 <= bubble_out_stall_entry_2_reg_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_bubble_out_stall_entry_2_reg(STALLREG,1248)
    SR_bubble_out_stall_entry_2_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_bubble_out_stall_entry_2_reg_r_valid <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_bubble_out_stall_entry_2_reg_r_valid <= bubble_out_stall_entry_2_reg_backStall and (SR_bubble_out_stall_entry_2_reg_r_valid or SR_bubble_out_stall_entry_2_reg_i_valid);

            IF (SR_bubble_out_stall_entry_2_reg_r_valid = "0") THEN
                -- Data(s)
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_bubble_out_stall_entry_2_reg_i_valid <= SE_stall_entry_V18;
    -- Stall signal propagation
    SR_bubble_out_stall_entry_2_reg_backStall <= SR_bubble_out_stall_entry_2_reg_r_valid or not (SR_bubble_out_stall_entry_2_reg_i_valid);

    -- Valid
    SR_bubble_out_stall_entry_2_reg_V <= SR_bubble_out_stall_entry_2_reg_r_valid WHEN SR_bubble_out_stall_entry_2_reg_r_valid = "1" ELSE SR_bubble_out_stall_entry_2_reg_i_valid;


    -- i_ffwd_dst_unnamed_gmm_substract59_gmm_substract(BLACKBOX,296)@0
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_unnamed_gmm_substract59_gmm_substract : i_ffwd_dst_unnamed_gmm_substract59_gmm_substract2304
    PORT MAP (
        in_intel_reserved_ffwd_54_0 => in_intel_reserved_ffwd_54_0,
        in_stall_in => SE_out_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_backStall,
        in_valid_in => SE_stall_entry_V17,
        out_dest_data_out_54_0 => i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0,
        out_stall_out => i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract(BITJOIN,529)
    bubble_join_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_q <= i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_out_dest_data_out_89_0;

    -- bubble_select_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract(BITSELECT,530)
    bubble_select_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_q(7 downto 0));

    -- bubble_join_i_ffwd_dst_acl_4032701_gmm_substract(BITJOIN,418)
    bubble_join_i_ffwd_dst_acl_4032701_gmm_substract_q <= i_ffwd_dst_acl_4032701_gmm_substract_out_dest_data_out_41_0;

    -- bubble_select_i_ffwd_dst_acl_4032701_gmm_substract(BITSELECT,419)
    bubble_select_i_ffwd_dst_acl_4032701_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_acl_4032701_gmm_substract_q(7 downto 0));

    -- bubble_join_i_ffwd_dst_cmp_i_i_i1372734_gmm_substract(BITJOIN,421)
    bubble_join_i_ffwd_dst_cmp_i_i_i1372734_gmm_substract_q <= i_ffwd_dst_cmp_i_i_i1372734_gmm_substract_out_dest_data_out_53_0;

    -- bubble_select_i_ffwd_dst_cmp_i_i_i1372734_gmm_substract(BITSELECT,422)
    bubble_select_i_ffwd_dst_cmp_i_i_i1372734_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_cmp_i_i_i1372734_gmm_substract_q(0 downto 0));

    -- i_cmp_i_i_i137_not_gmm_substract(LOGICAL,233)@0
    i_cmp_i_i_i137_not_gmm_substract_q <= bubble_select_i_ffwd_dst_cmp_i_i_i1372734_gmm_substract_b xor VCC_q;

    -- bubble_join_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract(BITJOIN,424)
    bubble_join_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_q <= i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_out_dest_data_out_35_0;

    -- bubble_select_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract(BITSELECT,425)
    bubble_select_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_q(0 downto 0));

    -- i_not_gmm_substract(LOGICAL,315)@0
    i_not_gmm_substract_q <= bubble_select_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_b and i_cmp_i_i_i137_not_gmm_substract_q;

    -- i_select622_gmm_substract(MUX,340)@0
    i_select622_gmm_substract_s <= i_not_gmm_substract_q;
    i_select622_gmm_substract_combproc: PROCESS (i_select622_gmm_substract_s, bubble_select_i_ffwd_dst_acl_4032701_gmm_substract_b, bubble_select_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_b)
    BEGIN
        CASE (i_select622_gmm_substract_s) IS
            WHEN "0" => i_select622_gmm_substract_q <= bubble_select_i_ffwd_dst_acl_4032701_gmm_substract_b;
            WHEN "1" => i_select622_gmm_substract_q <= bubble_select_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_b;
            WHEN OTHERS => i_select622_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- SR_SE_redist1_i_not_gmm_substract_q_1_0(STALLREG,1252)
    SR_SE_redist1_i_not_gmm_substract_q_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist1_i_not_gmm_substract_q_1_0_r_valid <= (others => '0');
            SR_SE_redist1_i_not_gmm_substract_q_1_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist1_i_not_gmm_substract_q_1_0_r_valid <= SE_redist1_i_not_gmm_substract_q_1_0_backStall and (SR_SE_redist1_i_not_gmm_substract_q_1_0_r_valid or SR_SE_redist1_i_not_gmm_substract_q_1_0_i_valid);

            IF (SR_SE_redist1_i_not_gmm_substract_q_1_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist1_i_not_gmm_substract_q_1_0_r_data0 <= STD_LOGIC_VECTOR(i_not_gmm_substract_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist1_i_not_gmm_substract_q_1_0_i_valid <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_V5;
    -- Stall signal propagation
    SR_SE_redist1_i_not_gmm_substract_q_1_0_backStall <= SR_SE_redist1_i_not_gmm_substract_q_1_0_r_valid or not (SR_SE_redist1_i_not_gmm_substract_q_1_0_i_valid);

    -- Valid
    SR_SE_redist1_i_not_gmm_substract_q_1_0_V <= SR_SE_redist1_i_not_gmm_substract_q_1_0_r_valid WHEN SR_SE_redist1_i_not_gmm_substract_q_1_0_r_valid = "1" ELSE SR_SE_redist1_i_not_gmm_substract_q_1_0_i_valid;

    SR_SE_redist1_i_not_gmm_substract_q_1_0_D0 <= SR_SE_redist1_i_not_gmm_substract_q_1_0_r_data0 WHEN SR_SE_redist1_i_not_gmm_substract_q_1_0_r_valid = "1" ELSE i_not_gmm_substract_q;

    -- bubble_join_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract(BITJOIN,511)
    bubble_join_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_q <= i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_out_dest_data_out_84_0;

    -- bubble_select_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract(BITSELECT,512)
    bubble_select_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_q(15 downto 0));

    -- bubble_join_i_ffwd_dst_acl_3892685_gmm_substract(BITJOIN,403)
    bubble_join_i_ffwd_dst_acl_3892685_gmm_substract_q <= i_ffwd_dst_acl_3892685_gmm_substract_out_dest_data_out_38_0;

    -- bubble_select_i_ffwd_dst_acl_3892685_gmm_substract(BITSELECT,404)
    bubble_select_i_ffwd_dst_acl_3892685_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_acl_3892685_gmm_substract_q(15 downto 0));

    -- i_select610_gmm_substract(MUX,337)@0
    i_select610_gmm_substract_s <= i_not_gmm_substract_q;
    i_select610_gmm_substract_combproc: PROCESS (i_select610_gmm_substract_s, bubble_select_i_ffwd_dst_acl_3892685_gmm_substract_b, bubble_select_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_b)
    BEGIN
        CASE (i_select610_gmm_substract_s) IS
            WHEN "0" => i_select610_gmm_substract_q <= bubble_select_i_ffwd_dst_acl_3892685_gmm_substract_b;
            WHEN "1" => i_select610_gmm_substract_q <= bubble_select_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_b;
            WHEN OTHERS => i_select610_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- SE_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract(STALLENABLE,778)
    -- Valid signal propagation
    SE_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_V0 <= SE_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_backStall <= bubble_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_1_reg_stall_out or not (SE_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_wireValid <= i_ffwd_src_unnamed_gmm_substract71_gmm_substract_out_valid_out;

    -- i_ffwd_src_unnamed_gmm_substract71_gmm_substract(BLACKBOX,308)@0
    -- in in_stall_in@20000000
    -- out out_intel_reserved_ffwd_67_0@20000000
    -- out out_stall_out@20000000
    thei_ffwd_src_unnamed_gmm_substract71_gmm_substract : i_ffwd_src_unnamed_gmm_substract71_gmm_substract2389
    PORT MAP (
        in_enable_in => VCC_q,
        in_src_data_in_67_0 => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_D0,
        in_stall_in => SE_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_backStall,
        in_valid_in => SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_V0,
        out_intel_reserved_ffwd_67_0 => i_ffwd_src_unnamed_gmm_substract71_gmm_substract_out_intel_reserved_ffwd_67_0,
        out_stall_out => i_ffwd_src_unnamed_gmm_substract71_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_src_unnamed_gmm_substract71_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract(STALLENABLE,730)
    -- Valid signal propagation
    SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_V0 <= SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_backStall <= i_ffwd_src_unnamed_gmm_substract71_gmm_substract_out_stall_out or not (SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_wireValid <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_V;

    -- SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract(STALLREG,1243)
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_r_valid <= (others => '0');
            SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_r_valid <= SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_backStall and (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_r_valid or SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_i_valid);

            IF (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_r_valid = "0") THEN
                -- Data(s)
                SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_r_data0 <= i_select610_gmm_substract_q;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_and0 <= i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_out_valid_out;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_and1 <= i_ffwd_dst_acl_3892685_gmm_substract_out_valid_out and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_and0;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_i_valid <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_V3 and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_and1;
    -- Stall signal propagation
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_backStall <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_r_valid or not (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_i_valid);

    -- Valid
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_V <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_r_valid WHEN SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_r_valid = "1" ELSE SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_i_valid;

    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_D0 <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_r_data0 WHEN SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_r_valid = "1" ELSE i_select610_gmm_substract_q;

    -- bubble_join_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract(BITJOIN,502)
    bubble_join_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_q <= i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_out_dest_data_out_81_0;

    -- bubble_select_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract(BITSELECT,503)
    bubble_select_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_q(8 downto 0));

    -- i_extract_t656_gmm_substract_sel_x(BITSELECT,206)@0
    i_extract_t656_gmm_substract_sel_x_b <= bubble_select_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_b(7 downto 0);

    -- bubble_join_i_ffwd_dst_extract_t23162720_gmm_substract(BITJOIN,463)
    bubble_join_i_ffwd_dst_extract_t23162720_gmm_substract_q <= i_ffwd_dst_extract_t23162720_gmm_substract_out_dest_data_out_48_0;

    -- bubble_select_i_ffwd_dst_extract_t23162720_gmm_substract(BITSELECT,464)
    bubble_select_i_ffwd_dst_extract_t23162720_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_extract_t23162720_gmm_substract_q(7 downto 0));

    -- i_select592_gmm_substract(MUX,332)@0
    i_select592_gmm_substract_s <= i_not_gmm_substract_q;
    i_select592_gmm_substract_combproc: PROCESS (i_select592_gmm_substract_s, bubble_select_i_ffwd_dst_extract_t23162720_gmm_substract_b, i_extract_t656_gmm_substract_sel_x_b)
    BEGIN
        CASE (i_select592_gmm_substract_s) IS
            WHEN "0" => i_select592_gmm_substract_q <= bubble_select_i_ffwd_dst_extract_t23162720_gmm_substract_b;
            WHEN "1" => i_select592_gmm_substract_q <= i_extract_t656_gmm_substract_sel_x_b;
            WHEN OTHERS => i_select592_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- SE_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract(STALLENABLE,772)
    -- Valid signal propagation
    SE_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_V0 <= SE_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_backStall <= bubble_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_1_reg_stall_out or not (SE_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_wireValid <= i_ffwd_src_unnamed_gmm_substract68_gmm_substract_out_valid_out;

    -- i_ffwd_src_unnamed_gmm_substract68_gmm_substract(BLACKBOX,305)@0
    -- in in_stall_in@20000000
    -- out out_intel_reserved_ffwd_64_0@20000000
    -- out out_stall_out@20000000
    thei_ffwd_src_unnamed_gmm_substract68_gmm_substract : i_ffwd_src_unnamed_gmm_substract68_gmm_substract2383
    PORT MAP (
        in_enable_in => VCC_q,
        in_src_data_in_64_0 => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_D0,
        in_stall_in => SE_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_backStall,
        in_valid_in => SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_V0,
        out_intel_reserved_ffwd_64_0 => i_ffwd_src_unnamed_gmm_substract68_gmm_substract_out_intel_reserved_ffwd_64_0,
        out_stall_out => i_ffwd_src_unnamed_gmm_substract68_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_src_unnamed_gmm_substract68_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract(STALLENABLE,724)
    -- Valid signal propagation
    SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_V0 <= SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_backStall <= i_ffwd_src_unnamed_gmm_substract68_gmm_substract_out_stall_out or not (SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_wireValid <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_V;

    -- SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract(STALLREG,1244)
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_r_valid <= (others => '0');
            SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_r_valid <= SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_backStall and (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_r_valid or SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_i_valid);

            IF (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_r_valid = "0") THEN
                -- Data(s)
                SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_r_data0 <= i_select592_gmm_substract_q;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_and0 <= i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_out_valid_out;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_and1 <= i_ffwd_dst_extract_t23162720_gmm_substract_out_valid_out and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_and0;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_i_valid <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_V2 and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_and1;
    -- Stall signal propagation
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_backStall <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_r_valid or not (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_i_valid);

    -- Valid
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_V <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_r_valid WHEN SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_r_valid = "1" ELSE SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_i_valid;

    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_D0 <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_r_data0 WHEN SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_r_valid = "1" ELSE i_select592_gmm_substract_q;

    -- bubble_join_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract(BITJOIN,493)
    bubble_join_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_q <= i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_out_dest_data_out_78_0;

    -- bubble_select_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract(BITSELECT,494)
    bubble_select_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_q(8 downto 0));

    -- i_extract_t653_gmm_substract_sel_x(BITSELECT,203)@0
    i_extract_t653_gmm_substract_sel_x_b <= bubble_select_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_b(7 downto 0);

    -- bubble_join_i_ffwd_dst_extract_t23122718_gmm_substract(BITJOIN,460)
    bubble_join_i_ffwd_dst_extract_t23122718_gmm_substract_q <= i_ffwd_dst_extract_t23122718_gmm_substract_out_dest_data_out_47_0;

    -- bubble_select_i_ffwd_dst_extract_t23122718_gmm_substract(BITSELECT,461)
    bubble_select_i_ffwd_dst_extract_t23122718_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_extract_t23122718_gmm_substract_q(7 downto 0));

    -- i_select586_gmm_substract(MUX,331)@0
    i_select586_gmm_substract_s <= i_not_gmm_substract_q;
    i_select586_gmm_substract_combproc: PROCESS (i_select586_gmm_substract_s, bubble_select_i_ffwd_dst_extract_t23122718_gmm_substract_b, i_extract_t653_gmm_substract_sel_x_b)
    BEGIN
        CASE (i_select586_gmm_substract_s) IS
            WHEN "0" => i_select586_gmm_substract_q <= bubble_select_i_ffwd_dst_extract_t23122718_gmm_substract_b;
            WHEN "1" => i_select586_gmm_substract_q <= i_extract_t653_gmm_substract_sel_x_b;
            WHEN OTHERS => i_select586_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- SE_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract(STALLENABLE,770)
    -- Valid signal propagation
    SE_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_V0 <= SE_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_backStall <= bubble_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_1_reg_stall_out or not (SE_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_wireValid <= i_ffwd_src_unnamed_gmm_substract67_gmm_substract_out_valid_out;

    -- i_ffwd_src_unnamed_gmm_substract67_gmm_substract(BLACKBOX,304)@0
    -- in in_stall_in@20000000
    -- out out_intel_reserved_ffwd_63_0@20000000
    -- out out_stall_out@20000000
    thei_ffwd_src_unnamed_gmm_substract67_gmm_substract : i_ffwd_src_unnamed_gmm_substract67_gmm_substract2381
    PORT MAP (
        in_enable_in => VCC_q,
        in_src_data_in_63_0 => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_D0,
        in_stall_in => SE_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_backStall,
        in_valid_in => SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_V0,
        out_intel_reserved_ffwd_63_0 => i_ffwd_src_unnamed_gmm_substract67_gmm_substract_out_intel_reserved_ffwd_63_0,
        out_stall_out => i_ffwd_src_unnamed_gmm_substract67_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_src_unnamed_gmm_substract67_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract(STALLENABLE,718)
    -- Valid signal propagation
    SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_V0 <= SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_backStall <= i_ffwd_src_unnamed_gmm_substract67_gmm_substract_out_stall_out or not (SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_wireValid <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_V;

    -- SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract(STALLREG,1245)
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_r_valid <= (others => '0');
            SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_r_valid <= SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_backStall and (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_r_valid or SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_i_valid);

            IF (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_r_valid = "0") THEN
                -- Data(s)
                SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_r_data0 <= i_select586_gmm_substract_q;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_and0 <= i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_out_valid_out;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_and1 <= i_ffwd_dst_extract_t23122718_gmm_substract_out_valid_out and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_and0;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_i_valid <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_V1 and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_and1;
    -- Stall signal propagation
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_backStall <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_r_valid or not (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_i_valid);

    -- Valid
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_V <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_r_valid WHEN SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_r_valid = "1" ELSE SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_i_valid;

    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_D0 <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_r_data0 WHEN SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_r_valid = "1" ELSE i_select586_gmm_substract_q;

    -- bubble_join_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract(BITJOIN,484)
    bubble_join_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_q <= i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_out_dest_data_out_75_0;

    -- bubble_select_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract(BITSELECT,485)
    bubble_select_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_q(8 downto 0));

    -- i_extract_t_gmm_substract_sel_x(BITSELECT,209)@0
    i_extract_t_gmm_substract_sel_x_b <= bubble_select_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_b(7 downto 0);

    -- bubble_join_i_ffwd_dst_extract_t23082716_gmm_substract(BITJOIN,457)
    bubble_join_i_ffwd_dst_extract_t23082716_gmm_substract_q <= i_ffwd_dst_extract_t23082716_gmm_substract_out_dest_data_out_46_0;

    -- bubble_select_i_ffwd_dst_extract_t23082716_gmm_substract(BITSELECT,458)
    bubble_select_i_ffwd_dst_extract_t23082716_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_extract_t23082716_gmm_substract_q(7 downto 0));

    -- i_select580_gmm_substract(MUX,330)@0
    i_select580_gmm_substract_s <= i_not_gmm_substract_q;
    i_select580_gmm_substract_combproc: PROCESS (i_select580_gmm_substract_s, bubble_select_i_ffwd_dst_extract_t23082716_gmm_substract_b, i_extract_t_gmm_substract_sel_x_b)
    BEGIN
        CASE (i_select580_gmm_substract_s) IS
            WHEN "0" => i_select580_gmm_substract_q <= bubble_select_i_ffwd_dst_extract_t23082716_gmm_substract_b;
            WHEN "1" => i_select580_gmm_substract_q <= i_extract_t_gmm_substract_sel_x_b;
            WHEN OTHERS => i_select580_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- SE_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract(STALLENABLE,768)
    -- Valid signal propagation
    SE_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_V0 <= SE_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_backStall <= bubble_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_1_reg_stall_out or not (SE_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_wireValid <= i_ffwd_src_unnamed_gmm_substract66_gmm_substract_out_valid_out;

    -- i_ffwd_src_unnamed_gmm_substract66_gmm_substract(BLACKBOX,303)@0
    -- in in_stall_in@20000000
    -- out out_intel_reserved_ffwd_62_0@20000000
    -- out out_stall_out@20000000
    thei_ffwd_src_unnamed_gmm_substract66_gmm_substract : i_ffwd_src_unnamed_gmm_substract66_gmm_substract2379
    PORT MAP (
        in_enable_in => VCC_q,
        in_src_data_in_62_0 => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_D0,
        in_stall_in => SE_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_backStall,
        in_valid_in => SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_V0,
        out_intel_reserved_ffwd_62_0 => i_ffwd_src_unnamed_gmm_substract66_gmm_substract_out_intel_reserved_ffwd_62_0,
        out_stall_out => i_ffwd_src_unnamed_gmm_substract66_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_src_unnamed_gmm_substract66_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract(STALLENABLE,712)
    -- Valid signal propagation
    SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_V0 <= SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_backStall <= i_ffwd_src_unnamed_gmm_substract66_gmm_substract_out_stall_out or not (SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_wireValid <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_V;

    -- SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract(STALLREG,1246)
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_r_valid <= (others => '0');
            SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_r_valid <= SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_backStall and (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_r_valid or SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_i_valid);

            IF (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_r_valid = "0") THEN
                -- Data(s)
                SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_r_data0 <= i_select580_gmm_substract_q;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_and0 <= i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_out_valid_out;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_and1 <= i_ffwd_dst_extract_t23082716_gmm_substract_out_valid_out and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_and0;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_i_valid <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_V0 and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_and1;
    -- Stall signal propagation
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_backStall <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_r_valid or not (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_i_valid);

    -- Valid
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_V <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_r_valid WHEN SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_r_valid = "1" ELSE SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_i_valid;

    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_D0 <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_r_data0 WHEN SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_r_valid = "1" ELSE i_select580_gmm_substract_q;

    -- SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract(STALLENABLE,672)
    SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_fromReg0 <= (others => '0');
            SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_fromReg1 <= (others => '0');
            SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_fromReg2 <= (others => '0');
            SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_fromReg3 <= (others => '0');
            SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_fromReg4 <= (others => '0');
            SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_fromReg5 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_fromReg0 <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_toReg0;
            -- Succesor 1
            SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_fromReg1 <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_toReg1;
            -- Succesor 2
            SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_fromReg2 <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_toReg2;
            -- Succesor 3
            SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_fromReg3 <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_toReg3;
            -- Succesor 4
            SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_fromReg4 <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_toReg4;
            -- Succesor 5
            SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_fromReg5 <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_toReg5;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_consumed0 <= (not (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_backStall) and SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_wireValid) or SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_fromReg0;
    SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_consumed1 <= (not (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_backStall) and SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_wireValid) or SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_fromReg1;
    SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_consumed2 <= (not (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_backStall) and SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_wireValid) or SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_fromReg2;
    SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_consumed3 <= (not (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_backStall) and SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_wireValid) or SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_fromReg3;
    SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_consumed4 <= (not (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_backStall) and SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_wireValid) or SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_fromReg4;
    SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_consumed5 <= (not (SR_SE_redist1_i_not_gmm_substract_q_1_0_backStall) and SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_wireValid) or SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_fromReg5;
    -- Consuming
    SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_StallValid <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_backStall and SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_wireValid;
    SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_toReg0 <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_StallValid and SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_consumed0;
    SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_toReg1 <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_StallValid and SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_consumed1;
    SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_toReg2 <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_StallValid and SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_consumed2;
    SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_toReg3 <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_StallValid and SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_consumed3;
    SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_toReg4 <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_StallValid and SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_consumed4;
    SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_toReg5 <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_StallValid and SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_consumed5;
    -- Backward Stall generation
    SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_or0 <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_consumed0;
    SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_or1 <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_consumed1 and SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_or0;
    SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_or2 <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_consumed2 and SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_or1;
    SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_or3 <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_consumed3 and SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_or2;
    SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_or4 <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_consumed4 and SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_or3;
    SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_wireStall <= not (SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_consumed5 and SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_or4);
    SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_backStall <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_wireStall;
    -- Valid signal propagation
    SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_V0 <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_wireValid and not (SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_fromReg0);
    SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_V1 <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_wireValid and not (SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_fromReg1);
    SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_V2 <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_wireValid and not (SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_fromReg2);
    SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_V3 <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_wireValid and not (SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_fromReg3);
    SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_V4 <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_wireValid and not (SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_fromReg4);
    SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_V5 <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_wireValid and not (SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_fromReg5);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_and0 <= i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_out_valid_out;
    SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_wireValid <= i_ffwd_dst_cmp_i_i_i1372734_gmm_substract_out_valid_out and SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_and0;

    -- SE_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract(STALLENABLE,782)
    -- Valid signal propagation
    SE_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_V0 <= SE_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_backStall <= bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_reg_stall_out or not (SE_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_wireValid <= i_ffwd_src_unnamed_gmm_substract73_gmm_substract_out_valid_out;

    -- i_ffwd_src_unnamed_gmm_substract73_gmm_substract(BLACKBOX,310)@0
    -- in in_stall_in@20000000
    -- out out_intel_reserved_ffwd_69_0@20000000
    -- out out_stall_out@20000000
    thei_ffwd_src_unnamed_gmm_substract73_gmm_substract : i_ffwd_src_unnamed_gmm_substract73_gmm_substract2393
    PORT MAP (
        in_enable_in => VCC_q,
        in_src_data_in_69_0 => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_D0,
        in_stall_in => SE_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_backStall,
        in_valid_in => SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_V0,
        out_intel_reserved_ffwd_69_0 => i_ffwd_src_unnamed_gmm_substract73_gmm_substract_out_intel_reserved_ffwd_69_0,
        out_stall_out => i_ffwd_src_unnamed_gmm_substract73_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_src_unnamed_gmm_substract73_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract(STALLENABLE,742)
    -- Valid signal propagation
    SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_V0 <= SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_backStall <= i_ffwd_src_unnamed_gmm_substract73_gmm_substract_out_stall_out or not (SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_wireValid <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_V;

    -- SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract(STALLREG,1242)
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_r_valid <= (others => '0');
            SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_r_valid <= SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_backStall and (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_r_valid or SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_i_valid);

            IF (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_r_valid = "0") THEN
                -- Data(s)
                SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_r_data0 <= i_select622_gmm_substract_q;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_and0 <= i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_out_valid_out;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_and1 <= i_ffwd_dst_acl_4032701_gmm_substract_out_valid_out and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_and0;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_i_valid <= SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_V4 and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_and1;
    -- Stall signal propagation
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_backStall <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_r_valid or not (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_i_valid);

    -- Valid
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_V <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_r_valid WHEN SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_r_valid = "1" ELSE SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_i_valid;

    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_D0 <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_r_data0 WHEN SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_r_valid = "1" ELSE i_select622_gmm_substract_q;

    -- i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract(BLACKBOX,290)@0
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_reduction_gmm_substract_662775_gmm_substract : i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract2354
    PORT MAP (
        in_intel_reserved_ffwd_89_0 => in_intel_reserved_ffwd_89_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_backStall,
        in_valid_in => SE_stall_entry_V16,
        out_dest_data_out_89_0 => i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_out_dest_data_out_89_0,
        out_stall_out => i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract(BLACKBOX,289)@0
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_reduction_gmm_substract_642774_gmm_substract : i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract2282
    PORT MAP (
        in_intel_reserved_ffwd_88_0 => in_intel_reserved_ffwd_88_0,
        in_stall_in => SE_out_i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract_backStall,
        in_valid_in => SE_stall_entry_V15,
        out_dest_data_out_88_0 => i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract_out_dest_data_out_88_0,
        out_stall_out => i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract(BLACKBOX,284)@0
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_reduction_gmm_substract_542769_gmm_substract : i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract2346
    PORT MAP (
        in_intel_reserved_ffwd_84_0 => in_intel_reserved_ffwd_84_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_backStall,
        in_valid_in => SE_stall_entry_V13,
        out_dest_data_out_84_0 => i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_out_dest_data_out_84_0,
        out_stall_out => i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract(BLACKBOX,281)@0
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_reduction_gmm_substract_482766_gmm_substract : i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract2266
    PORT MAP (
        in_intel_reserved_ffwd_81_0 => in_intel_reserved_ffwd_81_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_backStall,
        in_valid_in => SE_stall_entry_V12,
        out_dest_data_out_81_0 => i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_out_dest_data_out_81_0,
        out_stall_out => i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract(BLACKBOX,278)@0
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_reduction_gmm_substract_422763_gmm_substract : i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract2260
    PORT MAP (
        in_intel_reserved_ffwd_78_0 => in_intel_reserved_ffwd_78_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_backStall,
        in_valid_in => SE_stall_entry_V11,
        out_dest_data_out_78_0 => i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_out_dest_data_out_78_0,
        out_stall_out => i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract(BLACKBOX,275)@0
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_reduction_gmm_substract_362760_gmm_substract : i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract2254
    PORT MAP (
        in_intel_reserved_ffwd_75_0 => in_intel_reserved_ffwd_75_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_backStall,
        in_valid_in => SE_stall_entry_V10,
        out_dest_data_out_75_0 => i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_out_dest_data_out_75_0,
        out_stall_out => i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_extract_t23162720_gmm_substract(BLACKBOX,268)@0
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_extract_t23162720_gmm_substract : i_ffwd_dst_extract_t23162720_gmm_substract2334
    PORT MAP (
        in_intel_reserved_ffwd_48_0 => in_intel_reserved_ffwd_48_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_backStall,
        in_valid_in => SE_stall_entry_V9,
        out_dest_data_out_48_0 => i_ffwd_dst_extract_t23162720_gmm_substract_out_dest_data_out_48_0,
        out_stall_out => i_ffwd_dst_extract_t23162720_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_extract_t23162720_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_extract_t23122718_gmm_substract(BLACKBOX,267)@0
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_extract_t23122718_gmm_substract : i_ffwd_dst_extract_t23122718_gmm_substract2332
    PORT MAP (
        in_intel_reserved_ffwd_47_0 => in_intel_reserved_ffwd_47_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_backStall,
        in_valid_in => SE_stall_entry_V8,
        out_dest_data_out_47_0 => i_ffwd_dst_extract_t23122718_gmm_substract_out_dest_data_out_47_0,
        out_stall_out => i_ffwd_dst_extract_t23122718_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_extract_t23122718_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_extract_t23082716_gmm_substract(BLACKBOX,266)@0
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_extract_t23082716_gmm_substract : i_ffwd_dst_extract_t23082716_gmm_substract2330
    PORT MAP (
        in_intel_reserved_ffwd_46_0 => in_intel_reserved_ffwd_46_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_backStall,
        in_valid_in => SE_stall_entry_V7,
        out_dest_data_out_46_0 => i_ffwd_dst_extract_t23082716_gmm_substract_out_dest_data_out_46_0,
        out_stall_out => i_ffwd_dst_extract_t23082716_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_extract_t23082716_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_div_i_i_12731_gmm_substract(BLACKBOX,257)@0
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_div_i_i_12731_gmm_substract : i_ffwd_dst_div_i_i_12731_gmm_substract2278
    PORT MAP (
        in_intel_reserved_ffwd_52_0 => in_intel_reserved_ffwd_52_0,
        in_stall_in => SE_out_i_ffwd_dst_div_i_i_12731_gmm_substract_backStall,
        in_valid_in => SE_stall_entry_V6,
        out_dest_data_out_52_0 => i_ffwd_dst_div_i_i_12731_gmm_substract_out_dest_data_out_52_0,
        out_stall_out => i_ffwd_dst_div_i_i_12731_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_div_i_i_12731_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_div_i_i2726_gmm_substract(BLACKBOX,256)@0
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_div_i_i2726_gmm_substract : i_ffwd_dst_div_i_i2726_gmm_substract2276
    PORT MAP (
        in_intel_reserved_ffwd_51_0 => in_intel_reserved_ffwd_51_0,
        in_stall_in => SE_out_i_ffwd_dst_div_i_i2726_gmm_substract_backStall,
        in_valid_in => SE_stall_entry_V5,
        out_dest_data_out_51_0 => i_ffwd_dst_div_i_i2726_gmm_substract_out_dest_data_out_51_0,
        out_stall_out => i_ffwd_dst_div_i_i2726_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_div_i_i2726_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract(BLACKBOX,255)@0
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_cmp_i_i_i279_12663_gmm_substract : i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract2274
    PORT MAP (
        in_intel_reserved_ffwd_35_0 => in_intel_reserved_ffwd_35_0,
        in_stall_in => SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_backStall,
        in_valid_in => SE_stall_entry_V4,
        out_dest_data_out_35_0 => i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_out_dest_data_out_35_0,
        out_stall_out => i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_cmp_i_i_i1372734_gmm_substract(BLACKBOX,254)@0
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_cmp_i_i_i1372734_gmm_substract : i_ffwd_dst_cmp_i_i_i1372734_gmm_substract2272
    PORT MAP (
        in_intel_reserved_ffwd_53_0 => in_intel_reserved_ffwd_53_0,
        in_stall_in => SE_out_i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_backStall,
        in_valid_in => SE_stall_entry_V3,
        out_dest_data_out_53_0 => i_ffwd_dst_cmp_i_i_i1372734_gmm_substract_out_dest_data_out_53_0,
        out_stall_out => i_ffwd_dst_cmp_i_i_i1372734_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_cmp_i_i_i1372734_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_acl_4032701_gmm_substract(BLACKBOX,253)@0
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_acl_4032701_gmm_substract : i_ffwd_dst_acl_4032701_gmm_substract2352
    PORT MAP (
        in_intel_reserved_ffwd_41_0 => in_intel_reserved_ffwd_41_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_backStall,
        in_valid_in => SE_stall_entry_V2,
        out_dest_data_out_41_0 => i_ffwd_dst_acl_4032701_gmm_substract_out_dest_data_out_41_0,
        out_stall_out => i_ffwd_dst_acl_4032701_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_acl_4032701_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_acl_3892685_gmm_substract(BLACKBOX,248)@0
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_acl_3892685_gmm_substract : i_ffwd_dst_acl_3892685_gmm_substract2344
    PORT MAP (
        in_intel_reserved_ffwd_38_0 => in_intel_reserved_ffwd_38_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_backStall,
        in_valid_in => SE_stall_entry_V1,
        out_dest_data_out_38_0 => i_ffwd_dst_acl_3892685_gmm_substract_out_dest_data_out_38_0,
        out_stall_out => i_ffwd_dst_acl_3892685_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_acl_3892685_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- c_i33_2gr(CONSTANT,216)
    c_i33_2gr_q <= "111111111111111111111111111111110";

    -- i_unnamed_gmm_substract2362_vt_const_32(CONSTANT,345)
    i_unnamed_gmm_substract2362_vt_const_32_q <= "0000000000000000000000000000000";

    -- i_unnamed_gmm_substract2362_sel_x(BITSELECT,210)@0
    i_unnamed_gmm_substract2362_sel_x_b <= std_logic_vector(resize(unsigned(bubble_select_i_ffwd_dst_acl_3762631_gmm_substract_b(1 downto 0)), 33));

    -- i_unnamed_gmm_substract2362_vt_select_1(BITSELECT,347)@0
    i_unnamed_gmm_substract2362_vt_select_1_b <= i_unnamed_gmm_substract2362_sel_x_b(1 downto 0);

    -- i_unnamed_gmm_substract2362_vt_join(BITJOIN,346)@0
    i_unnamed_gmm_substract2362_vt_join_q <= i_unnamed_gmm_substract2362_vt_const_32_q & i_unnamed_gmm_substract2362_vt_select_1_b;

    -- i_op_gmm_substract(ADD,317)@0
    i_op_gmm_substract_a <= STD_LOGIC_VECTOR("0" & i_unnamed_gmm_substract2362_vt_join_q);
    i_op_gmm_substract_b <= STD_LOGIC_VECTOR("0" & c_i33_2gr_q);
    i_op_gmm_substract_o <= STD_LOGIC_VECTOR(UNSIGNED(i_op_gmm_substract_a) + UNSIGNED(i_op_gmm_substract_b));
    i_op_gmm_substract_q <= i_op_gmm_substract_o(33 downto 0);

    -- bgTrunc_i_op_gmm_substract_sel_x(BITSELECT,3)@0
    bgTrunc_i_op_gmm_substract_sel_x_b <= i_op_gmm_substract_q(32 downto 0);

    -- bubble_join_i_ffwd_dst_acl_3762631_gmm_substract(BITJOIN,388)
    bubble_join_i_ffwd_dst_acl_3762631_gmm_substract_q <= i_ffwd_dst_acl_3762631_gmm_substract_out_dest_data_out_31_0;

    -- bubble_select_i_ffwd_dst_acl_3762631_gmm_substract(BITSELECT,389)
    bubble_select_i_ffwd_dst_acl_3762631_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_acl_3762631_gmm_substract_q(1 downto 0));

    -- SE_redist0_i_unnamed_gmm_substract2363_q_2_0(STALLENABLE,827)
    -- Valid signal propagation
    SE_redist0_i_unnamed_gmm_substract2363_q_2_0_V0 <= SE_redist0_i_unnamed_gmm_substract2363_q_2_0_R_v_0;
    -- Stall signal propagation
    SE_redist0_i_unnamed_gmm_substract2363_q_2_0_s_tv_0 <= i_ffwd_src_unnamed_gmm_substract76_gmm_substract_out_stall_out and SE_redist0_i_unnamed_gmm_substract2363_q_2_0_R_v_0;
    -- Backward Enable generation
    SE_redist0_i_unnamed_gmm_substract2363_q_2_0_backEN <= not (SE_redist0_i_unnamed_gmm_substract2363_q_2_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_i_unnamed_gmm_substract2363_q_2_0_v_s_0 <= SE_redist0_i_unnamed_gmm_substract2363_q_2_0_backEN and SE_i_unnamed_gmm_substract2363_V0;
    -- Backward Stall generation
    SE_redist0_i_unnamed_gmm_substract2363_q_2_0_backStall <= not (SE_redist0_i_unnamed_gmm_substract2363_q_2_0_v_s_0);
    SE_redist0_i_unnamed_gmm_substract2363_q_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_i_unnamed_gmm_substract2363_q_2_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_unnamed_gmm_substract2363_q_2_0_backEN = "0") THEN
                SE_redist0_i_unnamed_gmm_substract2363_q_2_0_R_v_0 <= SE_redist0_i_unnamed_gmm_substract2363_q_2_0_R_v_0 and SE_redist0_i_unnamed_gmm_substract2363_q_2_0_s_tv_0;
            ELSE
                SE_redist0_i_unnamed_gmm_substract2363_q_2_0_R_v_0 <= SE_redist0_i_unnamed_gmm_substract2363_q_2_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_i_unnamed_gmm_substract2363(STALLENABLE,821)
    -- Valid signal propagation
    SE_i_unnamed_gmm_substract2363_V0 <= SE_i_unnamed_gmm_substract2363_R_v_0;
    -- Stall signal propagation
    SE_i_unnamed_gmm_substract2363_s_tv_0 <= SE_redist0_i_unnamed_gmm_substract2363_q_2_0_backStall and SE_i_unnamed_gmm_substract2363_R_v_0;
    -- Backward Enable generation
    SE_i_unnamed_gmm_substract2363_backEN <= not (SE_i_unnamed_gmm_substract2363_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_unnamed_gmm_substract2363_v_s_0 <= SE_i_unnamed_gmm_substract2363_backEN and SR_SE_i_unnamed_gmm_substract2363_V;
    -- Backward Stall generation
    SE_i_unnamed_gmm_substract2363_backStall <= not (SE_i_unnamed_gmm_substract2363_backEN);
    SE_i_unnamed_gmm_substract2363_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_unnamed_gmm_substract2363_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_unnamed_gmm_substract2363_backEN = "0") THEN
                SE_i_unnamed_gmm_substract2363_R_v_0 <= SE_i_unnamed_gmm_substract2363_R_v_0 and SE_i_unnamed_gmm_substract2363_s_tv_0;
            ELSE
                SE_i_unnamed_gmm_substract2363_R_v_0 <= SE_i_unnamed_gmm_substract2363_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_i_unnamed_gmm_substract2363(STALLREG,1247)
    SR_SE_i_unnamed_gmm_substract2363_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_unnamed_gmm_substract2363_r_valid <= (others => '0');
            SR_SE_i_unnamed_gmm_substract2363_r_data0 <= (others => '-');
            SR_SE_i_unnamed_gmm_substract2363_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_unnamed_gmm_substract2363_r_valid <= SE_i_unnamed_gmm_substract2363_backStall and (SR_SE_i_unnamed_gmm_substract2363_r_valid or SR_SE_i_unnamed_gmm_substract2363_i_valid);

            IF (SR_SE_i_unnamed_gmm_substract2363_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_unnamed_gmm_substract2363_r_data0 <= STD_LOGIC_VECTOR(bubble_select_i_ffwd_dst_acl_3762631_gmm_substract_b);
                SR_SE_i_unnamed_gmm_substract2363_r_data1 <= STD_LOGIC_VECTOR(bgTrunc_i_op_gmm_substract_sel_x_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_unnamed_gmm_substract2363_i_valid <= SE_out_i_ffwd_dst_acl_3762631_gmm_substract_V0;
    -- Stall signal propagation
    SR_SE_i_unnamed_gmm_substract2363_backStall <= SR_SE_i_unnamed_gmm_substract2363_r_valid or not (SR_SE_i_unnamed_gmm_substract2363_i_valid);

    -- Valid
    SR_SE_i_unnamed_gmm_substract2363_V <= SR_SE_i_unnamed_gmm_substract2363_r_valid WHEN SR_SE_i_unnamed_gmm_substract2363_r_valid = "1" ELSE SR_SE_i_unnamed_gmm_substract2363_i_valid;

    -- Data0
    SR_SE_i_unnamed_gmm_substract2363_D0 <= SR_SE_i_unnamed_gmm_substract2363_r_data0 WHEN SR_SE_i_unnamed_gmm_substract2363_r_valid = "1" ELSE bubble_select_i_ffwd_dst_acl_3762631_gmm_substract_b;
    -- Data1
    SR_SE_i_unnamed_gmm_substract2363_D1 <= SR_SE_i_unnamed_gmm_substract2363_r_data1 WHEN SR_SE_i_unnamed_gmm_substract2363_r_valid = "1" ELSE bgTrunc_i_op_gmm_substract_sel_x_b;

    -- SE_out_i_ffwd_dst_acl_3762631_gmm_substract(STALLENABLE,648)
    -- Valid signal propagation
    SE_out_i_ffwd_dst_acl_3762631_gmm_substract_V0 <= SE_out_i_ffwd_dst_acl_3762631_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_dst_acl_3762631_gmm_substract_backStall <= SR_SE_i_unnamed_gmm_substract2363_backStall or not (SE_out_i_ffwd_dst_acl_3762631_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_dst_acl_3762631_gmm_substract_wireValid <= i_ffwd_dst_acl_3762631_gmm_substract_out_valid_out;

    -- i_ffwd_dst_acl_3762631_gmm_substract(BLACKBOX,243)@0
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_acl_3762631_gmm_substract : i_ffwd_dst_acl_3762631_gmm_substract2360
    PORT MAP (
        in_intel_reserved_ffwd_31_0 => in_intel_reserved_ffwd_31_0,
        in_stall_in => SE_out_i_ffwd_dst_acl_3762631_gmm_substract_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_dest_data_out_31_0 => i_ffwd_dst_acl_3762631_gmm_substract_out_dest_data_out_31_0,
        out_stall_out => i_ffwd_dst_acl_3762631_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_acl_3762631_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_stall_entry(STALLENABLE,825)
    SE_stall_entry_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_stall_entry_fromReg0 <= (others => '0');
            SE_stall_entry_fromReg1 <= (others => '0');
            SE_stall_entry_fromReg2 <= (others => '0');
            SE_stall_entry_fromReg3 <= (others => '0');
            SE_stall_entry_fromReg4 <= (others => '0');
            SE_stall_entry_fromReg5 <= (others => '0');
            SE_stall_entry_fromReg6 <= (others => '0');
            SE_stall_entry_fromReg7 <= (others => '0');
            SE_stall_entry_fromReg8 <= (others => '0');
            SE_stall_entry_fromReg9 <= (others => '0');
            SE_stall_entry_fromReg10 <= (others => '0');
            SE_stall_entry_fromReg11 <= (others => '0');
            SE_stall_entry_fromReg12 <= (others => '0');
            SE_stall_entry_fromReg13 <= (others => '0');
            SE_stall_entry_fromReg14 <= (others => '0');
            SE_stall_entry_fromReg15 <= (others => '0');
            SE_stall_entry_fromReg16 <= (others => '0');
            SE_stall_entry_fromReg17 <= (others => '0');
            SE_stall_entry_fromReg18 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_stall_entry_fromReg0 <= SE_stall_entry_toReg0;
            -- Succesor 1
            SE_stall_entry_fromReg1 <= SE_stall_entry_toReg1;
            -- Succesor 2
            SE_stall_entry_fromReg2 <= SE_stall_entry_toReg2;
            -- Succesor 3
            SE_stall_entry_fromReg3 <= SE_stall_entry_toReg3;
            -- Succesor 4
            SE_stall_entry_fromReg4 <= SE_stall_entry_toReg4;
            -- Succesor 5
            SE_stall_entry_fromReg5 <= SE_stall_entry_toReg5;
            -- Succesor 6
            SE_stall_entry_fromReg6 <= SE_stall_entry_toReg6;
            -- Succesor 7
            SE_stall_entry_fromReg7 <= SE_stall_entry_toReg7;
            -- Succesor 8
            SE_stall_entry_fromReg8 <= SE_stall_entry_toReg8;
            -- Succesor 9
            SE_stall_entry_fromReg9 <= SE_stall_entry_toReg9;
            -- Succesor 10
            SE_stall_entry_fromReg10 <= SE_stall_entry_toReg10;
            -- Succesor 11
            SE_stall_entry_fromReg11 <= SE_stall_entry_toReg11;
            -- Succesor 12
            SE_stall_entry_fromReg12 <= SE_stall_entry_toReg12;
            -- Succesor 13
            SE_stall_entry_fromReg13 <= SE_stall_entry_toReg13;
            -- Succesor 14
            SE_stall_entry_fromReg14 <= SE_stall_entry_toReg14;
            -- Succesor 15
            SE_stall_entry_fromReg15 <= SE_stall_entry_toReg15;
            -- Succesor 16
            SE_stall_entry_fromReg16 <= SE_stall_entry_toReg16;
            -- Succesor 17
            SE_stall_entry_fromReg17 <= SE_stall_entry_toReg17;
            -- Succesor 18
            SE_stall_entry_fromReg18 <= SE_stall_entry_toReg18;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_stall_entry_consumed0 <= (not (i_ffwd_dst_acl_3762631_gmm_substract_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg0;
    SE_stall_entry_consumed1 <= (not (i_ffwd_dst_acl_3892685_gmm_substract_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg1;
    SE_stall_entry_consumed2 <= (not (i_ffwd_dst_acl_4032701_gmm_substract_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg2;
    SE_stall_entry_consumed3 <= (not (i_ffwd_dst_cmp_i_i_i1372734_gmm_substract_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg3;
    SE_stall_entry_consumed4 <= (not (i_ffwd_dst_cmp_i_i_i279_12663_gmm_substract_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg4;
    SE_stall_entry_consumed5 <= (not (i_ffwd_dst_div_i_i2726_gmm_substract_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg5;
    SE_stall_entry_consumed6 <= (not (i_ffwd_dst_div_i_i_12731_gmm_substract_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg6;
    SE_stall_entry_consumed7 <= (not (i_ffwd_dst_extract_t23082716_gmm_substract_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg7;
    SE_stall_entry_consumed8 <= (not (i_ffwd_dst_extract_t23122718_gmm_substract_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg8;
    SE_stall_entry_consumed9 <= (not (i_ffwd_dst_extract_t23162720_gmm_substract_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg9;
    SE_stall_entry_consumed10 <= (not (i_ffwd_dst_reduction_gmm_substract_362760_gmm_substract_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg10;
    SE_stall_entry_consumed11 <= (not (i_ffwd_dst_reduction_gmm_substract_422763_gmm_substract_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg11;
    SE_stall_entry_consumed12 <= (not (i_ffwd_dst_reduction_gmm_substract_482766_gmm_substract_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg12;
    SE_stall_entry_consumed13 <= (not (i_ffwd_dst_reduction_gmm_substract_542769_gmm_substract_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg13;
    SE_stall_entry_consumed14 <= (not (i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg14;
    SE_stall_entry_consumed15 <= (not (i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg15;
    SE_stall_entry_consumed16 <= (not (i_ffwd_dst_reduction_gmm_substract_662775_gmm_substract_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg16;
    SE_stall_entry_consumed17 <= (not (i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg17;
    SE_stall_entry_consumed18 <= (not (SR_bubble_out_stall_entry_2_reg_backStall) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg18;
    -- Consuming
    SE_stall_entry_StallValid <= SE_stall_entry_backStall and SE_stall_entry_wireValid;
    SE_stall_entry_toReg0 <= SE_stall_entry_StallValid and SE_stall_entry_consumed0;
    SE_stall_entry_toReg1 <= SE_stall_entry_StallValid and SE_stall_entry_consumed1;
    SE_stall_entry_toReg2 <= SE_stall_entry_StallValid and SE_stall_entry_consumed2;
    SE_stall_entry_toReg3 <= SE_stall_entry_StallValid and SE_stall_entry_consumed3;
    SE_stall_entry_toReg4 <= SE_stall_entry_StallValid and SE_stall_entry_consumed4;
    SE_stall_entry_toReg5 <= SE_stall_entry_StallValid and SE_stall_entry_consumed5;
    SE_stall_entry_toReg6 <= SE_stall_entry_StallValid and SE_stall_entry_consumed6;
    SE_stall_entry_toReg7 <= SE_stall_entry_StallValid and SE_stall_entry_consumed7;
    SE_stall_entry_toReg8 <= SE_stall_entry_StallValid and SE_stall_entry_consumed8;
    SE_stall_entry_toReg9 <= SE_stall_entry_StallValid and SE_stall_entry_consumed9;
    SE_stall_entry_toReg10 <= SE_stall_entry_StallValid and SE_stall_entry_consumed10;
    SE_stall_entry_toReg11 <= SE_stall_entry_StallValid and SE_stall_entry_consumed11;
    SE_stall_entry_toReg12 <= SE_stall_entry_StallValid and SE_stall_entry_consumed12;
    SE_stall_entry_toReg13 <= SE_stall_entry_StallValid and SE_stall_entry_consumed13;
    SE_stall_entry_toReg14 <= SE_stall_entry_StallValid and SE_stall_entry_consumed14;
    SE_stall_entry_toReg15 <= SE_stall_entry_StallValid and SE_stall_entry_consumed15;
    SE_stall_entry_toReg16 <= SE_stall_entry_StallValid and SE_stall_entry_consumed16;
    SE_stall_entry_toReg17 <= SE_stall_entry_StallValid and SE_stall_entry_consumed17;
    SE_stall_entry_toReg18 <= SE_stall_entry_StallValid and SE_stall_entry_consumed18;
    -- Backward Stall generation
    SE_stall_entry_or0 <= SE_stall_entry_consumed0;
    SE_stall_entry_or1 <= SE_stall_entry_consumed1 and SE_stall_entry_or0;
    SE_stall_entry_or2 <= SE_stall_entry_consumed2 and SE_stall_entry_or1;
    SE_stall_entry_or3 <= SE_stall_entry_consumed3 and SE_stall_entry_or2;
    SE_stall_entry_or4 <= SE_stall_entry_consumed4 and SE_stall_entry_or3;
    SE_stall_entry_or5 <= SE_stall_entry_consumed5 and SE_stall_entry_or4;
    SE_stall_entry_or6 <= SE_stall_entry_consumed6 and SE_stall_entry_or5;
    SE_stall_entry_or7 <= SE_stall_entry_consumed7 and SE_stall_entry_or6;
    SE_stall_entry_or8 <= SE_stall_entry_consumed8 and SE_stall_entry_or7;
    SE_stall_entry_or9 <= SE_stall_entry_consumed9 and SE_stall_entry_or8;
    SE_stall_entry_or10 <= SE_stall_entry_consumed10 and SE_stall_entry_or9;
    SE_stall_entry_or11 <= SE_stall_entry_consumed11 and SE_stall_entry_or10;
    SE_stall_entry_or12 <= SE_stall_entry_consumed12 and SE_stall_entry_or11;
    SE_stall_entry_or13 <= SE_stall_entry_consumed13 and SE_stall_entry_or12;
    SE_stall_entry_or14 <= SE_stall_entry_consumed14 and SE_stall_entry_or13;
    SE_stall_entry_or15 <= SE_stall_entry_consumed15 and SE_stall_entry_or14;
    SE_stall_entry_or16 <= SE_stall_entry_consumed16 and SE_stall_entry_or15;
    SE_stall_entry_or17 <= SE_stall_entry_consumed17 and SE_stall_entry_or16;
    SE_stall_entry_wireStall <= not (SE_stall_entry_consumed18 and SE_stall_entry_or17);
    SE_stall_entry_backStall <= SE_stall_entry_wireStall;
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg0);
    SE_stall_entry_V1 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg1);
    SE_stall_entry_V2 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg2);
    SE_stall_entry_V3 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg3);
    SE_stall_entry_V4 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg4);
    SE_stall_entry_V5 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg5);
    SE_stall_entry_V6 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg6);
    SE_stall_entry_V7 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg7);
    SE_stall_entry_V8 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg8);
    SE_stall_entry_V9 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg9);
    SE_stall_entry_V10 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg10);
    SE_stall_entry_V11 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg11);
    SE_stall_entry_V12 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg12);
    SE_stall_entry_V13 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg13);
    SE_stall_entry_V14 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg14);
    SE_stall_entry_V15 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg15);
    SE_stall_entry_V16 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg16);
    SE_stall_entry_V17 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg17);
    SE_stall_entry_V18 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg18);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract(BLACKBOX,288)@0
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_reduction_gmm_substract_622773_gmm_substract : i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract2280
    PORT MAP (
        in_intel_reserved_ffwd_87_0 => in_intel_reserved_ffwd_87_0,
        in_stall_in => SE_out_i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract_backStall,
        in_valid_in => SE_stall_entry_V14,
        out_dest_data_out_87_0 => i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract_out_dest_data_out_87_0,
        out_stall_out => i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract(BITJOIN,523)
    bubble_join_i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract_q <= i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract_out_dest_data_out_87_0;

    -- bubble_select_i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract(BITSELECT,524)
    bubble_select_i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract_q(31 downto 0));

    -- bubble_join_i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract(BITJOIN,526)
    bubble_join_i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract_q <= i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract_out_dest_data_out_88_0;

    -- bubble_select_i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract(BITSELECT,527)
    bubble_select_i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract_q(31 downto 0));

    -- SE_out_i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract(STALLENABLE,740)
    -- Valid signal propagation
    SE_out_i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract_V0 <= SE_out_i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract_backStall <= SR_SE_i_cmp_i_i129_1_gmm_substract_backStall or not (SE_out_i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract_wireValid <= i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract_out_valid_out;

    -- SE_out_i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract(STALLENABLE,738)
    -- Valid signal propagation
    SE_out_i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract_V0 <= SE_out_i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract_backStall <= SR_SE_i_cmp_i_i129_1_gmm_substract_backStall or not (SE_out_i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract_wireValid <= i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract_out_valid_out;

    -- SR_SE_i_cmp_i_i129_1_gmm_substract(STALLREG,1251)
    SR_SE_i_cmp_i_i129_1_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_cmp_i_i129_1_gmm_substract_r_valid <= (others => '0');
            SR_SE_i_cmp_i_i129_1_gmm_substract_r_data0 <= (others => '-');
            SR_SE_i_cmp_i_i129_1_gmm_substract_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_cmp_i_i129_1_gmm_substract_r_valid <= SE_i_cmp_i_i129_1_gmm_substract_backStall and (SR_SE_i_cmp_i_i129_1_gmm_substract_r_valid or SR_SE_i_cmp_i_i129_1_gmm_substract_i_valid);

            IF (SR_SE_i_cmp_i_i129_1_gmm_substract_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_cmp_i_i129_1_gmm_substract_r_data0 <= bubble_select_i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract_b;
                SR_SE_i_cmp_i_i129_1_gmm_substract_r_data1 <= bubble_select_i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract_b;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_cmp_i_i129_1_gmm_substract_and0 <= SE_out_i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract_V0;
    SR_SE_i_cmp_i_i129_1_gmm_substract_i_valid <= SE_out_i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract_V0 and SR_SE_i_cmp_i_i129_1_gmm_substract_and0;
    -- Stall signal propagation
    SR_SE_i_cmp_i_i129_1_gmm_substract_backStall <= SR_SE_i_cmp_i_i129_1_gmm_substract_r_valid or not (SR_SE_i_cmp_i_i129_1_gmm_substract_i_valid);

    -- Valid
    SR_SE_i_cmp_i_i129_1_gmm_substract_V <= SR_SE_i_cmp_i_i129_1_gmm_substract_r_valid WHEN SR_SE_i_cmp_i_i129_1_gmm_substract_r_valid = "1" ELSE SR_SE_i_cmp_i_i129_1_gmm_substract_i_valid;

    -- Data0
    SR_SE_i_cmp_i_i129_1_gmm_substract_D0 <= SR_SE_i_cmp_i_i129_1_gmm_substract_r_data0 WHEN SR_SE_i_cmp_i_i129_1_gmm_substract_r_valid = "1" ELSE bubble_select_i_ffwd_dst_reduction_gmm_substract_642774_gmm_substract_b;
    -- Data1
    SR_SE_i_cmp_i_i129_1_gmm_substract_D1 <= SR_SE_i_cmp_i_i129_1_gmm_substract_r_data1 WHEN SR_SE_i_cmp_i_i129_1_gmm_substract_r_valid = "1" ELSE bubble_select_i_ffwd_dst_reduction_gmm_substract_622773_gmm_substract_b;

    -- i_cmp_i_i129_1_gmm_substract(COMPARE,231)@0 + 1
    i_cmp_i_i129_1_gmm_substract_a <= STD_LOGIC_VECTOR("00" & SR_SE_i_cmp_i_i129_1_gmm_substract_D0);
    i_cmp_i_i129_1_gmm_substract_b <= STD_LOGIC_VECTOR("00" & SR_SE_i_cmp_i_i129_1_gmm_substract_D1);
    i_cmp_i_i129_1_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp_i_i129_1_gmm_substract_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_cmp_i_i129_1_gmm_substract_backEN = "1") THEN
                i_cmp_i_i129_1_gmm_substract_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i129_1_gmm_substract_a) - UNSIGNED(i_cmp_i_i129_1_gmm_substract_b));
            END IF;
        END IF;
    END PROCESS;
    i_cmp_i_i129_1_gmm_substract_c(0) <= i_cmp_i_i129_1_gmm_substract_o(33);

    -- i_acl_438_gmm_substract(MUX,229)@1
    i_acl_438_gmm_substract_s <= i_cmp_i_i129_1_gmm_substract_c;
    i_acl_438_gmm_substract_combproc: PROCESS (i_acl_438_gmm_substract_s, bubble_select_i_ffwd_dst_reduction_gmm_substract_682777_gmm_substract_b, bubble_select_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_b)
    BEGIN
        CASE (i_acl_438_gmm_substract_s) IS
            WHEN "0" => i_acl_438_gmm_substract_q <= bubble_select_i_ffwd_dst_reduction_gmm_substract_682777_gmm_substract_b;
            WHEN "1" => i_acl_438_gmm_substract_q <= bubble_select_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_b;
            WHEN OTHERS => i_acl_438_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- bubble_join_i_ffwd_dst_acl_4002698_gmm_substract(BITJOIN,415)
    bubble_join_i_ffwd_dst_acl_4002698_gmm_substract_q <= i_ffwd_dst_acl_4002698_gmm_substract_out_dest_data_out_40_0;

    -- bubble_select_i_ffwd_dst_acl_4002698_gmm_substract(BITSELECT,416)
    bubble_select_i_ffwd_dst_acl_4002698_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_acl_4002698_gmm_substract_q(7 downto 0));

    -- bubble_join_i_ffwd_dst_acl_3972689_gmm_substract(BITJOIN,406)
    bubble_join_i_ffwd_dst_acl_3972689_gmm_substract_q <= i_ffwd_dst_acl_3972689_gmm_substract_out_dest_data_out_39_0;

    -- bubble_select_i_ffwd_dst_acl_3972689_gmm_substract(BITSELECT,407)
    bubble_select_i_ffwd_dst_acl_3972689_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_acl_3972689_gmm_substract_q(7 downto 0));

    -- i_select626_gmm_substract(MUX,341)@1
    i_select626_gmm_substract_s <= i_from_if_then612542_gmm_substract_q;
    i_select626_gmm_substract_combproc: PROCESS (i_select626_gmm_substract_s, bubble_select_i_ffwd_dst_acl_3972689_gmm_substract_b, bubble_select_i_ffwd_dst_acl_4002698_gmm_substract_b)
    BEGIN
        CASE (i_select626_gmm_substract_s) IS
            WHEN "0" => i_select626_gmm_substract_q <= bubble_select_i_ffwd_dst_acl_3972689_gmm_substract_b;
            WHEN "1" => i_select626_gmm_substract_q <= bubble_select_i_ffwd_dst_acl_4002698_gmm_substract_b;
            WHEN OTHERS => i_select626_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist1_i_not_gmm_substract_q_1_0(REG,383)
    redist1_i_not_gmm_substract_q_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_not_gmm_substract_q_1_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_i_not_gmm_substract_q_1_0_backEN = "1") THEN
                redist1_i_not_gmm_substract_q_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist1_i_not_gmm_substract_q_1_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- i_select628_gmm_substract(MUX,342)@1
    i_select628_gmm_substract_s <= redist1_i_not_gmm_substract_q_1_0_q;
    i_select628_gmm_substract_combproc: PROCESS (i_select628_gmm_substract_s, i_select626_gmm_substract_q, i_acl_438_gmm_substract_q)
    BEGIN
        CASE (i_select628_gmm_substract_s) IS
            WHEN "0" => i_select628_gmm_substract_q <= i_select626_gmm_substract_q;
            WHEN "1" => i_select628_gmm_substract_q <= i_acl_438_gmm_substract_q;
            WHEN OTHERS => i_select628_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- SE_redist1_i_not_gmm_substract_q_1_0(STALLENABLE,828)
    -- Valid signal propagation
    SE_redist1_i_not_gmm_substract_q_1_0_V0 <= SE_redist1_i_not_gmm_substract_q_1_0_R_v_0;
    SE_redist1_i_not_gmm_substract_q_1_0_V1 <= SE_redist1_i_not_gmm_substract_q_1_0_R_v_1;
    SE_redist1_i_not_gmm_substract_q_1_0_V2 <= SE_redist1_i_not_gmm_substract_q_1_0_R_v_2;
    SE_redist1_i_not_gmm_substract_q_1_0_V3 <= SE_redist1_i_not_gmm_substract_q_1_0_R_v_3;
    SE_redist1_i_not_gmm_substract_q_1_0_V4 <= SE_redist1_i_not_gmm_substract_q_1_0_R_v_4;
    SE_redist1_i_not_gmm_substract_q_1_0_V5 <= SE_redist1_i_not_gmm_substract_q_1_0_R_v_5;
    SE_redist1_i_not_gmm_substract_q_1_0_V6 <= SE_redist1_i_not_gmm_substract_q_1_0_R_v_6;
    SE_redist1_i_not_gmm_substract_q_1_0_V7 <= SE_redist1_i_not_gmm_substract_q_1_0_R_v_7;
    SE_redist1_i_not_gmm_substract_q_1_0_V8 <= SE_redist1_i_not_gmm_substract_q_1_0_R_v_8;
    SE_redist1_i_not_gmm_substract_q_1_0_V9 <= SE_redist1_i_not_gmm_substract_q_1_0_R_v_9;
    SE_redist1_i_not_gmm_substract_q_1_0_V10 <= SE_redist1_i_not_gmm_substract_q_1_0_R_v_10;
    -- Stall signal propagation
    SE_redist1_i_not_gmm_substract_q_1_0_s_tv_0 <= SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_backStall and SE_redist1_i_not_gmm_substract_q_1_0_R_v_0;
    SE_redist1_i_not_gmm_substract_q_1_0_s_tv_1 <= SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_backStall and SE_redist1_i_not_gmm_substract_q_1_0_R_v_1;
    SE_redist1_i_not_gmm_substract_q_1_0_s_tv_2 <= SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_backStall and SE_redist1_i_not_gmm_substract_q_1_0_R_v_2;
    SE_redist1_i_not_gmm_substract_q_1_0_s_tv_3 <= SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_backStall and SE_redist1_i_not_gmm_substract_q_1_0_R_v_3;
    SE_redist1_i_not_gmm_substract_q_1_0_s_tv_4 <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_backStall and SE_redist1_i_not_gmm_substract_q_1_0_R_v_4;
    SE_redist1_i_not_gmm_substract_q_1_0_s_tv_5 <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_backStall and SE_redist1_i_not_gmm_substract_q_1_0_R_v_5;
    SE_redist1_i_not_gmm_substract_q_1_0_s_tv_6 <= SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_backStall and SE_redist1_i_not_gmm_substract_q_1_0_R_v_6;
    SE_redist1_i_not_gmm_substract_q_1_0_s_tv_7 <= SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_backStall and SE_redist1_i_not_gmm_substract_q_1_0_R_v_7;
    SE_redist1_i_not_gmm_substract_q_1_0_s_tv_8 <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_backStall and SE_redist1_i_not_gmm_substract_q_1_0_R_v_8;
    SE_redist1_i_not_gmm_substract_q_1_0_s_tv_9 <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_backStall and SE_redist1_i_not_gmm_substract_q_1_0_R_v_9;
    SE_redist1_i_not_gmm_substract_q_1_0_s_tv_10 <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_backStall and SE_redist1_i_not_gmm_substract_q_1_0_R_v_10;
    -- Backward Enable generation
    SE_redist1_i_not_gmm_substract_q_1_0_or0 <= SE_redist1_i_not_gmm_substract_q_1_0_s_tv_0;
    SE_redist1_i_not_gmm_substract_q_1_0_or1 <= SE_redist1_i_not_gmm_substract_q_1_0_s_tv_1 or SE_redist1_i_not_gmm_substract_q_1_0_or0;
    SE_redist1_i_not_gmm_substract_q_1_0_or2 <= SE_redist1_i_not_gmm_substract_q_1_0_s_tv_2 or SE_redist1_i_not_gmm_substract_q_1_0_or1;
    SE_redist1_i_not_gmm_substract_q_1_0_or3 <= SE_redist1_i_not_gmm_substract_q_1_0_s_tv_3 or SE_redist1_i_not_gmm_substract_q_1_0_or2;
    SE_redist1_i_not_gmm_substract_q_1_0_or4 <= SE_redist1_i_not_gmm_substract_q_1_0_s_tv_4 or SE_redist1_i_not_gmm_substract_q_1_0_or3;
    SE_redist1_i_not_gmm_substract_q_1_0_or5 <= SE_redist1_i_not_gmm_substract_q_1_0_s_tv_5 or SE_redist1_i_not_gmm_substract_q_1_0_or4;
    SE_redist1_i_not_gmm_substract_q_1_0_or6 <= SE_redist1_i_not_gmm_substract_q_1_0_s_tv_6 or SE_redist1_i_not_gmm_substract_q_1_0_or5;
    SE_redist1_i_not_gmm_substract_q_1_0_or7 <= SE_redist1_i_not_gmm_substract_q_1_0_s_tv_7 or SE_redist1_i_not_gmm_substract_q_1_0_or6;
    SE_redist1_i_not_gmm_substract_q_1_0_or8 <= SE_redist1_i_not_gmm_substract_q_1_0_s_tv_8 or SE_redist1_i_not_gmm_substract_q_1_0_or7;
    SE_redist1_i_not_gmm_substract_q_1_0_or9 <= SE_redist1_i_not_gmm_substract_q_1_0_s_tv_9 or SE_redist1_i_not_gmm_substract_q_1_0_or8;
    SE_redist1_i_not_gmm_substract_q_1_0_backEN <= not (SE_redist1_i_not_gmm_substract_q_1_0_s_tv_10 or SE_redist1_i_not_gmm_substract_q_1_0_or9);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_i_not_gmm_substract_q_1_0_v_s_0 <= SE_redist1_i_not_gmm_substract_q_1_0_backEN and SR_SE_redist1_i_not_gmm_substract_q_1_0_V;
    -- Backward Stall generation
    SE_redist1_i_not_gmm_substract_q_1_0_backStall <= not (SE_redist1_i_not_gmm_substract_q_1_0_backEN);
    SE_redist1_i_not_gmm_substract_q_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_i_not_gmm_substract_q_1_0_R_v_0 <= (others => '0');
            SE_redist1_i_not_gmm_substract_q_1_0_R_v_1 <= (others => '0');
            SE_redist1_i_not_gmm_substract_q_1_0_R_v_2 <= (others => '0');
            SE_redist1_i_not_gmm_substract_q_1_0_R_v_3 <= (others => '0');
            SE_redist1_i_not_gmm_substract_q_1_0_R_v_4 <= (others => '0');
            SE_redist1_i_not_gmm_substract_q_1_0_R_v_5 <= (others => '0');
            SE_redist1_i_not_gmm_substract_q_1_0_R_v_6 <= (others => '0');
            SE_redist1_i_not_gmm_substract_q_1_0_R_v_7 <= (others => '0');
            SE_redist1_i_not_gmm_substract_q_1_0_R_v_8 <= (others => '0');
            SE_redist1_i_not_gmm_substract_q_1_0_R_v_9 <= (others => '0');
            SE_redist1_i_not_gmm_substract_q_1_0_R_v_10 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_i_not_gmm_substract_q_1_0_backEN = "0") THEN
                SE_redist1_i_not_gmm_substract_q_1_0_R_v_0 <= SE_redist1_i_not_gmm_substract_q_1_0_R_v_0 and SE_redist1_i_not_gmm_substract_q_1_0_s_tv_0;
            ELSE
                SE_redist1_i_not_gmm_substract_q_1_0_R_v_0 <= SE_redist1_i_not_gmm_substract_q_1_0_v_s_0;
            END IF;

            IF (SE_redist1_i_not_gmm_substract_q_1_0_backEN = "0") THEN
                SE_redist1_i_not_gmm_substract_q_1_0_R_v_1 <= SE_redist1_i_not_gmm_substract_q_1_0_R_v_1 and SE_redist1_i_not_gmm_substract_q_1_0_s_tv_1;
            ELSE
                SE_redist1_i_not_gmm_substract_q_1_0_R_v_1 <= SE_redist1_i_not_gmm_substract_q_1_0_v_s_0;
            END IF;

            IF (SE_redist1_i_not_gmm_substract_q_1_0_backEN = "0") THEN
                SE_redist1_i_not_gmm_substract_q_1_0_R_v_2 <= SE_redist1_i_not_gmm_substract_q_1_0_R_v_2 and SE_redist1_i_not_gmm_substract_q_1_0_s_tv_2;
            ELSE
                SE_redist1_i_not_gmm_substract_q_1_0_R_v_2 <= SE_redist1_i_not_gmm_substract_q_1_0_v_s_0;
            END IF;

            IF (SE_redist1_i_not_gmm_substract_q_1_0_backEN = "0") THEN
                SE_redist1_i_not_gmm_substract_q_1_0_R_v_3 <= SE_redist1_i_not_gmm_substract_q_1_0_R_v_3 and SE_redist1_i_not_gmm_substract_q_1_0_s_tv_3;
            ELSE
                SE_redist1_i_not_gmm_substract_q_1_0_R_v_3 <= SE_redist1_i_not_gmm_substract_q_1_0_v_s_0;
            END IF;

            IF (SE_redist1_i_not_gmm_substract_q_1_0_backEN = "0") THEN
                SE_redist1_i_not_gmm_substract_q_1_0_R_v_4 <= SE_redist1_i_not_gmm_substract_q_1_0_R_v_4 and SE_redist1_i_not_gmm_substract_q_1_0_s_tv_4;
            ELSE
                SE_redist1_i_not_gmm_substract_q_1_0_R_v_4 <= SE_redist1_i_not_gmm_substract_q_1_0_v_s_0;
            END IF;

            IF (SE_redist1_i_not_gmm_substract_q_1_0_backEN = "0") THEN
                SE_redist1_i_not_gmm_substract_q_1_0_R_v_5 <= SE_redist1_i_not_gmm_substract_q_1_0_R_v_5 and SE_redist1_i_not_gmm_substract_q_1_0_s_tv_5;
            ELSE
                SE_redist1_i_not_gmm_substract_q_1_0_R_v_5 <= SE_redist1_i_not_gmm_substract_q_1_0_v_s_0;
            END IF;

            IF (SE_redist1_i_not_gmm_substract_q_1_0_backEN = "0") THEN
                SE_redist1_i_not_gmm_substract_q_1_0_R_v_6 <= SE_redist1_i_not_gmm_substract_q_1_0_R_v_6 and SE_redist1_i_not_gmm_substract_q_1_0_s_tv_6;
            ELSE
                SE_redist1_i_not_gmm_substract_q_1_0_R_v_6 <= SE_redist1_i_not_gmm_substract_q_1_0_v_s_0;
            END IF;

            IF (SE_redist1_i_not_gmm_substract_q_1_0_backEN = "0") THEN
                SE_redist1_i_not_gmm_substract_q_1_0_R_v_7 <= SE_redist1_i_not_gmm_substract_q_1_0_R_v_7 and SE_redist1_i_not_gmm_substract_q_1_0_s_tv_7;
            ELSE
                SE_redist1_i_not_gmm_substract_q_1_0_R_v_7 <= SE_redist1_i_not_gmm_substract_q_1_0_v_s_0;
            END IF;

            IF (SE_redist1_i_not_gmm_substract_q_1_0_backEN = "0") THEN
                SE_redist1_i_not_gmm_substract_q_1_0_R_v_8 <= SE_redist1_i_not_gmm_substract_q_1_0_R_v_8 and SE_redist1_i_not_gmm_substract_q_1_0_s_tv_8;
            ELSE
                SE_redist1_i_not_gmm_substract_q_1_0_R_v_8 <= SE_redist1_i_not_gmm_substract_q_1_0_v_s_0;
            END IF;

            IF (SE_redist1_i_not_gmm_substract_q_1_0_backEN = "0") THEN
                SE_redist1_i_not_gmm_substract_q_1_0_R_v_9 <= SE_redist1_i_not_gmm_substract_q_1_0_R_v_9 and SE_redist1_i_not_gmm_substract_q_1_0_s_tv_9;
            ELSE
                SE_redist1_i_not_gmm_substract_q_1_0_R_v_9 <= SE_redist1_i_not_gmm_substract_q_1_0_v_s_0;
            END IF;

            IF (SE_redist1_i_not_gmm_substract_q_1_0_backEN = "0") THEN
                SE_redist1_i_not_gmm_substract_q_1_0_R_v_10 <= SE_redist1_i_not_gmm_substract_q_1_0_R_v_10 and SE_redist1_i_not_gmm_substract_q_1_0_s_tv_10;
            ELSE
                SE_redist1_i_not_gmm_substract_q_1_0_R_v_10 <= SE_redist1_i_not_gmm_substract_q_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_i_cmp_i_i129_1_gmm_substract(STALLENABLE,644)
    -- Valid signal propagation
    SE_i_cmp_i_i129_1_gmm_substract_V0 <= SE_i_cmp_i_i129_1_gmm_substract_R_v_0;
    SE_i_cmp_i_i129_1_gmm_substract_V1 <= SE_i_cmp_i_i129_1_gmm_substract_R_v_1;
    SE_i_cmp_i_i129_1_gmm_substract_V2 <= SE_i_cmp_i_i129_1_gmm_substract_R_v_2;
    SE_i_cmp_i_i129_1_gmm_substract_V3 <= SE_i_cmp_i_i129_1_gmm_substract_R_v_3;
    SE_i_cmp_i_i129_1_gmm_substract_V4 <= SE_i_cmp_i_i129_1_gmm_substract_R_v_4;
    SE_i_cmp_i_i129_1_gmm_substract_V5 <= SE_i_cmp_i_i129_1_gmm_substract_R_v_5;
    SE_i_cmp_i_i129_1_gmm_substract_V6 <= SE_i_cmp_i_i129_1_gmm_substract_R_v_6;
    SE_i_cmp_i_i129_1_gmm_substract_V7 <= SE_i_cmp_i_i129_1_gmm_substract_R_v_7;
    -- Stall signal propagation
    SE_i_cmp_i_i129_1_gmm_substract_s_tv_0 <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_backStall and SE_i_cmp_i_i129_1_gmm_substract_R_v_0;
    SE_i_cmp_i_i129_1_gmm_substract_s_tv_1 <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_682778_gmm_substract_backStall and SE_i_cmp_i_i129_1_gmm_substract_R_v_1;
    SE_i_cmp_i_i129_1_gmm_substract_s_tv_2 <= SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_backStall and SE_i_cmp_i_i129_1_gmm_substract_R_v_2;
    SE_i_cmp_i_i129_1_gmm_substract_s_tv_3 <= SE_out_i_ffwd_dst_reduction_gmm_substract_462765_gmm_substract_backStall and SE_i_cmp_i_i129_1_gmm_substract_R_v_3;
    SE_i_cmp_i_i129_1_gmm_substract_s_tv_4 <= SE_out_i_ffwd_dst_reduction_gmm_substract_522768_gmm_substract_backStall and SE_i_cmp_i_i129_1_gmm_substract_R_v_4;
    SE_i_cmp_i_i129_1_gmm_substract_s_tv_5 <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_backStall and SE_i_cmp_i_i129_1_gmm_substract_R_v_5;
    SE_i_cmp_i_i129_1_gmm_substract_s_tv_6 <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_backStall and SE_i_cmp_i_i129_1_gmm_substract_R_v_6;
    SE_i_cmp_i_i129_1_gmm_substract_s_tv_7 <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702779_gmm_substract_backStall and SE_i_cmp_i_i129_1_gmm_substract_R_v_7;
    -- Backward Enable generation
    SE_i_cmp_i_i129_1_gmm_substract_or0 <= SE_i_cmp_i_i129_1_gmm_substract_s_tv_0;
    SE_i_cmp_i_i129_1_gmm_substract_or1 <= SE_i_cmp_i_i129_1_gmm_substract_s_tv_1 or SE_i_cmp_i_i129_1_gmm_substract_or0;
    SE_i_cmp_i_i129_1_gmm_substract_or2 <= SE_i_cmp_i_i129_1_gmm_substract_s_tv_2 or SE_i_cmp_i_i129_1_gmm_substract_or1;
    SE_i_cmp_i_i129_1_gmm_substract_or3 <= SE_i_cmp_i_i129_1_gmm_substract_s_tv_3 or SE_i_cmp_i_i129_1_gmm_substract_or2;
    SE_i_cmp_i_i129_1_gmm_substract_or4 <= SE_i_cmp_i_i129_1_gmm_substract_s_tv_4 or SE_i_cmp_i_i129_1_gmm_substract_or3;
    SE_i_cmp_i_i129_1_gmm_substract_or5 <= SE_i_cmp_i_i129_1_gmm_substract_s_tv_5 or SE_i_cmp_i_i129_1_gmm_substract_or4;
    SE_i_cmp_i_i129_1_gmm_substract_or6 <= SE_i_cmp_i_i129_1_gmm_substract_s_tv_6 or SE_i_cmp_i_i129_1_gmm_substract_or5;
    SE_i_cmp_i_i129_1_gmm_substract_backEN <= not (SE_i_cmp_i_i129_1_gmm_substract_s_tv_7 or SE_i_cmp_i_i129_1_gmm_substract_or6);
    -- Determine whether to write valid data into the first register stage
    SE_i_cmp_i_i129_1_gmm_substract_v_s_0 <= SE_i_cmp_i_i129_1_gmm_substract_backEN and SR_SE_i_cmp_i_i129_1_gmm_substract_V;
    -- Backward Stall generation
    SE_i_cmp_i_i129_1_gmm_substract_backStall <= not (SE_i_cmp_i_i129_1_gmm_substract_backEN);
    SE_i_cmp_i_i129_1_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_cmp_i_i129_1_gmm_substract_R_v_0 <= (others => '0');
            SE_i_cmp_i_i129_1_gmm_substract_R_v_1 <= (others => '0');
            SE_i_cmp_i_i129_1_gmm_substract_R_v_2 <= (others => '0');
            SE_i_cmp_i_i129_1_gmm_substract_R_v_3 <= (others => '0');
            SE_i_cmp_i_i129_1_gmm_substract_R_v_4 <= (others => '0');
            SE_i_cmp_i_i129_1_gmm_substract_R_v_5 <= (others => '0');
            SE_i_cmp_i_i129_1_gmm_substract_R_v_6 <= (others => '0');
            SE_i_cmp_i_i129_1_gmm_substract_R_v_7 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_cmp_i_i129_1_gmm_substract_backEN = "0") THEN
                SE_i_cmp_i_i129_1_gmm_substract_R_v_0 <= SE_i_cmp_i_i129_1_gmm_substract_R_v_0 and SE_i_cmp_i_i129_1_gmm_substract_s_tv_0;
            ELSE
                SE_i_cmp_i_i129_1_gmm_substract_R_v_0 <= SE_i_cmp_i_i129_1_gmm_substract_v_s_0;
            END IF;

            IF (SE_i_cmp_i_i129_1_gmm_substract_backEN = "0") THEN
                SE_i_cmp_i_i129_1_gmm_substract_R_v_1 <= SE_i_cmp_i_i129_1_gmm_substract_R_v_1 and SE_i_cmp_i_i129_1_gmm_substract_s_tv_1;
            ELSE
                SE_i_cmp_i_i129_1_gmm_substract_R_v_1 <= SE_i_cmp_i_i129_1_gmm_substract_v_s_0;
            END IF;

            IF (SE_i_cmp_i_i129_1_gmm_substract_backEN = "0") THEN
                SE_i_cmp_i_i129_1_gmm_substract_R_v_2 <= SE_i_cmp_i_i129_1_gmm_substract_R_v_2 and SE_i_cmp_i_i129_1_gmm_substract_s_tv_2;
            ELSE
                SE_i_cmp_i_i129_1_gmm_substract_R_v_2 <= SE_i_cmp_i_i129_1_gmm_substract_v_s_0;
            END IF;

            IF (SE_i_cmp_i_i129_1_gmm_substract_backEN = "0") THEN
                SE_i_cmp_i_i129_1_gmm_substract_R_v_3 <= SE_i_cmp_i_i129_1_gmm_substract_R_v_3 and SE_i_cmp_i_i129_1_gmm_substract_s_tv_3;
            ELSE
                SE_i_cmp_i_i129_1_gmm_substract_R_v_3 <= SE_i_cmp_i_i129_1_gmm_substract_v_s_0;
            END IF;

            IF (SE_i_cmp_i_i129_1_gmm_substract_backEN = "0") THEN
                SE_i_cmp_i_i129_1_gmm_substract_R_v_4 <= SE_i_cmp_i_i129_1_gmm_substract_R_v_4 and SE_i_cmp_i_i129_1_gmm_substract_s_tv_4;
            ELSE
                SE_i_cmp_i_i129_1_gmm_substract_R_v_4 <= SE_i_cmp_i_i129_1_gmm_substract_v_s_0;
            END IF;

            IF (SE_i_cmp_i_i129_1_gmm_substract_backEN = "0") THEN
                SE_i_cmp_i_i129_1_gmm_substract_R_v_5 <= SE_i_cmp_i_i129_1_gmm_substract_R_v_5 and SE_i_cmp_i_i129_1_gmm_substract_s_tv_5;
            ELSE
                SE_i_cmp_i_i129_1_gmm_substract_R_v_5 <= SE_i_cmp_i_i129_1_gmm_substract_v_s_0;
            END IF;

            IF (SE_i_cmp_i_i129_1_gmm_substract_backEN = "0") THEN
                SE_i_cmp_i_i129_1_gmm_substract_R_v_6 <= SE_i_cmp_i_i129_1_gmm_substract_R_v_6 and SE_i_cmp_i_i129_1_gmm_substract_s_tv_6;
            ELSE
                SE_i_cmp_i_i129_1_gmm_substract_R_v_6 <= SE_i_cmp_i_i129_1_gmm_substract_v_s_0;
            END IF;

            IF (SE_i_cmp_i_i129_1_gmm_substract_backEN = "0") THEN
                SE_i_cmp_i_i129_1_gmm_substract_R_v_7 <= SE_i_cmp_i_i129_1_gmm_substract_R_v_7 and SE_i_cmp_i_i129_1_gmm_substract_s_tv_7;
            ELSE
                SE_i_cmp_i_i129_1_gmm_substract_R_v_7 <= SE_i_cmp_i_i129_1_gmm_substract_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_i_from_if_then612542_gmm_substract(STALLENABLE,789)
    SE_i_from_if_then612542_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_from_if_then612542_gmm_substract_fromReg0 <= (others => '0');
            SE_i_from_if_then612542_gmm_substract_fromReg1 <= (others => '0');
            SE_i_from_if_then612542_gmm_substract_fromReg2 <= (others => '0');
            SE_i_from_if_then612542_gmm_substract_fromReg3 <= (others => '0');
            SE_i_from_if_then612542_gmm_substract_fromReg4 <= (others => '0');
            SE_i_from_if_then612542_gmm_substract_fromReg5 <= (others => '0');
            SE_i_from_if_then612542_gmm_substract_fromReg6 <= (others => '0');
            SE_i_from_if_then612542_gmm_substract_fromReg7 <= (others => '0');
            SE_i_from_if_then612542_gmm_substract_fromReg8 <= (others => '0');
            SE_i_from_if_then612542_gmm_substract_fromReg9 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_i_from_if_then612542_gmm_substract_fromReg0 <= SE_i_from_if_then612542_gmm_substract_toReg0;
            -- Succesor 1
            SE_i_from_if_then612542_gmm_substract_fromReg1 <= SE_i_from_if_then612542_gmm_substract_toReg1;
            -- Succesor 2
            SE_i_from_if_then612542_gmm_substract_fromReg2 <= SE_i_from_if_then612542_gmm_substract_toReg2;
            -- Succesor 3
            SE_i_from_if_then612542_gmm_substract_fromReg3 <= SE_i_from_if_then612542_gmm_substract_toReg3;
            -- Succesor 4
            SE_i_from_if_then612542_gmm_substract_fromReg4 <= SE_i_from_if_then612542_gmm_substract_toReg4;
            -- Succesor 5
            SE_i_from_if_then612542_gmm_substract_fromReg5 <= SE_i_from_if_then612542_gmm_substract_toReg5;
            -- Succesor 6
            SE_i_from_if_then612542_gmm_substract_fromReg6 <= SE_i_from_if_then612542_gmm_substract_toReg6;
            -- Succesor 7
            SE_i_from_if_then612542_gmm_substract_fromReg7 <= SE_i_from_if_then612542_gmm_substract_toReg7;
            -- Succesor 8
            SE_i_from_if_then612542_gmm_substract_fromReg8 <= SE_i_from_if_then612542_gmm_substract_toReg8;
            -- Succesor 9
            SE_i_from_if_then612542_gmm_substract_fromReg9 <= SE_i_from_if_then612542_gmm_substract_toReg9;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_i_from_if_then612542_gmm_substract_consumed0 <= (not (SR_SE_out_i_ffwd_dst_extract_t23042713_gmm_substract_backStall) and SE_i_from_if_then612542_gmm_substract_wireValid) or SE_i_from_if_then612542_gmm_substract_fromReg0;
    SE_i_from_if_then612542_gmm_substract_consumed1 <= (not (SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_backStall) and SE_i_from_if_then612542_gmm_substract_wireValid) or SE_i_from_if_then612542_gmm_substract_fromReg1;
    SE_i_from_if_then612542_gmm_substract_consumed2 <= (not (SR_SE_out_i_ffwd_dst_extract_t23242724_gmm_substract_backStall) and SE_i_from_if_then612542_gmm_substract_wireValid) or SE_i_from_if_then612542_gmm_substract_fromReg2;
    SE_i_from_if_then612542_gmm_substract_consumed3 <= (not (SR_SE_out_i_ffwd_dst_extract_t23042715_gmm_substract_backStall) and SE_i_from_if_then612542_gmm_substract_wireValid) or SE_i_from_if_then612542_gmm_substract_fromReg3;
    SE_i_from_if_then612542_gmm_substract_consumed4 <= (not (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_562771_gmm_substract_backStall) and SE_i_from_if_then612542_gmm_substract_wireValid) or SE_i_from_if_then612542_gmm_substract_fromReg4;
    SE_i_from_if_then612542_gmm_substract_consumed5 <= (not (SE_out_i_ffwd_dst_acl_4002696_gmm_substract_backStall) and SE_i_from_if_then612542_gmm_substract_wireValid) or SE_i_from_if_then612542_gmm_substract_fromReg5;
    SE_i_from_if_then612542_gmm_substract_consumed6 <= (not (SR_SE_out_i_ffwd_dst_extract_t23202723_gmm_substract_backStall) and SE_i_from_if_then612542_gmm_substract_wireValid) or SE_i_from_if_then612542_gmm_substract_fromReg6;
    SE_i_from_if_then612542_gmm_substract_consumed7 <= (not (SR_SE_out_i_ffwd_dst_extract_t23242725_gmm_substract_backStall) and SE_i_from_if_then612542_gmm_substract_wireValid) or SE_i_from_if_then612542_gmm_substract_fromReg7;
    SE_i_from_if_then612542_gmm_substract_consumed8 <= (not (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_582772_gmm_substract_backStall) and SE_i_from_if_then612542_gmm_substract_wireValid) or SE_i_from_if_then612542_gmm_substract_fromReg8;
    SE_i_from_if_then612542_gmm_substract_consumed9 <= (not (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_backStall) and SE_i_from_if_then612542_gmm_substract_wireValid) or SE_i_from_if_then612542_gmm_substract_fromReg9;
    -- Consuming
    SE_i_from_if_then612542_gmm_substract_StallValid <= SE_i_from_if_then612542_gmm_substract_backStall and SE_i_from_if_then612542_gmm_substract_wireValid;
    SE_i_from_if_then612542_gmm_substract_toReg0 <= SE_i_from_if_then612542_gmm_substract_StallValid and SE_i_from_if_then612542_gmm_substract_consumed0;
    SE_i_from_if_then612542_gmm_substract_toReg1 <= SE_i_from_if_then612542_gmm_substract_StallValid and SE_i_from_if_then612542_gmm_substract_consumed1;
    SE_i_from_if_then612542_gmm_substract_toReg2 <= SE_i_from_if_then612542_gmm_substract_StallValid and SE_i_from_if_then612542_gmm_substract_consumed2;
    SE_i_from_if_then612542_gmm_substract_toReg3 <= SE_i_from_if_then612542_gmm_substract_StallValid and SE_i_from_if_then612542_gmm_substract_consumed3;
    SE_i_from_if_then612542_gmm_substract_toReg4 <= SE_i_from_if_then612542_gmm_substract_StallValid and SE_i_from_if_then612542_gmm_substract_consumed4;
    SE_i_from_if_then612542_gmm_substract_toReg5 <= SE_i_from_if_then612542_gmm_substract_StallValid and SE_i_from_if_then612542_gmm_substract_consumed5;
    SE_i_from_if_then612542_gmm_substract_toReg6 <= SE_i_from_if_then612542_gmm_substract_StallValid and SE_i_from_if_then612542_gmm_substract_consumed6;
    SE_i_from_if_then612542_gmm_substract_toReg7 <= SE_i_from_if_then612542_gmm_substract_StallValid and SE_i_from_if_then612542_gmm_substract_consumed7;
    SE_i_from_if_then612542_gmm_substract_toReg8 <= SE_i_from_if_then612542_gmm_substract_StallValid and SE_i_from_if_then612542_gmm_substract_consumed8;
    SE_i_from_if_then612542_gmm_substract_toReg9 <= SE_i_from_if_then612542_gmm_substract_StallValid and SE_i_from_if_then612542_gmm_substract_consumed9;
    -- Backward Stall generation
    SE_i_from_if_then612542_gmm_substract_or0 <= SE_i_from_if_then612542_gmm_substract_consumed0;
    SE_i_from_if_then612542_gmm_substract_or1 <= SE_i_from_if_then612542_gmm_substract_consumed1 and SE_i_from_if_then612542_gmm_substract_or0;
    SE_i_from_if_then612542_gmm_substract_or2 <= SE_i_from_if_then612542_gmm_substract_consumed2 and SE_i_from_if_then612542_gmm_substract_or1;
    SE_i_from_if_then612542_gmm_substract_or3 <= SE_i_from_if_then612542_gmm_substract_consumed3 and SE_i_from_if_then612542_gmm_substract_or2;
    SE_i_from_if_then612542_gmm_substract_or4 <= SE_i_from_if_then612542_gmm_substract_consumed4 and SE_i_from_if_then612542_gmm_substract_or3;
    SE_i_from_if_then612542_gmm_substract_or5 <= SE_i_from_if_then612542_gmm_substract_consumed5 and SE_i_from_if_then612542_gmm_substract_or4;
    SE_i_from_if_then612542_gmm_substract_or6 <= SE_i_from_if_then612542_gmm_substract_consumed6 and SE_i_from_if_then612542_gmm_substract_or5;
    SE_i_from_if_then612542_gmm_substract_or7 <= SE_i_from_if_then612542_gmm_substract_consumed7 and SE_i_from_if_then612542_gmm_substract_or6;
    SE_i_from_if_then612542_gmm_substract_or8 <= SE_i_from_if_then612542_gmm_substract_consumed8 and SE_i_from_if_then612542_gmm_substract_or7;
    SE_i_from_if_then612542_gmm_substract_wireStall <= not (SE_i_from_if_then612542_gmm_substract_consumed9 and SE_i_from_if_then612542_gmm_substract_or8);
    SE_i_from_if_then612542_gmm_substract_backStall <= SE_i_from_if_then612542_gmm_substract_wireStall;
    -- Valid signal propagation
    SE_i_from_if_then612542_gmm_substract_V0 <= SE_i_from_if_then612542_gmm_substract_wireValid and not (SE_i_from_if_then612542_gmm_substract_fromReg0);
    SE_i_from_if_then612542_gmm_substract_V1 <= SE_i_from_if_then612542_gmm_substract_wireValid and not (SE_i_from_if_then612542_gmm_substract_fromReg1);
    SE_i_from_if_then612542_gmm_substract_V2 <= SE_i_from_if_then612542_gmm_substract_wireValid and not (SE_i_from_if_then612542_gmm_substract_fromReg2);
    SE_i_from_if_then612542_gmm_substract_V3 <= SE_i_from_if_then612542_gmm_substract_wireValid and not (SE_i_from_if_then612542_gmm_substract_fromReg3);
    SE_i_from_if_then612542_gmm_substract_V4 <= SE_i_from_if_then612542_gmm_substract_wireValid and not (SE_i_from_if_then612542_gmm_substract_fromReg4);
    SE_i_from_if_then612542_gmm_substract_V5 <= SE_i_from_if_then612542_gmm_substract_wireValid and not (SE_i_from_if_then612542_gmm_substract_fromReg5);
    SE_i_from_if_then612542_gmm_substract_V6 <= SE_i_from_if_then612542_gmm_substract_wireValid and not (SE_i_from_if_then612542_gmm_substract_fromReg6);
    SE_i_from_if_then612542_gmm_substract_V7 <= SE_i_from_if_then612542_gmm_substract_wireValid and not (SE_i_from_if_then612542_gmm_substract_fromReg7);
    SE_i_from_if_then612542_gmm_substract_V8 <= SE_i_from_if_then612542_gmm_substract_wireValid and not (SE_i_from_if_then612542_gmm_substract_fromReg8);
    SE_i_from_if_then612542_gmm_substract_V9 <= SE_i_from_if_then612542_gmm_substract_wireValid and not (SE_i_from_if_then612542_gmm_substract_fromReg9);
    -- Computing multiple Valid(s)
    SE_i_from_if_then612542_gmm_substract_and0 <= SE_i_cmp_i_i134_not_gmm_substract_V0;
    SE_i_from_if_then612542_gmm_substract_wireValid <= SE_redist2_i_ffwd_dst_unnamed_gmm_substract59_gmm_substract_out_dest_data_out_54_0_1_0_V0 and SE_i_from_if_then612542_gmm_substract_and0;

    -- i_ffwd_dst_acl_3972689_gmm_substract(BLACKBOX,249)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_acl_3972689_gmm_substract : i_ffwd_dst_acl_3972689_gmm_substract2356
    PORT MAP (
        in_intel_reserved_ffwd_39_0 => in_intel_reserved_ffwd_39_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V34,
        out_dest_data_out_39_0 => i_ffwd_dst_acl_3972689_gmm_substract_out_dest_data_out_39_0,
        out_stall_out => i_ffwd_dst_acl_3972689_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_acl_3972689_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_acl_4002698_gmm_substract(BLACKBOX,252)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_acl_4002698_gmm_substract : i_ffwd_dst_acl_4002698_gmm_substract2358
    PORT MAP (
        in_intel_reserved_ffwd_40_0 => in_intel_reserved_ffwd_40_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V35,
        out_dest_data_out_40_0 => i_ffwd_dst_acl_4002698_gmm_substract_out_dest_data_out_40_0,
        out_stall_out => i_ffwd_dst_acl_4002698_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_acl_4002698_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_reduction_gmm_substract_682777_gmm_substract(BLACKBOX,292)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_reduction_gmm_substract_682777_gmm_substract : i_ffwd_dst_reduction_gmm_substract_682777_gmm_substract2296
    PORT MAP (
        in_intel_reserved_ffwd_90_0 => in_intel_reserved_ffwd_90_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V12,
        out_dest_data_out_90_0 => i_ffwd_dst_reduction_gmm_substract_682777_gmm_substract_out_dest_data_out_90_0,
        out_stall_out => i_ffwd_dst_reduction_gmm_substract_682777_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_reduction_gmm_substract_682777_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract(BLACKBOX,295)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_ffwd_dst_reduction_gmm_substract_702780_gmm_substract : i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract2298
    PORT MAP (
        in_intel_reserved_ffwd_91_0 => in_intel_reserved_ffwd_91_0,
        in_stall_in => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_backStall,
        in_valid_in => bubble_out_stall_entry_2_reg_V13,
        out_dest_data_out_91_0 => i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_out_dest_data_out_91_0,
        out_stall_out => i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract(STALLREG,1273)
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_r_valid <= (others => '0');
            SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_r_valid <= SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_backStall and (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_r_valid or SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_i_valid);

            IF (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_r_valid = "0") THEN
                -- Data(s)
                SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_r_data0 <= i_select628_gmm_substract_q;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_and0 <= i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_out_valid_out;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_and1 <= i_ffwd_dst_reduction_gmm_substract_682777_gmm_substract_out_valid_out and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_and0;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_and2 <= i_ffwd_dst_acl_4002698_gmm_substract_out_valid_out and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_and1;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_and3 <= i_ffwd_dst_acl_3972689_gmm_substract_out_valid_out and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_and2;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_and4 <= SE_i_from_if_then612542_gmm_substract_V9 and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_and3;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_and5 <= SE_i_cmp_i_i129_1_gmm_substract_V6 and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_and4;
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_i_valid <= SE_redist1_i_not_gmm_substract_q_1_0_V9 and SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_and5;
    -- Stall signal propagation
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_backStall <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_r_valid or not (SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_i_valid);

    -- Valid
    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_V <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_r_valid WHEN SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_r_valid = "1" ELSE SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_i_valid;

    SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_D0 <= SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_r_data0 WHEN SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_r_valid = "1" ELSE i_select628_gmm_substract_q;

    -- i_ffwd_src_unnamed_gmm_substract74_gmm_substract(BLACKBOX,311)@1
    -- in in_stall_in@20000000
    -- out out_intel_reserved_ffwd_70_0@20000000
    -- out out_stall_out@20000000
    thei_ffwd_src_unnamed_gmm_substract74_gmm_substract : i_ffwd_src_unnamed_gmm_substract74_gmm_substract2395
    PORT MAP (
        in_enable_in => VCC_q,
        in_src_data_in_70_0 => SR_SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_D0,
        in_stall_in => SE_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_backStall,
        in_valid_in => SE_out_i_ffwd_dst_reduction_gmm_substract_702780_gmm_substract_V0,
        out_intel_reserved_ffwd_70_0 => i_ffwd_src_unnamed_gmm_substract74_gmm_substract_out_intel_reserved_ffwd_70_0,
        out_stall_out => i_ffwd_src_unnamed_gmm_substract74_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_src_unnamed_gmm_substract74_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract(STALLENABLE,784)
    -- Valid signal propagation
    SE_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_V0 <= SE_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_backStall <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_backStall or not (SE_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_wireValid <= i_ffwd_src_unnamed_gmm_substract74_gmm_substract_out_valid_out;

    -- SR_bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg(STALLREG,1274)
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_r_valid <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_r_valid <= bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_backStall and (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_r_valid or SR_bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_i_valid);

            IF (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_r_valid = "0") THEN
                -- Data(s)
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_i_valid <= SE_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_V0;
    -- Stall signal propagation
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_backStall <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_r_valid or not (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_i_valid);

    -- Valid
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_V <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_r_valid WHEN SR_bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_r_valid = "1" ELSE SR_bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_i_valid;


    -- bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg(STALLENABLE,1204)
    -- Valid signal propagation
    bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_V0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_R_v_0;
    -- Stall signal propagation
    bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_s_tv_0 <= SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_backStall and bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_R_v_0;
    -- Backward Enable generation
    bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_backEN <= not (bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_v_s_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_backEN and SR_bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_V;
    -- Backward Stall generation
    bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_backStall <= not (bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_backEN);
    bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_backEN = "0") THEN
                bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_R_v_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_R_v_0 and bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_s_tv_0;
            ELSE
                bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_R_v_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg(STALLENABLE,1202)
    -- Valid signal propagation
    bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_V0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_R_v_0;
    -- Stall signal propagation
    bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_s_tv_0 <= SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_backStall and bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_R_v_0;
    -- Backward Enable generation
    bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_backEN <= not (bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_v_s_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_backEN and SR_bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_V;
    -- Backward Stall generation
    bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_backStall <= not (bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_backEN);
    bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_backEN = "0") THEN
                bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_R_v_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_R_v_0 and bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_s_tv_0;
            ELSE
                bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_R_v_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg(STALLENABLE,1200)
    -- Valid signal propagation
    bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_V0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_R_v_0;
    -- Stall signal propagation
    bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_s_tv_0 <= SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_backStall and bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_R_v_0;
    -- Backward Enable generation
    bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_backEN <= not (bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_v_s_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_backEN and SR_bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_V;
    -- Backward Stall generation
    bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_backStall <= not (bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_backEN);
    bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_backEN = "0") THEN
                bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_R_v_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_R_v_0 and bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_s_tv_0;
            ELSE
                bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_R_v_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg(STALLENABLE,1199)
    -- Valid signal propagation
    bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_V0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_R_v_0;
    -- Stall signal propagation
    bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_s_tv_0 <= SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_backStall and bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_R_v_0;
    -- Backward Enable generation
    bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_backEN <= not (bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_v_s_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_backEN and SR_bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_V;
    -- Backward Stall generation
    bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_backStall <= not (bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_backEN);
    bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_backEN = "0") THEN
                bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_R_v_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_R_v_0 and bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_s_tv_0;
            ELSE
                bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_R_v_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg(STALLENABLE,1205)
    -- Valid signal propagation
    bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_V0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_R_v_0;
    -- Stall signal propagation
    bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_s_tv_0 <= SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_backStall and bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_R_v_0;
    -- Backward Enable generation
    bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_backEN <= not (bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_v_s_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_backEN and SR_bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_V;
    -- Backward Stall generation
    bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_backStall <= not (bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_backEN);
    bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_backEN = "0") THEN
                bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_R_v_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_R_v_0 and bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_s_tv_0;
            ELSE
                bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_R_v_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg(STALLENABLE,1195)
    -- Valid signal propagation
    bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_V0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_R_v_0;
    -- Stall signal propagation
    bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_s_tv_0 <= SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_backStall and bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_R_v_0;
    -- Backward Enable generation
    bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_backEN <= not (bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_v_s_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_backEN and SR_bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_V;
    -- Backward Stall generation
    bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_backStall <= not (bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_backEN);
    bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_backEN = "0") THEN
                bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_R_v_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_R_v_0 and bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_s_tv_0;
            ELSE
                bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_R_v_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg(STALLENABLE,1194)
    -- Valid signal propagation
    bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_V0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_R_v_0;
    -- Stall signal propagation
    bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_s_tv_0 <= SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_backStall and bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_R_v_0;
    -- Backward Enable generation
    bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_backEN <= not (bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_v_s_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_backEN and SR_bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_V;
    -- Backward Stall generation
    bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_backStall <= not (bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_backEN);
    bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_backEN = "0") THEN
                bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_R_v_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_R_v_0 and bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_s_tv_0;
            ELSE
                bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_R_v_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg(STALLENABLE,1193)
    -- Valid signal propagation
    bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_V0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_R_v_0;
    -- Stall signal propagation
    bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_s_tv_0 <= SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_backStall and bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_R_v_0;
    -- Backward Enable generation
    bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_backEN <= not (bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_v_s_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_backEN and SR_bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_V;
    -- Backward Stall generation
    bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_backStall <= not (bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_backEN);
    bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_backEN = "0") THEN
                bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_R_v_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_R_v_0 and bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_s_tv_0;
            ELSE
                bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_R_v_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg(STALLENABLE,1192)
    -- Valid signal propagation
    bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_V0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_R_v_0;
    -- Stall signal propagation
    bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_s_tv_0 <= SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_backStall and bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_R_v_0;
    -- Backward Enable generation
    bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_backEN <= not (bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_v_s_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_backEN and SR_bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_V;
    -- Backward Stall generation
    bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_backStall <= not (bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_backEN);
    bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_backEN = "0") THEN
                bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_R_v_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_R_v_0 and bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_s_tv_0;
            ELSE
                bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_R_v_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg(STALLENABLE,1190)
    -- Valid signal propagation
    bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_V0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_R_v_0;
    -- Stall signal propagation
    bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_s_tv_0 <= SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_backStall and bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_R_v_0;
    -- Backward Enable generation
    bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_backEN <= not (bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_v_s_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_backEN and SR_bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_V;
    -- Backward Stall generation
    bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_backStall <= not (bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_backEN);
    bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_backEN = "0") THEN
                bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_R_v_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_R_v_0 and bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_s_tv_0;
            ELSE
                bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_R_v_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- redist3_bgTrunc_i_op_gmm_substract_sel_x_b_1_0(REG,385)
    redist3_bgTrunc_i_op_gmm_substract_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_bgTrunc_i_op_gmm_substract_sel_x_b_1_0_q <= "000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_unnamed_gmm_substract2363_backEN = "1") THEN
                redist3_bgTrunc_i_op_gmm_substract_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_i_unnamed_gmm_substract2363_D1);
            END IF;
        END IF;
    END PROCESS;

    -- i_unnamed_gmm_substract2365_sel_x(BITSELECT,211)@1
    i_unnamed_gmm_substract2365_sel_x_b <= std_logic_vector(resize(unsigned(redist3_bgTrunc_i_op_gmm_substract_sel_x_b_1_0_q(32 downto 0)), 34));

    -- i_unnamed_gmm_substract2365_vt_select_32(BITSELECT,352)@1
    i_unnamed_gmm_substract2365_vt_select_32_b <= i_unnamed_gmm_substract2365_sel_x_b(32 downto 0);

    -- i_unnamed_gmm_substract2365_vt_join(BITJOIN,351)@1
    i_unnamed_gmm_substract2365_vt_join_q <= GND_q & i_unnamed_gmm_substract2365_vt_select_32_b;

    -- i_op2816_gmm_substract(ADD,316)@1
    i_op2816_gmm_substract_a <= STD_LOGIC_VECTOR("0" & i_unnamed_gmm_substract2365_vt_join_q);
    i_op2816_gmm_substract_b <= STD_LOGIC_VECTOR("0" & c_i34_1gr_q);
    i_op2816_gmm_substract_o <= STD_LOGIC_VECTOR(UNSIGNED(i_op2816_gmm_substract_a) + UNSIGNED(i_op2816_gmm_substract_b));
    i_op2816_gmm_substract_q <= i_op2816_gmm_substract_o(34 downto 0);

    -- bgTrunc_i_op2816_gmm_substract_sel_x(BITSELECT,2)@1
    bgTrunc_i_op2816_gmm_substract_sel_x_b <= i_op2816_gmm_substract_q(33 downto 0);

    -- redist4_bgTrunc_i_op2816_gmm_substract_sel_x_b_1_0(REG,386)
    redist4_bgTrunc_i_op2816_gmm_substract_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_bgTrunc_i_op2816_gmm_substract_sel_x_b_1_0_q <= "0000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_unnamed_gmm_substract2363_q_2_0_backEN = "1") THEN
                redist4_bgTrunc_i_op2816_gmm_substract_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(bgTrunc_i_op2816_gmm_substract_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- c_i34_1gr(CONSTANT,217)
    c_i34_1gr_q <= "1111111111111111111111111111111111";

    -- c_i2_1gr(CONSTANT,215)
    c_i2_1gr_q <= "11";

    -- i_unnamed_gmm_substract2363(LOGICAL,348)@0 + 1
    i_unnamed_gmm_substract2363_qi <= "1" WHEN SR_SE_i_unnamed_gmm_substract2363_D0 = c_i2_1gr_q ELSE "0";
    i_unnamed_gmm_substract2363_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_gmm_substract2363_qi, xout => i_unnamed_gmm_substract2363_q, ena => SE_i_unnamed_gmm_substract2363_backEN(0), clk => clock, aclr => resetn );

    -- redist0_i_unnamed_gmm_substract2363_q_2_0(REG,382)
    redist0_i_unnamed_gmm_substract2363_q_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_unnamed_gmm_substract2363_q_2_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_unnamed_gmm_substract2363_q_2_0_backEN = "1") THEN
                redist0_i_unnamed_gmm_substract2363_q_2_0_q <= STD_LOGIC_VECTOR(i_unnamed_gmm_substract2363_q);
            END IF;
        END IF;
    END PROCESS;

    -- i_unnamed_gmm_substract2366(MUX,353)@2
    i_unnamed_gmm_substract2366_s <= redist0_i_unnamed_gmm_substract2363_q_2_0_q;
    i_unnamed_gmm_substract2366_combproc: PROCESS (i_unnamed_gmm_substract2366_s, c_i34_1gr_q, redist4_bgTrunc_i_op2816_gmm_substract_sel_x_b_1_0_q)
    BEGIN
        CASE (i_unnamed_gmm_substract2366_s) IS
            WHEN "0" => i_unnamed_gmm_substract2366_q <= c_i34_1gr_q;
            WHEN "1" => i_unnamed_gmm_substract2366_q <= redist4_bgTrunc_i_op2816_gmm_substract_sel_x_b_1_0_q;
            WHEN OTHERS => i_unnamed_gmm_substract2366_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_src_unnamed_gmm_substract76_gmm_substract(BLACKBOX,313)@2
    -- in in_stall_in@20000000
    -- out out_intel_reserved_ffwd_72_0@20000000
    -- out out_stall_out@20000000
    thei_ffwd_src_unnamed_gmm_substract76_gmm_substract : i_ffwd_src_unnamed_gmm_substract76_gmm_substract2399
    PORT MAP (
        in_enable_in => VCC_q,
        in_src_data_in_72_0 => i_unnamed_gmm_substract2366_q,
        in_stall_in => SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_backStall,
        in_valid_in => SE_redist0_i_unnamed_gmm_substract2363_q_2_0_V0,
        out_intel_reserved_ffwd_72_0 => i_ffwd_src_unnamed_gmm_substract76_gmm_substract_out_intel_reserved_ffwd_72_0,
        out_stall_out => i_ffwd_src_unnamed_gmm_substract76_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_src_unnamed_gmm_substract76_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_1_reg(STALLFIFO,1196)
    bubble_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_1_reg_valid_in <= SE_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_V0;
    bubble_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_1_reg_stall_in <= SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_backStall;
    bubble_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_1_reg_valid_in_bitsignaltemp <= bubble_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_1_reg_valid_in(0);
    bubble_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_1_reg_stall_in_bitsignaltemp <= bubble_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_1_reg_stall_in(0);
    bubble_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_1_reg_valid_out(0) <= bubble_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_1_reg_valid_out_bitsignaltemp;
    bubble_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_1_reg_stall_out(0) <= bubble_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_1_reg_stall_out_bitsignaltemp;
    thebubble_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- bubble_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_1_reg(STALLFIFO,1197)
    bubble_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_1_reg_valid_in <= SE_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_V0;
    bubble_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_1_reg_stall_in <= SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_backStall;
    bubble_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_1_reg_valid_in_bitsignaltemp <= bubble_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_1_reg_valid_in(0);
    bubble_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_1_reg_stall_in_bitsignaltemp <= bubble_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_1_reg_stall_in(0);
    bubble_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_1_reg_valid_out(0) <= bubble_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_1_reg_valid_out_bitsignaltemp;
    bubble_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_1_reg_stall_out(0) <= bubble_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_1_reg_stall_out_bitsignaltemp;
    thebubble_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- bubble_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_1_reg(STALLFIFO,1198)
    bubble_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_1_reg_valid_in <= SE_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_V0;
    bubble_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_1_reg_stall_in <= SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_backStall;
    bubble_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_1_reg_valid_in_bitsignaltemp <= bubble_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_1_reg_valid_in(0);
    bubble_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_1_reg_stall_in_bitsignaltemp <= bubble_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_1_reg_stall_in(0);
    bubble_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_1_reg_valid_out(0) <= bubble_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_1_reg_valid_out_bitsignaltemp;
    bubble_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_1_reg_stall_out(0) <= bubble_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_1_reg_stall_out_bitsignaltemp;
    thebubble_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- bubble_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_1_reg(STALLFIFO,1201)
    bubble_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_1_reg_valid_in <= SE_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_V0;
    bubble_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_1_reg_stall_in <= SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_backStall;
    bubble_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_1_reg_valid_in_bitsignaltemp <= bubble_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_1_reg_valid_in(0);
    bubble_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_1_reg_stall_in_bitsignaltemp <= bubble_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_1_reg_stall_in(0);
    bubble_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_1_reg_valid_out(0) <= bubble_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_1_reg_valid_out_bitsignaltemp;
    bubble_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_1_reg_stall_out(0) <= bubble_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_1_reg_stall_out_bitsignaltemp;
    thebubble_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_reg(STALLFIFO,1203)
    bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_reg_valid_in <= SE_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_V0;
    bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_reg_stall_in <= SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_backStall;
    bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_reg_valid_in_bitsignaltemp <= bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_reg_valid_in(0);
    bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_reg_stall_in_bitsignaltemp <= bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_reg_stall_in(0);
    bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_reg_valid_out(0) <= bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_reg_valid_out_bitsignaltemp;
    bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_reg_stall_out(0) <= bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_reg_stall_out_bitsignaltemp;
    thebubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1(STALLENABLE,1075)
    -- Valid signal propagation
    SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_V0 <= SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_backStall <= in_stall_in or not (SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_reg_valid_out;
    SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and1 <= bubble_out_i_ffwd_src_unnamed_gmm_substract71_gmm_substract_1_reg_valid_out and SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and0;
    SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and2 <= bubble_out_i_ffwd_src_unnamed_gmm_substract68_gmm_substract_1_reg_valid_out and SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and1;
    SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and3 <= bubble_out_i_ffwd_src_unnamed_gmm_substract67_gmm_substract_1_reg_valid_out and SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and2;
    SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and4 <= bubble_out_i_ffwd_src_unnamed_gmm_substract66_gmm_substract_1_reg_valid_out and SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and3;
    SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and5 <= i_ffwd_src_unnamed_gmm_substract76_gmm_substract_out_valid_out and SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and4;
    SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and6 <= bubble_out_i_ffwd_src_unnamed_gmm_substract60_gmm_substract_1_reg_V0 and SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and5;
    SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and7 <= bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_V0 and SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and6;
    SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and8 <= bubble_out_i_ffwd_src_unnamed_gmm_substract62_gmm_substract_1_reg_V0 and SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and7;
    SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and9 <= bubble_out_i_ffwd_src_unnamed_gmm_substract63_gmm_substract_1_reg_V0 and SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and8;
    SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and10 <= bubble_out_i_ffwd_src_unnamed_gmm_substract64_gmm_substract_1_reg_V0 and SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and9;
    SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and11 <= bubble_out_i_ffwd_src_unnamed_gmm_substract65_gmm_substract_1_reg_V0 and SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and10;
    SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and12 <= bubble_out_i_ffwd_src_unnamed_gmm_substract75_gmm_substract_1_reg_V0 and SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and11;
    SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and13 <= bubble_out_i_ffwd_src_unnamed_gmm_substract69_gmm_substract_1_reg_V0 and SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and12;
    SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and14 <= bubble_out_i_ffwd_src_unnamed_gmm_substract70_gmm_substract_1_reg_V0 and SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and13;
    SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and15 <= bubble_out_i_ffwd_src_unnamed_gmm_substract72_gmm_substract_1_reg_V0 and SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and14;
    SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_wireValid <= bubble_out_i_ffwd_src_unnamed_gmm_substract74_gmm_substract_1_reg_V0 and SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_and15;

    -- bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg(STALLENABLE,1191)
    -- Valid signal propagation
    bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_V0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_R_v_0;
    -- Stall signal propagation
    bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_s_tv_0 <= SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_backStall and bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_R_v_0;
    -- Backward Enable generation
    bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_backEN <= not (bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_v_s_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_backEN and SR_bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_V;
    -- Backward Stall generation
    bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_backStall <= not (bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_backEN);
    bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_backEN = "0") THEN
                bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_R_v_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_R_v_0 and bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_s_tv_0;
            ELSE
                bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_R_v_0 <= bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg(STALLREG,1256)
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_r_valid <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_r_valid <= bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_backStall and (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_r_valid or SR_bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_i_valid);

            IF (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_r_valid = "0") THEN
                -- Data(s)
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_i_valid <= SE_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_V0;
    -- Stall signal propagation
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_backStall <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_r_valid or not (SR_bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_i_valid);

    -- Valid
    SR_bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_V <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_r_valid WHEN SR_bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_r_valid = "1" ELSE SR_bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_i_valid;


    -- SE_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract(STALLENABLE,758)
    -- Valid signal propagation
    SE_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_V0 <= SE_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_wireValid;
    -- Backward Stall generation
    SE_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_backStall <= SR_bubble_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_1_reg_backStall or not (SE_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_wireValid <= i_ffwd_src_unnamed_gmm_substract61_gmm_substract_out_valid_out;

    -- i_acl_432_gmm_substract(MUX,223)@1
    i_acl_432_gmm_substract_s <= i_cmp_i_i129_1_gmm_substract_c;
    i_acl_432_gmm_substract_combproc: PROCESS (i_acl_432_gmm_substract_s, i_extract_t652_gmm_substract_sel_x_b, i_extract_t651_gmm_substract_sel_x_b)
    BEGIN
        CASE (i_acl_432_gmm_substract_s) IS
            WHEN "0" => i_acl_432_gmm_substract_q <= i_extract_t652_gmm_substract_sel_x_b;
            WHEN "1" => i_acl_432_gmm_substract_q <= i_extract_t651_gmm_substract_sel_x_b;
            WHEN OTHERS => i_acl_432_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- bubble_join_i_ffwd_dst_extract_t22962709_gmm_substract(BITJOIN,442)
    bubble_join_i_ffwd_dst_extract_t22962709_gmm_substract_q <= i_ffwd_dst_extract_t22962709_gmm_substract_out_dest_data_out_43_0;

    -- bubble_select_i_ffwd_dst_extract_t22962709_gmm_substract(BITSELECT,443)
    bubble_select_i_ffwd_dst_extract_t22962709_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_extract_t22962709_gmm_substract_q(7 downto 0));

    -- bubble_join_i_ffwd_dst_extract_t23202722_gmm_substract(BITJOIN,466)
    bubble_join_i_ffwd_dst_extract_t23202722_gmm_substract_q <= i_ffwd_dst_extract_t23202722_gmm_substract_out_dest_data_out_49_0;

    -- bubble_select_i_ffwd_dst_extract_t23202722_gmm_substract(BITSELECT,467)
    bubble_select_i_ffwd_dst_extract_t23202722_gmm_substract_b <= STD_LOGIC_VECTOR(bubble_join_i_ffwd_dst_extract_t23202722_gmm_substract_q(7 downto 0));

    -- i_select548_gmm_substract(MUX,320)@1
    i_select548_gmm_substract_s <= i_from_if_then612542_gmm_substract_q;
    i_select548_gmm_substract_combproc: PROCESS (i_select548_gmm_substract_s, bubble_select_i_ffwd_dst_extract_t23202722_gmm_substract_b, bubble_select_i_ffwd_dst_extract_t22962709_gmm_substract_b)
    BEGIN
        CASE (i_select548_gmm_substract_s) IS
            WHEN "0" => i_select548_gmm_substract_q <= bubble_select_i_ffwd_dst_extract_t23202722_gmm_substract_b;
            WHEN "1" => i_select548_gmm_substract_q <= bubble_select_i_ffwd_dst_extract_t22962709_gmm_substract_b;
            WHEN OTHERS => i_select548_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_select550_gmm_substract(MUX,321)@1
    i_select550_gmm_substract_s <= redist1_i_not_gmm_substract_q_1_0_q;
    i_select550_gmm_substract_combproc: PROCESS (i_select550_gmm_substract_s, i_select548_gmm_substract_q, i_acl_432_gmm_substract_q)
    BEGIN
        CASE (i_select550_gmm_substract_s) IS
            WHEN "0" => i_select550_gmm_substract_q <= i_select548_gmm_substract_q;
            WHEN "1" => i_select550_gmm_substract_q <= i_acl_432_gmm_substract_q;
            WHEN OTHERS => i_select550_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract(STALLREG,1255)
    SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_r_valid <= (others => '0');
            SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_r_valid <= SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_backStall and (SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_r_valid or SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_i_valid);

            IF (SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_r_valid = "0") THEN
                -- Data(s)
                SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_r_data0 <= i_select550_gmm_substract_q;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_and0 <= i_ffwd_dst_extract_t23202722_gmm_substract_out_valid_out;
    SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_and1 <= i_ffwd_dst_extract_t22962709_gmm_substract_out_valid_out and SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_and0;
    SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_and2 <= SE_i_from_if_then612542_gmm_substract_V1 and SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_and1;
    SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_and3 <= SE_out_i_ffwd_dst_reduction_gmm_substract_402762_gmm_substract_V1 and SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_and2;
    SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_i_valid <= SE_redist1_i_not_gmm_substract_q_1_0_V1 and SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_and3;
    -- Stall signal propagation
    SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_backStall <= SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_r_valid or not (SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_i_valid);

    -- Valid
    SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_V <= SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_r_valid WHEN SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_r_valid = "1" ELSE SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_i_valid;

    SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_D0 <= SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_r_data0 WHEN SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_r_valid = "1" ELSE i_select550_gmm_substract_q;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- i_ffwd_src_unnamed_gmm_substract61_gmm_substract(BLACKBOX,298)@1
    -- in in_stall_in@20000000
    -- out out_intel_reserved_ffwd_57_0@20000000
    -- out out_stall_out@20000000
    thei_ffwd_src_unnamed_gmm_substract61_gmm_substract : i_ffwd_src_unnamed_gmm_substract61_gmm_substract2369
    PORT MAP (
        in_enable_in => VCC_q,
        in_src_data_in_57_0 => SR_SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_D0,
        in_stall_in => SE_out_i_ffwd_src_unnamed_gmm_substract61_gmm_substract_backStall,
        in_valid_in => SE_out_i_ffwd_dst_extract_t23202722_gmm_substract_V0,
        out_intel_reserved_ffwd_57_0 => i_ffwd_src_unnamed_gmm_substract61_gmm_substract_out_intel_reserved_ffwd_57_0,
        out_stall_out => i_ffwd_src_unnamed_gmm_substract61_gmm_substract_out_stall_out,
        out_valid_out => i_ffwd_src_unnamed_gmm_substract61_gmm_substract_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_regfree_osync_x(GPOUT,7)
    out_intel_reserved_ffwd_57_0 <= i_ffwd_src_unnamed_gmm_substract61_gmm_substract_out_intel_reserved_ffwd_57_0;

    -- dupName_0_sync_out_x(GPOUT,9)@2
    out_valid_out <= SE_out_bubble_out_i_ffwd_src_unnamed_gmm_substract73_gmm_substract_1_V0;

    -- dupName_1_regfree_osync_x(GPOUT,13)
    out_intel_reserved_ffwd_58_0 <= i_ffwd_src_unnamed_gmm_substract62_gmm_substract_out_intel_reserved_ffwd_58_0;

    -- dupName_2_regfree_osync_x(GPOUT,17)
    out_intel_reserved_ffwd_59_0 <= i_ffwd_src_unnamed_gmm_substract63_gmm_substract_out_intel_reserved_ffwd_59_0;

    -- dupName_3_regfree_osync_x(GPOUT,21)
    out_intel_reserved_ffwd_60_0 <= i_ffwd_src_unnamed_gmm_substract64_gmm_substract_out_intel_reserved_ffwd_60_0;

    -- dupName_4_regfree_osync_x(GPOUT,25)
    out_intel_reserved_ffwd_61_0 <= i_ffwd_src_unnamed_gmm_substract65_gmm_substract_out_intel_reserved_ffwd_61_0;

    -- dupName_5_regfree_osync_x(GPOUT,29)
    out_intel_reserved_ffwd_62_0 <= i_ffwd_src_unnamed_gmm_substract66_gmm_substract_out_intel_reserved_ffwd_62_0;

    -- dupName_6_regfree_osync_x(GPOUT,33)
    out_intel_reserved_ffwd_63_0 <= i_ffwd_src_unnamed_gmm_substract67_gmm_substract_out_intel_reserved_ffwd_63_0;

    -- dupName_7_regfree_osync_x(GPOUT,37)
    out_intel_reserved_ffwd_64_0 <= i_ffwd_src_unnamed_gmm_substract68_gmm_substract_out_intel_reserved_ffwd_64_0;

    -- dupName_8_regfree_osync_x(GPOUT,41)
    out_intel_reserved_ffwd_65_0 <= i_ffwd_src_unnamed_gmm_substract69_gmm_substract_out_intel_reserved_ffwd_65_0;

    -- dupName_9_regfree_osync_x(GPOUT,45)
    out_intel_reserved_ffwd_66_0 <= i_ffwd_src_unnamed_gmm_substract70_gmm_substract_out_intel_reserved_ffwd_66_0;

    -- dupName_10_regfree_osync_x(GPOUT,49)
    out_intel_reserved_ffwd_67_0 <= i_ffwd_src_unnamed_gmm_substract71_gmm_substract_out_intel_reserved_ffwd_67_0;

    -- dupName_11_regfree_osync_x(GPOUT,53)
    out_intel_reserved_ffwd_68_0 <= i_ffwd_src_unnamed_gmm_substract72_gmm_substract_out_intel_reserved_ffwd_68_0;

    -- dupName_12_regfree_osync_x(GPOUT,57)
    out_intel_reserved_ffwd_69_0 <= i_ffwd_src_unnamed_gmm_substract73_gmm_substract_out_intel_reserved_ffwd_69_0;

    -- dupName_13_regfree_osync_x(GPOUT,61)
    out_intel_reserved_ffwd_70_0 <= i_ffwd_src_unnamed_gmm_substract74_gmm_substract_out_intel_reserved_ffwd_70_0;

    -- dupName_14_regfree_osync_x(GPOUT,65)
    out_intel_reserved_ffwd_71_0 <= i_ffwd_src_unnamed_gmm_substract75_gmm_substract_out_intel_reserved_ffwd_71_0;

    -- dupName_15_regfree_osync_x(GPOUT,69)
    out_intel_reserved_ffwd_72_0 <= i_ffwd_src_unnamed_gmm_substract76_gmm_substract_out_intel_reserved_ffwd_72_0;

    -- regfree_osync(GPOUT,358)
    out_intel_reserved_ffwd_56_0 <= i_ffwd_src_unnamed_gmm_substract60_gmm_substract_out_intel_reserved_ffwd_56_0;

    -- sync_out(GPOUT,363)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
