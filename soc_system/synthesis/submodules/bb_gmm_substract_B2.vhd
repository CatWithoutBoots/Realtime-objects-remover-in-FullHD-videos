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

-- VHDL created from bb_gmm_substract_B2
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

entity bb_gmm_substract_B2 is
    port (
        in_bg_th_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_d_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_in_alpha_0 : in std_logic_vector(9 downto 0);  -- ufix10
        in_s_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_31_0 : in std_logic_vector(1 downto 0);  -- ufix2
        in_intel_reserved_ffwd_33_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_intel_reserved_ffwd_35_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_intel_reserved_ffwd_36_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_intel_reserved_ffwd_38_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_intel_reserved_ffwd_39_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_40_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_41_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_42_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_43_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_44_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_45_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_46_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_47_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_48_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_49_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_50_0 : in std_logic_vector(7 downto 0);  -- ufix8
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
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_intel_reserved_ffwd_56_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_57_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_58_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_59_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_60_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_intel_reserved_ffwd_61_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_62_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_63_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_64_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_65_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_66_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_67_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_intel_reserved_ffwd_68_0 : out std_logic_vector(15 downto 0);  -- ufix16
        out_intel_reserved_ffwd_69_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_70_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_71_0 : out std_logic_vector(7 downto 0);  -- ufix8
        out_intel_reserved_ffwd_72_0 : out std_logic_vector(33 downto 0);  -- ufix34
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gmm_substract_B2;

architecture normal of bb_gmm_substract_B2 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_gmm_substract_B2_stall_region is
        port (
            in_intel_reserved_ffwd_31_0 : in std_logic_vector(1 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_33_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_35_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_36_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_38_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_39_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_40_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_41_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_42_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_43_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_44_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_45_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_46_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_47_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_48_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_49_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_50_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_51_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_52_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_53_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_54_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_73_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_74_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_75_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_76_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_77_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_78_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_79_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_80_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_81_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_82_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_83_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_84_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_85_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_86_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_87_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_88_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_89_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_90_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_91_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_56_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_57_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_58_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_59_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_60_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_61_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_62_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_63_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_64_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_65_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_66_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_67_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_68_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_69_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_70_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_71_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_intel_reserved_ffwd_72_0 : out std_logic_vector(33 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component gmm_substract_B2_branch is
        port (
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component gmm_substract_B2_merge is
        port (
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_56_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_57_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_58_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_59_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_60_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_61_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_62_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_63_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_64_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_65_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_66_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_67_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_68_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_69_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_70_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_71_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_72_0 : STD_LOGIC_VECTOR (33 downto 0);
    signal bb_gmm_substract_B2_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gmm_substract_B2_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B2_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B2_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B2_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gmm_substract_B2_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- gmm_substract_B2_merge(BLACKBOX,50)
    thegmm_substract_B2_merge : gmm_substract_B2_merge
    PORT MAP (
        in_stall_in => bb_gmm_substract_B2_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        out_stall_out_0 => gmm_substract_B2_merge_out_stall_out_0,
        out_valid_out => gmm_substract_B2_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- gmm_substract_B2_branch(BLACKBOX,49)
    thegmm_substract_B2_branch : gmm_substract_B2_branch
    PORT MAP (
        in_stall_in_0 => in_stall_in_0,
        in_valid_in => bb_gmm_substract_B2_stall_region_out_valid_out,
        out_stall_out => gmm_substract_B2_branch_out_stall_out,
        out_valid_out_0 => gmm_substract_B2_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_gmm_substract_B2_stall_region(BLACKBOX,48)
    thebb_gmm_substract_B2_stall_region : bb_gmm_substract_B2_stall_region
    PORT MAP (
        in_intel_reserved_ffwd_31_0 => in_intel_reserved_ffwd_31_0,
        in_intel_reserved_ffwd_33_0 => in_intel_reserved_ffwd_33_0,
        in_intel_reserved_ffwd_35_0 => in_intel_reserved_ffwd_35_0,
        in_intel_reserved_ffwd_36_0 => in_intel_reserved_ffwd_36_0,
        in_intel_reserved_ffwd_38_0 => in_intel_reserved_ffwd_38_0,
        in_intel_reserved_ffwd_39_0 => in_intel_reserved_ffwd_39_0,
        in_intel_reserved_ffwd_40_0 => in_intel_reserved_ffwd_40_0,
        in_intel_reserved_ffwd_41_0 => in_intel_reserved_ffwd_41_0,
        in_intel_reserved_ffwd_42_0 => in_intel_reserved_ffwd_42_0,
        in_intel_reserved_ffwd_43_0 => in_intel_reserved_ffwd_43_0,
        in_intel_reserved_ffwd_44_0 => in_intel_reserved_ffwd_44_0,
        in_intel_reserved_ffwd_45_0 => in_intel_reserved_ffwd_45_0,
        in_intel_reserved_ffwd_46_0 => in_intel_reserved_ffwd_46_0,
        in_intel_reserved_ffwd_47_0 => in_intel_reserved_ffwd_47_0,
        in_intel_reserved_ffwd_48_0 => in_intel_reserved_ffwd_48_0,
        in_intel_reserved_ffwd_49_0 => in_intel_reserved_ffwd_49_0,
        in_intel_reserved_ffwd_50_0 => in_intel_reserved_ffwd_50_0,
        in_intel_reserved_ffwd_51_0 => in_intel_reserved_ffwd_51_0,
        in_intel_reserved_ffwd_52_0 => in_intel_reserved_ffwd_52_0,
        in_intel_reserved_ffwd_53_0 => in_intel_reserved_ffwd_53_0,
        in_intel_reserved_ffwd_54_0 => in_intel_reserved_ffwd_54_0,
        in_intel_reserved_ffwd_73_0 => in_intel_reserved_ffwd_73_0,
        in_intel_reserved_ffwd_74_0 => in_intel_reserved_ffwd_74_0,
        in_intel_reserved_ffwd_75_0 => in_intel_reserved_ffwd_75_0,
        in_intel_reserved_ffwd_76_0 => in_intel_reserved_ffwd_76_0,
        in_intel_reserved_ffwd_77_0 => in_intel_reserved_ffwd_77_0,
        in_intel_reserved_ffwd_78_0 => in_intel_reserved_ffwd_78_0,
        in_intel_reserved_ffwd_79_0 => in_intel_reserved_ffwd_79_0,
        in_intel_reserved_ffwd_80_0 => in_intel_reserved_ffwd_80_0,
        in_intel_reserved_ffwd_81_0 => in_intel_reserved_ffwd_81_0,
        in_intel_reserved_ffwd_82_0 => in_intel_reserved_ffwd_82_0,
        in_intel_reserved_ffwd_83_0 => in_intel_reserved_ffwd_83_0,
        in_intel_reserved_ffwd_84_0 => in_intel_reserved_ffwd_84_0,
        in_intel_reserved_ffwd_85_0 => in_intel_reserved_ffwd_85_0,
        in_intel_reserved_ffwd_86_0 => in_intel_reserved_ffwd_86_0,
        in_intel_reserved_ffwd_87_0 => in_intel_reserved_ffwd_87_0,
        in_intel_reserved_ffwd_88_0 => in_intel_reserved_ffwd_88_0,
        in_intel_reserved_ffwd_89_0 => in_intel_reserved_ffwd_89_0,
        in_intel_reserved_ffwd_90_0 => in_intel_reserved_ffwd_90_0,
        in_intel_reserved_ffwd_91_0 => in_intel_reserved_ffwd_91_0,
        in_stall_in => gmm_substract_B2_branch_out_stall_out,
        in_valid_in => gmm_substract_B2_merge_out_valid_out,
        out_intel_reserved_ffwd_56_0 => bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_56_0,
        out_intel_reserved_ffwd_57_0 => bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_57_0,
        out_intel_reserved_ffwd_58_0 => bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_58_0,
        out_intel_reserved_ffwd_59_0 => bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_59_0,
        out_intel_reserved_ffwd_60_0 => bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_60_0,
        out_intel_reserved_ffwd_61_0 => bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_61_0,
        out_intel_reserved_ffwd_62_0 => bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_62_0,
        out_intel_reserved_ffwd_63_0 => bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_63_0,
        out_intel_reserved_ffwd_64_0 => bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_64_0,
        out_intel_reserved_ffwd_65_0 => bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_65_0,
        out_intel_reserved_ffwd_66_0 => bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_66_0,
        out_intel_reserved_ffwd_67_0 => bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_67_0,
        out_intel_reserved_ffwd_68_0 => bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_68_0,
        out_intel_reserved_ffwd_69_0 => bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_69_0,
        out_intel_reserved_ffwd_70_0 => bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_70_0,
        out_intel_reserved_ffwd_71_0 => bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_71_0,
        out_intel_reserved_ffwd_72_0 => bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_72_0,
        out_stall_out => bb_gmm_substract_B2_stall_region_out_stall_out,
        out_valid_out => bb_gmm_substract_B2_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- out_intel_reserved_ffwd_56_0(GPOUT,51)
    out_intel_reserved_ffwd_56_0 <= bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_56_0;

    -- out_intel_reserved_ffwd_57_0(GPOUT,52)
    out_intel_reserved_ffwd_57_0 <= bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_57_0;

    -- out_intel_reserved_ffwd_58_0(GPOUT,53)
    out_intel_reserved_ffwd_58_0 <= bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_58_0;

    -- out_intel_reserved_ffwd_59_0(GPOUT,54)
    out_intel_reserved_ffwd_59_0 <= bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_59_0;

    -- out_intel_reserved_ffwd_60_0(GPOUT,55)
    out_intel_reserved_ffwd_60_0 <= bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_60_0;

    -- out_intel_reserved_ffwd_61_0(GPOUT,56)
    out_intel_reserved_ffwd_61_0 <= bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_61_0;

    -- out_intel_reserved_ffwd_62_0(GPOUT,57)
    out_intel_reserved_ffwd_62_0 <= bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_62_0;

    -- out_intel_reserved_ffwd_63_0(GPOUT,58)
    out_intel_reserved_ffwd_63_0 <= bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_63_0;

    -- out_intel_reserved_ffwd_64_0(GPOUT,59)
    out_intel_reserved_ffwd_64_0 <= bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_64_0;

    -- out_intel_reserved_ffwd_65_0(GPOUT,60)
    out_intel_reserved_ffwd_65_0 <= bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_65_0;

    -- out_intel_reserved_ffwd_66_0(GPOUT,61)
    out_intel_reserved_ffwd_66_0 <= bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_66_0;

    -- out_intel_reserved_ffwd_67_0(GPOUT,62)
    out_intel_reserved_ffwd_67_0 <= bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_67_0;

    -- out_intel_reserved_ffwd_68_0(GPOUT,63)
    out_intel_reserved_ffwd_68_0 <= bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_68_0;

    -- out_intel_reserved_ffwd_69_0(GPOUT,64)
    out_intel_reserved_ffwd_69_0 <= bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_69_0;

    -- out_intel_reserved_ffwd_70_0(GPOUT,65)
    out_intel_reserved_ffwd_70_0 <= bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_70_0;

    -- out_intel_reserved_ffwd_71_0(GPOUT,66)
    out_intel_reserved_ffwd_71_0 <= bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_71_0;

    -- out_intel_reserved_ffwd_72_0(GPOUT,67)
    out_intel_reserved_ffwd_72_0 <= bb_gmm_substract_B2_stall_region_out_intel_reserved_ffwd_72_0;

    -- out_stall_out_0(GPOUT,68)
    out_stall_out_0 <= gmm_substract_B2_merge_out_stall_out_0;

    -- out_valid_out_0(GPOUT,69)
    out_valid_out_0 <= gmm_substract_B2_branch_out_valid_out_0;

END normal;
