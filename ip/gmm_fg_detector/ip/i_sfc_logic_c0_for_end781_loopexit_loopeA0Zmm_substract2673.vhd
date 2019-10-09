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

-- VHDL created from i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673
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

entity i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673 is
    port (
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        in_intel_reserved_ffwd_0_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_10_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_11_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_12_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_13_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_14_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_15_0_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_15_0_1 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_15_0_2 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_16_0_0 : in std_logic_vector(5 downto 0);  -- ufix6
        in_intel_reserved_ffwd_17_0 : in std_logic_vector(19 downto 0);  -- ufix20
        in_intel_reserved_ffwd_18_0 : in std_logic_vector(19 downto 0);  -- ufix20
        in_intel_reserved_ffwd_19_0 : in std_logic_vector(19 downto 0);  -- ufix20
        in_intel_reserved_ffwd_1_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_29_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_intel_reserved_ffwd_2_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_30_0 : in std_logic_vector(5 downto 0);  -- ufix6
        in_intel_reserved_ffwd_31_0 : in std_logic_vector(1 downto 0);  -- ufix2
        in_intel_reserved_ffwd_32_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_intel_reserved_ffwd_33_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_intel_reserved_ffwd_34_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_intel_reserved_ffwd_35_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_intel_reserved_ffwd_37_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_intel_reserved_ffwd_38_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_intel_reserved_ffwd_39_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_3_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_40_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_41_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_43_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_44_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_45_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_46_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_47_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_48_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_4_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_56_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_57_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_58_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_59_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_5_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_60_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_intel_reserved_ffwd_61_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_62_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_63_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_64_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_65_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_66_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_67_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_intel_reserved_ffwd_68_0 : in std_logic_vector(15 downto 0);  -- ufix16
        in_intel_reserved_ffwd_69_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_6_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_70_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_7_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_8_0 : in std_logic_vector(7 downto 0);  -- ufix8
        in_intel_reserved_ffwd_92_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_intel_reserved_ffwd_9_0 : in std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exi12834_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi12834_1 : out std_logic_vector(1 downto 0);  -- ufix2
        out_c0_exi12834_2 : out std_logic_vector(5 downto 0);  -- ufix6
        out_c0_exi12834_3 : out std_logic_vector(5 downto 0);  -- ufix6
        out_c0_exi12834_4 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exi12834_5 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exi12834_6 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exi12834_7 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exi12834_8 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exi12834_9 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exi12834_10 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exi12834_11 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exi12834_12 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exi12834_13 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exi12834_14 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exi12834_15 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exi12834_16 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exi12834_17 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exi12834_18 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exi12834_19 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exi12834_20 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exi12834_21 : out std_logic_vector(7 downto 0);  -- ufix8
        out_c0_exi12834_22 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673;

architecture normal of i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enter2833_gmm_substract2673 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA0Z2cdo6u2ocpq6c0ouq3cz is
        port (
            in_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            out_primWireOut : out std_logic_vector(31 downto 0);  -- Floating Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;



    component floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA1Z2cdo6u2ocpq6c0ouq3cz is
        port (
            in_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            out_primWireOut : out std_logic_vector(31 downto 0);  -- Floating Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;




    component i_ffwd_dst_unnamed_gmm_substract115_gmm_substract2874 is
        port (
            in_intel_reserved_ffwd_16_0_0 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_16_0_0 : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_unnamed_gmm_substract116_gmm_substract2878 is
        port (
            in_intel_reserved_ffwd_15_0_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_15_0_1 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_intel_reserved_ffwd_15_0_2 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_15_0_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_dest_data_out_15_0_1 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_dest_data_out_15_0_2 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;



    component acl_fp_convert_with_rounding_64 is
        generic (
            ROUNDING_MODE : INTEGER := 2;
            UNSIGNED : INTEGER := 0
        );
        port (
            dataa : in std_logic_vector(31 downto 0);
            enable : in std_logic;
            stall_in : in std_logic;
            valid_in : in std_logic;
            result : out std_logic_vector(63 downto 0);
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;




    component floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA0Z4ce2a150g24ad2045eny is
        port (
            in_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            out_primWireOut : out std_logic_vector(31 downto 0);  -- Floating Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;




    component floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA1Z4ce2a150g24ad2045eny is
        port (
            in_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            out_primWireOut : out std_logic_vector(31 downto 0);  -- Floating Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;







    component floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA0Ze2a150g24ad20454ck5u is
        port (
            in_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_primWireOut : out std_logic_vector(31 downto 0);  -- Floating Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;










    component floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA0Zcpq6c0ouqqcd06uqrcz0 is
        port (
            in_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            out_primWireOut : out std_logic_vector(31 downto 0);  -- Floating Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;







    component i_ffwd_dst_acl_3172609_gmm_substract2751 is
        port (
            in_intel_reserved_ffwd_17_0 : in std_logic_vector(19 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_17_0 : out std_logic_vector(19 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_3242610_gmm_substract2759 is
        port (
            in_intel_reserved_ffwd_18_0 : in std_logic_vector(19 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_18_0 : out std_logic_vector(19 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_3272611_gmm_substract2755 is
        port (
            in_intel_reserved_ffwd_19_0 : in std_logic_vector(19 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_19_0 : out std_logic_vector(19 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_3722629_gmm_substract2741 is
        port (
            in_intel_reserved_ffwd_29_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_29_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_3732630_gmm_substract2876 is
        port (
            in_intel_reserved_ffwd_30_0 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_30_0 : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_acl_3762632_gmm_substract2872 is
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


    component i_ffwd_dst_acl_3772639_gmm_substract2693 is
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


    component i_ffwd_dst_acl_3892686_gmm_substract2731 is
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


    component i_ffwd_dst_acl_3972690_gmm_substract2701 is
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


    component i_ffwd_dst_acl_4002697_gmm_substract2737 is
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


    component i_ffwd_dst_acl_4032702_gmm_substract2725 is
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


    component i_ffwd_dst_b_12781_gmm_substract2749 is
        port (
            in_intel_reserved_ffwd_92_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_92_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_cmp_i_i_i2792633_gmm_substract2797 is
        port (
            in_intel_reserved_ffwd_32_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_32_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_cmp_i_i_i2792634_gmm_substract2793 is
        port (
            in_intel_reserved_ffwd_32_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_32_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_cmp_i_i_i2792635_gmm_substract2789 is
        port (
            in_intel_reserved_ffwd_32_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_32_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_cmp_i_i_i2792636_gmm_substract2785 is
        port (
            in_intel_reserved_ffwd_32_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_32_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_cmp_i_i_i2792637_gmm_substract2775 is
        port (
            in_intel_reserved_ffwd_32_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_32_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_cmp_i_i_i279_12648_gmm_substract2810 is
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


    component i_ffwd_dst_cmp_i_i_i279_12650_gmm_substract2675 is
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


    component i_ffwd_dst_cmp_i_i_i279_12651_gmm_substract2681 is
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


    component i_ffwd_dst_cmp_i_i_i279_12652_gmm_substract2687 is
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


    component i_ffwd_dst_cmp_i_i_i279_12653_gmm_substract2695 is
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


    component i_ffwd_dst_cmp_i_i_i279_12654_gmm_substract2699 is
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


    component i_ffwd_dst_cmp_i_i_i279_12655_gmm_substract2705 is
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


    component i_ffwd_dst_cmp_i_i_i279_12656_gmm_substract2711 is
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


    component i_ffwd_dst_cmp_i_i_i279_12657_gmm_substract2717 is
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


    component i_ffwd_dst_cmp_i_i_i279_12658_gmm_substract2723 is
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


    component i_ffwd_dst_cmp_i_i_i279_12659_gmm_substract2729 is
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


    component i_ffwd_dst_cmp_i_i_i279_12660_gmm_substract2735 is
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


    component i_ffwd_dst_cmp_i_i_i279_12661_gmm_substract2743 is
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


    component i_ffwd_dst_cmp_i_i_i279_12662_gmm_substract2747 is
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


    component i_ffwd_dst_cmp_i_i_i279_12664_gmm_substract2835 is
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


    component i_ffwd_dst_cmp_i_i_i279_12665_gmm_substract2829 is
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


    component i_ffwd_dst_cmp_i_i_i279_12666_gmm_substract2823 is
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


    component i_ffwd_dst_cmp_i_i_i279_12667_gmm_substract2819 is
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


    component i_ffwd_dst_cmp_i_i_i279_12668_gmm_substract2815 is
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


    component i_ffwd_dst_cmp_i_i_i279_12669_gmm_substract2813 is
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


    component i_ffwd_dst_cmp_i_i_i279_12670_gmm_substract2806 is
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


    component i_ffwd_dst_cmp_i_i_i279_12671_gmm_substract2763 is
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


    component i_ffwd_dst_cmp_i_i_i279_22676_gmm_substract2848 is
        port (
            in_intel_reserved_ffwd_37_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_37_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_cmp_i_i_i279_22677_gmm_substract2869 is
        port (
            in_intel_reserved_ffwd_37_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_37_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_cmp_i_i_i279_22678_gmm_substract2865 is
        port (
            in_intel_reserved_ffwd_37_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_37_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_cmp_i_i_i279_22679_gmm_substract2861 is
        port (
            in_intel_reserved_ffwd_37_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_37_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_cmp_i_i_i279_22680_gmm_substract2857 is
        port (
            in_intel_reserved_ffwd_37_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_37_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_cmp_i_i_i279_22681_gmm_substract2853 is
        port (
            in_intel_reserved_ffwd_37_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_37_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_cmp_i_i_i279_22682_gmm_substract2851 is
        port (
            in_intel_reserved_ffwd_37_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_37_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_cmp_i_i_i279_22683_gmm_substract2846 is
        port (
            in_intel_reserved_ffwd_37_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_37_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_cmp_i_i_i279_22684_gmm_substract2766 is
        port (
            in_intel_reserved_ffwd_37_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_37_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_extract_t22962708_gmm_substract2677 is
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


    component i_ffwd_dst_extract_t23002711_gmm_substract2683 is
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


    component i_ffwd_dst_extract_t23042714_gmm_substract2689 is
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


    component i_ffwd_dst_extract_t23082717_gmm_substract2707 is
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


    component i_ffwd_dst_extract_t23122719_gmm_substract2713 is
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


    component i_ffwd_dst_extract_t23162721_gmm_substract2719 is
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


    component i_ffwd_dst_not_cmp_i_i_i2792645_gmm_substract2781 is
        port (
            in_intel_reserved_ffwd_34_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_34_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_not_cmp_i_i_i2792646_gmm_substract2779 is
        port (
            in_intel_reserved_ffwd_34_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_34_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_not_cmp_i_i_i2792647_gmm_substract2777 is
        port (
            in_intel_reserved_ffwd_34_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_34_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_select5442737_gmm_substract2837 is
        port (
            in_intel_reserved_ffwd_56_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_56_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_select5502738_gmm_substract2679 is
        port (
            in_intel_reserved_ffwd_57_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_57_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_select5562739_gmm_substract2685 is
        port (
            in_intel_reserved_ffwd_58_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_58_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_select5622740_gmm_substract2691 is
        port (
            in_intel_reserved_ffwd_59_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_59_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_select5682741_gmm_substract2697 is
        port (
            in_intel_reserved_ffwd_60_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_60_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_select5742742_gmm_substract2703 is
        port (
            in_intel_reserved_ffwd_61_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_61_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_select5802743_gmm_substract2709 is
        port (
            in_intel_reserved_ffwd_62_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_62_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_select5862744_gmm_substract2715 is
        port (
            in_intel_reserved_ffwd_63_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_63_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_select5922745_gmm_substract2721 is
        port (
            in_intel_reserved_ffwd_64_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_64_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_select5982746_gmm_substract2825 is
        port (
            in_intel_reserved_ffwd_65_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_65_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_select6042747_gmm_substract2831 is
        port (
            in_intel_reserved_ffwd_66_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_66_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_select6102748_gmm_substract2733 is
        port (
            in_intel_reserved_ffwd_67_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_67_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_select6162749_gmm_substract2745 is
        port (
            in_intel_reserved_ffwd_68_0 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_68_0 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_select6222750_gmm_substract2727 is
        port (
            in_intel_reserved_ffwd_69_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_69_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_select6282752_gmm_substract2808 is
        port (
            in_intel_reserved_ffwd_70_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_70_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_select6282753_gmm_substract2739 is
        port (
            in_intel_reserved_ffwd_70_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_70_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_unnamed_gmm_substract100_gmm_substract2773 is
        port (
            in_intel_reserved_ffwd_4_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_4_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_unnamed_gmm_substract101_gmm_substract2783 is
        port (
            in_intel_reserved_ffwd_3_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_3_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_unnamed_gmm_substract102_gmm_substract2787 is
        port (
            in_intel_reserved_ffwd_2_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_2_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_unnamed_gmm_substract103_gmm_substract2791 is
        port (
            in_intel_reserved_ffwd_1_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_1_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_unnamed_gmm_substract104_gmm_substract2795 is
        port (
            in_intel_reserved_ffwd_0_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_0_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_unnamed_gmm_substract105_gmm_substract2804 is
        port (
            in_intel_reserved_ffwd_9_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_9_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_unnamed_gmm_substract106_gmm_substract2817 is
        port (
            in_intel_reserved_ffwd_8_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_8_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_unnamed_gmm_substract107_gmm_substract2821 is
        port (
            in_intel_reserved_ffwd_7_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_7_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_unnamed_gmm_substract108_gmm_substract2827 is
        port (
            in_intel_reserved_ffwd_6_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_6_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_unnamed_gmm_substract109_gmm_substract2833 is
        port (
            in_intel_reserved_ffwd_5_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_5_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_unnamed_gmm_substract110_gmm_substract2844 is
        port (
            in_intel_reserved_ffwd_14_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_14_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_unnamed_gmm_substract111_gmm_substract2855 is
        port (
            in_intel_reserved_ffwd_13_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_13_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_unnamed_gmm_substract112_gmm_substract2859 is
        port (
            in_intel_reserved_ffwd_12_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_12_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_unnamed_gmm_substract113_gmm_substract2863 is
        port (
            in_intel_reserved_ffwd_11_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_11_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_ffwd_dst_unnamed_gmm_substract114_gmm_substract2867 is
        port (
            in_intel_reserved_ffwd_10_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_dest_data_out_10_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA1Zcpq6c0ouqqcd06uqrcz0 is
        port (
            in_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            out_primWireOut : out std_logic_vector(31 downto 0);  -- Floating Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;







    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_acl_462_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bgTrunc_i_acl_476_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bgTrunc_i_phitmp1790_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_0_constMult_x_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_1_constMult_x_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_2_constMult_x_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_3_constMult_x_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_4_constMult_x_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_3172609_zext_to_i32_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_3242610_zext_to_i32_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_3272611_zext_to_i32_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_ffwd_dst_unnamed_gmm_substract115_gmm_substract_aunroll_x_out_dest_data_out_16_0_0 : STD_LOGIC_VECTOR (5 downto 0);
    signal i_ffwd_dst_unnamed_gmm_substract116_gmm_substract_aunroll_x_out_dest_data_out_15_0_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_unnamed_gmm_substract116_gmm_substract_aunroll_x_out_dest_data_out_15_0_1 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_unnamed_gmm_substract116_gmm_substract_aunroll_x_out_dest_data_out_15_0_2 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_p_max_idx_3_1_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_select498_zext_to_i32_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_select501_zext_to_i32_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_select519_zext_to_i32_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_select522_zext_to_i32_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_select525_zext_to_i32_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_select528_zext_to_i32_gmm_substract_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_gmm_substract2769_sel_x_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_unnamed_gmm_substract2772_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_unnamed_gmm_substract2800_sel_x_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_unnamed_gmm_substract2803_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_unnamed_gmm_substract2812_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_unnamed_gmm_substract2840_sel_x_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_unnamed_gmm_substract2843_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_unnamed_gmm_substract2850_sel_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal c_float_0_000000e_00_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_float_0x401921FB60000000_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i10_0gr_q : STD_LOGIC_VECTOR (9 downto 0);
    signal c_i10_1gr_q : STD_LOGIC_VECTOR (9 downto 0);
    signal c_i16_3969_q : STD_LOGIC_VECTOR (15 downto 0);
    signal c_i16_9gr_q : STD_LOGIC_VECTOR (15 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_2139095040_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_2147483648_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_2gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i8_1gr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal c_i8_3gr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal c_i8_63_q : STD_LOGIC_VECTOR (7 downto 0);
    signal constMult_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_3172609_zext_to_i32_gmm_substract_vt_const_31_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_acl_3172609_zext_to_i32_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_3172609_zext_to_i32_gmm_substract_vt_select_19_b : STD_LOGIC_VECTOR (19 downto 0);
    signal i_acl_3242610_zext_to_i32_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_3242610_zext_to_i32_gmm_substract_vt_select_19_b : STD_LOGIC_VECTOR (19 downto 0);
    signal i_acl_3272611_zext_to_i32_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_3272611_zext_to_i32_gmm_substract_vt_select_19_b : STD_LOGIC_VECTOR (19 downto 0);
    signal i_acl_443_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_443_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_443_gmm_substract_vt_const_31_q : STD_LOGIC_VECTOR (29 downto 0);
    signal i_acl_443_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_443_gmm_substract_vt_select_1_b : STD_LOGIC_VECTOR (1 downto 0);
    signal i_acl_444_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_444_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_445_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_445_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_446_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_446_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_447_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_448_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_448_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_449_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_449_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_453_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_453_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_454_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_454_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_455_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_455_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_456_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_456_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_457_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_457_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_458_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_458_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_462_gmm_substract_a : STD_LOGIC_VECTOR (8 downto 0);
    signal i_acl_462_gmm_substract_b : STD_LOGIC_VECTOR (8 downto 0);
    signal i_acl_462_gmm_substract_o : STD_LOGIC_VECTOR (8 downto 0);
    signal i_acl_462_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_acl_463_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_463_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_464_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_465_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_465_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_466_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_466_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_467_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_467_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_468_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_468_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_469_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_469_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_470_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_470_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_471_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_471_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_472_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_472_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_476_gmm_substract_a : STD_LOGIC_VECTOR (8 downto 0);
    signal i_acl_476_gmm_substract_b : STD_LOGIC_VECTOR (8 downto 0);
    signal i_acl_476_gmm_substract_o : STD_LOGIC_VECTOR (8 downto 0);
    signal i_acl_476_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_acl_477_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_477_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_478_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_479_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_479_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_480_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_480_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_481_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_481_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_482_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_482_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_483_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_483_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_484_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_484_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_485_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_485_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_convert_fptosi_64_fsi1_gmm_substract_dataa : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_convert_fptosi_64_fsi1_gmm_substract_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_fptosi_64_fsi1_gmm_substract_enable_bitsignaltemp : std_logic;
    signal i_acl_convert_fptosi_64_fsi1_gmm_substract_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_fptosi_64_fsi1_gmm_substract_stall_in_bitsignaltemp : std_logic;
    signal i_acl_convert_fptosi_64_fsi1_gmm_substract_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_fptosi_64_fsi1_gmm_substract_valid_in_bitsignaltemp : std_logic;
    signal i_acl_convert_fptosi_64_fsi1_gmm_substract_result : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_convert_fptosi_64_fsi2_gmm_substract_dataa : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_convert_fptosi_64_fsi2_gmm_substract_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_fptosi_64_fsi2_gmm_substract_enable_bitsignaltemp : std_logic;
    signal i_acl_convert_fptosi_64_fsi2_gmm_substract_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_fptosi_64_fsi2_gmm_substract_stall_in_bitsignaltemp : std_logic;
    signal i_acl_convert_fptosi_64_fsi2_gmm_substract_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_fptosi_64_fsi2_gmm_substract_valid_in_bitsignaltemp : std_logic;
    signal i_acl_convert_fptosi_64_fsi2_gmm_substract_result : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_convert_fptosi_64_fsi_gmm_substract_dataa : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_convert_fptosi_64_fsi_gmm_substract_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_fptosi_64_fsi_gmm_substract_enable_bitsignaltemp : std_logic;
    signal i_acl_convert_fptosi_64_fsi_gmm_substract_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_fptosi_64_fsi_gmm_substract_stall_in_bitsignaltemp : std_logic;
    signal i_acl_convert_fptosi_64_fsi_gmm_substract_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_fptosi_64_fsi_gmm_substract_valid_in_bitsignaltemp : std_logic;
    signal i_acl_convert_fptosi_64_fsi_gmm_substract_result : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_expf_call_i69_1_gmm_substract_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_expf_call_i69_2_gmm_substract_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_expf_call_i69_gmm_substract_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sqrtf_call_i86_1_gmm_substract_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sqrtf_call_i86_2_gmm_substract_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sqrtf_call_i86_gmm_substract_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sqrtf_call_i_1_gmm_substract_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sqrtf_call_i_2_gmm_substract_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sqrtf_call_i_gmm_substract_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and_i1784_1_gmm_substract_q : STD_LOGIC_VECTOR (9 downto 0);
    signal i_and_i1784_1_gmm_substract_vt_const_9_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_and_i1784_1_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (9 downto 0);
    signal i_and_i1784_1_gmm_substract_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_and_i1784_2_gmm_substract_q : STD_LOGIC_VECTOR (9 downto 0);
    signal i_and_i1784_2_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (9 downto 0);
    signal i_and_i1784_2_gmm_substract_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_and_i1784_gmm_substract_q : STD_LOGIC_VECTOR (9 downto 0);
    signal i_and_i1784_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (9 downto 0);
    signal i_and_i1784_gmm_substract_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_and_i_i71_1_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and_i_i71_1_gmm_substract_vt_const_22_q : STD_LOGIC_VECTOR (22 downto 0);
    signal i_and_i_i71_1_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and_i_i71_1_gmm_substract_vt_select_30_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_and_i_i71_2_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and_i_i71_2_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and_i_i71_2_gmm_substract_vt_select_30_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_and_i_i71_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and_i_i71_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and_i_i71_gmm_substract_vt_select_30_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_and_i_i88_1_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and_i_i88_1_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and_i_i88_1_gmm_substract_vt_select_30_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_and_i_i88_2_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and_i_i88_2_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and_i_i88_2_gmm_substract_vt_select_30_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_and_i_i88_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and_i_i88_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and_i_i88_gmm_substract_vt_select_30_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_and_i_i_1_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and_i_i_1_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and_i_i_1_gmm_substract_vt_select_30_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_and_i_i_2_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and_i_i_2_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and_i_i_2_gmm_substract_vt_select_30_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_and_i_i_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and_i_i_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and_i_i_gmm_substract_vt_select_30_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_astype1_i_i75_1_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_astype1_i_i75_1_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_astype1_i_i75_2_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_astype1_i_i75_2_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_astype1_i_i75_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_astype1_i_i75_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_astype1_i_i92_1_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_astype1_i_i92_1_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_astype1_i_i92_2_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_astype1_i_i92_2_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_astype1_i_i92_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_astype1_i_i92_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_cmp848_gmm_substract_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp848_gmm_substract_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp848_gmm_substract_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp848_gmm_substract_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i44_1_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i44_1_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i44_2_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i44_2_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i44_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i44_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i72_1_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i72_1_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i72_2_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i72_2_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i72_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i72_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i89_1_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i89_1_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i89_2_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i89_2_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i89_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i89_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i_i53_1_gmm_substract_a : STD_LOGIC_VECTOR (17 downto 0);
    signal i_cmp_i_i_i53_1_gmm_substract_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_cmp_i_i_i53_1_gmm_substract_o : STD_LOGIC_VECTOR (17 downto 0);
    signal i_cmp_i_i_i53_1_gmm_substract_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i_i53_2_gmm_substract_a : STD_LOGIC_VECTOR (17 downto 0);
    signal i_cmp_i_i_i53_2_gmm_substract_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_cmp_i_i_i53_2_gmm_substract_o : STD_LOGIC_VECTOR (17 downto 0);
    signal i_cmp_i_i_i53_2_gmm_substract_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i_i53_gmm_substract_a : STD_LOGIC_VECTOR (17 downto 0);
    signal i_cmp_i_i_i53_gmm_substract_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_cmp_i_i_i53_gmm_substract_o : STD_LOGIC_VECTOR (17 downto 0);
    signal i_cmp_i_i_i53_gmm_substract_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i_i57_1_gmm_substract_a : STD_LOGIC_VECTOR (17 downto 0);
    signal i_cmp_i_i_i57_1_gmm_substract_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_cmp_i_i_i57_1_gmm_substract_o : STD_LOGIC_VECTOR (17 downto 0);
    signal i_cmp_i_i_i57_1_gmm_substract_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i_i57_2_gmm_substract_a : STD_LOGIC_VECTOR (17 downto 0);
    signal i_cmp_i_i_i57_2_gmm_substract_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_cmp_i_i_i57_2_gmm_substract_o : STD_LOGIC_VECTOR (17 downto 0);
    signal i_cmp_i_i_i57_2_gmm_substract_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp_i_i_i57_gmm_substract_a : STD_LOGIC_VECTOR (17 downto 0);
    signal i_cmp_i_i_i57_gmm_substract_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_cmp_i_i_i57_gmm_substract_o : STD_LOGIC_VECTOR (17 downto 0);
    signal i_cmp_i_i_i57_gmm_substract_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_conv2_i_i_i_1_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_conv2_i_i_i_1_gmm_substract_q : STD_LOGIC_VECTOR (9 downto 0);
    signal i_conv2_i_i_i_2_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_conv2_i_i_i_2_gmm_substract_q : STD_LOGIC_VECTOR (9 downto 0);
    signal i_conv2_i_i_i_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_conv2_i_i_i_gmm_substract_q : STD_LOGIC_VECTOR (9 downto 0);
    signal i_conv797_1_gmm_substract_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv797_2_gmm_substract_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv797_gmm_substract_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv802_1_gmm_substract_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv802_2_gmm_substract_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv802_gmm_substract_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv813_1_gmm_substract_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv813_2_gmm_substract_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv813_gmm_substract_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_div816_1_gmm_substract_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_div816_2_gmm_substract_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_div816_gmm_substract_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_div_1_gmm_substract_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_div_2_gmm_substract_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_div_gmm_substract_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_ffwd_dst_acl_3172609_gmm_substract_out_dest_data_out_17_0 : STD_LOGIC_VECTOR (19 downto 0);
    signal i_ffwd_dst_acl_3242610_gmm_substract_out_dest_data_out_18_0 : STD_LOGIC_VECTOR (19 downto 0);
    signal i_ffwd_dst_acl_3272611_gmm_substract_out_dest_data_out_19_0 : STD_LOGIC_VECTOR (19 downto 0);
    signal i_ffwd_dst_acl_3722629_gmm_substract_out_dest_data_out_29_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_ffwd_dst_acl_3732630_gmm_substract_out_dest_data_out_30_0 : STD_LOGIC_VECTOR (5 downto 0);
    signal i_ffwd_dst_acl_3762632_gmm_substract_out_dest_data_out_31_0 : STD_LOGIC_VECTOR (1 downto 0);
    signal i_ffwd_dst_acl_3772639_gmm_substract_out_dest_data_out_33_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_ffwd_dst_acl_3892686_gmm_substract_out_dest_data_out_38_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_ffwd_dst_acl_3972690_gmm_substract_out_dest_data_out_39_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_acl_4002697_gmm_substract_out_dest_data_out_40_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_acl_4032702_gmm_substract_out_dest_data_out_41_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_b_12781_gmm_substract_out_dest_data_out_92_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_ffwd_dst_cmp_i_i_i2792633_gmm_substract_out_dest_data_out_32_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i2792634_gmm_substract_out_dest_data_out_32_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i2792635_gmm_substract_out_dest_data_out_32_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i2792636_gmm_substract_out_dest_data_out_32_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i2792637_gmm_substract_out_dest_data_out_32_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_12648_gmm_substract_out_dest_data_out_35_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_12650_gmm_substract_out_dest_data_out_35_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_12651_gmm_substract_out_dest_data_out_35_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_12652_gmm_substract_out_dest_data_out_35_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_12653_gmm_substract_out_dest_data_out_35_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_12654_gmm_substract_out_dest_data_out_35_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_12655_gmm_substract_out_dest_data_out_35_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_12656_gmm_substract_out_dest_data_out_35_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_12657_gmm_substract_out_dest_data_out_35_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_12658_gmm_substract_out_dest_data_out_35_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_12659_gmm_substract_out_dest_data_out_35_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_12660_gmm_substract_out_dest_data_out_35_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_12661_gmm_substract_out_dest_data_out_35_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_12662_gmm_substract_out_dest_data_out_35_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_12664_gmm_substract_out_dest_data_out_35_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_12665_gmm_substract_out_dest_data_out_35_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_12666_gmm_substract_out_dest_data_out_35_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_12667_gmm_substract_out_dest_data_out_35_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_12668_gmm_substract_out_dest_data_out_35_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_12669_gmm_substract_out_dest_data_out_35_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_12670_gmm_substract_out_dest_data_out_35_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_12671_gmm_substract_out_dest_data_out_35_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_22676_gmm_substract_out_dest_data_out_37_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_22677_gmm_substract_out_dest_data_out_37_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_22678_gmm_substract_out_dest_data_out_37_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_22679_gmm_substract_out_dest_data_out_37_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_22680_gmm_substract_out_dest_data_out_37_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_22681_gmm_substract_out_dest_data_out_37_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_22682_gmm_substract_out_dest_data_out_37_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_22683_gmm_substract_out_dest_data_out_37_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_cmp_i_i_i279_22684_gmm_substract_out_dest_data_out_37_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_extract_t22962708_gmm_substract_out_dest_data_out_43_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_extract_t23002711_gmm_substract_out_dest_data_out_44_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_extract_t23042714_gmm_substract_out_dest_data_out_45_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_extract_t23082717_gmm_substract_out_dest_data_out_46_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_extract_t23122719_gmm_substract_out_dest_data_out_47_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_extract_t23162721_gmm_substract_out_dest_data_out_48_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_not_cmp_i_i_i2792645_gmm_substract_out_dest_data_out_34_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_not_cmp_i_i_i2792646_gmm_substract_out_dest_data_out_34_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_not_cmp_i_i_i2792647_gmm_substract_out_dest_data_out_34_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_ffwd_dst_select5442737_gmm_substract_out_dest_data_out_56_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_select5502738_gmm_substract_out_dest_data_out_57_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_select5562739_gmm_substract_out_dest_data_out_58_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_select5622740_gmm_substract_out_dest_data_out_59_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_select5682741_gmm_substract_out_dest_data_out_60_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_ffwd_dst_select5742742_gmm_substract_out_dest_data_out_61_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_select5802743_gmm_substract_out_dest_data_out_62_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_select5862744_gmm_substract_out_dest_data_out_63_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_select5922745_gmm_substract_out_dest_data_out_64_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_select5982746_gmm_substract_out_dest_data_out_65_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_select6042747_gmm_substract_out_dest_data_out_66_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_select6102748_gmm_substract_out_dest_data_out_67_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_ffwd_dst_select6162749_gmm_substract_out_dest_data_out_68_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_ffwd_dst_select6222750_gmm_substract_out_dest_data_out_69_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_select6282752_gmm_substract_out_dest_data_out_70_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_select6282753_gmm_substract_out_dest_data_out_70_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_unnamed_gmm_substract100_gmm_substract_out_dest_data_out_4_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_unnamed_gmm_substract101_gmm_substract_out_dest_data_out_3_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_unnamed_gmm_substract102_gmm_substract_out_dest_data_out_2_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_unnamed_gmm_substract103_gmm_substract_out_dest_data_out_1_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_unnamed_gmm_substract104_gmm_substract_out_dest_data_out_0_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_unnamed_gmm_substract105_gmm_substract_out_dest_data_out_9_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_unnamed_gmm_substract106_gmm_substract_out_dest_data_out_8_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_unnamed_gmm_substract107_gmm_substract_out_dest_data_out_7_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_unnamed_gmm_substract108_gmm_substract_out_dest_data_out_6_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_unnamed_gmm_substract109_gmm_substract_out_dest_data_out_5_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_unnamed_gmm_substract110_gmm_substract_out_dest_data_out_14_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_unnamed_gmm_substract111_gmm_substract_out_dest_data_out_13_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_unnamed_gmm_substract112_gmm_substract_out_dest_data_out_12_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_unnamed_gmm_substract113_gmm_substract_out_dest_data_out_11_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_ffwd_dst_unnamed_gmm_substract114_gmm_substract_out_dest_data_out_10_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_mul808_1_gmm_substract_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul808_2_gmm_substract_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul808_gmm_substract_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul815_1_gmm_substract_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul815_2_gmm_substract_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul815_gmm_substract_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_negate_sign193_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_negate_sign196_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_negate_sign_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_not_cmp_i_i_i53_1_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_not_cmp_i_i_i53_2_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_not_cmp_i_i_i53_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_not_cmp_i_i_i57_1_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_not_cmp_i_i_i57_2_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_not_cmp_i_i_i57_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_p_max_3_1_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_p_max_3_1_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_p_max_idx_3_1_gmm_substract_gmm_substract2765_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_p_max_idx_3_1_gmm_substract_gmm_substract2765_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_p_max_idx_3_1_gmm_substract_gmm_substract2765_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_p_max_idx_3_1_gmm_substract_gmm_substract2765_vt_select_1_b : STD_LOGIC_VECTOR (1 downto 0);
    signal i_p_max_idx_3_1_gmm_substract_vt_const_31_q : STD_LOGIC_VECTOR (30 downto 0);
    signal i_p_max_idx_3_1_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_p_max_idx_3_1_gmm_substract_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_phitmp1787_1_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_phitmp1787_1_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_phitmp1787_2_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_phitmp1787_2_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_phitmp1787_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_phitmp1787_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_phitmp1790_1_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_phitmp1790_1_gmm_substract_vt_const_7_q : STD_LOGIC_VECTOR (6 downto 0);
    signal i_phitmp1790_1_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_phitmp1790_1_gmm_substract_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_phitmp1790_2_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_phitmp1790_2_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_phitmp1790_2_gmm_substract_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_phitmp1790_gmm_substract_a : STD_LOGIC_VECTOR (8 downto 0);
    signal i_phitmp1790_gmm_substract_b : STD_LOGIC_VECTOR (8 downto 0);
    signal i_phitmp1790_gmm_substract_o : STD_LOGIC_VECTOR (8 downto 0);
    signal i_phitmp1790_gmm_substract_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_reduction_gmm_substract_77_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_77_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_78_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_79_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_80_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_81_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_82_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_83_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_84_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_gmm_substract_85_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select489_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select489_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select492_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select492_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select495_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select495_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select498_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select498_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_select498_zext_to_i32_gmm_substract_vt_const_31_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_select498_zext_to_i32_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_select498_zext_to_i32_gmm_substract_vt_select_15_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_select501_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select501_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select501_zext_to_i32_gmm_substract_vt_const_31_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_select501_zext_to_i32_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_select501_zext_to_i32_gmm_substract_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select504_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select504_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select507_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select507_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select510_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select510_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select519_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select519_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select519_zext_to_i32_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_select519_zext_to_i32_gmm_substract_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select522_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select522_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_select522_zext_to_i32_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_select522_zext_to_i32_gmm_substract_vt_select_15_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_select525_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select525_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select525_zext_to_i32_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_select525_zext_to_i32_gmm_substract_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_select528_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select528_gmm_substract_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_select528_zext_to_i32_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_select528_zext_to_i32_gmm_substract_vt_select_15_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_select531_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select531_gmm_substract_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_shr_i_i29_1_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (9 downto 0);
    signal i_shr_i_i29_1_gmm_substract_vt_select_8_b : STD_LOGIC_VECTOR (8 downto 0);
    signal i_shr_i_i29_2_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (9 downto 0);
    signal i_shr_i_i29_2_gmm_substract_vt_select_8_b : STD_LOGIC_VECTOR (8 downto 0);
    signal i_shr_i_i29_gmm_substract_vt_join_q : STD_LOGIC_VECTOR (9 downto 0);
    signal i_shr_i_i29_gmm_substract_vt_select_8_b : STD_LOGIC_VECTOR (8 downto 0);
    signal i_unnamed_gmm_substract2812_vt_join_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_unnamed_gmm_substract2812_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gmm_substract2850_vt_join_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_unnamed_gmm_substract2850_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid554_i_cmp838_1_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstAllZWE_uid556_i_cmp838_1_gmm_substract_q : STD_LOGIC_VECTOR (7 downto 0);
    signal exp_x_uid557_i_cmp838_1_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_x_uid558_i_cmp838_1_gmm_substract_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expXIsZero_uid559_i_cmp838_1_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid560_i_cmp838_1_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid561_i_cmp838_1_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid562_i_cmp838_1_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid563_i_cmp838_1_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid563_i_cmp838_1_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid565_i_cmp838_1_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid565_i_cmp838_1_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_y_uid574_i_cmp838_1_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_y_uid575_i_cmp838_1_gmm_substract_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expXIsZero_uid576_i_cmp838_1_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid577_i_cmp838_1_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid578_i_cmp838_1_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid579_i_cmp838_1_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid580_i_cmp838_1_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid580_i_cmp838_1_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid582_i_cmp838_1_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid582_i_cmp838_1_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid588_i_cmp838_1_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid588_i_cmp838_1_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracX_uid593_i_cmp838_1_gmm_substract_q : STD_LOGIC_VECTOR (30 downto 0);
    signal expFracY_uid595_i_cmp838_1_gmm_substract_q : STD_LOGIC_VECTOR (30 downto 0);
    signal efxGTefy_uid597_i_cmp838_1_gmm_substract_a : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid597_i_cmp838_1_gmm_substract_b : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid597_i_cmp838_1_gmm_substract_o : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid597_i_cmp838_1_gmm_substract_c : STD_LOGIC_VECTOR (0 downto 0);
    signal efxLTefy_uid598_i_cmp838_1_gmm_substract_a : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid598_i_cmp838_1_gmm_substract_b : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid598_i_cmp838_1_gmm_substract_o : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid598_i_cmp838_1_gmm_substract_c : STD_LOGIC_VECTOR (0 downto 0);
    signal signX_uid602_i_cmp838_1_gmm_substract_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid603_i_cmp838_1_gmm_substract_b : STD_LOGIC_VECTOR (0 downto 0);
    signal two_uid604_i_cmp838_1_gmm_substract_q : STD_LOGIC_VECTOR (1 downto 0);
    signal concSXSY_uid605_i_cmp838_1_gmm_substract_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sxLTsy_uid606_i_cmp838_1_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xorSigns_uid607_i_cmp838_1_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsy_uid608_i_cmp838_1_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracCompMux_uid609_i_cmp838_1_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracCompMux_uid609_i_cmp838_1_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcYZ_uid610_i_cmp838_1_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcXZ_uid611_i_cmp838_1_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneNonZero_uid612_i_cmp838_1_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rc2_uid613_i_cmp838_1_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsyExpFracCompMux_uid614_i_cmp838_1_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid615_i_cmp838_1_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid615_i_cmp838_1_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rPostExc_uid616_i_cmp838_1_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rPostExc_uid616_i_cmp838_1_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_x_uid621_i_cmp838_2_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_x_uid622_i_cmp838_2_gmm_substract_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expXIsZero_uid623_i_cmp838_2_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid624_i_cmp838_2_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid625_i_cmp838_2_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid626_i_cmp838_2_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid627_i_cmp838_2_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid627_i_cmp838_2_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid629_i_cmp838_2_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid629_i_cmp838_2_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_y_uid638_i_cmp838_2_gmm_substract_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_y_uid639_i_cmp838_2_gmm_substract_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expXIsZero_uid640_i_cmp838_2_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid641_i_cmp838_2_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid642_i_cmp838_2_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid643_i_cmp838_2_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid644_i_cmp838_2_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid644_i_cmp838_2_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid646_i_cmp838_2_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid646_i_cmp838_2_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid652_i_cmp838_2_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid652_i_cmp838_2_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracX_uid657_i_cmp838_2_gmm_substract_q : STD_LOGIC_VECTOR (30 downto 0);
    signal expFracY_uid659_i_cmp838_2_gmm_substract_q : STD_LOGIC_VECTOR (30 downto 0);
    signal efxGTefy_uid661_i_cmp838_2_gmm_substract_a : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid661_i_cmp838_2_gmm_substract_b : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid661_i_cmp838_2_gmm_substract_o : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid661_i_cmp838_2_gmm_substract_c : STD_LOGIC_VECTOR (0 downto 0);
    signal efxLTefy_uid662_i_cmp838_2_gmm_substract_a : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid662_i_cmp838_2_gmm_substract_b : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid662_i_cmp838_2_gmm_substract_o : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid662_i_cmp838_2_gmm_substract_c : STD_LOGIC_VECTOR (0 downto 0);
    signal signX_uid666_i_cmp838_2_gmm_substract_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid667_i_cmp838_2_gmm_substract_b : STD_LOGIC_VECTOR (0 downto 0);
    signal concSXSY_uid669_i_cmp838_2_gmm_substract_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sxLTsy_uid670_i_cmp838_2_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xorSigns_uid671_i_cmp838_2_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsy_uid672_i_cmp838_2_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracCompMux_uid673_i_cmp838_2_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracCompMux_uid673_i_cmp838_2_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcYZ_uid674_i_cmp838_2_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcXZ_uid675_i_cmp838_2_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneNonZero_uid676_i_cmp838_2_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rc2_uid677_i_cmp838_2_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsyExpFracCompMux_uid678_i_cmp838_2_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid679_i_cmp838_2_gmm_substract_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid679_i_cmp838_2_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rPostExc_uid680_i_cmp838_2_gmm_substract_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rPostExc_uid680_i_cmp838_2_gmm_substract_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx1Rng1_uid685_i_shr_i_i29_1_gmm_substract_gmm_substract2802_shift_x_b : STD_LOGIC_VECTOR (8 downto 0);
    signal rightShiftStage0Idx1_uid687_i_shr_i_i29_1_gmm_substract_gmm_substract2802_shift_x_q : STD_LOGIC_VECTOR (9 downto 0);
    signal rightShiftStage0_uid689_i_shr_i_i29_1_gmm_substract_gmm_substract2802_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid689_i_shr_i_i29_1_gmm_substract_gmm_substract2802_shift_x_q : STD_LOGIC_VECTOR (9 downto 0);
    signal rightShiftStage0Idx1Rng1_uid694_i_shr_i_i29_2_gmm_substract_gmm_substract2842_shift_x_b : STD_LOGIC_VECTOR (8 downto 0);
    signal rightShiftStage0Idx1_uid696_i_shr_i_i29_2_gmm_substract_gmm_substract2842_shift_x_q : STD_LOGIC_VECTOR (9 downto 0);
    signal rightShiftStage0_uid698_i_shr_i_i29_2_gmm_substract_gmm_substract2842_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid698_i_shr_i_i29_2_gmm_substract_gmm_substract2842_shift_x_q : STD_LOGIC_VECTOR (9 downto 0);
    signal rightShiftStage0Idx1Rng1_uid703_i_shr_i_i29_gmm_substract_gmm_substract2771_shift_x_b : STD_LOGIC_VECTOR (8 downto 0);
    signal rightShiftStage0Idx1_uid705_i_shr_i_i29_gmm_substract_gmm_substract2771_shift_x_q : STD_LOGIC_VECTOR (9 downto 0);
    signal rightShiftStage0_uid707_i_shr_i_i29_gmm_substract_gmm_substract2771_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid707_i_shr_i_i29_gmm_substract_gmm_substract2771_shift_x_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist0_signY_uid667_i_cmp838_2_gmm_substract_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_signX_uid666_i_cmp838_2_gmm_substract_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_frac_x_uid622_i_cmp838_2_gmm_substract_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist3_exp_x_uid621_i_cmp838_2_gmm_substract_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist4_i_phitmp1790_2_gmm_substract_vt_select_0_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_phitmp1790_1_gmm_substract_vt_select_0_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_p_max_idx_3_1_gmm_substract_vt_select_0_b_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_mul815_gmm_substract_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_i_mul815_2_gmm_substract_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_i_mul815_1_gmm_substract_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_i_mul808_gmm_substract_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_i_mul808_2_gmm_substract_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_i_mul808_1_gmm_substract_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_i_div_gmm_substract_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_i_div_2_gmm_substract_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_i_div_1_gmm_substract_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist16_i_div816_gmm_substract_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist17_i_div816_gmm_substract_out_primWireOut_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist18_i_div816_gmm_substract_out_primWireOut_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist19_i_div816_2_gmm_substract_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist20_i_div816_1_gmm_substract_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist21_i_div816_1_gmm_substract_out_primWireOut_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist22_i_div816_1_gmm_substract_out_primWireOut_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_i_conv813_gmm_substract_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist24_i_conv813_2_gmm_substract_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist25_i_conv813_1_gmm_substract_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist26_i_conv802_gmm_substract_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist28_i_conv802_2_gmm_substract_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist30_i_conv802_1_gmm_substract_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist32_i_conv797_gmm_substract_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist33_i_conv797_2_gmm_substract_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist34_i_conv797_1_gmm_substract_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist35_i_cmp_i_i_i57_gmm_substract_c_59_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_i_cmp_i_i_i57_2_gmm_substract_c_60_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_i_cmp_i_i_i57_1_gmm_substract_c_60_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_i_cmp_i_i_i53_gmm_substract_c_59_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_i_cmp_i_i_i53_2_gmm_substract_c_60_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_i_cmp_i_i_i53_1_gmm_substract_c_60_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_i_cmp_i_i44_gmm_substract_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_i_cmp_i_i44_2_gmm_substract_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_i_cmp_i_i44_1_gmm_substract_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist44_i_and_i_i_gmm_substract_vt_select_30_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist45_i_and_i_i_2_gmm_substract_vt_select_30_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist46_i_and_i_i_1_gmm_substract_vt_select_30_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist47_i_acl_sqrtf_call_i86_gmm_substract_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist48_i_acl_sqrtf_call_i86_gmm_substract_out_primWireOut_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist49_i_acl_sqrtf_call_i86_2_gmm_substract_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist50_i_acl_sqrtf_call_i86_2_gmm_substract_out_primWireOut_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist51_i_acl_sqrtf_call_i86_1_gmm_substract_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist52_i_acl_sqrtf_call_i86_1_gmm_substract_out_primWireOut_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist53_i_acl_expf_call_i69_gmm_substract_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist54_i_acl_expf_call_i69_gmm_substract_out_primWireOut_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist55_i_acl_expf_call_i69_2_gmm_substract_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist56_i_acl_expf_call_i69_2_gmm_substract_out_primWireOut_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist57_i_acl_expf_call_i69_1_gmm_substract_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist58_i_acl_expf_call_i69_1_gmm_substract_out_primWireOut_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist60_i_acl_480_gmm_substract_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist63_i_acl_466_gmm_substract_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_i_acl_444_gmm_substract_q_37_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist66_i_acl_443_gmm_substract_vt_select_1_b_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist67_constMult_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist68_sync_in_aunroll_x_in_i_valid_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist69_sync_in_aunroll_x_in_i_valid_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist70_sync_in_aunroll_x_in_i_valid_17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist71_sync_in_aunroll_x_in_i_valid_52_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist72_sync_in_aunroll_x_in_i_valid_53_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist73_sync_in_aunroll_x_in_i_valid_55_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist74_sync_in_aunroll_x_in_i_valid_56_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist75_sync_in_aunroll_x_in_i_valid_60_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist76_sync_in_aunroll_x_in_i_valid_61_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist77_sync_in_aunroll_x_in_i_valid_62_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist78_sync_in_aunroll_x_in_i_valid_64_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist79_sync_in_aunroll_x_in_i_valid_65_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist80_sync_in_aunroll_x_in_i_valid_86_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist81_sync_in_aunroll_x_in_i_valid_89_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist82_sync_in_aunroll_x_in_i_valid_90_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist83_i_unnamed_gmm_substract2843_sel_x_b_2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist84_i_unnamed_gmm_substract2803_sel_x_b_2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist85_i_unnamed_gmm_substract2772_sel_x_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist86_dupName_4_constMult_x_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist87_dupName_3_constMult_x_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist88_dupName_2_constMult_x_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist89_dupName_1_constMult_x_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist90_dupName_0_constMult_x_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist91_bgTrunc_i_phitmp1790_gmm_substract_sel_x_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist27_i_conv802_gmm_substract_out_primWireOut_26_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist27_i_conv802_gmm_substract_out_primWireOut_26_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist27_i_conv802_gmm_substract_out_primWireOut_26_mem_reset0 : std_logic;
    signal redist27_i_conv802_gmm_substract_out_primWireOut_26_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist27_i_conv802_gmm_substract_out_primWireOut_26_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist27_i_conv802_gmm_substract_out_primWireOut_26_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist27_i_conv802_gmm_substract_out_primWireOut_26_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist27_i_conv802_gmm_substract_out_primWireOut_26_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist27_i_conv802_gmm_substract_out_primWireOut_26_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist27_i_conv802_gmm_substract_out_primWireOut_26_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve : boolean;
    attribute preserve of redist27_i_conv802_gmm_substract_out_primWireOut_26_rdcnt_i : signal is true;
    signal redist27_i_conv802_gmm_substract_out_primWireOut_26_rdcnt_eq : std_logic;
    attribute preserve of redist27_i_conv802_gmm_substract_out_primWireOut_26_rdcnt_eq : signal is true;
    signal redist27_i_conv802_gmm_substract_out_primWireOut_26_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist27_i_conv802_gmm_substract_out_primWireOut_26_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist27_i_conv802_gmm_substract_out_primWireOut_26_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist27_i_conv802_gmm_substract_out_primWireOut_26_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_i_conv802_gmm_substract_out_primWireOut_26_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_i_conv802_gmm_substract_out_primWireOut_26_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_i_conv802_gmm_substract_out_primWireOut_26_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_i_conv802_gmm_substract_out_primWireOut_26_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist27_i_conv802_gmm_substract_out_primWireOut_26_sticky_ena_q : signal is true;
    signal redist27_i_conv802_gmm_substract_out_primWireOut_26_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_i_conv802_2_gmm_substract_out_primWireOut_26_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist29_i_conv802_2_gmm_substract_out_primWireOut_26_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist29_i_conv802_2_gmm_substract_out_primWireOut_26_mem_reset0 : std_logic;
    signal redist29_i_conv802_2_gmm_substract_out_primWireOut_26_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist29_i_conv802_2_gmm_substract_out_primWireOut_26_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist29_i_conv802_2_gmm_substract_out_primWireOut_26_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist29_i_conv802_2_gmm_substract_out_primWireOut_26_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist29_i_conv802_2_gmm_substract_out_primWireOut_26_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist29_i_conv802_2_gmm_substract_out_primWireOut_26_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist29_i_conv802_2_gmm_substract_out_primWireOut_26_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of redist29_i_conv802_2_gmm_substract_out_primWireOut_26_rdcnt_i : signal is true;
    signal redist29_i_conv802_2_gmm_substract_out_primWireOut_26_rdcnt_eq : std_logic;
    attribute preserve of redist29_i_conv802_2_gmm_substract_out_primWireOut_26_rdcnt_eq : signal is true;
    signal redist29_i_conv802_2_gmm_substract_out_primWireOut_26_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist29_i_conv802_2_gmm_substract_out_primWireOut_26_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist29_i_conv802_2_gmm_substract_out_primWireOut_26_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist29_i_conv802_2_gmm_substract_out_primWireOut_26_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_i_conv802_2_gmm_substract_out_primWireOut_26_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_i_conv802_2_gmm_substract_out_primWireOut_26_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_i_conv802_2_gmm_substract_out_primWireOut_26_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_i_conv802_2_gmm_substract_out_primWireOut_26_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist29_i_conv802_2_gmm_substract_out_primWireOut_26_sticky_ena_q : signal is true;
    signal redist29_i_conv802_2_gmm_substract_out_primWireOut_26_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_i_conv802_1_gmm_substract_out_primWireOut_26_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist31_i_conv802_1_gmm_substract_out_primWireOut_26_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist31_i_conv802_1_gmm_substract_out_primWireOut_26_mem_reset0 : std_logic;
    signal redist31_i_conv802_1_gmm_substract_out_primWireOut_26_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist31_i_conv802_1_gmm_substract_out_primWireOut_26_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist31_i_conv802_1_gmm_substract_out_primWireOut_26_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist31_i_conv802_1_gmm_substract_out_primWireOut_26_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist31_i_conv802_1_gmm_substract_out_primWireOut_26_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist31_i_conv802_1_gmm_substract_out_primWireOut_26_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist31_i_conv802_1_gmm_substract_out_primWireOut_26_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of redist31_i_conv802_1_gmm_substract_out_primWireOut_26_rdcnt_i : signal is true;
    signal redist31_i_conv802_1_gmm_substract_out_primWireOut_26_rdcnt_eq : std_logic;
    attribute preserve of redist31_i_conv802_1_gmm_substract_out_primWireOut_26_rdcnt_eq : signal is true;
    signal redist31_i_conv802_1_gmm_substract_out_primWireOut_26_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist31_i_conv802_1_gmm_substract_out_primWireOut_26_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist31_i_conv802_1_gmm_substract_out_primWireOut_26_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist31_i_conv802_1_gmm_substract_out_primWireOut_26_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_i_conv802_1_gmm_substract_out_primWireOut_26_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_i_conv802_1_gmm_substract_out_primWireOut_26_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_i_conv802_1_gmm_substract_out_primWireOut_26_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_i_conv802_1_gmm_substract_out_primWireOut_26_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist31_i_conv802_1_gmm_substract_out_primWireOut_26_sticky_ena_q : signal is true;
    signal redist31_i_conv802_1_gmm_substract_out_primWireOut_26_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist59_i_acl_481_gmm_substract_q_24_mem_reset0 : std_logic;
    signal redist59_i_acl_481_gmm_substract_q_24_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist59_i_acl_481_gmm_substract_q_24_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist59_i_acl_481_gmm_substract_q_24_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist59_i_acl_481_gmm_substract_q_24_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist59_i_acl_481_gmm_substract_q_24_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist59_i_acl_481_gmm_substract_q_24_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist59_i_acl_481_gmm_substract_q_24_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of redist59_i_acl_481_gmm_substract_q_24_rdcnt_i : signal is true;
    signal redist59_i_acl_481_gmm_substract_q_24_rdcnt_eq : std_logic;
    attribute preserve of redist59_i_acl_481_gmm_substract_q_24_rdcnt_eq : signal is true;
    signal redist59_i_acl_481_gmm_substract_q_24_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist59_i_acl_481_gmm_substract_q_24_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist59_i_acl_481_gmm_substract_q_24_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist59_i_acl_481_gmm_substract_q_24_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist59_i_acl_481_gmm_substract_q_24_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist59_i_acl_481_gmm_substract_q_24_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist59_i_acl_481_gmm_substract_q_24_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist59_i_acl_481_gmm_substract_q_24_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist59_i_acl_481_gmm_substract_q_24_sticky_ena_q : signal is true;
    signal redist59_i_acl_481_gmm_substract_q_24_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist61_i_acl_472_gmm_substract_q_34_mem_reset0 : std_logic;
    signal redist61_i_acl_472_gmm_substract_q_34_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist61_i_acl_472_gmm_substract_q_34_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist61_i_acl_472_gmm_substract_q_34_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist61_i_acl_472_gmm_substract_q_34_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist61_i_acl_472_gmm_substract_q_34_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist61_i_acl_472_gmm_substract_q_34_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist61_i_acl_472_gmm_substract_q_34_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of redist61_i_acl_472_gmm_substract_q_34_rdcnt_i : signal is true;
    signal redist61_i_acl_472_gmm_substract_q_34_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist61_i_acl_472_gmm_substract_q_34_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist61_i_acl_472_gmm_substract_q_34_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist61_i_acl_472_gmm_substract_q_34_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist61_i_acl_472_gmm_substract_q_34_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist61_i_acl_472_gmm_substract_q_34_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist61_i_acl_472_gmm_substract_q_34_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist61_i_acl_472_gmm_substract_q_34_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist61_i_acl_472_gmm_substract_q_34_sticky_ena_q : signal is true;
    signal redist61_i_acl_472_gmm_substract_q_34_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_i_acl_467_gmm_substract_q_27_mem_reset0 : std_logic;
    signal redist62_i_acl_467_gmm_substract_q_27_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist62_i_acl_467_gmm_substract_q_27_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist62_i_acl_467_gmm_substract_q_27_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist62_i_acl_467_gmm_substract_q_27_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist62_i_acl_467_gmm_substract_q_27_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist62_i_acl_467_gmm_substract_q_27_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist62_i_acl_467_gmm_substract_q_27_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of redist62_i_acl_467_gmm_substract_q_27_rdcnt_i : signal is true;
    signal redist62_i_acl_467_gmm_substract_q_27_rdcnt_eq : std_logic;
    attribute preserve of redist62_i_acl_467_gmm_substract_q_27_rdcnt_eq : signal is true;
    signal redist62_i_acl_467_gmm_substract_q_27_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist62_i_acl_467_gmm_substract_q_27_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist62_i_acl_467_gmm_substract_q_27_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist62_i_acl_467_gmm_substract_q_27_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_i_acl_467_gmm_substract_q_27_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_i_acl_467_gmm_substract_q_27_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_i_acl_467_gmm_substract_q_27_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_i_acl_467_gmm_substract_q_27_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist62_i_acl_467_gmm_substract_q_27_sticky_ena_q : signal is true;
    signal redist62_i_acl_467_gmm_substract_q_27_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist64_i_acl_454_gmm_substract_q_28_mem_reset0 : std_logic;
    signal redist64_i_acl_454_gmm_substract_q_28_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist64_i_acl_454_gmm_substract_q_28_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist64_i_acl_454_gmm_substract_q_28_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist64_i_acl_454_gmm_substract_q_28_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist64_i_acl_454_gmm_substract_q_28_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist64_i_acl_454_gmm_substract_q_28_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist64_i_acl_454_gmm_substract_q_28_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of redist64_i_acl_454_gmm_substract_q_28_rdcnt_i : signal is true;
    signal redist64_i_acl_454_gmm_substract_q_28_rdcnt_eq : std_logic;
    attribute preserve of redist64_i_acl_454_gmm_substract_q_28_rdcnt_eq : signal is true;
    signal redist64_i_acl_454_gmm_substract_q_28_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist64_i_acl_454_gmm_substract_q_28_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist64_i_acl_454_gmm_substract_q_28_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist64_i_acl_454_gmm_substract_q_28_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist64_i_acl_454_gmm_substract_q_28_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist64_i_acl_454_gmm_substract_q_28_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist64_i_acl_454_gmm_substract_q_28_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist64_i_acl_454_gmm_substract_q_28_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist64_i_acl_454_gmm_substract_q_28_sticky_ena_q : signal is true;
    signal redist64_i_acl_454_gmm_substract_q_28_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_i_acl_444_gmm_substract_q_37_split_0_outputreg_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist65_i_acl_444_gmm_substract_q_37_split_0_mem_reset0 : std_logic;
    signal redist65_i_acl_444_gmm_substract_q_37_split_0_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist65_i_acl_444_gmm_substract_q_37_split_0_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist65_i_acl_444_gmm_substract_q_37_split_0_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist65_i_acl_444_gmm_substract_q_37_split_0_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist65_i_acl_444_gmm_substract_q_37_split_0_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist65_i_acl_444_gmm_substract_q_37_split_0_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist65_i_acl_444_gmm_substract_q_37_split_0_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of redist65_i_acl_444_gmm_substract_q_37_split_0_rdcnt_i : signal is true;
    signal redist65_i_acl_444_gmm_substract_q_37_split_0_rdcnt_eq : std_logic;
    attribute preserve of redist65_i_acl_444_gmm_substract_q_37_split_0_rdcnt_eq : signal is true;
    signal redist65_i_acl_444_gmm_substract_q_37_split_0_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist65_i_acl_444_gmm_substract_q_37_split_0_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist65_i_acl_444_gmm_substract_q_37_split_0_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist65_i_acl_444_gmm_substract_q_37_split_0_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_i_acl_444_gmm_substract_q_37_split_0_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_i_acl_444_gmm_substract_q_37_split_0_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_i_acl_444_gmm_substract_q_37_split_0_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_i_acl_444_gmm_substract_q_37_split_0_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist65_i_acl_444_gmm_substract_q_37_split_0_sticky_ena_q : signal is true;
    signal redist65_i_acl_444_gmm_substract_q_37_split_0_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist68_sync_in_aunroll_x_in_i_valid_3(DELAY,797)
    redist68_sync_in_aunroll_x_in_i_valid_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist68_sync_in_aunroll_x_in_i_valid_3_q, clk => clock, aclr => resetn );

    -- redist69_sync_in_aunroll_x_in_i_valid_14(DELAY,798)
    redist69_sync_in_aunroll_x_in_i_valid_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist68_sync_in_aunroll_x_in_i_valid_3_q, xout => redist69_sync_in_aunroll_x_in_i_valid_14_q, clk => clock, aclr => resetn );

    -- redist70_sync_in_aunroll_x_in_i_valid_17(DELAY,799)
    redist70_sync_in_aunroll_x_in_i_valid_17 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist69_sync_in_aunroll_x_in_i_valid_14_q, xout => redist70_sync_in_aunroll_x_in_i_valid_17_q, clk => clock, aclr => resetn );

    -- redist71_sync_in_aunroll_x_in_i_valid_52(DELAY,800)
    redist71_sync_in_aunroll_x_in_i_valid_52 : dspba_delay
    GENERIC MAP ( width => 1, depth => 35, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist70_sync_in_aunroll_x_in_i_valid_17_q, xout => redist71_sync_in_aunroll_x_in_i_valid_52_q, clk => clock, aclr => resetn );

    -- redist72_sync_in_aunroll_x_in_i_valid_53(DELAY,801)
    redist72_sync_in_aunroll_x_in_i_valid_53 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist71_sync_in_aunroll_x_in_i_valid_52_q, xout => redist72_sync_in_aunroll_x_in_i_valid_53_q, clk => clock, aclr => resetn );

    -- redist73_sync_in_aunroll_x_in_i_valid_55(DELAY,802)
    redist73_sync_in_aunroll_x_in_i_valid_55 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist72_sync_in_aunroll_x_in_i_valid_53_q, xout => redist73_sync_in_aunroll_x_in_i_valid_55_q, clk => clock, aclr => resetn );

    -- redist74_sync_in_aunroll_x_in_i_valid_56(DELAY,803)
    redist74_sync_in_aunroll_x_in_i_valid_56 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist73_sync_in_aunroll_x_in_i_valid_55_q, xout => redist74_sync_in_aunroll_x_in_i_valid_56_q, clk => clock, aclr => resetn );

    -- redist75_sync_in_aunroll_x_in_i_valid_60(DELAY,804)
    redist75_sync_in_aunroll_x_in_i_valid_60 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist74_sync_in_aunroll_x_in_i_valid_56_q, xout => redist75_sync_in_aunroll_x_in_i_valid_60_q, clk => clock, aclr => resetn );

    -- redist76_sync_in_aunroll_x_in_i_valid_61(DELAY,805)
    redist76_sync_in_aunroll_x_in_i_valid_61 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist75_sync_in_aunroll_x_in_i_valid_60_q, xout => redist76_sync_in_aunroll_x_in_i_valid_61_q, clk => clock, aclr => resetn );

    -- redist77_sync_in_aunroll_x_in_i_valid_62(DELAY,806)
    redist77_sync_in_aunroll_x_in_i_valid_62 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist76_sync_in_aunroll_x_in_i_valid_61_q, xout => redist77_sync_in_aunroll_x_in_i_valid_62_q, clk => clock, aclr => resetn );

    -- redist78_sync_in_aunroll_x_in_i_valid_64(DELAY,807)
    redist78_sync_in_aunroll_x_in_i_valid_64 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist77_sync_in_aunroll_x_in_i_valid_62_q, xout => redist78_sync_in_aunroll_x_in_i_valid_64_q, clk => clock, aclr => resetn );

    -- redist79_sync_in_aunroll_x_in_i_valid_65(DELAY,808)
    redist79_sync_in_aunroll_x_in_i_valid_65 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist78_sync_in_aunroll_x_in_i_valid_64_q, xout => redist79_sync_in_aunroll_x_in_i_valid_65_q, clk => clock, aclr => resetn );

    -- redist80_sync_in_aunroll_x_in_i_valid_86(DELAY,809)
    redist80_sync_in_aunroll_x_in_i_valid_86 : dspba_delay
    GENERIC MAP ( width => 1, depth => 21, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist79_sync_in_aunroll_x_in_i_valid_65_q, xout => redist80_sync_in_aunroll_x_in_i_valid_86_q, clk => clock, aclr => resetn );

    -- redist81_sync_in_aunroll_x_in_i_valid_89(DELAY,810)
    redist81_sync_in_aunroll_x_in_i_valid_89 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist80_sync_in_aunroll_x_in_i_valid_86_q, xout => redist81_sync_in_aunroll_x_in_i_valid_89_q, clk => clock, aclr => resetn );

    -- redist82_sync_in_aunroll_x_in_i_valid_90(DELAY,811)
    redist82_sync_in_aunroll_x_in_i_valid_90 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist81_sync_in_aunroll_x_in_i_valid_89_q, xout => redist82_sync_in_aunroll_x_in_i_valid_90_q, clk => clock, aclr => resetn );

    -- i_acl_443_gmm_substract_vt_const_31(CONSTANT,171)
    i_acl_443_gmm_substract_vt_const_31_q <= "000000000000000000000000000000";

    -- c_i32_2gr(CONSTANT,151)
    c_i32_2gr_q <= "00000000000000000000000000000010";

    -- c_float_0_000000e_00(FLOATCONSTANT,140)
    c_float_0_000000e_00_q <= "00000000000000000000000000000000";

    -- c_float_0x401921FB60000000(FLOATCONSTANT,141)
    c_float_0x401921FB60000000_q <= "01000000110010010000111111011011";

    -- redist29_i_conv802_2_gmm_substract_out_primWireOut_26_notEnable(LOGICAL,842)
    redist29_i_conv802_2_gmm_substract_out_primWireOut_26_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist29_i_conv802_2_gmm_substract_out_primWireOut_26_nor(LOGICAL,843)
    redist29_i_conv802_2_gmm_substract_out_primWireOut_26_nor_q <= not (redist29_i_conv802_2_gmm_substract_out_primWireOut_26_notEnable_q or redist29_i_conv802_2_gmm_substract_out_primWireOut_26_sticky_ena_q);

    -- redist29_i_conv802_2_gmm_substract_out_primWireOut_26_mem_last(CONSTANT,839)
    redist29_i_conv802_2_gmm_substract_out_primWireOut_26_mem_last_q <= "010100";

    -- redist29_i_conv802_2_gmm_substract_out_primWireOut_26_cmp(LOGICAL,840)
    redist29_i_conv802_2_gmm_substract_out_primWireOut_26_cmp_b <= STD_LOGIC_VECTOR("0" & redist29_i_conv802_2_gmm_substract_out_primWireOut_26_rdcnt_q);
    redist29_i_conv802_2_gmm_substract_out_primWireOut_26_cmp_q <= "1" WHEN redist29_i_conv802_2_gmm_substract_out_primWireOut_26_mem_last_q = redist29_i_conv802_2_gmm_substract_out_primWireOut_26_cmp_b ELSE "0";

    -- redist29_i_conv802_2_gmm_substract_out_primWireOut_26_cmpReg(REG,841)
    redist29_i_conv802_2_gmm_substract_out_primWireOut_26_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist29_i_conv802_2_gmm_substract_out_primWireOut_26_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist29_i_conv802_2_gmm_substract_out_primWireOut_26_cmpReg_q <= STD_LOGIC_VECTOR(redist29_i_conv802_2_gmm_substract_out_primWireOut_26_cmp_q);
        END IF;
    END PROCESS;

    -- redist29_i_conv802_2_gmm_substract_out_primWireOut_26_sticky_ena(REG,844)
    redist29_i_conv802_2_gmm_substract_out_primWireOut_26_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist29_i_conv802_2_gmm_substract_out_primWireOut_26_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist29_i_conv802_2_gmm_substract_out_primWireOut_26_nor_q = "1") THEN
                redist29_i_conv802_2_gmm_substract_out_primWireOut_26_sticky_ena_q <= STD_LOGIC_VECTOR(redist29_i_conv802_2_gmm_substract_out_primWireOut_26_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist29_i_conv802_2_gmm_substract_out_primWireOut_26_enaAnd(LOGICAL,845)
    redist29_i_conv802_2_gmm_substract_out_primWireOut_26_enaAnd_q <= redist29_i_conv802_2_gmm_substract_out_primWireOut_26_sticky_ena_q and VCC_q;

    -- redist29_i_conv802_2_gmm_substract_out_primWireOut_26_rdcnt(COUNTER,837)
    -- low=0, high=21, step=1, init=0
    redist29_i_conv802_2_gmm_substract_out_primWireOut_26_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist29_i_conv802_2_gmm_substract_out_primWireOut_26_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist29_i_conv802_2_gmm_substract_out_primWireOut_26_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist29_i_conv802_2_gmm_substract_out_primWireOut_26_rdcnt_i = TO_UNSIGNED(20, 5)) THEN
                redist29_i_conv802_2_gmm_substract_out_primWireOut_26_rdcnt_eq <= '1';
            ELSE
                redist29_i_conv802_2_gmm_substract_out_primWireOut_26_rdcnt_eq <= '0';
            END IF;
            IF (redist29_i_conv802_2_gmm_substract_out_primWireOut_26_rdcnt_eq = '1') THEN
                redist29_i_conv802_2_gmm_substract_out_primWireOut_26_rdcnt_i <= redist29_i_conv802_2_gmm_substract_out_primWireOut_26_rdcnt_i + 11;
            ELSE
                redist29_i_conv802_2_gmm_substract_out_primWireOut_26_rdcnt_i <= redist29_i_conv802_2_gmm_substract_out_primWireOut_26_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist29_i_conv802_2_gmm_substract_out_primWireOut_26_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist29_i_conv802_2_gmm_substract_out_primWireOut_26_rdcnt_i, 5)));

    -- i_select498_zext_to_i32_gmm_substract_vt_const_31(CONSTANT,472)
    i_select498_zext_to_i32_gmm_substract_vt_const_31_q <= "0000000000000000";

    -- i_ffwd_dst_select6102748_gmm_substract(BLACKBOX,401)@3
    thei_ffwd_dst_select6102748_gmm_substract : i_ffwd_dst_select6102748_gmm_substract2733
    PORT MAP (
        in_intel_reserved_ffwd_67_0 => in_intel_reserved_ffwd_67_0,
        in_stall_in => GND_q,
        in_valid_in => redist68_sync_in_aunroll_x_in_i_valid_3_q,
        out_dest_data_out_67_0 => i_ffwd_dst_select6102748_gmm_substract_out_dest_data_out_67_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_acl_3892686_gmm_substract(BLACKBOX,340)@3
    thei_ffwd_dst_acl_3892686_gmm_substract : i_ffwd_dst_acl_3892686_gmm_substract2731
    PORT MAP (
        in_intel_reserved_ffwd_38_0 => in_intel_reserved_ffwd_38_0,
        in_stall_in => GND_q,
        in_valid_in => redist68_sync_in_aunroll_x_in_i_valid_3_q,
        out_dest_data_out_38_0 => i_ffwd_dst_acl_3892686_gmm_substract_out_dest_data_out_38_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_cmp_i_i_i279_12659_gmm_substract(BLACKBOX,360)@3
    thei_ffwd_dst_cmp_i_i_i279_12659_gmm_substract : i_ffwd_dst_cmp_i_i_i279_12659_gmm_substract2729
    PORT MAP (
        in_intel_reserved_ffwd_35_0 => in_intel_reserved_ffwd_35_0,
        in_stall_in => GND_q,
        in_valid_in => redist68_sync_in_aunroll_x_in_i_valid_3_q,
        out_dest_data_out_35_0 => i_ffwd_dst_cmp_i_i_i279_12659_gmm_substract_out_dest_data_out_35_0,
        clock => clock,
        resetn => resetn
    );

    -- i_select522_gmm_substract(MUX,488)@3 + 1
    i_select522_gmm_substract_s <= i_ffwd_dst_cmp_i_i_i279_12659_gmm_substract_out_dest_data_out_35_0;
    i_select522_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_select522_gmm_substract_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_select522_gmm_substract_s) IS
                WHEN "0" => i_select522_gmm_substract_q <= i_ffwd_dst_acl_3892686_gmm_substract_out_dest_data_out_38_0;
                WHEN "1" => i_select522_gmm_substract_q <= i_ffwd_dst_select6102748_gmm_substract_out_dest_data_out_67_0;
                WHEN OTHERS => i_select522_gmm_substract_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_select522_zext_to_i32_gmm_substract_sel_x(BITSELECT,112)@4
    i_select522_zext_to_i32_gmm_substract_sel_x_b <= std_logic_vector(resize(unsigned(i_select522_gmm_substract_q(15 downto 0)), 32));

    -- i_select522_zext_to_i32_gmm_substract_vt_select_15(BITSELECT,492)@4
    i_select522_zext_to_i32_gmm_substract_vt_select_15_b <= i_select522_zext_to_i32_gmm_substract_sel_x_b(15 downto 0);

    -- i_select522_zext_to_i32_gmm_substract_vt_join(BITJOIN,491)@4
    i_select522_zext_to_i32_gmm_substract_vt_join_q <= i_select498_zext_to_i32_gmm_substract_vt_const_31_q & i_select522_zext_to_i32_gmm_substract_vt_select_15_b;

    -- i_conv802_2_gmm_substract(BLACKBOX,322)@4
    -- out out_primWireOut@13
    thei_conv802_2_gmm_substract : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA0Ze2a150g24ad20454ck5u
    PORT MAP (
        in_0 => i_select522_zext_to_i32_gmm_substract_vt_join_q,
        out_primWireOut => i_conv802_2_gmm_substract_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist28_i_conv802_2_gmm_substract_out_primWireOut_1(DELAY,757)
    redist28_i_conv802_2_gmm_substract_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv802_2_gmm_substract_out_primWireOut, xout => redist28_i_conv802_2_gmm_substract_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- redist29_i_conv802_2_gmm_substract_out_primWireOut_26_inputreg(DELAY,834)
    redist29_i_conv802_2_gmm_substract_out_primWireOut_26_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist28_i_conv802_2_gmm_substract_out_primWireOut_1_q, xout => redist29_i_conv802_2_gmm_substract_out_primWireOut_26_inputreg_q, clk => clock, aclr => resetn );

    -- redist29_i_conv802_2_gmm_substract_out_primWireOut_26_wraddr(REG,838)
    redist29_i_conv802_2_gmm_substract_out_primWireOut_26_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist29_i_conv802_2_gmm_substract_out_primWireOut_26_wraddr_q <= "10101";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist29_i_conv802_2_gmm_substract_out_primWireOut_26_wraddr_q <= STD_LOGIC_VECTOR(redist29_i_conv802_2_gmm_substract_out_primWireOut_26_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist29_i_conv802_2_gmm_substract_out_primWireOut_26_mem(DUALMEM,836)
    redist29_i_conv802_2_gmm_substract_out_primWireOut_26_mem_ia <= STD_LOGIC_VECTOR(redist29_i_conv802_2_gmm_substract_out_primWireOut_26_inputreg_q);
    redist29_i_conv802_2_gmm_substract_out_primWireOut_26_mem_aa <= redist29_i_conv802_2_gmm_substract_out_primWireOut_26_wraddr_q;
    redist29_i_conv802_2_gmm_substract_out_primWireOut_26_mem_ab <= redist29_i_conv802_2_gmm_substract_out_primWireOut_26_rdcnt_q;
    redist29_i_conv802_2_gmm_substract_out_primWireOut_26_mem_reset0 <= not (resetn);
    redist29_i_conv802_2_gmm_substract_out_primWireOut_26_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 5,
        numwords_a => 22,
        width_b => 32,
        widthad_b => 5,
        numwords_b => 22,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist29_i_conv802_2_gmm_substract_out_primWireOut_26_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist29_i_conv802_2_gmm_substract_out_primWireOut_26_mem_reset0,
        clock1 => clock,
        address_a => redist29_i_conv802_2_gmm_substract_out_primWireOut_26_mem_aa,
        data_a => redist29_i_conv802_2_gmm_substract_out_primWireOut_26_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist29_i_conv802_2_gmm_substract_out_primWireOut_26_mem_ab,
        q_b => redist29_i_conv802_2_gmm_substract_out_primWireOut_26_mem_iq
    );
    redist29_i_conv802_2_gmm_substract_out_primWireOut_26_mem_q <= redist29_i_conv802_2_gmm_substract_out_primWireOut_26_mem_iq(31 downto 0);

    -- redist29_i_conv802_2_gmm_substract_out_primWireOut_26_outputreg(DELAY,835)
    redist29_i_conv802_2_gmm_substract_out_primWireOut_26_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist29_i_conv802_2_gmm_substract_out_primWireOut_26_mem_q, xout => redist29_i_conv802_2_gmm_substract_out_primWireOut_26_outputreg_q, clk => clock, aclr => resetn );

    -- i_mul808_2_gmm_substract(BLACKBOX,422)@39
    -- out out_primWireOut@46
    thei_mul808_2_gmm_substract : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA1Zcpq6c0ouqqcd06uqrcz0
    PORT MAP (
        in_0 => redist29_i_conv802_2_gmm_substract_out_primWireOut_26_outputreg_q,
        in_1 => c_float_0x401921FB60000000_q,
        out_primWireOut => i_mul808_2_gmm_substract_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist11_i_mul808_2_gmm_substract_out_primWireOut_1(DELAY,740)
    redist11_i_mul808_2_gmm_substract_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul808_2_gmm_substract_out_primWireOut, xout => redist11_i_mul808_2_gmm_substract_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_acl_sqrtf_call_i86_2_gmm_substract(BLACKBOX,214)@47
    -- out out_primWireOut@62
    thei_acl_sqrtf_call_i86_2_gmm_substract : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA1Z4ce2a150g24ad2045eny
    PORT MAP (
        in_0 => redist11_i_mul808_2_gmm_substract_out_primWireOut_1_q,
        out_primWireOut => i_acl_sqrtf_call_i86_2_gmm_substract_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist49_i_acl_sqrtf_call_i86_2_gmm_substract_out_primWireOut_1(DELAY,778)
    redist49_i_acl_sqrtf_call_i86_2_gmm_substract_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_sqrtf_call_i86_2_gmm_substract_out_primWireOut, xout => redist49_i_acl_sqrtf_call_i86_2_gmm_substract_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- redist50_i_acl_sqrtf_call_i86_2_gmm_substract_out_primWireOut_2(DELAY,779)
    redist50_i_acl_sqrtf_call_i86_2_gmm_substract_out_primWireOut_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist49_i_acl_sqrtf_call_i86_2_gmm_substract_out_primWireOut_1_q, xout => redist50_i_acl_sqrtf_call_i86_2_gmm_substract_out_primWireOut_2_q, clk => clock, aclr => resetn );

    -- c_i32_0gr(CONSTANT,148)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- c_i32_2139095040(CONSTANT,149)
    c_i32_2139095040_q <= "01111111100000000000000000000000";

    -- i_and_i_i88_2_gmm_substract(LOGICAL,251)@63
    i_and_i_i88_2_gmm_substract_q <= redist49_i_acl_sqrtf_call_i86_2_gmm_substract_out_primWireOut_1_q and c_i32_2139095040_q;

    -- i_and_i_i88_2_gmm_substract_vt_select_30(BITSELECT,255)@63
    i_and_i_i88_2_gmm_substract_vt_select_30_b <= i_and_i_i88_2_gmm_substract_q(30 downto 23);

    -- i_and_i_i88_2_gmm_substract_vt_join(BITJOIN,254)@63
    i_and_i_i88_2_gmm_substract_vt_join_q <= GND_q & i_and_i_i88_2_gmm_substract_vt_select_30_b & i_and_i_i71_1_gmm_substract_vt_const_22_q;

    -- i_cmp_i_i89_2_gmm_substract(LOGICAL,307)@63 + 1
    i_cmp_i_i89_2_gmm_substract_qi <= "1" WHEN i_and_i_i88_2_gmm_substract_vt_join_q = c_i32_0gr_q ELSE "0";
    i_cmp_i_i89_2_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_i_i89_2_gmm_substract_qi, xout => i_cmp_i_i89_2_gmm_substract_q, clk => clock, aclr => resetn );

    -- i_astype1_i_i92_2_gmm_substract(MUX,280)@64 + 1
    i_astype1_i_i92_2_gmm_substract_s <= i_cmp_i_i89_2_gmm_substract_q;
    i_astype1_i_i92_2_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_astype1_i_i92_2_gmm_substract_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_astype1_i_i92_2_gmm_substract_s) IS
                WHEN "0" => i_astype1_i_i92_2_gmm_substract_q <= redist50_i_acl_sqrtf_call_i86_2_gmm_substract_out_primWireOut_2_q;
                WHEN "1" => i_astype1_i_i92_2_gmm_substract_q <= c_float_0_000000e_00_q;
                WHEN OTHERS => i_astype1_i_i92_2_gmm_substract_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- dupName_3_constMult_x(BLACKBOX,16)@14
    -- out out_primWireOut@17
    thedupName_3_constMult_x : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA1Z2cdo6u2ocpq6c0ouq3cz
    PORT MAP (
        in_0 => redist28_i_conv802_2_gmm_substract_out_primWireOut_1_q,
        out_primWireOut => dupName_3_constMult_x_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist87_dupName_3_constMult_x_out_primWireOut_1(DELAY,816)
    redist87_dupName_3_constMult_x_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => dupName_3_constMult_x_out_primWireOut, xout => redist87_dupName_3_constMult_x_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- c_i32_2147483648(CONSTANT,150)
    c_i32_2147483648_q <= "10000000000000000000000000000000";

    -- i_acl_3172609_zext_to_i32_gmm_substract_vt_const_31(CONSTANT,159)
    i_acl_3172609_zext_to_i32_gmm_substract_vt_const_31_q <= "000000000000";

    -- i_ffwd_dst_acl_3242610_gmm_substract(BLACKBOX,334)@17
    thei_ffwd_dst_acl_3242610_gmm_substract : i_ffwd_dst_acl_3242610_gmm_substract2759
    PORT MAP (
        in_intel_reserved_ffwd_18_0 => in_intel_reserved_ffwd_18_0,
        in_stall_in => GND_q,
        in_valid_in => redist70_sync_in_aunroll_x_in_i_valid_17_q,
        out_dest_data_out_18_0 => i_ffwd_dst_acl_3242610_gmm_substract_out_dest_data_out_18_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_3242610_zext_to_i32_gmm_substract_sel_x(BITSELECT,104)@17
    i_acl_3242610_zext_to_i32_gmm_substract_sel_x_b <= std_logic_vector(resize(unsigned(i_ffwd_dst_acl_3242610_gmm_substract_out_dest_data_out_18_0(19 downto 0)), 32));

    -- i_acl_3242610_zext_to_i32_gmm_substract_vt_select_19(BITSELECT,165)@17
    i_acl_3242610_zext_to_i32_gmm_substract_vt_select_19_b <= i_acl_3242610_zext_to_i32_gmm_substract_sel_x_b(19 downto 0);

    -- i_acl_3242610_zext_to_i32_gmm_substract_vt_join(BITJOIN,164)@17
    i_acl_3242610_zext_to_i32_gmm_substract_vt_join_q <= i_acl_3172609_zext_to_i32_gmm_substract_vt_const_31_q & i_acl_3242610_zext_to_i32_gmm_substract_vt_select_19_b;

    -- i_conv797_2_gmm_substract(BLACKBOX,319)@17
    -- out out_primWireOut@26
    thei_conv797_2_gmm_substract : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA0Ze2a150g24ad20454ck5u
    PORT MAP (
        in_0 => i_acl_3242610_zext_to_i32_gmm_substract_vt_join_q,
        out_primWireOut => i_conv797_2_gmm_substract_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist33_i_conv797_2_gmm_substract_out_primWireOut_1(DELAY,762)
    redist33_i_conv797_2_gmm_substract_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv797_2_gmm_substract_out_primWireOut, xout => redist33_i_conv797_2_gmm_substract_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_negate_sign196_gmm_substract(LOGICAL,428)@27
    i_negate_sign196_gmm_substract_q <= redist33_i_conv797_2_gmm_substract_out_primWireOut_1_q xor c_i32_2147483648_q;

    -- i_div_2_gmm_substract(BLACKBOX,331)@18
    -- in in_0@27
    -- out out_primWireOut@39
    thei_div_2_gmm_substract : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA0Zcpq6c0ouqqcd06uqrcz0
    PORT MAP (
        in_0 => i_negate_sign196_gmm_substract_q,
        in_1 => redist87_dupName_3_constMult_x_out_primWireOut_1_q,
        out_primWireOut => i_div_2_gmm_substract_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist14_i_div_2_gmm_substract_out_primWireOut_1(DELAY,743)
    redist14_i_div_2_gmm_substract_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_div_2_gmm_substract_out_primWireOut, xout => redist14_i_div_2_gmm_substract_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_acl_expf_call_i69_2_gmm_substract(BLACKBOX,211)@40
    -- out out_primWireOut@63
    thei_acl_expf_call_i69_2_gmm_substract : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA0Z4ce2a150g24ad2045eny
    PORT MAP (
        in_0 => redist14_i_div_2_gmm_substract_out_primWireOut_1_q,
        out_primWireOut => i_acl_expf_call_i69_2_gmm_substract_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist55_i_acl_expf_call_i69_2_gmm_substract_out_primWireOut_1(DELAY,784)
    redist55_i_acl_expf_call_i69_2_gmm_substract_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_expf_call_i69_2_gmm_substract_out_primWireOut, xout => redist55_i_acl_expf_call_i69_2_gmm_substract_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- redist56_i_acl_expf_call_i69_2_gmm_substract_out_primWireOut_2(DELAY,785)
    redist56_i_acl_expf_call_i69_2_gmm_substract_out_primWireOut_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist55_i_acl_expf_call_i69_2_gmm_substract_out_primWireOut_1_q, xout => redist56_i_acl_expf_call_i69_2_gmm_substract_out_primWireOut_2_q, clk => clock, aclr => resetn );

    -- i_and_i_i71_2_gmm_substract(LOGICAL,236)@64
    i_and_i_i71_2_gmm_substract_q <= redist55_i_acl_expf_call_i69_2_gmm_substract_out_primWireOut_1_q and c_i32_2139095040_q;

    -- i_and_i_i71_2_gmm_substract_vt_select_30(BITSELECT,240)@64
    i_and_i_i71_2_gmm_substract_vt_select_30_b <= i_and_i_i71_2_gmm_substract_q(30 downto 23);

    -- i_and_i_i71_2_gmm_substract_vt_join(BITJOIN,239)@64
    i_and_i_i71_2_gmm_substract_vt_join_q <= GND_q & i_and_i_i71_2_gmm_substract_vt_select_30_b & i_and_i_i71_1_gmm_substract_vt_const_22_q;

    -- i_cmp_i_i72_2_gmm_substract(LOGICAL,304)@64 + 1
    i_cmp_i_i72_2_gmm_substract_qi <= "1" WHEN i_and_i_i71_2_gmm_substract_vt_join_q = c_i32_0gr_q ELSE "0";
    i_cmp_i_i72_2_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_i_i72_2_gmm_substract_qi, xout => i_cmp_i_i72_2_gmm_substract_q, clk => clock, aclr => resetn );

    -- i_astype1_i_i75_2_gmm_substract(MUX,277)@65 + 1
    i_astype1_i_i75_2_gmm_substract_s <= i_cmp_i_i72_2_gmm_substract_q;
    i_astype1_i_i75_2_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_astype1_i_i75_2_gmm_substract_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_astype1_i_i75_2_gmm_substract_s) IS
                WHEN "0" => i_astype1_i_i75_2_gmm_substract_q <= redist56_i_acl_expf_call_i69_2_gmm_substract_out_primWireOut_2_q;
                WHEN "1" => i_astype1_i_i75_2_gmm_substract_q <= c_float_0_000000e_00_q;
                WHEN OTHERS => i_astype1_i_i75_2_gmm_substract_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_select501_zext_to_i32_gmm_substract_vt_const_31(CONSTANT,477)
    i_select501_zext_to_i32_gmm_substract_vt_const_31_q <= "000000000000000000000000";

    -- i_ffwd_dst_select6222750_gmm_substract(BLACKBOX,403)@55
    thei_ffwd_dst_select6222750_gmm_substract : i_ffwd_dst_select6222750_gmm_substract2727
    PORT MAP (
        in_intel_reserved_ffwd_69_0 => in_intel_reserved_ffwd_69_0,
        in_stall_in => GND_q,
        in_valid_in => redist73_sync_in_aunroll_x_in_i_valid_55_q,
        out_dest_data_out_69_0 => i_ffwd_dst_select6222750_gmm_substract_out_dest_data_out_69_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_acl_4032702_gmm_substract(BLACKBOX,343)@55
    thei_ffwd_dst_acl_4032702_gmm_substract : i_ffwd_dst_acl_4032702_gmm_substract2725
    PORT MAP (
        in_intel_reserved_ffwd_41_0 => in_intel_reserved_ffwd_41_0,
        in_stall_in => GND_q,
        in_valid_in => redist73_sync_in_aunroll_x_in_i_valid_55_q,
        out_dest_data_out_41_0 => i_ffwd_dst_acl_4032702_gmm_substract_out_dest_data_out_41_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_cmp_i_i_i279_12658_gmm_substract(BLACKBOX,359)@55
    thei_ffwd_dst_cmp_i_i_i279_12658_gmm_substract : i_ffwd_dst_cmp_i_i_i279_12658_gmm_substract2723
    PORT MAP (
        in_intel_reserved_ffwd_35_0 => in_intel_reserved_ffwd_35_0,
        in_stall_in => GND_q,
        in_valid_in => redist73_sync_in_aunroll_x_in_i_valid_55_q,
        out_dest_data_out_35_0 => i_ffwd_dst_cmp_i_i_i279_12658_gmm_substract_out_dest_data_out_35_0,
        clock => clock,
        resetn => resetn
    );

    -- i_select519_gmm_substract(MUX,483)@55 + 1
    i_select519_gmm_substract_s <= i_ffwd_dst_cmp_i_i_i279_12658_gmm_substract_out_dest_data_out_35_0;
    i_select519_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_select519_gmm_substract_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_select519_gmm_substract_s) IS
                WHEN "0" => i_select519_gmm_substract_q <= i_ffwd_dst_acl_4032702_gmm_substract_out_dest_data_out_41_0;
                WHEN "1" => i_select519_gmm_substract_q <= i_ffwd_dst_select6222750_gmm_substract_out_dest_data_out_69_0;
                WHEN OTHERS => i_select519_gmm_substract_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_select519_zext_to_i32_gmm_substract_sel_x(BITSELECT,111)@56
    i_select519_zext_to_i32_gmm_substract_sel_x_b <= std_logic_vector(resize(unsigned(i_select519_gmm_substract_q(7 downto 0)), 32));

    -- i_select519_zext_to_i32_gmm_substract_vt_select_7(BITSELECT,487)@56
    i_select519_zext_to_i32_gmm_substract_vt_select_7_b <= i_select519_zext_to_i32_gmm_substract_sel_x_b(7 downto 0);

    -- i_select519_zext_to_i32_gmm_substract_vt_join(BITJOIN,486)@56
    i_select519_zext_to_i32_gmm_substract_vt_join_q <= i_select501_zext_to_i32_gmm_substract_vt_const_31_q & i_select519_zext_to_i32_gmm_substract_vt_select_7_b;

    -- i_conv813_2_gmm_substract(BLACKBOX,325)@56
    -- out out_primWireOut@65
    thei_conv813_2_gmm_substract : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA0Ze2a150g24ad20454ck5u
    PORT MAP (
        in_0 => i_select519_zext_to_i32_gmm_substract_vt_join_q,
        out_primWireOut => i_conv813_2_gmm_substract_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist24_i_conv813_2_gmm_substract_out_primWireOut_1(DELAY,753)
    redist24_i_conv813_2_gmm_substract_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv813_2_gmm_substract_out_primWireOut, xout => redist24_i_conv813_2_gmm_substract_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_mul815_2_gmm_substract(BLACKBOX,425)@66
    -- out out_primWireOut@73
    thei_mul815_2_gmm_substract : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA1Zcpq6c0ouqqcd06uqrcz0
    PORT MAP (
        in_0 => redist24_i_conv813_2_gmm_substract_out_primWireOut_1_q,
        in_1 => i_astype1_i_i75_2_gmm_substract_q,
        out_primWireOut => i_mul815_2_gmm_substract_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist8_i_mul815_2_gmm_substract_out_primWireOut_1(DELAY,737)
    redist8_i_mul815_2_gmm_substract_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul815_2_gmm_substract_out_primWireOut, xout => redist8_i_mul815_2_gmm_substract_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_div816_2_gmm_substract(BLACKBOX,328)@65
    -- in in_0@74
    -- out out_primWireOut@86
    thei_div816_2_gmm_substract : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA0Zcpq6c0ouqqcd06uqrcz0
    PORT MAP (
        in_0 => redist8_i_mul815_2_gmm_substract_out_primWireOut_1_q,
        in_1 => i_astype1_i_i92_2_gmm_substract_q,
        out_primWireOut => i_div816_2_gmm_substract_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist19_i_div816_2_gmm_substract_out_primWireOut_1(DELAY,748)
    redist19_i_div816_2_gmm_substract_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_div816_2_gmm_substract_out_primWireOut, xout => redist19_i_div816_2_gmm_substract_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- frac_y_uid639_i_cmp838_2_gmm_substract(BITSELECT,638)@87
    frac_y_uid639_i_cmp838_2_gmm_substract_b <= redist19_i_div816_2_gmm_substract_out_primWireOut_1_q(22 downto 0);

    -- i_and_i_i71_1_gmm_substract_vt_const_22(CONSTANT,232)
    i_and_i_i71_1_gmm_substract_vt_const_22_q <= "00000000000000000000000";

    -- fracXIsZero_uid642_i_cmp838_2_gmm_substract(LOGICAL,641)@87
    fracXIsZero_uid642_i_cmp838_2_gmm_substract_q <= "1" WHEN i_and_i_i71_1_gmm_substract_vt_const_22_q = frac_y_uid639_i_cmp838_2_gmm_substract_b ELSE "0";

    -- cstAllZWE_uid556_i_cmp838_1_gmm_substract(CONSTANT,555)
    cstAllZWE_uid556_i_cmp838_1_gmm_substract_q <= "00000000";

    -- exp_y_uid638_i_cmp838_2_gmm_substract(BITSELECT,637)@87
    exp_y_uid638_i_cmp838_2_gmm_substract_b <= redist19_i_div816_2_gmm_substract_out_primWireOut_1_q(30 downto 23);

    -- expXIsZero_uid640_i_cmp838_2_gmm_substract(LOGICAL,639)@87
    expXIsZero_uid640_i_cmp838_2_gmm_substract_q <= "1" WHEN exp_y_uid638_i_cmp838_2_gmm_substract_b = cstAllZWE_uid556_i_cmp838_1_gmm_substract_q ELSE "0";

    -- excZ_y_uid644_i_cmp838_2_gmm_substract(LOGICAL,643)@87 + 1
    excZ_y_uid644_i_cmp838_2_gmm_substract_qi <= expXIsZero_uid640_i_cmp838_2_gmm_substract_q and fracXIsZero_uid642_i_cmp838_2_gmm_substract_q;
    excZ_y_uid644_i_cmp838_2_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excZ_y_uid644_i_cmp838_2_gmm_substract_qi, xout => excZ_y_uid644_i_cmp838_2_gmm_substract_q, clk => clock, aclr => resetn );

    -- invExcYZ_uid674_i_cmp838_2_gmm_substract(LOGICAL,673)@88
    invExcYZ_uid674_i_cmp838_2_gmm_substract_q <= not (excZ_y_uid644_i_cmp838_2_gmm_substract_q);

    -- redist31_i_conv802_1_gmm_substract_out_primWireOut_26_notEnable(LOGICAL,854)
    redist31_i_conv802_1_gmm_substract_out_primWireOut_26_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist31_i_conv802_1_gmm_substract_out_primWireOut_26_nor(LOGICAL,855)
    redist31_i_conv802_1_gmm_substract_out_primWireOut_26_nor_q <= not (redist31_i_conv802_1_gmm_substract_out_primWireOut_26_notEnable_q or redist31_i_conv802_1_gmm_substract_out_primWireOut_26_sticky_ena_q);

    -- redist31_i_conv802_1_gmm_substract_out_primWireOut_26_mem_last(CONSTANT,851)
    redist31_i_conv802_1_gmm_substract_out_primWireOut_26_mem_last_q <= "010100";

    -- redist31_i_conv802_1_gmm_substract_out_primWireOut_26_cmp(LOGICAL,852)
    redist31_i_conv802_1_gmm_substract_out_primWireOut_26_cmp_b <= STD_LOGIC_VECTOR("0" & redist31_i_conv802_1_gmm_substract_out_primWireOut_26_rdcnt_q);
    redist31_i_conv802_1_gmm_substract_out_primWireOut_26_cmp_q <= "1" WHEN redist31_i_conv802_1_gmm_substract_out_primWireOut_26_mem_last_q = redist31_i_conv802_1_gmm_substract_out_primWireOut_26_cmp_b ELSE "0";

    -- redist31_i_conv802_1_gmm_substract_out_primWireOut_26_cmpReg(REG,853)
    redist31_i_conv802_1_gmm_substract_out_primWireOut_26_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist31_i_conv802_1_gmm_substract_out_primWireOut_26_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist31_i_conv802_1_gmm_substract_out_primWireOut_26_cmpReg_q <= STD_LOGIC_VECTOR(redist31_i_conv802_1_gmm_substract_out_primWireOut_26_cmp_q);
        END IF;
    END PROCESS;

    -- redist31_i_conv802_1_gmm_substract_out_primWireOut_26_sticky_ena(REG,856)
    redist31_i_conv802_1_gmm_substract_out_primWireOut_26_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist31_i_conv802_1_gmm_substract_out_primWireOut_26_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist31_i_conv802_1_gmm_substract_out_primWireOut_26_nor_q = "1") THEN
                redist31_i_conv802_1_gmm_substract_out_primWireOut_26_sticky_ena_q <= STD_LOGIC_VECTOR(redist31_i_conv802_1_gmm_substract_out_primWireOut_26_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist31_i_conv802_1_gmm_substract_out_primWireOut_26_enaAnd(LOGICAL,857)
    redist31_i_conv802_1_gmm_substract_out_primWireOut_26_enaAnd_q <= redist31_i_conv802_1_gmm_substract_out_primWireOut_26_sticky_ena_q and VCC_q;

    -- redist31_i_conv802_1_gmm_substract_out_primWireOut_26_rdcnt(COUNTER,849)
    -- low=0, high=21, step=1, init=0
    redist31_i_conv802_1_gmm_substract_out_primWireOut_26_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist31_i_conv802_1_gmm_substract_out_primWireOut_26_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist31_i_conv802_1_gmm_substract_out_primWireOut_26_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist31_i_conv802_1_gmm_substract_out_primWireOut_26_rdcnt_i = TO_UNSIGNED(20, 5)) THEN
                redist31_i_conv802_1_gmm_substract_out_primWireOut_26_rdcnt_eq <= '1';
            ELSE
                redist31_i_conv802_1_gmm_substract_out_primWireOut_26_rdcnt_eq <= '0';
            END IF;
            IF (redist31_i_conv802_1_gmm_substract_out_primWireOut_26_rdcnt_eq = '1') THEN
                redist31_i_conv802_1_gmm_substract_out_primWireOut_26_rdcnt_i <= redist31_i_conv802_1_gmm_substract_out_primWireOut_26_rdcnt_i + 11;
            ELSE
                redist31_i_conv802_1_gmm_substract_out_primWireOut_26_rdcnt_i <= redist31_i_conv802_1_gmm_substract_out_primWireOut_26_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist31_i_conv802_1_gmm_substract_out_primWireOut_26_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist31_i_conv802_1_gmm_substract_out_primWireOut_26_rdcnt_i, 5)));

    -- i_ffwd_dst_select6162749_gmm_substract(BLACKBOX,402)@0
    thei_ffwd_dst_select6162749_gmm_substract : i_ffwd_dst_select6162749_gmm_substract2745
    PORT MAP (
        in_intel_reserved_ffwd_68_0 => in_intel_reserved_ffwd_68_0,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_dest_data_out_68_0 => i_ffwd_dst_select6162749_gmm_substract_out_dest_data_out_68_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_acl_3722629_gmm_substract(BLACKBOX,336)@0
    thei_ffwd_dst_acl_3722629_gmm_substract : i_ffwd_dst_acl_3722629_gmm_substract2741
    PORT MAP (
        in_intel_reserved_ffwd_29_0 => in_intel_reserved_ffwd_29_0,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_dest_data_out_29_0 => i_ffwd_dst_acl_3722629_gmm_substract_out_dest_data_out_29_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_cmp_i_i_i279_12661_gmm_substract(BLACKBOX,362)@0
    thei_ffwd_dst_cmp_i_i_i279_12661_gmm_substract : i_ffwd_dst_cmp_i_i_i279_12661_gmm_substract2743
    PORT MAP (
        in_intel_reserved_ffwd_35_0 => in_intel_reserved_ffwd_35_0,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_dest_data_out_35_0 => i_ffwd_dst_cmp_i_i_i279_12661_gmm_substract_out_dest_data_out_35_0,
        clock => clock,
        resetn => resetn
    );

    -- i_select528_gmm_substract(MUX,498)@0 + 1
    i_select528_gmm_substract_s <= i_ffwd_dst_cmp_i_i_i279_12661_gmm_substract_out_dest_data_out_35_0;
    i_select528_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_select528_gmm_substract_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_select528_gmm_substract_s) IS
                WHEN "0" => i_select528_gmm_substract_q <= i_ffwd_dst_acl_3722629_gmm_substract_out_dest_data_out_29_0;
                WHEN "1" => i_select528_gmm_substract_q <= i_ffwd_dst_select6162749_gmm_substract_out_dest_data_out_68_0;
                WHEN OTHERS => i_select528_gmm_substract_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_select528_zext_to_i32_gmm_substract_sel_x(BITSELECT,114)@1
    i_select528_zext_to_i32_gmm_substract_sel_x_b <= std_logic_vector(resize(unsigned(i_select528_gmm_substract_q(15 downto 0)), 32));

    -- i_select528_zext_to_i32_gmm_substract_vt_select_15(BITSELECT,502)@1
    i_select528_zext_to_i32_gmm_substract_vt_select_15_b <= i_select528_zext_to_i32_gmm_substract_sel_x_b(15 downto 0);

    -- i_select528_zext_to_i32_gmm_substract_vt_join(BITJOIN,501)@1
    i_select528_zext_to_i32_gmm_substract_vt_join_q <= i_select498_zext_to_i32_gmm_substract_vt_const_31_q & i_select528_zext_to_i32_gmm_substract_vt_select_15_b;

    -- i_conv802_1_gmm_substract(BLACKBOX,321)@1
    -- out out_primWireOut@10
    thei_conv802_1_gmm_substract : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA0Ze2a150g24ad20454ck5u
    PORT MAP (
        in_0 => i_select528_zext_to_i32_gmm_substract_vt_join_q,
        out_primWireOut => i_conv802_1_gmm_substract_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist30_i_conv802_1_gmm_substract_out_primWireOut_1(DELAY,759)
    redist30_i_conv802_1_gmm_substract_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv802_1_gmm_substract_out_primWireOut, xout => redist30_i_conv802_1_gmm_substract_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- redist31_i_conv802_1_gmm_substract_out_primWireOut_26_inputreg(DELAY,846)
    redist31_i_conv802_1_gmm_substract_out_primWireOut_26_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist30_i_conv802_1_gmm_substract_out_primWireOut_1_q, xout => redist31_i_conv802_1_gmm_substract_out_primWireOut_26_inputreg_q, clk => clock, aclr => resetn );

    -- redist31_i_conv802_1_gmm_substract_out_primWireOut_26_wraddr(REG,850)
    redist31_i_conv802_1_gmm_substract_out_primWireOut_26_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist31_i_conv802_1_gmm_substract_out_primWireOut_26_wraddr_q <= "10101";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist31_i_conv802_1_gmm_substract_out_primWireOut_26_wraddr_q <= STD_LOGIC_VECTOR(redist31_i_conv802_1_gmm_substract_out_primWireOut_26_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist31_i_conv802_1_gmm_substract_out_primWireOut_26_mem(DUALMEM,848)
    redist31_i_conv802_1_gmm_substract_out_primWireOut_26_mem_ia <= STD_LOGIC_VECTOR(redist31_i_conv802_1_gmm_substract_out_primWireOut_26_inputreg_q);
    redist31_i_conv802_1_gmm_substract_out_primWireOut_26_mem_aa <= redist31_i_conv802_1_gmm_substract_out_primWireOut_26_wraddr_q;
    redist31_i_conv802_1_gmm_substract_out_primWireOut_26_mem_ab <= redist31_i_conv802_1_gmm_substract_out_primWireOut_26_rdcnt_q;
    redist31_i_conv802_1_gmm_substract_out_primWireOut_26_mem_reset0 <= not (resetn);
    redist31_i_conv802_1_gmm_substract_out_primWireOut_26_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 5,
        numwords_a => 22,
        width_b => 32,
        widthad_b => 5,
        numwords_b => 22,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist31_i_conv802_1_gmm_substract_out_primWireOut_26_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist31_i_conv802_1_gmm_substract_out_primWireOut_26_mem_reset0,
        clock1 => clock,
        address_a => redist31_i_conv802_1_gmm_substract_out_primWireOut_26_mem_aa,
        data_a => redist31_i_conv802_1_gmm_substract_out_primWireOut_26_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist31_i_conv802_1_gmm_substract_out_primWireOut_26_mem_ab,
        q_b => redist31_i_conv802_1_gmm_substract_out_primWireOut_26_mem_iq
    );
    redist31_i_conv802_1_gmm_substract_out_primWireOut_26_mem_q <= redist31_i_conv802_1_gmm_substract_out_primWireOut_26_mem_iq(31 downto 0);

    -- redist31_i_conv802_1_gmm_substract_out_primWireOut_26_outputreg(DELAY,847)
    redist31_i_conv802_1_gmm_substract_out_primWireOut_26_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist31_i_conv802_1_gmm_substract_out_primWireOut_26_mem_q, xout => redist31_i_conv802_1_gmm_substract_out_primWireOut_26_outputreg_q, clk => clock, aclr => resetn );

    -- i_mul808_1_gmm_substract(BLACKBOX,421)@36
    -- out out_primWireOut@43
    thei_mul808_1_gmm_substract : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA1Zcpq6c0ouqqcd06uqrcz0
    PORT MAP (
        in_0 => redist31_i_conv802_1_gmm_substract_out_primWireOut_26_outputreg_q,
        in_1 => c_float_0x401921FB60000000_q,
        out_primWireOut => i_mul808_1_gmm_substract_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist12_i_mul808_1_gmm_substract_out_primWireOut_1(DELAY,741)
    redist12_i_mul808_1_gmm_substract_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul808_1_gmm_substract_out_primWireOut, xout => redist12_i_mul808_1_gmm_substract_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_acl_sqrtf_call_i86_1_gmm_substract(BLACKBOX,213)@44
    -- out out_primWireOut@59
    thei_acl_sqrtf_call_i86_1_gmm_substract : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA1Z4ce2a150g24ad2045eny
    PORT MAP (
        in_0 => redist12_i_mul808_1_gmm_substract_out_primWireOut_1_q,
        out_primWireOut => i_acl_sqrtf_call_i86_1_gmm_substract_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist51_i_acl_sqrtf_call_i86_1_gmm_substract_out_primWireOut_1(DELAY,780)
    redist51_i_acl_sqrtf_call_i86_1_gmm_substract_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_sqrtf_call_i86_1_gmm_substract_out_primWireOut, xout => redist51_i_acl_sqrtf_call_i86_1_gmm_substract_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- redist52_i_acl_sqrtf_call_i86_1_gmm_substract_out_primWireOut_2(DELAY,781)
    redist52_i_acl_sqrtf_call_i86_1_gmm_substract_out_primWireOut_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist51_i_acl_sqrtf_call_i86_1_gmm_substract_out_primWireOut_1_q, xout => redist52_i_acl_sqrtf_call_i86_1_gmm_substract_out_primWireOut_2_q, clk => clock, aclr => resetn );

    -- i_and_i_i88_1_gmm_substract(LOGICAL,246)@60
    i_and_i_i88_1_gmm_substract_q <= redist51_i_acl_sqrtf_call_i86_1_gmm_substract_out_primWireOut_1_q and c_i32_2139095040_q;

    -- i_and_i_i88_1_gmm_substract_vt_select_30(BITSELECT,250)@60
    i_and_i_i88_1_gmm_substract_vt_select_30_b <= i_and_i_i88_1_gmm_substract_q(30 downto 23);

    -- i_and_i_i88_1_gmm_substract_vt_join(BITJOIN,249)@60
    i_and_i_i88_1_gmm_substract_vt_join_q <= GND_q & i_and_i_i88_1_gmm_substract_vt_select_30_b & i_and_i_i71_1_gmm_substract_vt_const_22_q;

    -- i_cmp_i_i89_1_gmm_substract(LOGICAL,306)@60 + 1
    i_cmp_i_i89_1_gmm_substract_qi <= "1" WHEN i_and_i_i88_1_gmm_substract_vt_join_q = c_i32_0gr_q ELSE "0";
    i_cmp_i_i89_1_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_i_i89_1_gmm_substract_qi, xout => i_cmp_i_i89_1_gmm_substract_q, clk => clock, aclr => resetn );

    -- i_astype1_i_i92_1_gmm_substract(MUX,279)@61 + 1
    i_astype1_i_i92_1_gmm_substract_s <= i_cmp_i_i89_1_gmm_substract_q;
    i_astype1_i_i92_1_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_astype1_i_i92_1_gmm_substract_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_astype1_i_i92_1_gmm_substract_s) IS
                WHEN "0" => i_astype1_i_i92_1_gmm_substract_q <= redist52_i_acl_sqrtf_call_i86_1_gmm_substract_out_primWireOut_2_q;
                WHEN "1" => i_astype1_i_i92_1_gmm_substract_q <= c_float_0_000000e_00_q;
                WHEN OTHERS => i_astype1_i_i92_1_gmm_substract_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- dupName_2_constMult_x(BLACKBOX,14)@11
    -- out out_primWireOut@14
    thedupName_2_constMult_x : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA1Z2cdo6u2ocpq6c0ouq3cz
    PORT MAP (
        in_0 => redist30_i_conv802_1_gmm_substract_out_primWireOut_1_q,
        out_primWireOut => dupName_2_constMult_x_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist88_dupName_2_constMult_x_out_primWireOut_1(DELAY,817)
    redist88_dupName_2_constMult_x_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => dupName_2_constMult_x_out_primWireOut, xout => redist88_dupName_2_constMult_x_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_ffwd_dst_acl_3272611_gmm_substract(BLACKBOX,335)@14
    thei_ffwd_dst_acl_3272611_gmm_substract : i_ffwd_dst_acl_3272611_gmm_substract2755
    PORT MAP (
        in_intel_reserved_ffwd_19_0 => in_intel_reserved_ffwd_19_0,
        in_stall_in => GND_q,
        in_valid_in => redist69_sync_in_aunroll_x_in_i_valid_14_q,
        out_dest_data_out_19_0 => i_ffwd_dst_acl_3272611_gmm_substract_out_dest_data_out_19_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_3272611_zext_to_i32_gmm_substract_sel_x(BITSELECT,105)@14
    i_acl_3272611_zext_to_i32_gmm_substract_sel_x_b <= std_logic_vector(resize(unsigned(i_ffwd_dst_acl_3272611_gmm_substract_out_dest_data_out_19_0(19 downto 0)), 32));

    -- i_acl_3272611_zext_to_i32_gmm_substract_vt_select_19(BITSELECT,169)@14
    i_acl_3272611_zext_to_i32_gmm_substract_vt_select_19_b <= i_acl_3272611_zext_to_i32_gmm_substract_sel_x_b(19 downto 0);

    -- i_acl_3272611_zext_to_i32_gmm_substract_vt_join(BITJOIN,168)@14
    i_acl_3272611_zext_to_i32_gmm_substract_vt_join_q <= i_acl_3172609_zext_to_i32_gmm_substract_vt_const_31_q & i_acl_3272611_zext_to_i32_gmm_substract_vt_select_19_b;

    -- i_conv797_1_gmm_substract(BLACKBOX,318)@14
    -- out out_primWireOut@23
    thei_conv797_1_gmm_substract : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA0Ze2a150g24ad20454ck5u
    PORT MAP (
        in_0 => i_acl_3272611_zext_to_i32_gmm_substract_vt_join_q,
        out_primWireOut => i_conv797_1_gmm_substract_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist34_i_conv797_1_gmm_substract_out_primWireOut_1(DELAY,763)
    redist34_i_conv797_1_gmm_substract_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv797_1_gmm_substract_out_primWireOut, xout => redist34_i_conv797_1_gmm_substract_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_negate_sign193_gmm_substract(LOGICAL,427)@24
    i_negate_sign193_gmm_substract_q <= redist34_i_conv797_1_gmm_substract_out_primWireOut_1_q xor c_i32_2147483648_q;

    -- i_div_1_gmm_substract(BLACKBOX,330)@15
    -- in in_0@24
    -- out out_primWireOut@36
    thei_div_1_gmm_substract : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA0Zcpq6c0ouqqcd06uqrcz0
    PORT MAP (
        in_0 => i_negate_sign193_gmm_substract_q,
        in_1 => redist88_dupName_2_constMult_x_out_primWireOut_1_q,
        out_primWireOut => i_div_1_gmm_substract_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist15_i_div_1_gmm_substract_out_primWireOut_1(DELAY,744)
    redist15_i_div_1_gmm_substract_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_div_1_gmm_substract_out_primWireOut, xout => redist15_i_div_1_gmm_substract_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_acl_expf_call_i69_1_gmm_substract(BLACKBOX,210)@37
    -- out out_primWireOut@60
    thei_acl_expf_call_i69_1_gmm_substract : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA0Z4ce2a150g24ad2045eny
    PORT MAP (
        in_0 => redist15_i_div_1_gmm_substract_out_primWireOut_1_q,
        out_primWireOut => i_acl_expf_call_i69_1_gmm_substract_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist57_i_acl_expf_call_i69_1_gmm_substract_out_primWireOut_1(DELAY,786)
    redist57_i_acl_expf_call_i69_1_gmm_substract_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_expf_call_i69_1_gmm_substract_out_primWireOut, xout => redist57_i_acl_expf_call_i69_1_gmm_substract_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- redist58_i_acl_expf_call_i69_1_gmm_substract_out_primWireOut_2(DELAY,787)
    redist58_i_acl_expf_call_i69_1_gmm_substract_out_primWireOut_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist57_i_acl_expf_call_i69_1_gmm_substract_out_primWireOut_1_q, xout => redist58_i_acl_expf_call_i69_1_gmm_substract_out_primWireOut_2_q, clk => clock, aclr => resetn );

    -- i_and_i_i71_1_gmm_substract(LOGICAL,231)@61
    i_and_i_i71_1_gmm_substract_q <= redist57_i_acl_expf_call_i69_1_gmm_substract_out_primWireOut_1_q and c_i32_2139095040_q;

    -- i_and_i_i71_1_gmm_substract_vt_select_30(BITSELECT,235)@61
    i_and_i_i71_1_gmm_substract_vt_select_30_b <= i_and_i_i71_1_gmm_substract_q(30 downto 23);

    -- i_and_i_i71_1_gmm_substract_vt_join(BITJOIN,234)@61
    i_and_i_i71_1_gmm_substract_vt_join_q <= GND_q & i_and_i_i71_1_gmm_substract_vt_select_30_b & i_and_i_i71_1_gmm_substract_vt_const_22_q;

    -- i_cmp_i_i72_1_gmm_substract(LOGICAL,303)@61 + 1
    i_cmp_i_i72_1_gmm_substract_qi <= "1" WHEN i_and_i_i71_1_gmm_substract_vt_join_q = c_i32_0gr_q ELSE "0";
    i_cmp_i_i72_1_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_i_i72_1_gmm_substract_qi, xout => i_cmp_i_i72_1_gmm_substract_q, clk => clock, aclr => resetn );

    -- i_astype1_i_i75_1_gmm_substract(MUX,276)@62 + 1
    i_astype1_i_i75_1_gmm_substract_s <= i_cmp_i_i72_1_gmm_substract_q;
    i_astype1_i_i75_1_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_astype1_i_i75_1_gmm_substract_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_astype1_i_i75_1_gmm_substract_s) IS
                WHEN "0" => i_astype1_i_i75_1_gmm_substract_q <= redist58_i_acl_expf_call_i69_1_gmm_substract_out_primWireOut_2_q;
                WHEN "1" => i_astype1_i_i75_1_gmm_substract_q <= c_float_0_000000e_00_q;
                WHEN OTHERS => i_astype1_i_i75_1_gmm_substract_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_ffwd_dst_select6282753_gmm_substract(BLACKBOX,405)@52
    thei_ffwd_dst_select6282753_gmm_substract : i_ffwd_dst_select6282753_gmm_substract2739
    PORT MAP (
        in_intel_reserved_ffwd_70_0 => in_intel_reserved_ffwd_70_0,
        in_stall_in => GND_q,
        in_valid_in => redist71_sync_in_aunroll_x_in_i_valid_52_q,
        out_dest_data_out_70_0 => i_ffwd_dst_select6282753_gmm_substract_out_dest_data_out_70_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_acl_4002697_gmm_substract(BLACKBOX,342)@52
    thei_ffwd_dst_acl_4002697_gmm_substract : i_ffwd_dst_acl_4002697_gmm_substract2737
    PORT MAP (
        in_intel_reserved_ffwd_40_0 => in_intel_reserved_ffwd_40_0,
        in_stall_in => GND_q,
        in_valid_in => redist71_sync_in_aunroll_x_in_i_valid_52_q,
        out_dest_data_out_40_0 => i_ffwd_dst_acl_4002697_gmm_substract_out_dest_data_out_40_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_cmp_i_i_i279_12660_gmm_substract(BLACKBOX,361)@52
    thei_ffwd_dst_cmp_i_i_i279_12660_gmm_substract : i_ffwd_dst_cmp_i_i_i279_12660_gmm_substract2735
    PORT MAP (
        in_intel_reserved_ffwd_35_0 => in_intel_reserved_ffwd_35_0,
        in_stall_in => GND_q,
        in_valid_in => redist71_sync_in_aunroll_x_in_i_valid_52_q,
        out_dest_data_out_35_0 => i_ffwd_dst_cmp_i_i_i279_12660_gmm_substract_out_dest_data_out_35_0,
        clock => clock,
        resetn => resetn
    );

    -- i_select525_gmm_substract(MUX,493)@52 + 1
    i_select525_gmm_substract_s <= i_ffwd_dst_cmp_i_i_i279_12660_gmm_substract_out_dest_data_out_35_0;
    i_select525_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_select525_gmm_substract_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_select525_gmm_substract_s) IS
                WHEN "0" => i_select525_gmm_substract_q <= i_ffwd_dst_acl_4002697_gmm_substract_out_dest_data_out_40_0;
                WHEN "1" => i_select525_gmm_substract_q <= i_ffwd_dst_select6282753_gmm_substract_out_dest_data_out_70_0;
                WHEN OTHERS => i_select525_gmm_substract_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_select525_zext_to_i32_gmm_substract_sel_x(BITSELECT,113)@53
    i_select525_zext_to_i32_gmm_substract_sel_x_b <= std_logic_vector(resize(unsigned(i_select525_gmm_substract_q(7 downto 0)), 32));

    -- i_select525_zext_to_i32_gmm_substract_vt_select_7(BITSELECT,497)@53
    i_select525_zext_to_i32_gmm_substract_vt_select_7_b <= i_select525_zext_to_i32_gmm_substract_sel_x_b(7 downto 0);

    -- i_select525_zext_to_i32_gmm_substract_vt_join(BITJOIN,496)@53
    i_select525_zext_to_i32_gmm_substract_vt_join_q <= i_select501_zext_to_i32_gmm_substract_vt_const_31_q & i_select525_zext_to_i32_gmm_substract_vt_select_7_b;

    -- i_conv813_1_gmm_substract(BLACKBOX,324)@53
    -- out out_primWireOut@62
    thei_conv813_1_gmm_substract : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA0Ze2a150g24ad20454ck5u
    PORT MAP (
        in_0 => i_select525_zext_to_i32_gmm_substract_vt_join_q,
        out_primWireOut => i_conv813_1_gmm_substract_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist25_i_conv813_1_gmm_substract_out_primWireOut_1(DELAY,754)
    redist25_i_conv813_1_gmm_substract_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv813_1_gmm_substract_out_primWireOut, xout => redist25_i_conv813_1_gmm_substract_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_mul815_1_gmm_substract(BLACKBOX,424)@63
    -- out out_primWireOut@70
    thei_mul815_1_gmm_substract : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA1Zcpq6c0ouqqcd06uqrcz0
    PORT MAP (
        in_0 => redist25_i_conv813_1_gmm_substract_out_primWireOut_1_q,
        in_1 => i_astype1_i_i75_1_gmm_substract_q,
        out_primWireOut => i_mul815_1_gmm_substract_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist9_i_mul815_1_gmm_substract_out_primWireOut_1(DELAY,738)
    redist9_i_mul815_1_gmm_substract_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul815_1_gmm_substract_out_primWireOut, xout => redist9_i_mul815_1_gmm_substract_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_div816_1_gmm_substract(BLACKBOX,327)@62
    -- in in_0@71
    -- out out_primWireOut@83
    thei_div816_1_gmm_substract : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA0Zcpq6c0ouqqcd06uqrcz0
    PORT MAP (
        in_0 => redist9_i_mul815_1_gmm_substract_out_primWireOut_1_q,
        in_1 => i_astype1_i_i92_1_gmm_substract_q,
        out_primWireOut => i_div816_1_gmm_substract_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist20_i_div816_1_gmm_substract_out_primWireOut_1(DELAY,749)
    redist20_i_div816_1_gmm_substract_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_div816_1_gmm_substract_out_primWireOut, xout => redist20_i_div816_1_gmm_substract_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- redist21_i_div816_1_gmm_substract_out_primWireOut_2(DELAY,750)
    redist21_i_div816_1_gmm_substract_out_primWireOut_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist20_i_div816_1_gmm_substract_out_primWireOut_1_q, xout => redist21_i_div816_1_gmm_substract_out_primWireOut_2_q, clk => clock, aclr => resetn );

    -- redist22_i_div816_1_gmm_substract_out_primWireOut_3(DELAY,751)
    redist22_i_div816_1_gmm_substract_out_primWireOut_3 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist21_i_div816_1_gmm_substract_out_primWireOut_2_q, xout => redist22_i_div816_1_gmm_substract_out_primWireOut_3_q, clk => clock, aclr => resetn );

    -- redist27_i_conv802_gmm_substract_out_primWireOut_26_notEnable(LOGICAL,830)
    redist27_i_conv802_gmm_substract_out_primWireOut_26_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist27_i_conv802_gmm_substract_out_primWireOut_26_nor(LOGICAL,831)
    redist27_i_conv802_gmm_substract_out_primWireOut_26_nor_q <= not (redist27_i_conv802_gmm_substract_out_primWireOut_26_notEnable_q or redist27_i_conv802_gmm_substract_out_primWireOut_26_sticky_ena_q);

    -- redist27_i_conv802_gmm_substract_out_primWireOut_26_mem_last(CONSTANT,827)
    redist27_i_conv802_gmm_substract_out_primWireOut_26_mem_last_q <= "010100";

    -- redist27_i_conv802_gmm_substract_out_primWireOut_26_cmp(LOGICAL,828)
    redist27_i_conv802_gmm_substract_out_primWireOut_26_cmp_b <= STD_LOGIC_VECTOR("0" & redist27_i_conv802_gmm_substract_out_primWireOut_26_rdcnt_q);
    redist27_i_conv802_gmm_substract_out_primWireOut_26_cmp_q <= "1" WHEN redist27_i_conv802_gmm_substract_out_primWireOut_26_mem_last_q = redist27_i_conv802_gmm_substract_out_primWireOut_26_cmp_b ELSE "0";

    -- redist27_i_conv802_gmm_substract_out_primWireOut_26_cmpReg(REG,829)
    redist27_i_conv802_gmm_substract_out_primWireOut_26_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist27_i_conv802_gmm_substract_out_primWireOut_26_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist27_i_conv802_gmm_substract_out_primWireOut_26_cmpReg_q <= STD_LOGIC_VECTOR(redist27_i_conv802_gmm_substract_out_primWireOut_26_cmp_q);
        END IF;
    END PROCESS;

    -- redist27_i_conv802_gmm_substract_out_primWireOut_26_sticky_ena(REG,832)
    redist27_i_conv802_gmm_substract_out_primWireOut_26_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist27_i_conv802_gmm_substract_out_primWireOut_26_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist27_i_conv802_gmm_substract_out_primWireOut_26_nor_q = "1") THEN
                redist27_i_conv802_gmm_substract_out_primWireOut_26_sticky_ena_q <= STD_LOGIC_VECTOR(redist27_i_conv802_gmm_substract_out_primWireOut_26_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist27_i_conv802_gmm_substract_out_primWireOut_26_enaAnd(LOGICAL,833)
    redist27_i_conv802_gmm_substract_out_primWireOut_26_enaAnd_q <= redist27_i_conv802_gmm_substract_out_primWireOut_26_sticky_ena_q and VCC_q;

    -- redist27_i_conv802_gmm_substract_out_primWireOut_26_rdcnt(COUNTER,825)
    -- low=0, high=21, step=1, init=0
    redist27_i_conv802_gmm_substract_out_primWireOut_26_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist27_i_conv802_gmm_substract_out_primWireOut_26_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist27_i_conv802_gmm_substract_out_primWireOut_26_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist27_i_conv802_gmm_substract_out_primWireOut_26_rdcnt_i = TO_UNSIGNED(20, 5)) THEN
                redist27_i_conv802_gmm_substract_out_primWireOut_26_rdcnt_eq <= '1';
            ELSE
                redist27_i_conv802_gmm_substract_out_primWireOut_26_rdcnt_eq <= '0';
            END IF;
            IF (redist27_i_conv802_gmm_substract_out_primWireOut_26_rdcnt_eq = '1') THEN
                redist27_i_conv802_gmm_substract_out_primWireOut_26_rdcnt_i <= redist27_i_conv802_gmm_substract_out_primWireOut_26_rdcnt_i + 11;
            ELSE
                redist27_i_conv802_gmm_substract_out_primWireOut_26_rdcnt_i <= redist27_i_conv802_gmm_substract_out_primWireOut_26_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist27_i_conv802_gmm_substract_out_primWireOut_26_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist27_i_conv802_gmm_substract_out_primWireOut_26_rdcnt_i, 5)));

    -- i_ffwd_dst_select5682741_gmm_substract(BLACKBOX,394)@0
    thei_ffwd_dst_select5682741_gmm_substract : i_ffwd_dst_select5682741_gmm_substract2697
    PORT MAP (
        in_intel_reserved_ffwd_60_0 => in_intel_reserved_ffwd_60_0,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_dest_data_out_60_0 => i_ffwd_dst_select5682741_gmm_substract_out_dest_data_out_60_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_acl_3772639_gmm_substract(BLACKBOX,339)@0
    thei_ffwd_dst_acl_3772639_gmm_substract : i_ffwd_dst_acl_3772639_gmm_substract2693
    PORT MAP (
        in_intel_reserved_ffwd_33_0 => in_intel_reserved_ffwd_33_0,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_dest_data_out_33_0 => i_ffwd_dst_acl_3772639_gmm_substract_out_dest_data_out_33_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_cmp_i_i_i279_12653_gmm_substract(BLACKBOX,354)@0
    thei_ffwd_dst_cmp_i_i_i279_12653_gmm_substract : i_ffwd_dst_cmp_i_i_i279_12653_gmm_substract2695
    PORT MAP (
        in_intel_reserved_ffwd_35_0 => in_intel_reserved_ffwd_35_0,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_dest_data_out_35_0 => i_ffwd_dst_cmp_i_i_i279_12653_gmm_substract_out_dest_data_out_35_0,
        clock => clock,
        resetn => resetn
    );

    -- i_select498_gmm_substract(MUX,470)@0 + 1
    i_select498_gmm_substract_s <= i_ffwd_dst_cmp_i_i_i279_12653_gmm_substract_out_dest_data_out_35_0;
    i_select498_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_select498_gmm_substract_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_select498_gmm_substract_s) IS
                WHEN "0" => i_select498_gmm_substract_q <= i_ffwd_dst_acl_3772639_gmm_substract_out_dest_data_out_33_0;
                WHEN "1" => i_select498_gmm_substract_q <= i_ffwd_dst_select5682741_gmm_substract_out_dest_data_out_60_0;
                WHEN OTHERS => i_select498_gmm_substract_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_select498_zext_to_i32_gmm_substract_sel_x(BITSELECT,109)@1
    i_select498_zext_to_i32_gmm_substract_sel_x_b <= std_logic_vector(resize(unsigned(i_select498_gmm_substract_q(15 downto 0)), 32));

    -- i_select498_zext_to_i32_gmm_substract_vt_select_15(BITSELECT,474)@1
    i_select498_zext_to_i32_gmm_substract_vt_select_15_b <= i_select498_zext_to_i32_gmm_substract_sel_x_b(15 downto 0);

    -- i_select498_zext_to_i32_gmm_substract_vt_join(BITJOIN,473)@1
    i_select498_zext_to_i32_gmm_substract_vt_join_q <= i_select498_zext_to_i32_gmm_substract_vt_const_31_q & i_select498_zext_to_i32_gmm_substract_vt_select_15_b;

    -- i_conv802_gmm_substract(BLACKBOX,323)@1
    -- out out_primWireOut@10
    thei_conv802_gmm_substract : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA0Ze2a150g24ad20454ck5u
    PORT MAP (
        in_0 => i_select498_zext_to_i32_gmm_substract_vt_join_q,
        out_primWireOut => i_conv802_gmm_substract_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist26_i_conv802_gmm_substract_out_primWireOut_1(DELAY,755)
    redist26_i_conv802_gmm_substract_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv802_gmm_substract_out_primWireOut, xout => redist26_i_conv802_gmm_substract_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- redist27_i_conv802_gmm_substract_out_primWireOut_26_inputreg(DELAY,822)
    redist27_i_conv802_gmm_substract_out_primWireOut_26_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist26_i_conv802_gmm_substract_out_primWireOut_1_q, xout => redist27_i_conv802_gmm_substract_out_primWireOut_26_inputreg_q, clk => clock, aclr => resetn );

    -- redist27_i_conv802_gmm_substract_out_primWireOut_26_wraddr(REG,826)
    redist27_i_conv802_gmm_substract_out_primWireOut_26_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist27_i_conv802_gmm_substract_out_primWireOut_26_wraddr_q <= "10101";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist27_i_conv802_gmm_substract_out_primWireOut_26_wraddr_q <= STD_LOGIC_VECTOR(redist27_i_conv802_gmm_substract_out_primWireOut_26_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist27_i_conv802_gmm_substract_out_primWireOut_26_mem(DUALMEM,824)
    redist27_i_conv802_gmm_substract_out_primWireOut_26_mem_ia <= STD_LOGIC_VECTOR(redist27_i_conv802_gmm_substract_out_primWireOut_26_inputreg_q);
    redist27_i_conv802_gmm_substract_out_primWireOut_26_mem_aa <= redist27_i_conv802_gmm_substract_out_primWireOut_26_wraddr_q;
    redist27_i_conv802_gmm_substract_out_primWireOut_26_mem_ab <= redist27_i_conv802_gmm_substract_out_primWireOut_26_rdcnt_q;
    redist27_i_conv802_gmm_substract_out_primWireOut_26_mem_reset0 <= not (resetn);
    redist27_i_conv802_gmm_substract_out_primWireOut_26_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 5,
        numwords_a => 22,
        width_b => 32,
        widthad_b => 5,
        numwords_b => 22,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist27_i_conv802_gmm_substract_out_primWireOut_26_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist27_i_conv802_gmm_substract_out_primWireOut_26_mem_reset0,
        clock1 => clock,
        address_a => redist27_i_conv802_gmm_substract_out_primWireOut_26_mem_aa,
        data_a => redist27_i_conv802_gmm_substract_out_primWireOut_26_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist27_i_conv802_gmm_substract_out_primWireOut_26_mem_ab,
        q_b => redist27_i_conv802_gmm_substract_out_primWireOut_26_mem_iq
    );
    redist27_i_conv802_gmm_substract_out_primWireOut_26_mem_q <= redist27_i_conv802_gmm_substract_out_primWireOut_26_mem_iq(31 downto 0);

    -- redist27_i_conv802_gmm_substract_out_primWireOut_26_outputreg(DELAY,823)
    redist27_i_conv802_gmm_substract_out_primWireOut_26_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist27_i_conv802_gmm_substract_out_primWireOut_26_mem_q, xout => redist27_i_conv802_gmm_substract_out_primWireOut_26_outputreg_q, clk => clock, aclr => resetn );

    -- i_mul808_gmm_substract(BLACKBOX,423)@36
    -- out out_primWireOut@43
    thei_mul808_gmm_substract : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA1Zcpq6c0ouqqcd06uqrcz0
    PORT MAP (
        in_0 => redist27_i_conv802_gmm_substract_out_primWireOut_26_outputreg_q,
        in_1 => c_float_0x401921FB60000000_q,
        out_primWireOut => i_mul808_gmm_substract_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist10_i_mul808_gmm_substract_out_primWireOut_1(DELAY,739)
    redist10_i_mul808_gmm_substract_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul808_gmm_substract_out_primWireOut, xout => redist10_i_mul808_gmm_substract_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_acl_sqrtf_call_i86_gmm_substract(BLACKBOX,215)@44
    -- out out_primWireOut@59
    thei_acl_sqrtf_call_i86_gmm_substract : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA1Z4ce2a150g24ad2045eny
    PORT MAP (
        in_0 => redist10_i_mul808_gmm_substract_out_primWireOut_1_q,
        out_primWireOut => i_acl_sqrtf_call_i86_gmm_substract_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist47_i_acl_sqrtf_call_i86_gmm_substract_out_primWireOut_1(DELAY,776)
    redist47_i_acl_sqrtf_call_i86_gmm_substract_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_sqrtf_call_i86_gmm_substract_out_primWireOut, xout => redist47_i_acl_sqrtf_call_i86_gmm_substract_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- redist48_i_acl_sqrtf_call_i86_gmm_substract_out_primWireOut_2(DELAY,777)
    redist48_i_acl_sqrtf_call_i86_gmm_substract_out_primWireOut_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist47_i_acl_sqrtf_call_i86_gmm_substract_out_primWireOut_1_q, xout => redist48_i_acl_sqrtf_call_i86_gmm_substract_out_primWireOut_2_q, clk => clock, aclr => resetn );

    -- i_and_i_i88_gmm_substract(LOGICAL,256)@60
    i_and_i_i88_gmm_substract_q <= redist47_i_acl_sqrtf_call_i86_gmm_substract_out_primWireOut_1_q and c_i32_2139095040_q;

    -- i_and_i_i88_gmm_substract_vt_select_30(BITSELECT,260)@60
    i_and_i_i88_gmm_substract_vt_select_30_b <= i_and_i_i88_gmm_substract_q(30 downto 23);

    -- i_and_i_i88_gmm_substract_vt_join(BITJOIN,259)@60
    i_and_i_i88_gmm_substract_vt_join_q <= GND_q & i_and_i_i88_gmm_substract_vt_select_30_b & i_and_i_i71_1_gmm_substract_vt_const_22_q;

    -- i_cmp_i_i89_gmm_substract(LOGICAL,308)@60 + 1
    i_cmp_i_i89_gmm_substract_qi <= "1" WHEN i_and_i_i88_gmm_substract_vt_join_q = c_i32_0gr_q ELSE "0";
    i_cmp_i_i89_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_i_i89_gmm_substract_qi, xout => i_cmp_i_i89_gmm_substract_q, clk => clock, aclr => resetn );

    -- i_astype1_i_i92_gmm_substract(MUX,281)@61 + 1
    i_astype1_i_i92_gmm_substract_s <= i_cmp_i_i89_gmm_substract_q;
    i_astype1_i_i92_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_astype1_i_i92_gmm_substract_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_astype1_i_i92_gmm_substract_s) IS
                WHEN "0" => i_astype1_i_i92_gmm_substract_q <= redist48_i_acl_sqrtf_call_i86_gmm_substract_out_primWireOut_2_q;
                WHEN "1" => i_astype1_i_i92_gmm_substract_q <= c_float_0_000000e_00_q;
                WHEN OTHERS => i_astype1_i_i92_gmm_substract_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- dupName_4_constMult_x(BLACKBOX,18)@11
    -- out out_primWireOut@14
    thedupName_4_constMult_x : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA1Z2cdo6u2ocpq6c0ouq3cz
    PORT MAP (
        in_0 => redist26_i_conv802_gmm_substract_out_primWireOut_1_q,
        out_primWireOut => dupName_4_constMult_x_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist86_dupName_4_constMult_x_out_primWireOut_1(DELAY,815)
    redist86_dupName_4_constMult_x_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => dupName_4_constMult_x_out_primWireOut, xout => redist86_dupName_4_constMult_x_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_ffwd_dst_acl_3172609_gmm_substract(BLACKBOX,333)@14
    thei_ffwd_dst_acl_3172609_gmm_substract : i_ffwd_dst_acl_3172609_gmm_substract2751
    PORT MAP (
        in_intel_reserved_ffwd_17_0 => in_intel_reserved_ffwd_17_0,
        in_stall_in => GND_q,
        in_valid_in => redist69_sync_in_aunroll_x_in_i_valid_14_q,
        out_dest_data_out_17_0 => i_ffwd_dst_acl_3172609_gmm_substract_out_dest_data_out_17_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_3172609_zext_to_i32_gmm_substract_sel_x(BITSELECT,103)@14
    i_acl_3172609_zext_to_i32_gmm_substract_sel_x_b <= std_logic_vector(resize(unsigned(i_ffwd_dst_acl_3172609_gmm_substract_out_dest_data_out_17_0(19 downto 0)), 32));

    -- i_acl_3172609_zext_to_i32_gmm_substract_vt_select_19(BITSELECT,161)@14
    i_acl_3172609_zext_to_i32_gmm_substract_vt_select_19_b <= i_acl_3172609_zext_to_i32_gmm_substract_sel_x_b(19 downto 0);

    -- i_acl_3172609_zext_to_i32_gmm_substract_vt_join(BITJOIN,160)@14
    i_acl_3172609_zext_to_i32_gmm_substract_vt_join_q <= i_acl_3172609_zext_to_i32_gmm_substract_vt_const_31_q & i_acl_3172609_zext_to_i32_gmm_substract_vt_select_19_b;

    -- i_conv797_gmm_substract(BLACKBOX,320)@14
    -- out out_primWireOut@23
    thei_conv797_gmm_substract : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA0Ze2a150g24ad20454ck5u
    PORT MAP (
        in_0 => i_acl_3172609_zext_to_i32_gmm_substract_vt_join_q,
        out_primWireOut => i_conv797_gmm_substract_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist32_i_conv797_gmm_substract_out_primWireOut_1(DELAY,761)
    redist32_i_conv797_gmm_substract_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv797_gmm_substract_out_primWireOut, xout => redist32_i_conv797_gmm_substract_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_negate_sign_gmm_substract(LOGICAL,429)@24
    i_negate_sign_gmm_substract_q <= redist32_i_conv797_gmm_substract_out_primWireOut_1_q xor c_i32_2147483648_q;

    -- i_div_gmm_substract(BLACKBOX,332)@15
    -- in in_0@24
    -- out out_primWireOut@36
    thei_div_gmm_substract : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA0Zcpq6c0ouqqcd06uqrcz0
    PORT MAP (
        in_0 => i_negate_sign_gmm_substract_q,
        in_1 => redist86_dupName_4_constMult_x_out_primWireOut_1_q,
        out_primWireOut => i_div_gmm_substract_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist13_i_div_gmm_substract_out_primWireOut_1(DELAY,742)
    redist13_i_div_gmm_substract_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_div_gmm_substract_out_primWireOut, xout => redist13_i_div_gmm_substract_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_acl_expf_call_i69_gmm_substract(BLACKBOX,212)@37
    -- out out_primWireOut@60
    thei_acl_expf_call_i69_gmm_substract : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA0Z4ce2a150g24ad2045eny
    PORT MAP (
        in_0 => redist13_i_div_gmm_substract_out_primWireOut_1_q,
        out_primWireOut => i_acl_expf_call_i69_gmm_substract_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist53_i_acl_expf_call_i69_gmm_substract_out_primWireOut_1(DELAY,782)
    redist53_i_acl_expf_call_i69_gmm_substract_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_expf_call_i69_gmm_substract_out_primWireOut, xout => redist53_i_acl_expf_call_i69_gmm_substract_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- redist54_i_acl_expf_call_i69_gmm_substract_out_primWireOut_2(DELAY,783)
    redist54_i_acl_expf_call_i69_gmm_substract_out_primWireOut_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist53_i_acl_expf_call_i69_gmm_substract_out_primWireOut_1_q, xout => redist54_i_acl_expf_call_i69_gmm_substract_out_primWireOut_2_q, clk => clock, aclr => resetn );

    -- i_and_i_i71_gmm_substract(LOGICAL,241)@61
    i_and_i_i71_gmm_substract_q <= redist53_i_acl_expf_call_i69_gmm_substract_out_primWireOut_1_q and c_i32_2139095040_q;

    -- i_and_i_i71_gmm_substract_vt_select_30(BITSELECT,245)@61
    i_and_i_i71_gmm_substract_vt_select_30_b <= i_and_i_i71_gmm_substract_q(30 downto 23);

    -- i_and_i_i71_gmm_substract_vt_join(BITJOIN,244)@61
    i_and_i_i71_gmm_substract_vt_join_q <= GND_q & i_and_i_i71_gmm_substract_vt_select_30_b & i_and_i_i71_1_gmm_substract_vt_const_22_q;

    -- i_cmp_i_i72_gmm_substract(LOGICAL,305)@61 + 1
    i_cmp_i_i72_gmm_substract_qi <= "1" WHEN i_and_i_i71_gmm_substract_vt_join_q = c_i32_0gr_q ELSE "0";
    i_cmp_i_i72_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_i_i72_gmm_substract_qi, xout => i_cmp_i_i72_gmm_substract_q, clk => clock, aclr => resetn );

    -- i_astype1_i_i75_gmm_substract(MUX,278)@62 + 1
    i_astype1_i_i75_gmm_substract_s <= i_cmp_i_i72_gmm_substract_q;
    i_astype1_i_i75_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_astype1_i_i75_gmm_substract_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_astype1_i_i75_gmm_substract_s) IS
                WHEN "0" => i_astype1_i_i75_gmm_substract_q <= redist54_i_acl_expf_call_i69_gmm_substract_out_primWireOut_2_q;
                WHEN "1" => i_astype1_i_i75_gmm_substract_q <= c_float_0_000000e_00_q;
                WHEN OTHERS => i_astype1_i_i75_gmm_substract_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_ffwd_dst_select5742742_gmm_substract(BLACKBOX,395)@52
    thei_ffwd_dst_select5742742_gmm_substract : i_ffwd_dst_select5742742_gmm_substract2703
    PORT MAP (
        in_intel_reserved_ffwd_61_0 => in_intel_reserved_ffwd_61_0,
        in_stall_in => GND_q,
        in_valid_in => redist71_sync_in_aunroll_x_in_i_valid_52_q,
        out_dest_data_out_61_0 => i_ffwd_dst_select5742742_gmm_substract_out_dest_data_out_61_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_acl_3972690_gmm_substract(BLACKBOX,341)@52
    thei_ffwd_dst_acl_3972690_gmm_substract : i_ffwd_dst_acl_3972690_gmm_substract2701
    PORT MAP (
        in_intel_reserved_ffwd_39_0 => in_intel_reserved_ffwd_39_0,
        in_stall_in => GND_q,
        in_valid_in => redist71_sync_in_aunroll_x_in_i_valid_52_q,
        out_dest_data_out_39_0 => i_ffwd_dst_acl_3972690_gmm_substract_out_dest_data_out_39_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_cmp_i_i_i279_12654_gmm_substract(BLACKBOX,355)@52
    thei_ffwd_dst_cmp_i_i_i279_12654_gmm_substract : i_ffwd_dst_cmp_i_i_i279_12654_gmm_substract2699
    PORT MAP (
        in_intel_reserved_ffwd_35_0 => in_intel_reserved_ffwd_35_0,
        in_stall_in => GND_q,
        in_valid_in => redist71_sync_in_aunroll_x_in_i_valid_52_q,
        out_dest_data_out_35_0 => i_ffwd_dst_cmp_i_i_i279_12654_gmm_substract_out_dest_data_out_35_0,
        clock => clock,
        resetn => resetn
    );

    -- i_select501_gmm_substract(MUX,475)@52 + 1
    i_select501_gmm_substract_s <= i_ffwd_dst_cmp_i_i_i279_12654_gmm_substract_out_dest_data_out_35_0;
    i_select501_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_select501_gmm_substract_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_select501_gmm_substract_s) IS
                WHEN "0" => i_select501_gmm_substract_q <= i_ffwd_dst_acl_3972690_gmm_substract_out_dest_data_out_39_0;
                WHEN "1" => i_select501_gmm_substract_q <= i_ffwd_dst_select5742742_gmm_substract_out_dest_data_out_61_0;
                WHEN OTHERS => i_select501_gmm_substract_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_select501_zext_to_i32_gmm_substract_sel_x(BITSELECT,110)@53
    i_select501_zext_to_i32_gmm_substract_sel_x_b <= std_logic_vector(resize(unsigned(i_select501_gmm_substract_q(7 downto 0)), 32));

    -- i_select501_zext_to_i32_gmm_substract_vt_select_7(BITSELECT,479)@53
    i_select501_zext_to_i32_gmm_substract_vt_select_7_b <= i_select501_zext_to_i32_gmm_substract_sel_x_b(7 downto 0);

    -- i_select501_zext_to_i32_gmm_substract_vt_join(BITJOIN,478)@53
    i_select501_zext_to_i32_gmm_substract_vt_join_q <= i_select501_zext_to_i32_gmm_substract_vt_const_31_q & i_select501_zext_to_i32_gmm_substract_vt_select_7_b;

    -- i_conv813_gmm_substract(BLACKBOX,326)@53
    -- out out_primWireOut@62
    thei_conv813_gmm_substract : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA0Ze2a150g24ad20454ck5u
    PORT MAP (
        in_0 => i_select501_zext_to_i32_gmm_substract_vt_join_q,
        out_primWireOut => i_conv813_gmm_substract_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist23_i_conv813_gmm_substract_out_primWireOut_1(DELAY,752)
    redist23_i_conv813_gmm_substract_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv813_gmm_substract_out_primWireOut, xout => redist23_i_conv813_gmm_substract_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_mul815_gmm_substract(BLACKBOX,426)@63
    -- out out_primWireOut@70
    thei_mul815_gmm_substract : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA1Zcpq6c0ouqqcd06uqrcz0
    PORT MAP (
        in_0 => redist23_i_conv813_gmm_substract_out_primWireOut_1_q,
        in_1 => i_astype1_i_i75_gmm_substract_q,
        out_primWireOut => i_mul815_gmm_substract_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist7_i_mul815_gmm_substract_out_primWireOut_1(DELAY,736)
    redist7_i_mul815_gmm_substract_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul815_gmm_substract_out_primWireOut, xout => redist7_i_mul815_gmm_substract_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_div816_gmm_substract(BLACKBOX,329)@62
    -- in in_0@71
    -- out out_primWireOut@83
    thei_div816_gmm_substract : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA0Zcpq6c0ouqqcd06uqrcz0
    PORT MAP (
        in_0 => redist7_i_mul815_gmm_substract_out_primWireOut_1_q,
        in_1 => i_astype1_i_i92_gmm_substract_q,
        out_primWireOut => i_div816_gmm_substract_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist16_i_div816_gmm_substract_out_primWireOut_1(DELAY,745)
    redist16_i_div816_gmm_substract_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_div816_gmm_substract_out_primWireOut, xout => redist16_i_div816_gmm_substract_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- redist17_i_div816_gmm_substract_out_primWireOut_2(DELAY,746)
    redist17_i_div816_gmm_substract_out_primWireOut_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist16_i_div816_gmm_substract_out_primWireOut_1_q, xout => redist17_i_div816_gmm_substract_out_primWireOut_2_q, clk => clock, aclr => resetn );

    -- redist18_i_div816_gmm_substract_out_primWireOut_3(DELAY,747)
    redist18_i_div816_gmm_substract_out_primWireOut_3 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist17_i_div816_gmm_substract_out_primWireOut_2_q, xout => redist18_i_div816_gmm_substract_out_primWireOut_3_q, clk => clock, aclr => resetn );

    -- frac_y_uid575_i_cmp838_1_gmm_substract(BITSELECT,574)@84
    frac_y_uid575_i_cmp838_1_gmm_substract_b <= redist20_i_div816_1_gmm_substract_out_primWireOut_1_q(22 downto 0);

    -- fracXIsZero_uid578_i_cmp838_1_gmm_substract(LOGICAL,577)@84
    fracXIsZero_uid578_i_cmp838_1_gmm_substract_q <= "1" WHEN i_and_i_i71_1_gmm_substract_vt_const_22_q = frac_y_uid575_i_cmp838_1_gmm_substract_b ELSE "0";

    -- exp_y_uid574_i_cmp838_1_gmm_substract(BITSELECT,573)@84
    exp_y_uid574_i_cmp838_1_gmm_substract_b <= redist20_i_div816_1_gmm_substract_out_primWireOut_1_q(30 downto 23);

    -- expXIsZero_uid576_i_cmp838_1_gmm_substract(LOGICAL,575)@84
    expXIsZero_uid576_i_cmp838_1_gmm_substract_q <= "1" WHEN exp_y_uid574_i_cmp838_1_gmm_substract_b = cstAllZWE_uid556_i_cmp838_1_gmm_substract_q ELSE "0";

    -- excZ_y_uid580_i_cmp838_1_gmm_substract(LOGICAL,579)@84 + 1
    excZ_y_uid580_i_cmp838_1_gmm_substract_qi <= expXIsZero_uid576_i_cmp838_1_gmm_substract_q and fracXIsZero_uid578_i_cmp838_1_gmm_substract_q;
    excZ_y_uid580_i_cmp838_1_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excZ_y_uid580_i_cmp838_1_gmm_substract_qi, xout => excZ_y_uid580_i_cmp838_1_gmm_substract_q, clk => clock, aclr => resetn );

    -- invExcYZ_uid610_i_cmp838_1_gmm_substract(LOGICAL,609)@85
    invExcYZ_uid610_i_cmp838_1_gmm_substract_q <= not (excZ_y_uid580_i_cmp838_1_gmm_substract_q);

    -- frac_x_uid558_i_cmp838_1_gmm_substract(BITSELECT,557)@84
    frac_x_uid558_i_cmp838_1_gmm_substract_b <= redist16_i_div816_gmm_substract_out_primWireOut_1_q(22 downto 0);

    -- fracXIsZero_uid561_i_cmp838_1_gmm_substract(LOGICAL,560)@84
    fracXIsZero_uid561_i_cmp838_1_gmm_substract_q <= "1" WHEN i_and_i_i71_1_gmm_substract_vt_const_22_q = frac_x_uid558_i_cmp838_1_gmm_substract_b ELSE "0";

    -- exp_x_uid557_i_cmp838_1_gmm_substract(BITSELECT,556)@84
    exp_x_uid557_i_cmp838_1_gmm_substract_b <= redist16_i_div816_gmm_substract_out_primWireOut_1_q(30 downto 23);

    -- expXIsZero_uid559_i_cmp838_1_gmm_substract(LOGICAL,558)@84
    expXIsZero_uid559_i_cmp838_1_gmm_substract_q <= "1" WHEN exp_x_uid557_i_cmp838_1_gmm_substract_b = cstAllZWE_uid556_i_cmp838_1_gmm_substract_q ELSE "0";

    -- excZ_x_uid563_i_cmp838_1_gmm_substract(LOGICAL,562)@84 + 1
    excZ_x_uid563_i_cmp838_1_gmm_substract_qi <= expXIsZero_uid559_i_cmp838_1_gmm_substract_q and fracXIsZero_uid561_i_cmp838_1_gmm_substract_q;
    excZ_x_uid563_i_cmp838_1_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excZ_x_uid563_i_cmp838_1_gmm_substract_qi, xout => excZ_x_uid563_i_cmp838_1_gmm_substract_q, clk => clock, aclr => resetn );

    -- invExcXZ_uid611_i_cmp838_1_gmm_substract(LOGICAL,610)@85
    invExcXZ_uid611_i_cmp838_1_gmm_substract_q <= not (excZ_x_uid563_i_cmp838_1_gmm_substract_q);

    -- oneNonZero_uid612_i_cmp838_1_gmm_substract(LOGICAL,611)@85
    oneNonZero_uid612_i_cmp838_1_gmm_substract_q <= invExcXZ_uid611_i_cmp838_1_gmm_substract_q or invExcYZ_uid610_i_cmp838_1_gmm_substract_q;

    -- two_uid604_i_cmp838_1_gmm_substract(CONSTANT,603)
    two_uid604_i_cmp838_1_gmm_substract_q <= "10";

    -- signX_uid602_i_cmp838_1_gmm_substract(BITSELECT,601)@85
    signX_uid602_i_cmp838_1_gmm_substract_b <= STD_LOGIC_VECTOR(redist17_i_div816_gmm_substract_out_primWireOut_2_q(31 downto 31));

    -- signY_uid603_i_cmp838_1_gmm_substract(BITSELECT,602)@85
    signY_uid603_i_cmp838_1_gmm_substract_b <= STD_LOGIC_VECTOR(redist21_i_div816_1_gmm_substract_out_primWireOut_2_q(31 downto 31));

    -- concSXSY_uid605_i_cmp838_1_gmm_substract(BITJOIN,604)@85
    concSXSY_uid605_i_cmp838_1_gmm_substract_q <= signX_uid602_i_cmp838_1_gmm_substract_b & signY_uid603_i_cmp838_1_gmm_substract_b;

    -- sxLTsy_uid606_i_cmp838_1_gmm_substract(LOGICAL,605)@85
    sxLTsy_uid606_i_cmp838_1_gmm_substract_q <= "1" WHEN concSXSY_uid605_i_cmp838_1_gmm_substract_q = two_uid604_i_cmp838_1_gmm_substract_q ELSE "0";

    -- rc2_uid613_i_cmp838_1_gmm_substract(LOGICAL,612)@85
    rc2_uid613_i_cmp838_1_gmm_substract_q <= sxLTsy_uid606_i_cmp838_1_gmm_substract_q and oneNonZero_uid612_i_cmp838_1_gmm_substract_q;

    -- expFracX_uid593_i_cmp838_1_gmm_substract(BITJOIN,592)@84
    expFracX_uid593_i_cmp838_1_gmm_substract_q <= exp_x_uid557_i_cmp838_1_gmm_substract_b & frac_x_uid558_i_cmp838_1_gmm_substract_b;

    -- expFracY_uid595_i_cmp838_1_gmm_substract(BITJOIN,594)@84
    expFracY_uid595_i_cmp838_1_gmm_substract_q <= exp_y_uid574_i_cmp838_1_gmm_substract_b & frac_y_uid575_i_cmp838_1_gmm_substract_b;

    -- efxGTefy_uid597_i_cmp838_1_gmm_substract(COMPARE,596)@84 + 1
    efxGTefy_uid597_i_cmp838_1_gmm_substract_a <= STD_LOGIC_VECTOR("00" & expFracY_uid595_i_cmp838_1_gmm_substract_q);
    efxGTefy_uid597_i_cmp838_1_gmm_substract_b <= STD_LOGIC_VECTOR("00" & expFracX_uid593_i_cmp838_1_gmm_substract_q);
    efxGTefy_uid597_i_cmp838_1_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            efxGTefy_uid597_i_cmp838_1_gmm_substract_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            efxGTefy_uid597_i_cmp838_1_gmm_substract_o <= STD_LOGIC_VECTOR(UNSIGNED(efxGTefy_uid597_i_cmp838_1_gmm_substract_a) - UNSIGNED(efxGTefy_uid597_i_cmp838_1_gmm_substract_b));
        END IF;
    END PROCESS;
    efxGTefy_uid597_i_cmp838_1_gmm_substract_c(0) <= efxGTefy_uid597_i_cmp838_1_gmm_substract_o(32);

    -- efxLTefy_uid598_i_cmp838_1_gmm_substract(COMPARE,597)@84 + 1
    efxLTefy_uid598_i_cmp838_1_gmm_substract_a <= STD_LOGIC_VECTOR("00" & expFracX_uid593_i_cmp838_1_gmm_substract_q);
    efxLTefy_uid598_i_cmp838_1_gmm_substract_b <= STD_LOGIC_VECTOR("00" & expFracY_uid595_i_cmp838_1_gmm_substract_q);
    efxLTefy_uid598_i_cmp838_1_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            efxLTefy_uid598_i_cmp838_1_gmm_substract_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            efxLTefy_uid598_i_cmp838_1_gmm_substract_o <= STD_LOGIC_VECTOR(UNSIGNED(efxLTefy_uid598_i_cmp838_1_gmm_substract_a) - UNSIGNED(efxLTefy_uid598_i_cmp838_1_gmm_substract_b));
        END IF;
    END PROCESS;
    efxLTefy_uid598_i_cmp838_1_gmm_substract_c(0) <= efxLTefy_uid598_i_cmp838_1_gmm_substract_o(32);

    -- expFracCompMux_uid609_i_cmp838_1_gmm_substract(MUX,608)@85
    expFracCompMux_uid609_i_cmp838_1_gmm_substract_s <= signX_uid602_i_cmp838_1_gmm_substract_b;
    expFracCompMux_uid609_i_cmp838_1_gmm_substract_combproc: PROCESS (expFracCompMux_uid609_i_cmp838_1_gmm_substract_s, efxLTefy_uid598_i_cmp838_1_gmm_substract_c, efxGTefy_uid597_i_cmp838_1_gmm_substract_c)
    BEGIN
        CASE (expFracCompMux_uid609_i_cmp838_1_gmm_substract_s) IS
            WHEN "0" => expFracCompMux_uid609_i_cmp838_1_gmm_substract_q <= efxLTefy_uid598_i_cmp838_1_gmm_substract_c;
            WHEN "1" => expFracCompMux_uid609_i_cmp838_1_gmm_substract_q <= efxGTefy_uid597_i_cmp838_1_gmm_substract_c;
            WHEN OTHERS => expFracCompMux_uid609_i_cmp838_1_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- xorSigns_uid607_i_cmp838_1_gmm_substract(LOGICAL,606)@85
    xorSigns_uid607_i_cmp838_1_gmm_substract_q <= signX_uid602_i_cmp838_1_gmm_substract_b xor signY_uid603_i_cmp838_1_gmm_substract_b;

    -- sxEQsy_uid608_i_cmp838_1_gmm_substract(LOGICAL,607)@85
    sxEQsy_uid608_i_cmp838_1_gmm_substract_q <= not (xorSigns_uid607_i_cmp838_1_gmm_substract_q);

    -- sxEQsyExpFracCompMux_uid614_i_cmp838_1_gmm_substract(LOGICAL,613)@85
    sxEQsyExpFracCompMux_uid614_i_cmp838_1_gmm_substract_q <= sxEQsy_uid608_i_cmp838_1_gmm_substract_q and expFracCompMux_uid609_i_cmp838_1_gmm_substract_q;

    -- r_uid615_i_cmp838_1_gmm_substract(LOGICAL,614)@85 + 1
    r_uid615_i_cmp838_1_gmm_substract_qi <= sxEQsyExpFracCompMux_uid614_i_cmp838_1_gmm_substract_q or rc2_uid613_i_cmp838_1_gmm_substract_q;
    r_uid615_i_cmp838_1_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => r_uid615_i_cmp838_1_gmm_substract_qi, xout => r_uid615_i_cmp838_1_gmm_substract_q, clk => clock, aclr => resetn );

    -- fracXIsNotZero_uid579_i_cmp838_1_gmm_substract(LOGICAL,578)@84
    fracXIsNotZero_uid579_i_cmp838_1_gmm_substract_q <= not (fracXIsZero_uid578_i_cmp838_1_gmm_substract_q);

    -- cstAllOWE_uid554_i_cmp838_1_gmm_substract(CONSTANT,553)
    cstAllOWE_uid554_i_cmp838_1_gmm_substract_q <= "11111111";

    -- expXIsMax_uid577_i_cmp838_1_gmm_substract(LOGICAL,576)@84
    expXIsMax_uid577_i_cmp838_1_gmm_substract_q <= "1" WHEN exp_y_uid574_i_cmp838_1_gmm_substract_b = cstAllOWE_uid554_i_cmp838_1_gmm_substract_q ELSE "0";

    -- excN_y_uid582_i_cmp838_1_gmm_substract(LOGICAL,581)@84 + 1
    excN_y_uid582_i_cmp838_1_gmm_substract_qi <= expXIsMax_uid577_i_cmp838_1_gmm_substract_q and fracXIsNotZero_uid579_i_cmp838_1_gmm_substract_q;
    excN_y_uid582_i_cmp838_1_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excN_y_uid582_i_cmp838_1_gmm_substract_qi, xout => excN_y_uid582_i_cmp838_1_gmm_substract_q, clk => clock, aclr => resetn );

    -- fracXIsNotZero_uid562_i_cmp838_1_gmm_substract(LOGICAL,561)@84
    fracXIsNotZero_uid562_i_cmp838_1_gmm_substract_q <= not (fracXIsZero_uid561_i_cmp838_1_gmm_substract_q);

    -- expXIsMax_uid560_i_cmp838_1_gmm_substract(LOGICAL,559)@84
    expXIsMax_uid560_i_cmp838_1_gmm_substract_q <= "1" WHEN exp_x_uid557_i_cmp838_1_gmm_substract_b = cstAllOWE_uid554_i_cmp838_1_gmm_substract_q ELSE "0";

    -- excN_x_uid565_i_cmp838_1_gmm_substract(LOGICAL,564)@84 + 1
    excN_x_uid565_i_cmp838_1_gmm_substract_qi <= expXIsMax_uid560_i_cmp838_1_gmm_substract_q and fracXIsNotZero_uid562_i_cmp838_1_gmm_substract_q;
    excN_x_uid565_i_cmp838_1_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excN_x_uid565_i_cmp838_1_gmm_substract_qi, xout => excN_x_uid565_i_cmp838_1_gmm_substract_q, clk => clock, aclr => resetn );

    -- oneIsNaN_uid588_i_cmp838_1_gmm_substract(LOGICAL,587)@85 + 1
    oneIsNaN_uid588_i_cmp838_1_gmm_substract_qi <= excN_x_uid565_i_cmp838_1_gmm_substract_q or excN_y_uid582_i_cmp838_1_gmm_substract_q;
    oneIsNaN_uid588_i_cmp838_1_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => oneIsNaN_uid588_i_cmp838_1_gmm_substract_qi, xout => oneIsNaN_uid588_i_cmp838_1_gmm_substract_q, clk => clock, aclr => resetn );

    -- rPostExc_uid616_i_cmp838_1_gmm_substract(MUX,615)@86
    rPostExc_uid616_i_cmp838_1_gmm_substract_s <= oneIsNaN_uid588_i_cmp838_1_gmm_substract_q;
    rPostExc_uid616_i_cmp838_1_gmm_substract_combproc: PROCESS (rPostExc_uid616_i_cmp838_1_gmm_substract_s, r_uid615_i_cmp838_1_gmm_substract_q, GND_q)
    BEGIN
        CASE (rPostExc_uid616_i_cmp838_1_gmm_substract_s) IS
            WHEN "0" => rPostExc_uid616_i_cmp838_1_gmm_substract_q <= r_uid615_i_cmp838_1_gmm_substract_q;
            WHEN "1" => rPostExc_uid616_i_cmp838_1_gmm_substract_q <= GND_q;
            WHEN OTHERS => rPostExc_uid616_i_cmp838_1_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_dst_cmp_i_i_i279_12671_gmm_substract(BLACKBOX,371)@86
    thei_ffwd_dst_cmp_i_i_i279_12671_gmm_substract : i_ffwd_dst_cmp_i_i_i279_12671_gmm_substract2763
    PORT MAP (
        in_intel_reserved_ffwd_35_0 => in_intel_reserved_ffwd_35_0,
        in_stall_in => GND_q,
        in_valid_in => redist80_sync_in_aunroll_x_in_i_valid_86_q,
        out_dest_data_out_35_0 => i_ffwd_dst_cmp_i_i_i279_12671_gmm_substract_out_dest_data_out_35_0,
        clock => clock,
        resetn => resetn
    );

    -- i_or_cond_gmm_substract(LOGICAL,436)@86
    i_or_cond_gmm_substract_q <= i_ffwd_dst_cmp_i_i_i279_12671_gmm_substract_out_dest_data_out_35_0 and rPostExc_uid616_i_cmp838_1_gmm_substract_q;

    -- i_p_max_3_1_gmm_substract(MUX,437)@86
    i_p_max_3_1_gmm_substract_s <= i_or_cond_gmm_substract_q;
    i_p_max_3_1_gmm_substract_combproc: PROCESS (i_p_max_3_1_gmm_substract_s, redist18_i_div816_gmm_substract_out_primWireOut_3_q, redist22_i_div816_1_gmm_substract_out_primWireOut_3_q)
    BEGIN
        CASE (i_p_max_3_1_gmm_substract_s) IS
            WHEN "0" => i_p_max_3_1_gmm_substract_q <= redist18_i_div816_gmm_substract_out_primWireOut_3_q;
            WHEN "1" => i_p_max_3_1_gmm_substract_q <= redist22_i_div816_1_gmm_substract_out_primWireOut_3_q;
            WHEN OTHERS => i_p_max_3_1_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- frac_x_uid622_i_cmp838_2_gmm_substract(BITSELECT,621)@86
    frac_x_uid622_i_cmp838_2_gmm_substract_b <= i_p_max_3_1_gmm_substract_q(22 downto 0);

    -- redist2_frac_x_uid622_i_cmp838_2_gmm_substract_b_1(DELAY,731)
    redist2_frac_x_uid622_i_cmp838_2_gmm_substract_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => frac_x_uid622_i_cmp838_2_gmm_substract_b, xout => redist2_frac_x_uid622_i_cmp838_2_gmm_substract_b_1_q, clk => clock, aclr => resetn );

    -- fracXIsZero_uid625_i_cmp838_2_gmm_substract(LOGICAL,624)@87
    fracXIsZero_uid625_i_cmp838_2_gmm_substract_q <= "1" WHEN i_and_i_i71_1_gmm_substract_vt_const_22_q = redist2_frac_x_uid622_i_cmp838_2_gmm_substract_b_1_q ELSE "0";

    -- exp_x_uid621_i_cmp838_2_gmm_substract(BITSELECT,620)@86
    exp_x_uid621_i_cmp838_2_gmm_substract_b <= i_p_max_3_1_gmm_substract_q(30 downto 23);

    -- redist3_exp_x_uid621_i_cmp838_2_gmm_substract_b_1(DELAY,732)
    redist3_exp_x_uid621_i_cmp838_2_gmm_substract_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => exp_x_uid621_i_cmp838_2_gmm_substract_b, xout => redist3_exp_x_uid621_i_cmp838_2_gmm_substract_b_1_q, clk => clock, aclr => resetn );

    -- expXIsZero_uid623_i_cmp838_2_gmm_substract(LOGICAL,622)@87
    expXIsZero_uid623_i_cmp838_2_gmm_substract_q <= "1" WHEN redist3_exp_x_uid621_i_cmp838_2_gmm_substract_b_1_q = cstAllZWE_uid556_i_cmp838_1_gmm_substract_q ELSE "0";

    -- excZ_x_uid627_i_cmp838_2_gmm_substract(LOGICAL,626)@87 + 1
    excZ_x_uid627_i_cmp838_2_gmm_substract_qi <= expXIsZero_uid623_i_cmp838_2_gmm_substract_q and fracXIsZero_uid625_i_cmp838_2_gmm_substract_q;
    excZ_x_uid627_i_cmp838_2_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excZ_x_uid627_i_cmp838_2_gmm_substract_qi, xout => excZ_x_uid627_i_cmp838_2_gmm_substract_q, clk => clock, aclr => resetn );

    -- invExcXZ_uid675_i_cmp838_2_gmm_substract(LOGICAL,674)@88
    invExcXZ_uid675_i_cmp838_2_gmm_substract_q <= not (excZ_x_uid627_i_cmp838_2_gmm_substract_q);

    -- oneNonZero_uid676_i_cmp838_2_gmm_substract(LOGICAL,675)@88
    oneNonZero_uid676_i_cmp838_2_gmm_substract_q <= invExcXZ_uid675_i_cmp838_2_gmm_substract_q or invExcYZ_uid674_i_cmp838_2_gmm_substract_q;

    -- signX_uid666_i_cmp838_2_gmm_substract(BITSELECT,665)@86
    signX_uid666_i_cmp838_2_gmm_substract_b <= STD_LOGIC_VECTOR(i_p_max_3_1_gmm_substract_q(31 downto 31));

    -- redist1_signX_uid666_i_cmp838_2_gmm_substract_b_2(DELAY,730)
    redist1_signX_uid666_i_cmp838_2_gmm_substract_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => signX_uid666_i_cmp838_2_gmm_substract_b, xout => redist1_signX_uid666_i_cmp838_2_gmm_substract_b_2_q, clk => clock, aclr => resetn );

    -- signY_uid667_i_cmp838_2_gmm_substract(BITSELECT,666)@87
    signY_uid667_i_cmp838_2_gmm_substract_b <= STD_LOGIC_VECTOR(redist19_i_div816_2_gmm_substract_out_primWireOut_1_q(31 downto 31));

    -- redist0_signY_uid667_i_cmp838_2_gmm_substract_b_1(DELAY,729)
    redist0_signY_uid667_i_cmp838_2_gmm_substract_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => signY_uid667_i_cmp838_2_gmm_substract_b, xout => redist0_signY_uid667_i_cmp838_2_gmm_substract_b_1_q, clk => clock, aclr => resetn );

    -- concSXSY_uid669_i_cmp838_2_gmm_substract(BITJOIN,668)@88
    concSXSY_uid669_i_cmp838_2_gmm_substract_q <= redist1_signX_uid666_i_cmp838_2_gmm_substract_b_2_q & redist0_signY_uid667_i_cmp838_2_gmm_substract_b_1_q;

    -- sxLTsy_uid670_i_cmp838_2_gmm_substract(LOGICAL,669)@88
    sxLTsy_uid670_i_cmp838_2_gmm_substract_q <= "1" WHEN concSXSY_uid669_i_cmp838_2_gmm_substract_q = two_uid604_i_cmp838_1_gmm_substract_q ELSE "0";

    -- rc2_uid677_i_cmp838_2_gmm_substract(LOGICAL,676)@88
    rc2_uid677_i_cmp838_2_gmm_substract_q <= sxLTsy_uid670_i_cmp838_2_gmm_substract_q and oneNonZero_uid676_i_cmp838_2_gmm_substract_q;

    -- expFracX_uid657_i_cmp838_2_gmm_substract(BITJOIN,656)@87
    expFracX_uid657_i_cmp838_2_gmm_substract_q <= redist3_exp_x_uid621_i_cmp838_2_gmm_substract_b_1_q & redist2_frac_x_uid622_i_cmp838_2_gmm_substract_b_1_q;

    -- expFracY_uid659_i_cmp838_2_gmm_substract(BITJOIN,658)@87
    expFracY_uid659_i_cmp838_2_gmm_substract_q <= exp_y_uid638_i_cmp838_2_gmm_substract_b & frac_y_uid639_i_cmp838_2_gmm_substract_b;

    -- efxGTefy_uid661_i_cmp838_2_gmm_substract(COMPARE,660)@87 + 1
    efxGTefy_uid661_i_cmp838_2_gmm_substract_a <= STD_LOGIC_VECTOR("00" & expFracY_uid659_i_cmp838_2_gmm_substract_q);
    efxGTefy_uid661_i_cmp838_2_gmm_substract_b <= STD_LOGIC_VECTOR("00" & expFracX_uid657_i_cmp838_2_gmm_substract_q);
    efxGTefy_uid661_i_cmp838_2_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            efxGTefy_uid661_i_cmp838_2_gmm_substract_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            efxGTefy_uid661_i_cmp838_2_gmm_substract_o <= STD_LOGIC_VECTOR(UNSIGNED(efxGTefy_uid661_i_cmp838_2_gmm_substract_a) - UNSIGNED(efxGTefy_uid661_i_cmp838_2_gmm_substract_b));
        END IF;
    END PROCESS;
    efxGTefy_uid661_i_cmp838_2_gmm_substract_c(0) <= efxGTefy_uid661_i_cmp838_2_gmm_substract_o(32);

    -- efxLTefy_uid662_i_cmp838_2_gmm_substract(COMPARE,661)@87 + 1
    efxLTefy_uid662_i_cmp838_2_gmm_substract_a <= STD_LOGIC_VECTOR("00" & expFracX_uid657_i_cmp838_2_gmm_substract_q);
    efxLTefy_uid662_i_cmp838_2_gmm_substract_b <= STD_LOGIC_VECTOR("00" & expFracY_uid659_i_cmp838_2_gmm_substract_q);
    efxLTefy_uid662_i_cmp838_2_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            efxLTefy_uid662_i_cmp838_2_gmm_substract_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            efxLTefy_uid662_i_cmp838_2_gmm_substract_o <= STD_LOGIC_VECTOR(UNSIGNED(efxLTefy_uid662_i_cmp838_2_gmm_substract_a) - UNSIGNED(efxLTefy_uid662_i_cmp838_2_gmm_substract_b));
        END IF;
    END PROCESS;
    efxLTefy_uid662_i_cmp838_2_gmm_substract_c(0) <= efxLTefy_uid662_i_cmp838_2_gmm_substract_o(32);

    -- expFracCompMux_uid673_i_cmp838_2_gmm_substract(MUX,672)@88
    expFracCompMux_uid673_i_cmp838_2_gmm_substract_s <= redist1_signX_uid666_i_cmp838_2_gmm_substract_b_2_q;
    expFracCompMux_uid673_i_cmp838_2_gmm_substract_combproc: PROCESS (expFracCompMux_uid673_i_cmp838_2_gmm_substract_s, efxLTefy_uid662_i_cmp838_2_gmm_substract_c, efxGTefy_uid661_i_cmp838_2_gmm_substract_c)
    BEGIN
        CASE (expFracCompMux_uid673_i_cmp838_2_gmm_substract_s) IS
            WHEN "0" => expFracCompMux_uid673_i_cmp838_2_gmm_substract_q <= efxLTefy_uid662_i_cmp838_2_gmm_substract_c;
            WHEN "1" => expFracCompMux_uid673_i_cmp838_2_gmm_substract_q <= efxGTefy_uid661_i_cmp838_2_gmm_substract_c;
            WHEN OTHERS => expFracCompMux_uid673_i_cmp838_2_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- xorSigns_uid671_i_cmp838_2_gmm_substract(LOGICAL,670)@88
    xorSigns_uid671_i_cmp838_2_gmm_substract_q <= redist1_signX_uid666_i_cmp838_2_gmm_substract_b_2_q xor redist0_signY_uid667_i_cmp838_2_gmm_substract_b_1_q;

    -- sxEQsy_uid672_i_cmp838_2_gmm_substract(LOGICAL,671)@88
    sxEQsy_uid672_i_cmp838_2_gmm_substract_q <= not (xorSigns_uid671_i_cmp838_2_gmm_substract_q);

    -- sxEQsyExpFracCompMux_uid678_i_cmp838_2_gmm_substract(LOGICAL,677)@88
    sxEQsyExpFracCompMux_uid678_i_cmp838_2_gmm_substract_q <= sxEQsy_uid672_i_cmp838_2_gmm_substract_q and expFracCompMux_uid673_i_cmp838_2_gmm_substract_q;

    -- r_uid679_i_cmp838_2_gmm_substract(LOGICAL,678)@88 + 1
    r_uid679_i_cmp838_2_gmm_substract_qi <= sxEQsyExpFracCompMux_uid678_i_cmp838_2_gmm_substract_q or rc2_uid677_i_cmp838_2_gmm_substract_q;
    r_uid679_i_cmp838_2_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => r_uid679_i_cmp838_2_gmm_substract_qi, xout => r_uid679_i_cmp838_2_gmm_substract_q, clk => clock, aclr => resetn );

    -- fracXIsNotZero_uid643_i_cmp838_2_gmm_substract(LOGICAL,642)@87
    fracXIsNotZero_uid643_i_cmp838_2_gmm_substract_q <= not (fracXIsZero_uid642_i_cmp838_2_gmm_substract_q);

    -- expXIsMax_uid641_i_cmp838_2_gmm_substract(LOGICAL,640)@87
    expXIsMax_uid641_i_cmp838_2_gmm_substract_q <= "1" WHEN exp_y_uid638_i_cmp838_2_gmm_substract_b = cstAllOWE_uid554_i_cmp838_1_gmm_substract_q ELSE "0";

    -- excN_y_uid646_i_cmp838_2_gmm_substract(LOGICAL,645)@87 + 1
    excN_y_uid646_i_cmp838_2_gmm_substract_qi <= expXIsMax_uid641_i_cmp838_2_gmm_substract_q and fracXIsNotZero_uid643_i_cmp838_2_gmm_substract_q;
    excN_y_uid646_i_cmp838_2_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excN_y_uid646_i_cmp838_2_gmm_substract_qi, xout => excN_y_uid646_i_cmp838_2_gmm_substract_q, clk => clock, aclr => resetn );

    -- fracXIsNotZero_uid626_i_cmp838_2_gmm_substract(LOGICAL,625)@87
    fracXIsNotZero_uid626_i_cmp838_2_gmm_substract_q <= not (fracXIsZero_uid625_i_cmp838_2_gmm_substract_q);

    -- expXIsMax_uid624_i_cmp838_2_gmm_substract(LOGICAL,623)@87
    expXIsMax_uid624_i_cmp838_2_gmm_substract_q <= "1" WHEN redist3_exp_x_uid621_i_cmp838_2_gmm_substract_b_1_q = cstAllOWE_uid554_i_cmp838_1_gmm_substract_q ELSE "0";

    -- excN_x_uid629_i_cmp838_2_gmm_substract(LOGICAL,628)@87 + 1
    excN_x_uid629_i_cmp838_2_gmm_substract_qi <= expXIsMax_uid624_i_cmp838_2_gmm_substract_q and fracXIsNotZero_uid626_i_cmp838_2_gmm_substract_q;
    excN_x_uid629_i_cmp838_2_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excN_x_uid629_i_cmp838_2_gmm_substract_qi, xout => excN_x_uid629_i_cmp838_2_gmm_substract_q, clk => clock, aclr => resetn );

    -- oneIsNaN_uid652_i_cmp838_2_gmm_substract(LOGICAL,651)@88 + 1
    oneIsNaN_uid652_i_cmp838_2_gmm_substract_qi <= excN_x_uid629_i_cmp838_2_gmm_substract_q or excN_y_uid646_i_cmp838_2_gmm_substract_q;
    oneIsNaN_uid652_i_cmp838_2_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => oneIsNaN_uid652_i_cmp838_2_gmm_substract_qi, xout => oneIsNaN_uid652_i_cmp838_2_gmm_substract_q, clk => clock, aclr => resetn );

    -- rPostExc_uid680_i_cmp838_2_gmm_substract(MUX,679)@89
    rPostExc_uid680_i_cmp838_2_gmm_substract_s <= oneIsNaN_uid652_i_cmp838_2_gmm_substract_q;
    rPostExc_uid680_i_cmp838_2_gmm_substract_combproc: PROCESS (rPostExc_uid680_i_cmp838_2_gmm_substract_s, r_uid679_i_cmp838_2_gmm_substract_q, GND_q)
    BEGIN
        CASE (rPostExc_uid680_i_cmp838_2_gmm_substract_s) IS
            WHEN "0" => rPostExc_uid680_i_cmp838_2_gmm_substract_q <= r_uid679_i_cmp838_2_gmm_substract_q;
            WHEN "1" => rPostExc_uid680_i_cmp838_2_gmm_substract_q <= GND_q;
            WHEN OTHERS => rPostExc_uid680_i_cmp838_2_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_p_max_idx_3_1_gmm_substract_gmm_substract2765(MUX,438)@89
    i_p_max_idx_3_1_gmm_substract_gmm_substract2765_s <= rPostExc_uid680_i_cmp838_2_gmm_substract_q;
    i_p_max_idx_3_1_gmm_substract_gmm_substract2765_combproc: PROCESS (i_p_max_idx_3_1_gmm_substract_gmm_substract2765_s, i_p_max_idx_3_1_gmm_substract_vt_join_q, c_i32_2gr_q)
    BEGIN
        CASE (i_p_max_idx_3_1_gmm_substract_gmm_substract2765_s) IS
            WHEN "0" => i_p_max_idx_3_1_gmm_substract_gmm_substract2765_q <= i_p_max_idx_3_1_gmm_substract_vt_join_q;
            WHEN "1" => i_p_max_idx_3_1_gmm_substract_gmm_substract2765_q <= c_i32_2gr_q;
            WHEN OTHERS => i_p_max_idx_3_1_gmm_substract_gmm_substract2765_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_p_max_idx_3_1_gmm_substract_gmm_substract2765_vt_select_1(BITSELECT,441)@89
    i_p_max_idx_3_1_gmm_substract_gmm_substract2765_vt_select_1_b <= i_p_max_idx_3_1_gmm_substract_gmm_substract2765_q(1 downto 0);

    -- i_p_max_idx_3_1_gmm_substract_gmm_substract2765_vt_join(BITJOIN,440)@89
    i_p_max_idx_3_1_gmm_substract_gmm_substract2765_vt_join_q <= i_acl_443_gmm_substract_vt_const_31_q & i_p_max_idx_3_1_gmm_substract_gmm_substract2765_vt_select_1_b;

    -- i_p_max_idx_3_1_gmm_substract_vt_const_31(CONSTANT,443)
    i_p_max_idx_3_1_gmm_substract_vt_const_31_q <= "0000000000000000000000000000000";

    -- i_p_max_idx_3_1_gmm_substract_sel_x(BITSELECT,108)@86
    i_p_max_idx_3_1_gmm_substract_sel_x_b <= std_logic_vector(resize(unsigned(i_or_cond_gmm_substract_q(0 downto 0)), 32));

    -- i_p_max_idx_3_1_gmm_substract_vt_select_0(BITSELECT,445)@86
    i_p_max_idx_3_1_gmm_substract_vt_select_0_b <= i_p_max_idx_3_1_gmm_substract_sel_x_b(0 downto 0);

    -- redist6_i_p_max_idx_3_1_gmm_substract_vt_select_0_b_3(DELAY,735)
    redist6_i_p_max_idx_3_1_gmm_substract_vt_select_0_b_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_p_max_idx_3_1_gmm_substract_vt_select_0_b, xout => redist6_i_p_max_idx_3_1_gmm_substract_vt_select_0_b_3_q, clk => clock, aclr => resetn );

    -- i_p_max_idx_3_1_gmm_substract_vt_join(BITJOIN,444)@89
    i_p_max_idx_3_1_gmm_substract_vt_join_q <= i_p_max_idx_3_1_gmm_substract_vt_const_31_q & redist6_i_p_max_idx_3_1_gmm_substract_vt_select_0_b_3_q;

    -- i_ffwd_dst_cmp_i_i_i279_22684_gmm_substract(BLACKBOX,380)@89
    thei_ffwd_dst_cmp_i_i_i279_22684_gmm_substract : i_ffwd_dst_cmp_i_i_i279_22684_gmm_substract2766
    PORT MAP (
        in_intel_reserved_ffwd_37_0 => in_intel_reserved_ffwd_37_0,
        in_stall_in => GND_q,
        in_valid_in => redist81_sync_in_aunroll_x_in_i_valid_89_q,
        out_dest_data_out_37_0 => i_ffwd_dst_cmp_i_i_i279_22684_gmm_substract_out_dest_data_out_37_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_443_gmm_substract(MUX,170)@89
    i_acl_443_gmm_substract_s <= i_ffwd_dst_cmp_i_i_i279_22684_gmm_substract_out_dest_data_out_37_0;
    i_acl_443_gmm_substract_combproc: PROCESS (i_acl_443_gmm_substract_s, i_p_max_idx_3_1_gmm_substract_vt_join_q, i_p_max_idx_3_1_gmm_substract_gmm_substract2765_vt_join_q)
    BEGIN
        CASE (i_acl_443_gmm_substract_s) IS
            WHEN "0" => i_acl_443_gmm_substract_q <= i_p_max_idx_3_1_gmm_substract_vt_join_q;
            WHEN "1" => i_acl_443_gmm_substract_q <= i_p_max_idx_3_1_gmm_substract_gmm_substract2765_vt_join_q;
            WHEN OTHERS => i_acl_443_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_443_gmm_substract_vt_select_1(BITSELECT,173)@89
    i_acl_443_gmm_substract_vt_select_1_b <= i_acl_443_gmm_substract_q(1 downto 0);

    -- redist66_i_acl_443_gmm_substract_vt_select_1_b_1(DELAY,795)
    redist66_i_acl_443_gmm_substract_vt_select_1_b_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_443_gmm_substract_vt_select_1_b, xout => redist66_i_acl_443_gmm_substract_vt_select_1_b_1_q, clk => clock, aclr => resetn );

    -- i_acl_443_gmm_substract_vt_join(BITJOIN,172)@90
    i_acl_443_gmm_substract_vt_join_q <= i_acl_443_gmm_substract_vt_const_31_q & redist66_i_acl_443_gmm_substract_vt_select_1_b_1_q;

    -- i_ffwd_dst_b_12781_gmm_substract(BLACKBOX,344)@89
    thei_ffwd_dst_b_12781_gmm_substract : i_ffwd_dst_b_12781_gmm_substract2749
    PORT MAP (
        in_intel_reserved_ffwd_92_0 => in_intel_reserved_ffwd_92_0,
        in_stall_in => GND_q,
        in_valid_in => redist81_sync_in_aunroll_x_in_i_valid_89_q,
        out_dest_data_out_92_0 => i_ffwd_dst_b_12781_gmm_substract_out_dest_data_out_92_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_cmp_i_i_i279_12662_gmm_substract(BLACKBOX,363)@89
    thei_ffwd_dst_cmp_i_i_i279_12662_gmm_substract : i_ffwd_dst_cmp_i_i_i279_12662_gmm_substract2747
    PORT MAP (
        in_intel_reserved_ffwd_35_0 => in_intel_reserved_ffwd_35_0,
        in_stall_in => GND_q,
        in_valid_in => redist81_sync_in_aunroll_x_in_i_valid_89_q,
        out_dest_data_out_35_0 => i_ffwd_dst_cmp_i_i_i279_12662_gmm_substract_out_dest_data_out_35_0,
        clock => clock,
        resetn => resetn
    );

    -- i_select531_gmm_substract(MUX,503)@89 + 1
    i_select531_gmm_substract_s <= i_ffwd_dst_cmp_i_i_i279_12662_gmm_substract_out_dest_data_out_35_0;
    i_select531_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_select531_gmm_substract_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_select531_gmm_substract_s) IS
                WHEN "0" => i_select531_gmm_substract_q <= c_i32_0gr_q;
                WHEN "1" => i_select531_gmm_substract_q <= i_ffwd_dst_b_12781_gmm_substract_out_dest_data_out_92_0;
                WHEN OTHERS => i_select531_gmm_substract_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_cmp848_gmm_substract(COMPARE,299)@90
    i_cmp848_gmm_substract_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_select531_gmm_substract_q(31)) & i_select531_gmm_substract_q));
    i_cmp848_gmm_substract_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_acl_443_gmm_substract_vt_join_q(31)) & i_acl_443_gmm_substract_vt_join_q));
    i_cmp848_gmm_substract_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp848_gmm_substract_a) - SIGNED(i_cmp848_gmm_substract_b));
    i_cmp848_gmm_substract_c(0) <= i_cmp848_gmm_substract_o(33);

    -- i_ffwd_dst_unnamed_gmm_substract116_gmm_substract_aunroll_x(BLACKBOX,107)@90
    thei_ffwd_dst_unnamed_gmm_substract116_gmm_substract_aunroll_x : i_ffwd_dst_unnamed_gmm_substract116_gmm_substract2878
    PORT MAP (
        in_intel_reserved_ffwd_15_0_0 => in_intel_reserved_ffwd_15_0_0,
        in_intel_reserved_ffwd_15_0_1 => in_intel_reserved_ffwd_15_0_1,
        in_intel_reserved_ffwd_15_0_2 => in_intel_reserved_ffwd_15_0_2,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_15_0_0 => i_ffwd_dst_unnamed_gmm_substract116_gmm_substract_aunroll_x_out_dest_data_out_15_0_0,
        out_dest_data_out_15_0_1 => i_ffwd_dst_unnamed_gmm_substract116_gmm_substract_aunroll_x_out_dest_data_out_15_0_1,
        out_dest_data_out_15_0_2 => i_ffwd_dst_unnamed_gmm_substract116_gmm_substract_aunroll_x_out_dest_data_out_15_0_2,
        clock => clock,
        resetn => resetn
    );

    -- redist61_i_acl_472_gmm_substract_q_34_notEnable(LOGICAL,874)
    redist61_i_acl_472_gmm_substract_q_34_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist61_i_acl_472_gmm_substract_q_34_nor(LOGICAL,875)
    redist61_i_acl_472_gmm_substract_q_34_nor_q <= not (redist61_i_acl_472_gmm_substract_q_34_notEnable_q or redist61_i_acl_472_gmm_substract_q_34_sticky_ena_q);

    -- redist61_i_acl_472_gmm_substract_q_34_mem_last(CONSTANT,871)
    redist61_i_acl_472_gmm_substract_q_34_mem_last_q <= "011110";

    -- redist61_i_acl_472_gmm_substract_q_34_cmp(LOGICAL,872)
    redist61_i_acl_472_gmm_substract_q_34_cmp_b <= STD_LOGIC_VECTOR("0" & redist61_i_acl_472_gmm_substract_q_34_rdcnt_q);
    redist61_i_acl_472_gmm_substract_q_34_cmp_q <= "1" WHEN redist61_i_acl_472_gmm_substract_q_34_mem_last_q = redist61_i_acl_472_gmm_substract_q_34_cmp_b ELSE "0";

    -- redist61_i_acl_472_gmm_substract_q_34_cmpReg(REG,873)
    redist61_i_acl_472_gmm_substract_q_34_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist61_i_acl_472_gmm_substract_q_34_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist61_i_acl_472_gmm_substract_q_34_cmpReg_q <= STD_LOGIC_VECTOR(redist61_i_acl_472_gmm_substract_q_34_cmp_q);
        END IF;
    END PROCESS;

    -- redist61_i_acl_472_gmm_substract_q_34_sticky_ena(REG,876)
    redist61_i_acl_472_gmm_substract_q_34_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist61_i_acl_472_gmm_substract_q_34_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist61_i_acl_472_gmm_substract_q_34_nor_q = "1") THEN
                redist61_i_acl_472_gmm_substract_q_34_sticky_ena_q <= STD_LOGIC_VECTOR(redist61_i_acl_472_gmm_substract_q_34_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist61_i_acl_472_gmm_substract_q_34_enaAnd(LOGICAL,877)
    redist61_i_acl_472_gmm_substract_q_34_enaAnd_q <= redist61_i_acl_472_gmm_substract_q_34_sticky_ena_q and VCC_q;

    -- redist61_i_acl_472_gmm_substract_q_34_rdcnt(COUNTER,869)
    -- low=0, high=31, step=1, init=0
    redist61_i_acl_472_gmm_substract_q_34_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist61_i_acl_472_gmm_substract_q_34_rdcnt_i <= TO_UNSIGNED(0, 5);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist61_i_acl_472_gmm_substract_q_34_rdcnt_i <= redist61_i_acl_472_gmm_substract_q_34_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist61_i_acl_472_gmm_substract_q_34_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist61_i_acl_472_gmm_substract_q_34_rdcnt_i, 5)));

    -- i_ffwd_dst_unnamed_gmm_substract110_gmm_substract(BLACKBOX,416)@56
    thei_ffwd_dst_unnamed_gmm_substract110_gmm_substract : i_ffwd_dst_unnamed_gmm_substract110_gmm_substract2844
    PORT MAP (
        in_intel_reserved_ffwd_14_0 => in_intel_reserved_ffwd_14_0,
        in_stall_in => GND_q,
        in_valid_in => redist74_sync_in_aunroll_x_in_i_valid_56_q,
        out_dest_data_out_14_0 => i_ffwd_dst_unnamed_gmm_substract110_gmm_substract_out_dest_data_out_14_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_cmp_i_i_i279_22683_gmm_substract(BLACKBOX,379)@56
    thei_ffwd_dst_cmp_i_i_i279_22683_gmm_substract : i_ffwd_dst_cmp_i_i_i279_22683_gmm_substract2846
    PORT MAP (
        in_intel_reserved_ffwd_37_0 => in_intel_reserved_ffwd_37_0,
        in_stall_in => GND_q,
        in_valid_in => redist74_sync_in_aunroll_x_in_i_valid_56_q,
        out_dest_data_out_37_0 => i_ffwd_dst_cmp_i_i_i279_22683_gmm_substract_out_dest_data_out_37_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_472_gmm_substract(MUX,196)@56 + 1
    i_acl_472_gmm_substract_s <= i_ffwd_dst_cmp_i_i_i279_22683_gmm_substract_out_dest_data_out_37_0;
    i_acl_472_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_472_gmm_substract_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_acl_472_gmm_substract_s) IS
                WHEN "0" => i_acl_472_gmm_substract_q <= i_ffwd_dst_unnamed_gmm_substract110_gmm_substract_out_dest_data_out_14_0;
                WHEN "1" => i_acl_472_gmm_substract_q <= i_select519_gmm_substract_q;
                WHEN OTHERS => i_acl_472_gmm_substract_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist61_i_acl_472_gmm_substract_q_34_wraddr(REG,870)
    redist61_i_acl_472_gmm_substract_q_34_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist61_i_acl_472_gmm_substract_q_34_wraddr_q <= "11111";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist61_i_acl_472_gmm_substract_q_34_wraddr_q <= STD_LOGIC_VECTOR(redist61_i_acl_472_gmm_substract_q_34_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist61_i_acl_472_gmm_substract_q_34_mem(DUALMEM,868)
    redist61_i_acl_472_gmm_substract_q_34_mem_ia <= STD_LOGIC_VECTOR(i_acl_472_gmm_substract_q);
    redist61_i_acl_472_gmm_substract_q_34_mem_aa <= redist61_i_acl_472_gmm_substract_q_34_wraddr_q;
    redist61_i_acl_472_gmm_substract_q_34_mem_ab <= redist61_i_acl_472_gmm_substract_q_34_rdcnt_q;
    redist61_i_acl_472_gmm_substract_q_34_mem_reset0 <= not (resetn);
    redist61_i_acl_472_gmm_substract_q_34_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 5,
        numwords_a => 32,
        width_b => 8,
        widthad_b => 5,
        numwords_b => 32,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist61_i_acl_472_gmm_substract_q_34_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist61_i_acl_472_gmm_substract_q_34_mem_reset0,
        clock1 => clock,
        address_a => redist61_i_acl_472_gmm_substract_q_34_mem_aa,
        data_a => redist61_i_acl_472_gmm_substract_q_34_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist61_i_acl_472_gmm_substract_q_34_mem_ab,
        q_b => redist61_i_acl_472_gmm_substract_q_34_mem_iq
    );
    redist61_i_acl_472_gmm_substract_q_34_mem_q <= redist61_i_acl_472_gmm_substract_q_34_mem_iq(7 downto 0);

    -- redist59_i_acl_481_gmm_substract_q_24_notEnable(LOGICAL,864)
    redist59_i_acl_481_gmm_substract_q_24_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist59_i_acl_481_gmm_substract_q_24_nor(LOGICAL,865)
    redist59_i_acl_481_gmm_substract_q_24_nor_q <= not (redist59_i_acl_481_gmm_substract_q_24_notEnable_q or redist59_i_acl_481_gmm_substract_q_24_sticky_ena_q);

    -- redist59_i_acl_481_gmm_substract_q_24_mem_last(CONSTANT,861)
    redist59_i_acl_481_gmm_substract_q_24_mem_last_q <= "010100";

    -- redist59_i_acl_481_gmm_substract_q_24_cmp(LOGICAL,862)
    redist59_i_acl_481_gmm_substract_q_24_cmp_b <= STD_LOGIC_VECTOR("0" & redist59_i_acl_481_gmm_substract_q_24_rdcnt_q);
    redist59_i_acl_481_gmm_substract_q_24_cmp_q <= "1" WHEN redist59_i_acl_481_gmm_substract_q_24_mem_last_q = redist59_i_acl_481_gmm_substract_q_24_cmp_b ELSE "0";

    -- redist59_i_acl_481_gmm_substract_q_24_cmpReg(REG,863)
    redist59_i_acl_481_gmm_substract_q_24_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist59_i_acl_481_gmm_substract_q_24_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist59_i_acl_481_gmm_substract_q_24_cmpReg_q <= STD_LOGIC_VECTOR(redist59_i_acl_481_gmm_substract_q_24_cmp_q);
        END IF;
    END PROCESS;

    -- redist59_i_acl_481_gmm_substract_q_24_sticky_ena(REG,866)
    redist59_i_acl_481_gmm_substract_q_24_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist59_i_acl_481_gmm_substract_q_24_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist59_i_acl_481_gmm_substract_q_24_nor_q = "1") THEN
                redist59_i_acl_481_gmm_substract_q_24_sticky_ena_q <= STD_LOGIC_VECTOR(redist59_i_acl_481_gmm_substract_q_24_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist59_i_acl_481_gmm_substract_q_24_enaAnd(LOGICAL,867)
    redist59_i_acl_481_gmm_substract_q_24_enaAnd_q <= redist59_i_acl_481_gmm_substract_q_24_sticky_ena_q and VCC_q;

    -- redist59_i_acl_481_gmm_substract_q_24_rdcnt(COUNTER,859)
    -- low=0, high=21, step=1, init=0
    redist59_i_acl_481_gmm_substract_q_24_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist59_i_acl_481_gmm_substract_q_24_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist59_i_acl_481_gmm_substract_q_24_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist59_i_acl_481_gmm_substract_q_24_rdcnt_i = TO_UNSIGNED(20, 5)) THEN
                redist59_i_acl_481_gmm_substract_q_24_rdcnt_eq <= '1';
            ELSE
                redist59_i_acl_481_gmm_substract_q_24_rdcnt_eq <= '0';
            END IF;
            IF (redist59_i_acl_481_gmm_substract_q_24_rdcnt_eq = '1') THEN
                redist59_i_acl_481_gmm_substract_q_24_rdcnt_i <= redist59_i_acl_481_gmm_substract_q_24_rdcnt_i + 11;
            ELSE
                redist59_i_acl_481_gmm_substract_q_24_rdcnt_i <= redist59_i_acl_481_gmm_substract_q_24_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist59_i_acl_481_gmm_substract_q_24_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist59_i_acl_481_gmm_substract_q_24_rdcnt_i, 5)));

    -- c_i8_63(CONSTANT,154)
    c_i8_63_q <= "00111111";

    -- c_i8_3gr(CONSTANT,153)
    c_i8_3gr_q <= "00000011";

    -- i_phitmp1790_1_gmm_substract_vt_const_7(CONSTANT,450)
    i_phitmp1790_1_gmm_substract_vt_const_7_q <= "0000000";

    -- c_i8_1gr(CONSTANT,152)
    c_i8_1gr_q <= "00000001";

    -- c_i10_0gr(CONSTANT,142)
    c_i10_0gr_q <= "0000000000";

    -- i_and_i1784_1_gmm_substract_vt_const_9(CONSTANT,220)
    i_and_i1784_1_gmm_substract_vt_const_9_q <= "000000000";

    -- c_i10_1gr(CONSTANT,143)
    c_i10_1gr_q <= "0000000001";

    -- dupName_0_constMult_x(BLACKBOX,6)@39
    -- out out_primWireOut@42
    thedupName_0_constMult_x : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA0Z2cdo6u2ocpq6c0ouq3cz
    PORT MAP (
        in_0 => redist29_i_conv802_2_gmm_substract_out_primWireOut_26_outputreg_q,
        out_primWireOut => dupName_0_constMult_x_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist90_dupName_0_constMult_x_out_primWireOut_1(DELAY,819)
    redist90_dupName_0_constMult_x_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => dupName_0_constMult_x_out_primWireOut, xout => redist90_dupName_0_constMult_x_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_acl_sqrtf_call_i_2_gmm_substract(BLACKBOX,217)@43
    -- out out_primWireOut@58
    thei_acl_sqrtf_call_i_2_gmm_substract : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA1Z4ce2a150g24ad2045eny
    PORT MAP (
        in_0 => redist90_dupName_0_constMult_x_out_primWireOut_1_q,
        out_primWireOut => i_acl_sqrtf_call_i_2_gmm_substract_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_convert_fptosi_64_fsi2_gmm_substract(EXTIFACE,208)@58 + 5
    i_acl_convert_fptosi_64_fsi2_gmm_substract_dataa <= i_acl_sqrtf_call_i_2_gmm_substract_out_primWireOut;
    i_acl_convert_fptosi_64_fsi2_gmm_substract_enable <= VCC_q;
    i_acl_convert_fptosi_64_fsi2_gmm_substract_stall_in <= GND_q;
    i_acl_convert_fptosi_64_fsi2_gmm_substract_valid_in <= VCC_q;
    i_acl_convert_fptosi_64_fsi2_gmm_substract_enable_bitsignaltemp <= i_acl_convert_fptosi_64_fsi2_gmm_substract_enable(0);
    i_acl_convert_fptosi_64_fsi2_gmm_substract_stall_in_bitsignaltemp <= i_acl_convert_fptosi_64_fsi2_gmm_substract_stall_in(0);
    i_acl_convert_fptosi_64_fsi2_gmm_substract_valid_in_bitsignaltemp <= i_acl_convert_fptosi_64_fsi2_gmm_substract_valid_in(0);
    thei_acl_convert_fptosi_64_fsi2_gmm_substract : acl_fp_convert_with_rounding_64
    GENERIC MAP (
        ROUNDING_MODE => 2,
        UNSIGNED => 0
    )
    PORT MAP (
        dataa => i_acl_sqrtf_call_i_2_gmm_substract_out_primWireOut,
        enable => i_acl_convert_fptosi_64_fsi2_gmm_substract_enable_bitsignaltemp,
        stall_in => i_acl_convert_fptosi_64_fsi2_gmm_substract_stall_in_bitsignaltemp,
        valid_in => i_acl_convert_fptosi_64_fsi2_gmm_substract_valid_in_bitsignaltemp,
        result => i_acl_convert_fptosi_64_fsi2_gmm_substract_result,
        clock => clock,
        resetn => resetn
    );

    -- i_unnamed_gmm_substract2840_sel_x(BITSELECT,132)@63
    i_unnamed_gmm_substract2840_sel_x_b <= i_acl_convert_fptosi_64_fsi2_gmm_substract_result(9 downto 0);

    -- i_and_i_i_2_gmm_substract(LOGICAL,266)@58
    i_and_i_i_2_gmm_substract_q <= i_acl_sqrtf_call_i_2_gmm_substract_out_primWireOut and c_i32_2139095040_q;

    -- i_and_i_i_2_gmm_substract_vt_select_30(BITSELECT,270)@58
    i_and_i_i_2_gmm_substract_vt_select_30_b <= i_and_i_i_2_gmm_substract_q(30 downto 23);

    -- redist45_i_and_i_i_2_gmm_substract_vt_select_30_b_1(DELAY,774)
    redist45_i_and_i_i_2_gmm_substract_vt_select_30_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_and_i_i_2_gmm_substract_vt_select_30_b, xout => redist45_i_and_i_i_2_gmm_substract_vt_select_30_b_1_q, clk => clock, aclr => resetn );

    -- i_and_i_i_2_gmm_substract_vt_join(BITJOIN,269)@59
    i_and_i_i_2_gmm_substract_vt_join_q <= GND_q & redist45_i_and_i_i_2_gmm_substract_vt_select_30_b_1_q & i_and_i_i71_1_gmm_substract_vt_const_22_q;

    -- i_cmp_i_i44_2_gmm_substract(LOGICAL,301)@59 + 1
    i_cmp_i_i44_2_gmm_substract_qi <= "1" WHEN i_and_i_i_2_gmm_substract_vt_join_q = c_i32_0gr_q ELSE "0";
    i_cmp_i_i44_2_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_i_i44_2_gmm_substract_qi, xout => i_cmp_i_i44_2_gmm_substract_q, clk => clock, aclr => resetn );

    -- redist42_i_cmp_i_i44_2_gmm_substract_q_4(DELAY,771)
    redist42_i_cmp_i_i44_2_gmm_substract_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_i_i44_2_gmm_substract_q, xout => redist42_i_cmp_i_i44_2_gmm_substract_q_4_q, clk => clock, aclr => resetn );

    -- i_conv2_i_i_i_2_gmm_substract(MUX,316)@63
    i_conv2_i_i_i_2_gmm_substract_s <= redist42_i_cmp_i_i44_2_gmm_substract_q_4_q;
    i_conv2_i_i_i_2_gmm_substract_combproc: PROCESS (i_conv2_i_i_i_2_gmm_substract_s, i_unnamed_gmm_substract2840_sel_x_b, c_i10_0gr_q)
    BEGIN
        CASE (i_conv2_i_i_i_2_gmm_substract_s) IS
            WHEN "0" => i_conv2_i_i_i_2_gmm_substract_q <= i_unnamed_gmm_substract2840_sel_x_b;
            WHEN "1" => i_conv2_i_i_i_2_gmm_substract_q <= c_i10_0gr_q;
            WHEN OTHERS => i_conv2_i_i_i_2_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_and_i1784_2_gmm_substract(LOGICAL,223)@63
    i_and_i1784_2_gmm_substract_q <= i_conv2_i_i_i_2_gmm_substract_q and c_i10_1gr_q;

    -- i_and_i1784_2_gmm_substract_vt_select_0(BITSELECT,226)@63
    i_and_i1784_2_gmm_substract_vt_select_0_b <= i_and_i1784_2_gmm_substract_q(0 downto 0);

    -- i_and_i1784_2_gmm_substract_vt_join(BITJOIN,225)@63
    i_and_i1784_2_gmm_substract_vt_join_q <= i_and_i1784_1_gmm_substract_vt_const_9_q & i_and_i1784_2_gmm_substract_vt_select_0_b;

    -- i_phitmp1787_2_gmm_substract(LOGICAL,447)@63 + 1
    i_phitmp1787_2_gmm_substract_qi <= "1" WHEN i_and_i1784_2_gmm_substract_vt_join_q = c_i10_0gr_q ELSE "0";
    i_phitmp1787_2_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_phitmp1787_2_gmm_substract_qi, xout => i_phitmp1787_2_gmm_substract_q, clk => clock, aclr => resetn );

    -- i_ffwd_dst_cmp_i_i_i279_22676_gmm_substract(BLACKBOX,372)@64
    thei_ffwd_dst_cmp_i_i_i279_22676_gmm_substract : i_ffwd_dst_cmp_i_i_i279_22676_gmm_substract2848
    PORT MAP (
        in_intel_reserved_ffwd_37_0 => in_intel_reserved_ffwd_37_0,
        in_stall_in => GND_q,
        in_valid_in => redist78_sync_in_aunroll_x_in_i_valid_64_q,
        out_dest_data_out_37_0 => i_ffwd_dst_cmp_i_i_i279_22676_gmm_substract_out_dest_data_out_37_0,
        clock => clock,
        resetn => resetn
    );

    -- i_reduction_gmm_substract_84_gmm_substract(LOGICAL,465)@64
    i_reduction_gmm_substract_84_gmm_substract_q <= i_ffwd_dst_cmp_i_i_i279_22676_gmm_substract_out_dest_data_out_37_0 and i_phitmp1787_2_gmm_substract_q;

    -- c_i16_3969(CONSTANT,144)
    c_i16_3969_q <= "0000111110000001";

    -- i_cmp_i_i_i57_2_gmm_substract(COMPARE,313)@4 + 1
    i_cmp_i_i_i57_2_gmm_substract_a <= STD_LOGIC_VECTOR("00" & c_i16_3969_q);
    i_cmp_i_i_i57_2_gmm_substract_b <= STD_LOGIC_VECTOR("00" & i_select522_gmm_substract_q);
    i_cmp_i_i_i57_2_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp_i_i_i57_2_gmm_substract_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp_i_i_i57_2_gmm_substract_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i_i57_2_gmm_substract_a) - UNSIGNED(i_cmp_i_i_i57_2_gmm_substract_b));
        END IF;
    END PROCESS;
    i_cmp_i_i_i57_2_gmm_substract_c(0) <= i_cmp_i_i_i57_2_gmm_substract_o(17);

    -- redist36_i_cmp_i_i_i57_2_gmm_substract_c_60(DELAY,765)
    redist36_i_cmp_i_i_i57_2_gmm_substract_c_60 : dspba_delay
    GENERIC MAP ( width => 1, depth => 59, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_i_i_i57_2_gmm_substract_c, xout => redist36_i_cmp_i_i_i57_2_gmm_substract_c_60_q, clk => clock, aclr => resetn );

    -- i_not_cmp_i_i_i57_2_gmm_substract(LOGICAL,434)@64
    i_not_cmp_i_i_i57_2_gmm_substract_q <= redist36_i_cmp_i_i_i57_2_gmm_substract_c_60_q xor VCC_q;

    -- c_i16_9gr(CONSTANT,145)
    c_i16_9gr_q <= "0000000000001001";

    -- i_cmp_i_i_i53_2_gmm_substract(COMPARE,310)@4 + 1
    i_cmp_i_i_i53_2_gmm_substract_a <= STD_LOGIC_VECTOR("00" & i_select522_gmm_substract_q);
    i_cmp_i_i_i53_2_gmm_substract_b <= STD_LOGIC_VECTOR("00" & c_i16_9gr_q);
    i_cmp_i_i_i53_2_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp_i_i_i53_2_gmm_substract_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp_i_i_i53_2_gmm_substract_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i_i53_2_gmm_substract_a) - UNSIGNED(i_cmp_i_i_i53_2_gmm_substract_b));
        END IF;
    END PROCESS;
    i_cmp_i_i_i53_2_gmm_substract_c(0) <= i_cmp_i_i_i53_2_gmm_substract_o(17);

    -- redist39_i_cmp_i_i_i53_2_gmm_substract_c_60(DELAY,768)
    redist39_i_cmp_i_i_i53_2_gmm_substract_c_60 : dspba_delay
    GENERIC MAP ( width => 1, depth => 59, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_i_i_i53_2_gmm_substract_c, xout => redist39_i_cmp_i_i_i53_2_gmm_substract_c_60_q, clk => clock, aclr => resetn );

    -- i_not_cmp_i_i_i53_2_gmm_substract(LOGICAL,431)@64
    i_not_cmp_i_i_i53_2_gmm_substract_q <= redist39_i_cmp_i_i_i53_2_gmm_substract_c_60_q xor VCC_q;

    -- i_reduction_gmm_substract_83_gmm_substract(LOGICAL,464)@64
    i_reduction_gmm_substract_83_gmm_substract_q <= i_not_cmp_i_i_i53_2_gmm_substract_q and i_not_cmp_i_i_i57_2_gmm_substract_q;

    -- i_reduction_gmm_substract_85_gmm_substract(LOGICAL,466)@64
    i_reduction_gmm_substract_85_gmm_substract_q <= i_reduction_gmm_substract_83_gmm_substract_q and i_reduction_gmm_substract_84_gmm_substract_q;

    -- i_unnamed_gmm_substract2850_sel_x(BITSELECT,134)@64
    i_unnamed_gmm_substract2850_sel_x_b <= std_logic_vector(resize(unsigned(i_reduction_gmm_substract_85_gmm_substract_q(0 downto 0)), 8));

    -- i_unnamed_gmm_substract2850_vt_select_0(BITSELECT,526)@64
    i_unnamed_gmm_substract2850_vt_select_0_b <= i_unnamed_gmm_substract2850_sel_x_b(0 downto 0);

    -- i_unnamed_gmm_substract2850_vt_join(BITJOIN,525)@64
    i_unnamed_gmm_substract2850_vt_join_q <= i_phitmp1790_1_gmm_substract_vt_const_7_q & i_unnamed_gmm_substract2850_vt_select_0_b;

    -- i_phitmp1790_2_gmm_substract(LOGICAL,453)@64
    i_phitmp1790_2_gmm_substract_q <= i_unnamed_gmm_substract2850_vt_join_q xor c_i8_1gr_q;

    -- i_phitmp1790_2_gmm_substract_vt_select_0(BITSELECT,456)@64
    i_phitmp1790_2_gmm_substract_vt_select_0_b <= i_phitmp1790_2_gmm_substract_q(0 downto 0);

    -- redist4_i_phitmp1790_2_gmm_substract_vt_select_0_b_1(DELAY,733)
    redist4_i_phitmp1790_2_gmm_substract_vt_select_0_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_phitmp1790_2_gmm_substract_vt_select_0_b, xout => redist4_i_phitmp1790_2_gmm_substract_vt_select_0_b_1_q, clk => clock, aclr => resetn );

    -- i_phitmp1790_2_gmm_substract_vt_join(BITJOIN,455)@65
    i_phitmp1790_2_gmm_substract_vt_join_q <= i_phitmp1790_1_gmm_substract_vt_const_7_q & redist4_i_phitmp1790_2_gmm_substract_vt_select_0_b_1_q;

    -- rightShiftStage0Idx1Rng1_uid694_i_shr_i_i29_2_gmm_substract_gmm_substract2842_shift_x(BITSELECT,693)@63
    rightShiftStage0Idx1Rng1_uid694_i_shr_i_i29_2_gmm_substract_gmm_substract2842_shift_x_b <= i_conv2_i_i_i_2_gmm_substract_q(9 downto 1);

    -- rightShiftStage0Idx1_uid696_i_shr_i_i29_2_gmm_substract_gmm_substract2842_shift_x(BITJOIN,695)@63
    rightShiftStage0Idx1_uid696_i_shr_i_i29_2_gmm_substract_gmm_substract2842_shift_x_q <= GND_q & rightShiftStage0Idx1Rng1_uid694_i_shr_i_i29_2_gmm_substract_gmm_substract2842_shift_x_b;

    -- rightShiftStage0_uid698_i_shr_i_i29_2_gmm_substract_gmm_substract2842_shift_x(MUX,697)@63
    rightShiftStage0_uid698_i_shr_i_i29_2_gmm_substract_gmm_substract2842_shift_x_s <= VCC_q;
    rightShiftStage0_uid698_i_shr_i_i29_2_gmm_substract_gmm_substract2842_shift_x_combproc: PROCESS (rightShiftStage0_uid698_i_shr_i_i29_2_gmm_substract_gmm_substract2842_shift_x_s, i_conv2_i_i_i_2_gmm_substract_q, rightShiftStage0Idx1_uid696_i_shr_i_i29_2_gmm_substract_gmm_substract2842_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid698_i_shr_i_i29_2_gmm_substract_gmm_substract2842_shift_x_s) IS
            WHEN "0" => rightShiftStage0_uid698_i_shr_i_i29_2_gmm_substract_gmm_substract2842_shift_x_q <= i_conv2_i_i_i_2_gmm_substract_q;
            WHEN "1" => rightShiftStage0_uid698_i_shr_i_i29_2_gmm_substract_gmm_substract2842_shift_x_q <= rightShiftStage0Idx1_uid696_i_shr_i_i29_2_gmm_substract_gmm_substract2842_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid698_i_shr_i_i29_2_gmm_substract_gmm_substract2842_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_shr_i_i29_2_gmm_substract_vt_select_8(BITSELECT,509)@63
    i_shr_i_i29_2_gmm_substract_vt_select_8_b <= rightShiftStage0_uid698_i_shr_i_i29_2_gmm_substract_gmm_substract2842_shift_x_q(8 downto 0);

    -- i_shr_i_i29_2_gmm_substract_vt_join(BITJOIN,508)@63
    i_shr_i_i29_2_gmm_substract_vt_join_q <= GND_q & i_shr_i_i29_2_gmm_substract_vt_select_8_b;

    -- i_unnamed_gmm_substract2843_sel_x(BITSELECT,133)@63
    i_unnamed_gmm_substract2843_sel_x_b <= i_shr_i_i29_2_gmm_substract_vt_join_q(7 downto 0);

    -- redist83_i_unnamed_gmm_substract2843_sel_x_b_2(DELAY,812)
    redist83_i_unnamed_gmm_substract2843_sel_x_b_2 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_gmm_substract2843_sel_x_b, xout => redist83_i_unnamed_gmm_substract2843_sel_x_b_2_q, clk => clock, aclr => resetn );

    -- i_acl_476_gmm_substract(ADD,197)@65
    i_acl_476_gmm_substract_a <= STD_LOGIC_VECTOR("0" & redist83_i_unnamed_gmm_substract2843_sel_x_b_2_q);
    i_acl_476_gmm_substract_b <= STD_LOGIC_VECTOR("0" & i_phitmp1790_2_gmm_substract_vt_join_q);
    i_acl_476_gmm_substract_o <= STD_LOGIC_VECTOR(UNSIGNED(i_acl_476_gmm_substract_a) + UNSIGNED(i_acl_476_gmm_substract_b));
    i_acl_476_gmm_substract_q <= i_acl_476_gmm_substract_o(8 downto 0);

    -- bgTrunc_i_acl_476_gmm_substract_sel_x(BITSELECT,3)@65
    bgTrunc_i_acl_476_gmm_substract_sel_x_b <= i_acl_476_gmm_substract_q(7 downto 0);

    -- i_acl_477_gmm_substract(LOGICAL,198)@64 + 1
    i_acl_477_gmm_substract_qi <= redist39_i_cmp_i_i_i53_2_gmm_substract_c_60_q and i_not_cmp_i_i_i57_2_gmm_substract_q;
    i_acl_477_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_477_gmm_substract_qi, xout => i_acl_477_gmm_substract_q, clk => clock, aclr => resetn );

    -- i_ffwd_dst_cmp_i_i_i279_22682_gmm_substract(BLACKBOX,378)@65
    thei_ffwd_dst_cmp_i_i_i279_22682_gmm_substract : i_ffwd_dst_cmp_i_i_i279_22682_gmm_substract2851
    PORT MAP (
        in_intel_reserved_ffwd_37_0 => in_intel_reserved_ffwd_37_0,
        in_stall_in => GND_q,
        in_valid_in => redist79_sync_in_aunroll_x_in_i_valid_65_q,
        out_dest_data_out_37_0 => i_ffwd_dst_cmp_i_i_i279_22682_gmm_substract_out_dest_data_out_37_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_478_gmm_substract(LOGICAL,199)@65
    i_acl_478_gmm_substract_q <= i_ffwd_dst_cmp_i_i_i279_22682_gmm_substract_out_dest_data_out_37_0 and i_acl_477_gmm_substract_q;

    -- i_acl_479_gmm_substract(MUX,200)@65 + 1
    i_acl_479_gmm_substract_s <= i_acl_478_gmm_substract_q;
    i_acl_479_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_479_gmm_substract_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_acl_479_gmm_substract_s) IS
                WHEN "0" => i_acl_479_gmm_substract_q <= bgTrunc_i_acl_476_gmm_substract_sel_x_b;
                WHEN "1" => i_acl_479_gmm_substract_q <= c_i8_3gr_q;
                WHEN OTHERS => i_acl_479_gmm_substract_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_ffwd_dst_cmp_i_i_i279_22681_gmm_substract(BLACKBOX,377)@64
    thei_ffwd_dst_cmp_i_i_i279_22681_gmm_substract : i_ffwd_dst_cmp_i_i_i279_22681_gmm_substract2853
    PORT MAP (
        in_intel_reserved_ffwd_37_0 => in_intel_reserved_ffwd_37_0,
        in_stall_in => GND_q,
        in_valid_in => redist78_sync_in_aunroll_x_in_i_valid_64_q,
        out_dest_data_out_37_0 => i_ffwd_dst_cmp_i_i_i279_22681_gmm_substract_out_dest_data_out_37_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_480_gmm_substract(LOGICAL,201)@64 + 1
    i_acl_480_gmm_substract_qi <= i_ffwd_dst_cmp_i_i_i279_22681_gmm_substract_out_dest_data_out_37_0 and redist36_i_cmp_i_i_i57_2_gmm_substract_c_60_q;
    i_acl_480_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_480_gmm_substract_qi, xout => i_acl_480_gmm_substract_q, clk => clock, aclr => resetn );

    -- redist60_i_acl_480_gmm_substract_q_2(DELAY,789)
    redist60_i_acl_480_gmm_substract_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_480_gmm_substract_q, xout => redist60_i_acl_480_gmm_substract_q_2_q, clk => clock, aclr => resetn );

    -- i_acl_481_gmm_substract(MUX,202)@66 + 1
    i_acl_481_gmm_substract_s <= redist60_i_acl_480_gmm_substract_q_2_q;
    i_acl_481_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_481_gmm_substract_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_acl_481_gmm_substract_s) IS
                WHEN "0" => i_acl_481_gmm_substract_q <= i_acl_479_gmm_substract_q;
                WHEN "1" => i_acl_481_gmm_substract_q <= c_i8_63_q;
                WHEN OTHERS => i_acl_481_gmm_substract_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist59_i_acl_481_gmm_substract_q_24_wraddr(REG,860)
    redist59_i_acl_481_gmm_substract_q_24_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist59_i_acl_481_gmm_substract_q_24_wraddr_q <= "10101";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist59_i_acl_481_gmm_substract_q_24_wraddr_q <= STD_LOGIC_VECTOR(redist59_i_acl_481_gmm_substract_q_24_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist59_i_acl_481_gmm_substract_q_24_mem(DUALMEM,858)
    redist59_i_acl_481_gmm_substract_q_24_mem_ia <= STD_LOGIC_VECTOR(i_acl_481_gmm_substract_q);
    redist59_i_acl_481_gmm_substract_q_24_mem_aa <= redist59_i_acl_481_gmm_substract_q_24_wraddr_q;
    redist59_i_acl_481_gmm_substract_q_24_mem_ab <= redist59_i_acl_481_gmm_substract_q_24_rdcnt_q;
    redist59_i_acl_481_gmm_substract_q_24_mem_reset0 <= not (resetn);
    redist59_i_acl_481_gmm_substract_q_24_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 5,
        numwords_a => 22,
        width_b => 8,
        widthad_b => 5,
        numwords_b => 22,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist59_i_acl_481_gmm_substract_q_24_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist59_i_acl_481_gmm_substract_q_24_mem_reset0,
        clock1 => clock,
        address_a => redist59_i_acl_481_gmm_substract_q_24_mem_aa,
        data_a => redist59_i_acl_481_gmm_substract_q_24_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist59_i_acl_481_gmm_substract_q_24_mem_ab,
        q_b => redist59_i_acl_481_gmm_substract_q_24_mem_iq
    );
    redist59_i_acl_481_gmm_substract_q_24_mem_q <= redist59_i_acl_481_gmm_substract_q_24_mem_iq(7 downto 0);

    -- i_ffwd_dst_unnamed_gmm_substract111_gmm_substract(BLACKBOX,417)@90
    thei_ffwd_dst_unnamed_gmm_substract111_gmm_substract : i_ffwd_dst_unnamed_gmm_substract111_gmm_substract2855
    PORT MAP (
        in_intel_reserved_ffwd_13_0 => in_intel_reserved_ffwd_13_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_13_0 => i_ffwd_dst_unnamed_gmm_substract111_gmm_substract_out_dest_data_out_13_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_cmp_i_i_i279_22680_gmm_substract(BLACKBOX,376)@90
    thei_ffwd_dst_cmp_i_i_i279_22680_gmm_substract : i_ffwd_dst_cmp_i_i_i279_22680_gmm_substract2857
    PORT MAP (
        in_intel_reserved_ffwd_37_0 => in_intel_reserved_ffwd_37_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_37_0 => i_ffwd_dst_cmp_i_i_i279_22680_gmm_substract_out_dest_data_out_37_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_482_gmm_substract(MUX,203)@90
    i_acl_482_gmm_substract_s <= i_ffwd_dst_cmp_i_i_i279_22680_gmm_substract_out_dest_data_out_37_0;
    i_acl_482_gmm_substract_combproc: PROCESS (i_acl_482_gmm_substract_s, i_ffwd_dst_unnamed_gmm_substract111_gmm_substract_out_dest_data_out_13_0, redist59_i_acl_481_gmm_substract_q_24_mem_q)
    BEGIN
        CASE (i_acl_482_gmm_substract_s) IS
            WHEN "0" => i_acl_482_gmm_substract_q <= i_ffwd_dst_unnamed_gmm_substract111_gmm_substract_out_dest_data_out_13_0;
            WHEN "1" => i_acl_482_gmm_substract_q <= redist59_i_acl_481_gmm_substract_q_24_mem_q;
            WHEN OTHERS => i_acl_482_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_dst_select5802743_gmm_substract(BLACKBOX,396)@90
    thei_ffwd_dst_select5802743_gmm_substract : i_ffwd_dst_select5802743_gmm_substract2709
    PORT MAP (
        in_intel_reserved_ffwd_62_0 => in_intel_reserved_ffwd_62_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_62_0 => i_ffwd_dst_select5802743_gmm_substract_out_dest_data_out_62_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_extract_t23082717_gmm_substract(BLACKBOX,384)@90
    thei_ffwd_dst_extract_t23082717_gmm_substract : i_ffwd_dst_extract_t23082717_gmm_substract2707
    PORT MAP (
        in_intel_reserved_ffwd_46_0 => in_intel_reserved_ffwd_46_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_46_0 => i_ffwd_dst_extract_t23082717_gmm_substract_out_dest_data_out_46_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_cmp_i_i_i279_12655_gmm_substract(BLACKBOX,356)@90
    thei_ffwd_dst_cmp_i_i_i279_12655_gmm_substract : i_ffwd_dst_cmp_i_i_i279_12655_gmm_substract2705
    PORT MAP (
        in_intel_reserved_ffwd_35_0 => in_intel_reserved_ffwd_35_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_35_0 => i_ffwd_dst_cmp_i_i_i279_12655_gmm_substract_out_dest_data_out_35_0,
        clock => clock,
        resetn => resetn
    );

    -- i_select504_gmm_substract(MUX,480)@90
    i_select504_gmm_substract_s <= i_ffwd_dst_cmp_i_i_i279_12655_gmm_substract_out_dest_data_out_35_0;
    i_select504_gmm_substract_combproc: PROCESS (i_select504_gmm_substract_s, i_ffwd_dst_extract_t23082717_gmm_substract_out_dest_data_out_46_0, i_ffwd_dst_select5802743_gmm_substract_out_dest_data_out_62_0)
    BEGIN
        CASE (i_select504_gmm_substract_s) IS
            WHEN "0" => i_select504_gmm_substract_q <= i_ffwd_dst_extract_t23082717_gmm_substract_out_dest_data_out_46_0;
            WHEN "1" => i_select504_gmm_substract_q <= i_ffwd_dst_select5802743_gmm_substract_out_dest_data_out_62_0;
            WHEN OTHERS => i_select504_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_dst_unnamed_gmm_substract112_gmm_substract(BLACKBOX,418)@90
    thei_ffwd_dst_unnamed_gmm_substract112_gmm_substract : i_ffwd_dst_unnamed_gmm_substract112_gmm_substract2859
    PORT MAP (
        in_intel_reserved_ffwd_12_0 => in_intel_reserved_ffwd_12_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_12_0 => i_ffwd_dst_unnamed_gmm_substract112_gmm_substract_out_dest_data_out_12_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_cmp_i_i_i279_22679_gmm_substract(BLACKBOX,375)@90
    thei_ffwd_dst_cmp_i_i_i279_22679_gmm_substract : i_ffwd_dst_cmp_i_i_i279_22679_gmm_substract2861
    PORT MAP (
        in_intel_reserved_ffwd_37_0 => in_intel_reserved_ffwd_37_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_37_0 => i_ffwd_dst_cmp_i_i_i279_22679_gmm_substract_out_dest_data_out_37_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_483_gmm_substract(MUX,204)@90
    i_acl_483_gmm_substract_s <= i_ffwd_dst_cmp_i_i_i279_22679_gmm_substract_out_dest_data_out_37_0;
    i_acl_483_gmm_substract_combproc: PROCESS (i_acl_483_gmm_substract_s, i_ffwd_dst_unnamed_gmm_substract112_gmm_substract_out_dest_data_out_12_0, i_select504_gmm_substract_q)
    BEGIN
        CASE (i_acl_483_gmm_substract_s) IS
            WHEN "0" => i_acl_483_gmm_substract_q <= i_ffwd_dst_unnamed_gmm_substract112_gmm_substract_out_dest_data_out_12_0;
            WHEN "1" => i_acl_483_gmm_substract_q <= i_select504_gmm_substract_q;
            WHEN OTHERS => i_acl_483_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_dst_select5862744_gmm_substract(BLACKBOX,397)@90
    thei_ffwd_dst_select5862744_gmm_substract : i_ffwd_dst_select5862744_gmm_substract2715
    PORT MAP (
        in_intel_reserved_ffwd_63_0 => in_intel_reserved_ffwd_63_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_63_0 => i_ffwd_dst_select5862744_gmm_substract_out_dest_data_out_63_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_extract_t23122719_gmm_substract(BLACKBOX,385)@90
    thei_ffwd_dst_extract_t23122719_gmm_substract : i_ffwd_dst_extract_t23122719_gmm_substract2713
    PORT MAP (
        in_intel_reserved_ffwd_47_0 => in_intel_reserved_ffwd_47_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_47_0 => i_ffwd_dst_extract_t23122719_gmm_substract_out_dest_data_out_47_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_cmp_i_i_i279_12656_gmm_substract(BLACKBOX,357)@90
    thei_ffwd_dst_cmp_i_i_i279_12656_gmm_substract : i_ffwd_dst_cmp_i_i_i279_12656_gmm_substract2711
    PORT MAP (
        in_intel_reserved_ffwd_35_0 => in_intel_reserved_ffwd_35_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_35_0 => i_ffwd_dst_cmp_i_i_i279_12656_gmm_substract_out_dest_data_out_35_0,
        clock => clock,
        resetn => resetn
    );

    -- i_select507_gmm_substract(MUX,481)@90
    i_select507_gmm_substract_s <= i_ffwd_dst_cmp_i_i_i279_12656_gmm_substract_out_dest_data_out_35_0;
    i_select507_gmm_substract_combproc: PROCESS (i_select507_gmm_substract_s, i_ffwd_dst_extract_t23122719_gmm_substract_out_dest_data_out_47_0, i_ffwd_dst_select5862744_gmm_substract_out_dest_data_out_63_0)
    BEGIN
        CASE (i_select507_gmm_substract_s) IS
            WHEN "0" => i_select507_gmm_substract_q <= i_ffwd_dst_extract_t23122719_gmm_substract_out_dest_data_out_47_0;
            WHEN "1" => i_select507_gmm_substract_q <= i_ffwd_dst_select5862744_gmm_substract_out_dest_data_out_63_0;
            WHEN OTHERS => i_select507_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_dst_unnamed_gmm_substract113_gmm_substract(BLACKBOX,419)@90
    thei_ffwd_dst_unnamed_gmm_substract113_gmm_substract : i_ffwd_dst_unnamed_gmm_substract113_gmm_substract2863
    PORT MAP (
        in_intel_reserved_ffwd_11_0 => in_intel_reserved_ffwd_11_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_11_0 => i_ffwd_dst_unnamed_gmm_substract113_gmm_substract_out_dest_data_out_11_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_cmp_i_i_i279_22678_gmm_substract(BLACKBOX,374)@90
    thei_ffwd_dst_cmp_i_i_i279_22678_gmm_substract : i_ffwd_dst_cmp_i_i_i279_22678_gmm_substract2865
    PORT MAP (
        in_intel_reserved_ffwd_37_0 => in_intel_reserved_ffwd_37_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_37_0 => i_ffwd_dst_cmp_i_i_i279_22678_gmm_substract_out_dest_data_out_37_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_484_gmm_substract(MUX,205)@90
    i_acl_484_gmm_substract_s <= i_ffwd_dst_cmp_i_i_i279_22678_gmm_substract_out_dest_data_out_37_0;
    i_acl_484_gmm_substract_combproc: PROCESS (i_acl_484_gmm_substract_s, i_ffwd_dst_unnamed_gmm_substract113_gmm_substract_out_dest_data_out_11_0, i_select507_gmm_substract_q)
    BEGIN
        CASE (i_acl_484_gmm_substract_s) IS
            WHEN "0" => i_acl_484_gmm_substract_q <= i_ffwd_dst_unnamed_gmm_substract113_gmm_substract_out_dest_data_out_11_0;
            WHEN "1" => i_acl_484_gmm_substract_q <= i_select507_gmm_substract_q;
            WHEN OTHERS => i_acl_484_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_dst_select5922745_gmm_substract(BLACKBOX,398)@90
    thei_ffwd_dst_select5922745_gmm_substract : i_ffwd_dst_select5922745_gmm_substract2721
    PORT MAP (
        in_intel_reserved_ffwd_64_0 => in_intel_reserved_ffwd_64_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_64_0 => i_ffwd_dst_select5922745_gmm_substract_out_dest_data_out_64_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_extract_t23162721_gmm_substract(BLACKBOX,386)@90
    thei_ffwd_dst_extract_t23162721_gmm_substract : i_ffwd_dst_extract_t23162721_gmm_substract2719
    PORT MAP (
        in_intel_reserved_ffwd_48_0 => in_intel_reserved_ffwd_48_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_48_0 => i_ffwd_dst_extract_t23162721_gmm_substract_out_dest_data_out_48_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_cmp_i_i_i279_12657_gmm_substract(BLACKBOX,358)@90
    thei_ffwd_dst_cmp_i_i_i279_12657_gmm_substract : i_ffwd_dst_cmp_i_i_i279_12657_gmm_substract2717
    PORT MAP (
        in_intel_reserved_ffwd_35_0 => in_intel_reserved_ffwd_35_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_35_0 => i_ffwd_dst_cmp_i_i_i279_12657_gmm_substract_out_dest_data_out_35_0,
        clock => clock,
        resetn => resetn
    );

    -- i_select510_gmm_substract(MUX,482)@90
    i_select510_gmm_substract_s <= i_ffwd_dst_cmp_i_i_i279_12657_gmm_substract_out_dest_data_out_35_0;
    i_select510_gmm_substract_combproc: PROCESS (i_select510_gmm_substract_s, i_ffwd_dst_extract_t23162721_gmm_substract_out_dest_data_out_48_0, i_ffwd_dst_select5922745_gmm_substract_out_dest_data_out_64_0)
    BEGIN
        CASE (i_select510_gmm_substract_s) IS
            WHEN "0" => i_select510_gmm_substract_q <= i_ffwd_dst_extract_t23162721_gmm_substract_out_dest_data_out_48_0;
            WHEN "1" => i_select510_gmm_substract_q <= i_ffwd_dst_select5922745_gmm_substract_out_dest_data_out_64_0;
            WHEN OTHERS => i_select510_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_dst_unnamed_gmm_substract114_gmm_substract(BLACKBOX,420)@90
    thei_ffwd_dst_unnamed_gmm_substract114_gmm_substract : i_ffwd_dst_unnamed_gmm_substract114_gmm_substract2867
    PORT MAP (
        in_intel_reserved_ffwd_10_0 => in_intel_reserved_ffwd_10_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_10_0 => i_ffwd_dst_unnamed_gmm_substract114_gmm_substract_out_dest_data_out_10_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_cmp_i_i_i279_22677_gmm_substract(BLACKBOX,373)@90
    thei_ffwd_dst_cmp_i_i_i279_22677_gmm_substract : i_ffwd_dst_cmp_i_i_i279_22677_gmm_substract2869
    PORT MAP (
        in_intel_reserved_ffwd_37_0 => in_intel_reserved_ffwd_37_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_37_0 => i_ffwd_dst_cmp_i_i_i279_22677_gmm_substract_out_dest_data_out_37_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_485_gmm_substract(MUX,206)@90
    i_acl_485_gmm_substract_s <= i_ffwd_dst_cmp_i_i_i279_22677_gmm_substract_out_dest_data_out_37_0;
    i_acl_485_gmm_substract_combproc: PROCESS (i_acl_485_gmm_substract_s, i_ffwd_dst_unnamed_gmm_substract114_gmm_substract_out_dest_data_out_10_0, i_select510_gmm_substract_q)
    BEGIN
        CASE (i_acl_485_gmm_substract_s) IS
            WHEN "0" => i_acl_485_gmm_substract_q <= i_ffwd_dst_unnamed_gmm_substract114_gmm_substract_out_dest_data_out_10_0;
            WHEN "1" => i_acl_485_gmm_substract_q <= i_select510_gmm_substract_q;
            WHEN OTHERS => i_acl_485_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_dst_select6282752_gmm_substract(BLACKBOX,404)@90
    thei_ffwd_dst_select6282752_gmm_substract : i_ffwd_dst_select6282752_gmm_substract2808
    PORT MAP (
        in_intel_reserved_ffwd_70_0 => in_intel_reserved_ffwd_70_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_70_0 => i_ffwd_dst_select6282752_gmm_substract_out_dest_data_out_70_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_unnamed_gmm_substract105_gmm_substract(BLACKBOX,411)@90
    thei_ffwd_dst_unnamed_gmm_substract105_gmm_substract : i_ffwd_dst_unnamed_gmm_substract105_gmm_substract2804
    PORT MAP (
        in_intel_reserved_ffwd_9_0 => in_intel_reserved_ffwd_9_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_9_0 => i_ffwd_dst_unnamed_gmm_substract105_gmm_substract_out_dest_data_out_9_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_cmp_i_i_i279_12670_gmm_substract(BLACKBOX,370)@90
    thei_ffwd_dst_cmp_i_i_i279_12670_gmm_substract : i_ffwd_dst_cmp_i_i_i279_12670_gmm_substract2806
    PORT MAP (
        in_intel_reserved_ffwd_35_0 => in_intel_reserved_ffwd_35_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_35_0 => i_ffwd_dst_cmp_i_i_i279_12670_gmm_substract_out_dest_data_out_35_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_458_gmm_substract(MUX,185)@90
    i_acl_458_gmm_substract_s <= i_ffwd_dst_cmp_i_i_i279_12670_gmm_substract_out_dest_data_out_35_0;
    i_acl_458_gmm_substract_combproc: PROCESS (i_acl_458_gmm_substract_s, i_ffwd_dst_unnamed_gmm_substract105_gmm_substract_out_dest_data_out_9_0, i_ffwd_dst_select6282752_gmm_substract_out_dest_data_out_70_0)
    BEGIN
        CASE (i_acl_458_gmm_substract_s) IS
            WHEN "0" => i_acl_458_gmm_substract_q <= i_ffwd_dst_unnamed_gmm_substract105_gmm_substract_out_dest_data_out_9_0;
            WHEN "1" => i_acl_458_gmm_substract_q <= i_ffwd_dst_select6282752_gmm_substract_out_dest_data_out_70_0;
            WHEN OTHERS => i_acl_458_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist62_i_acl_467_gmm_substract_q_27_notEnable(LOGICAL,884)
    redist62_i_acl_467_gmm_substract_q_27_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist62_i_acl_467_gmm_substract_q_27_nor(LOGICAL,885)
    redist62_i_acl_467_gmm_substract_q_27_nor_q <= not (redist62_i_acl_467_gmm_substract_q_27_notEnable_q or redist62_i_acl_467_gmm_substract_q_27_sticky_ena_q);

    -- redist62_i_acl_467_gmm_substract_q_27_mem_last(CONSTANT,881)
    redist62_i_acl_467_gmm_substract_q_27_mem_last_q <= "010111";

    -- redist62_i_acl_467_gmm_substract_q_27_cmp(LOGICAL,882)
    redist62_i_acl_467_gmm_substract_q_27_cmp_b <= STD_LOGIC_VECTOR("0" & redist62_i_acl_467_gmm_substract_q_27_rdcnt_q);
    redist62_i_acl_467_gmm_substract_q_27_cmp_q <= "1" WHEN redist62_i_acl_467_gmm_substract_q_27_mem_last_q = redist62_i_acl_467_gmm_substract_q_27_cmp_b ELSE "0";

    -- redist62_i_acl_467_gmm_substract_q_27_cmpReg(REG,883)
    redist62_i_acl_467_gmm_substract_q_27_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist62_i_acl_467_gmm_substract_q_27_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist62_i_acl_467_gmm_substract_q_27_cmpReg_q <= STD_LOGIC_VECTOR(redist62_i_acl_467_gmm_substract_q_27_cmp_q);
        END IF;
    END PROCESS;

    -- redist62_i_acl_467_gmm_substract_q_27_sticky_ena(REG,886)
    redist62_i_acl_467_gmm_substract_q_27_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist62_i_acl_467_gmm_substract_q_27_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist62_i_acl_467_gmm_substract_q_27_nor_q = "1") THEN
                redist62_i_acl_467_gmm_substract_q_27_sticky_ena_q <= STD_LOGIC_VECTOR(redist62_i_acl_467_gmm_substract_q_27_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist62_i_acl_467_gmm_substract_q_27_enaAnd(LOGICAL,887)
    redist62_i_acl_467_gmm_substract_q_27_enaAnd_q <= redist62_i_acl_467_gmm_substract_q_27_sticky_ena_q and VCC_q;

    -- redist62_i_acl_467_gmm_substract_q_27_rdcnt(COUNTER,879)
    -- low=0, high=24, step=1, init=0
    redist62_i_acl_467_gmm_substract_q_27_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist62_i_acl_467_gmm_substract_q_27_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist62_i_acl_467_gmm_substract_q_27_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist62_i_acl_467_gmm_substract_q_27_rdcnt_i = TO_UNSIGNED(23, 5)) THEN
                redist62_i_acl_467_gmm_substract_q_27_rdcnt_eq <= '1';
            ELSE
                redist62_i_acl_467_gmm_substract_q_27_rdcnt_eq <= '0';
            END IF;
            IF (redist62_i_acl_467_gmm_substract_q_27_rdcnt_eq = '1') THEN
                redist62_i_acl_467_gmm_substract_q_27_rdcnt_i <= redist62_i_acl_467_gmm_substract_q_27_rdcnt_i + 8;
            ELSE
                redist62_i_acl_467_gmm_substract_q_27_rdcnt_i <= redist62_i_acl_467_gmm_substract_q_27_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist62_i_acl_467_gmm_substract_q_27_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist62_i_acl_467_gmm_substract_q_27_rdcnt_i, 5)));

    -- constMult(BLACKBOX,155)@36
    -- out out_primWireOut@39
    theconstMult : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA0Z2cdo6u2ocpq6c0ouq3cz
    PORT MAP (
        in_0 => redist31_i_conv802_1_gmm_substract_out_primWireOut_26_outputreg_q,
        out_primWireOut => constMult_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist67_constMult_out_primWireOut_1(DELAY,796)
    redist67_constMult_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => constMult_out_primWireOut, xout => redist67_constMult_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_acl_sqrtf_call_i_1_gmm_substract(BLACKBOX,216)@40
    -- out out_primWireOut@55
    thei_acl_sqrtf_call_i_1_gmm_substract : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA1Z4ce2a150g24ad2045eny
    PORT MAP (
        in_0 => redist67_constMult_out_primWireOut_1_q,
        out_primWireOut => i_acl_sqrtf_call_i_1_gmm_substract_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_convert_fptosi_64_fsi1_gmm_substract(EXTIFACE,207)@55 + 5
    i_acl_convert_fptosi_64_fsi1_gmm_substract_dataa <= i_acl_sqrtf_call_i_1_gmm_substract_out_primWireOut;
    i_acl_convert_fptosi_64_fsi1_gmm_substract_enable <= VCC_q;
    i_acl_convert_fptosi_64_fsi1_gmm_substract_stall_in <= GND_q;
    i_acl_convert_fptosi_64_fsi1_gmm_substract_valid_in <= VCC_q;
    i_acl_convert_fptosi_64_fsi1_gmm_substract_enable_bitsignaltemp <= i_acl_convert_fptosi_64_fsi1_gmm_substract_enable(0);
    i_acl_convert_fptosi_64_fsi1_gmm_substract_stall_in_bitsignaltemp <= i_acl_convert_fptosi_64_fsi1_gmm_substract_stall_in(0);
    i_acl_convert_fptosi_64_fsi1_gmm_substract_valid_in_bitsignaltemp <= i_acl_convert_fptosi_64_fsi1_gmm_substract_valid_in(0);
    thei_acl_convert_fptosi_64_fsi1_gmm_substract : acl_fp_convert_with_rounding_64
    GENERIC MAP (
        ROUNDING_MODE => 2,
        UNSIGNED => 0
    )
    PORT MAP (
        dataa => i_acl_sqrtf_call_i_1_gmm_substract_out_primWireOut,
        enable => i_acl_convert_fptosi_64_fsi1_gmm_substract_enable_bitsignaltemp,
        stall_in => i_acl_convert_fptosi_64_fsi1_gmm_substract_stall_in_bitsignaltemp,
        valid_in => i_acl_convert_fptosi_64_fsi1_gmm_substract_valid_in_bitsignaltemp,
        result => i_acl_convert_fptosi_64_fsi1_gmm_substract_result,
        clock => clock,
        resetn => resetn
    );

    -- i_unnamed_gmm_substract2800_sel_x(BITSELECT,129)@60
    i_unnamed_gmm_substract2800_sel_x_b <= i_acl_convert_fptosi_64_fsi1_gmm_substract_result(9 downto 0);

    -- i_and_i_i_1_gmm_substract(LOGICAL,261)@55
    i_and_i_i_1_gmm_substract_q <= i_acl_sqrtf_call_i_1_gmm_substract_out_primWireOut and c_i32_2139095040_q;

    -- i_and_i_i_1_gmm_substract_vt_select_30(BITSELECT,265)@55
    i_and_i_i_1_gmm_substract_vt_select_30_b <= i_and_i_i_1_gmm_substract_q(30 downto 23);

    -- redist46_i_and_i_i_1_gmm_substract_vt_select_30_b_1(DELAY,775)
    redist46_i_and_i_i_1_gmm_substract_vt_select_30_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_and_i_i_1_gmm_substract_vt_select_30_b, xout => redist46_i_and_i_i_1_gmm_substract_vt_select_30_b_1_q, clk => clock, aclr => resetn );

    -- i_and_i_i_1_gmm_substract_vt_join(BITJOIN,264)@56
    i_and_i_i_1_gmm_substract_vt_join_q <= GND_q & redist46_i_and_i_i_1_gmm_substract_vt_select_30_b_1_q & i_and_i_i71_1_gmm_substract_vt_const_22_q;

    -- i_cmp_i_i44_1_gmm_substract(LOGICAL,300)@56 + 1
    i_cmp_i_i44_1_gmm_substract_qi <= "1" WHEN i_and_i_i_1_gmm_substract_vt_join_q = c_i32_0gr_q ELSE "0";
    i_cmp_i_i44_1_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_i_i44_1_gmm_substract_qi, xout => i_cmp_i_i44_1_gmm_substract_q, clk => clock, aclr => resetn );

    -- redist43_i_cmp_i_i44_1_gmm_substract_q_4(DELAY,772)
    redist43_i_cmp_i_i44_1_gmm_substract_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_i_i44_1_gmm_substract_q, xout => redist43_i_cmp_i_i44_1_gmm_substract_q_4_q, clk => clock, aclr => resetn );

    -- i_conv2_i_i_i_1_gmm_substract(MUX,315)@60
    i_conv2_i_i_i_1_gmm_substract_s <= redist43_i_cmp_i_i44_1_gmm_substract_q_4_q;
    i_conv2_i_i_i_1_gmm_substract_combproc: PROCESS (i_conv2_i_i_i_1_gmm_substract_s, i_unnamed_gmm_substract2800_sel_x_b, c_i10_0gr_q)
    BEGIN
        CASE (i_conv2_i_i_i_1_gmm_substract_s) IS
            WHEN "0" => i_conv2_i_i_i_1_gmm_substract_q <= i_unnamed_gmm_substract2800_sel_x_b;
            WHEN "1" => i_conv2_i_i_i_1_gmm_substract_q <= c_i10_0gr_q;
            WHEN OTHERS => i_conv2_i_i_i_1_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_and_i1784_1_gmm_substract(LOGICAL,219)@60
    i_and_i1784_1_gmm_substract_q <= i_conv2_i_i_i_1_gmm_substract_q and c_i10_1gr_q;

    -- i_and_i1784_1_gmm_substract_vt_select_0(BITSELECT,222)@60
    i_and_i1784_1_gmm_substract_vt_select_0_b <= i_and_i1784_1_gmm_substract_q(0 downto 0);

    -- i_and_i1784_1_gmm_substract_vt_join(BITJOIN,221)@60
    i_and_i1784_1_gmm_substract_vt_join_q <= i_and_i1784_1_gmm_substract_vt_const_9_q & i_and_i1784_1_gmm_substract_vt_select_0_b;

    -- i_phitmp1787_1_gmm_substract(LOGICAL,446)@60 + 1
    i_phitmp1787_1_gmm_substract_qi <= "1" WHEN i_and_i1784_1_gmm_substract_vt_join_q = c_i10_0gr_q ELSE "0";
    i_phitmp1787_1_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_phitmp1787_1_gmm_substract_qi, xout => i_phitmp1787_1_gmm_substract_q, clk => clock, aclr => resetn );

    -- i_ffwd_dst_cmp_i_i_i279_12648_gmm_substract(BLACKBOX,350)@61
    thei_ffwd_dst_cmp_i_i_i279_12648_gmm_substract : i_ffwd_dst_cmp_i_i_i279_12648_gmm_substract2810
    PORT MAP (
        in_intel_reserved_ffwd_35_0 => in_intel_reserved_ffwd_35_0,
        in_stall_in => GND_q,
        in_valid_in => redist76_sync_in_aunroll_x_in_i_valid_61_q,
        out_dest_data_out_35_0 => i_ffwd_dst_cmp_i_i_i279_12648_gmm_substract_out_dest_data_out_35_0,
        clock => clock,
        resetn => resetn
    );

    -- i_reduction_gmm_substract_81_gmm_substract(LOGICAL,462)@61
    i_reduction_gmm_substract_81_gmm_substract_q <= i_ffwd_dst_cmp_i_i_i279_12648_gmm_substract_out_dest_data_out_35_0 and i_phitmp1787_1_gmm_substract_q;

    -- i_cmp_i_i_i57_1_gmm_substract(COMPARE,312)@1 + 1
    i_cmp_i_i_i57_1_gmm_substract_a <= STD_LOGIC_VECTOR("00" & c_i16_3969_q);
    i_cmp_i_i_i57_1_gmm_substract_b <= STD_LOGIC_VECTOR("00" & i_select528_gmm_substract_q);
    i_cmp_i_i_i57_1_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp_i_i_i57_1_gmm_substract_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp_i_i_i57_1_gmm_substract_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i_i57_1_gmm_substract_a) - UNSIGNED(i_cmp_i_i_i57_1_gmm_substract_b));
        END IF;
    END PROCESS;
    i_cmp_i_i_i57_1_gmm_substract_c(0) <= i_cmp_i_i_i57_1_gmm_substract_o(17);

    -- redist37_i_cmp_i_i_i57_1_gmm_substract_c_60(DELAY,766)
    redist37_i_cmp_i_i_i57_1_gmm_substract_c_60 : dspba_delay
    GENERIC MAP ( width => 1, depth => 59, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_i_i_i57_1_gmm_substract_c, xout => redist37_i_cmp_i_i_i57_1_gmm_substract_c_60_q, clk => clock, aclr => resetn );

    -- i_not_cmp_i_i_i57_1_gmm_substract(LOGICAL,433)@61
    i_not_cmp_i_i_i57_1_gmm_substract_q <= redist37_i_cmp_i_i_i57_1_gmm_substract_c_60_q xor VCC_q;

    -- i_cmp_i_i_i53_1_gmm_substract(COMPARE,309)@1 + 1
    i_cmp_i_i_i53_1_gmm_substract_a <= STD_LOGIC_VECTOR("00" & i_select528_gmm_substract_q);
    i_cmp_i_i_i53_1_gmm_substract_b <= STD_LOGIC_VECTOR("00" & c_i16_9gr_q);
    i_cmp_i_i_i53_1_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp_i_i_i53_1_gmm_substract_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp_i_i_i53_1_gmm_substract_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i_i53_1_gmm_substract_a) - UNSIGNED(i_cmp_i_i_i53_1_gmm_substract_b));
        END IF;
    END PROCESS;
    i_cmp_i_i_i53_1_gmm_substract_c(0) <= i_cmp_i_i_i53_1_gmm_substract_o(17);

    -- redist40_i_cmp_i_i_i53_1_gmm_substract_c_60(DELAY,769)
    redist40_i_cmp_i_i_i53_1_gmm_substract_c_60 : dspba_delay
    GENERIC MAP ( width => 1, depth => 59, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_i_i_i53_1_gmm_substract_c, xout => redist40_i_cmp_i_i_i53_1_gmm_substract_c_60_q, clk => clock, aclr => resetn );

    -- i_not_cmp_i_i_i53_1_gmm_substract(LOGICAL,430)@61
    i_not_cmp_i_i_i53_1_gmm_substract_q <= redist40_i_cmp_i_i_i53_1_gmm_substract_c_60_q xor VCC_q;

    -- i_reduction_gmm_substract_80_gmm_substract(LOGICAL,461)@61
    i_reduction_gmm_substract_80_gmm_substract_q <= i_not_cmp_i_i_i53_1_gmm_substract_q and i_not_cmp_i_i_i57_1_gmm_substract_q;

    -- i_reduction_gmm_substract_82_gmm_substract(LOGICAL,463)@61
    i_reduction_gmm_substract_82_gmm_substract_q <= i_reduction_gmm_substract_80_gmm_substract_q and i_reduction_gmm_substract_81_gmm_substract_q;

    -- i_unnamed_gmm_substract2812_sel_x(BITSELECT,131)@61
    i_unnamed_gmm_substract2812_sel_x_b <= std_logic_vector(resize(unsigned(i_reduction_gmm_substract_82_gmm_substract_q(0 downto 0)), 8));

    -- i_unnamed_gmm_substract2812_vt_select_0(BITSELECT,520)@61
    i_unnamed_gmm_substract2812_vt_select_0_b <= i_unnamed_gmm_substract2812_sel_x_b(0 downto 0);

    -- i_unnamed_gmm_substract2812_vt_join(BITJOIN,519)@61
    i_unnamed_gmm_substract2812_vt_join_q <= i_phitmp1790_1_gmm_substract_vt_const_7_q & i_unnamed_gmm_substract2812_vt_select_0_b;

    -- i_phitmp1790_1_gmm_substract(LOGICAL,449)@61
    i_phitmp1790_1_gmm_substract_q <= i_unnamed_gmm_substract2812_vt_join_q xor c_i8_1gr_q;

    -- i_phitmp1790_1_gmm_substract_vt_select_0(BITSELECT,452)@61
    i_phitmp1790_1_gmm_substract_vt_select_0_b <= i_phitmp1790_1_gmm_substract_q(0 downto 0);

    -- redist5_i_phitmp1790_1_gmm_substract_vt_select_0_b_1(DELAY,734)
    redist5_i_phitmp1790_1_gmm_substract_vt_select_0_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_phitmp1790_1_gmm_substract_vt_select_0_b, xout => redist5_i_phitmp1790_1_gmm_substract_vt_select_0_b_1_q, clk => clock, aclr => resetn );

    -- i_phitmp1790_1_gmm_substract_vt_join(BITJOIN,451)@62
    i_phitmp1790_1_gmm_substract_vt_join_q <= i_phitmp1790_1_gmm_substract_vt_const_7_q & redist5_i_phitmp1790_1_gmm_substract_vt_select_0_b_1_q;

    -- rightShiftStage0Idx1Rng1_uid685_i_shr_i_i29_1_gmm_substract_gmm_substract2802_shift_x(BITSELECT,684)@60
    rightShiftStage0Idx1Rng1_uid685_i_shr_i_i29_1_gmm_substract_gmm_substract2802_shift_x_b <= i_conv2_i_i_i_1_gmm_substract_q(9 downto 1);

    -- rightShiftStage0Idx1_uid687_i_shr_i_i29_1_gmm_substract_gmm_substract2802_shift_x(BITJOIN,686)@60
    rightShiftStage0Idx1_uid687_i_shr_i_i29_1_gmm_substract_gmm_substract2802_shift_x_q <= GND_q & rightShiftStage0Idx1Rng1_uid685_i_shr_i_i29_1_gmm_substract_gmm_substract2802_shift_x_b;

    -- rightShiftStage0_uid689_i_shr_i_i29_1_gmm_substract_gmm_substract2802_shift_x(MUX,688)@60
    rightShiftStage0_uid689_i_shr_i_i29_1_gmm_substract_gmm_substract2802_shift_x_s <= VCC_q;
    rightShiftStage0_uid689_i_shr_i_i29_1_gmm_substract_gmm_substract2802_shift_x_combproc: PROCESS (rightShiftStage0_uid689_i_shr_i_i29_1_gmm_substract_gmm_substract2802_shift_x_s, i_conv2_i_i_i_1_gmm_substract_q, rightShiftStage0Idx1_uid687_i_shr_i_i29_1_gmm_substract_gmm_substract2802_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid689_i_shr_i_i29_1_gmm_substract_gmm_substract2802_shift_x_s) IS
            WHEN "0" => rightShiftStage0_uid689_i_shr_i_i29_1_gmm_substract_gmm_substract2802_shift_x_q <= i_conv2_i_i_i_1_gmm_substract_q;
            WHEN "1" => rightShiftStage0_uid689_i_shr_i_i29_1_gmm_substract_gmm_substract2802_shift_x_q <= rightShiftStage0Idx1_uid687_i_shr_i_i29_1_gmm_substract_gmm_substract2802_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid689_i_shr_i_i29_1_gmm_substract_gmm_substract2802_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_shr_i_i29_1_gmm_substract_vt_select_8(BITSELECT,506)@60
    i_shr_i_i29_1_gmm_substract_vt_select_8_b <= rightShiftStage0_uid689_i_shr_i_i29_1_gmm_substract_gmm_substract2802_shift_x_q(8 downto 0);

    -- i_shr_i_i29_1_gmm_substract_vt_join(BITJOIN,505)@60
    i_shr_i_i29_1_gmm_substract_vt_join_q <= GND_q & i_shr_i_i29_1_gmm_substract_vt_select_8_b;

    -- i_unnamed_gmm_substract2803_sel_x(BITSELECT,130)@60
    i_unnamed_gmm_substract2803_sel_x_b <= i_shr_i_i29_1_gmm_substract_vt_join_q(7 downto 0);

    -- redist84_i_unnamed_gmm_substract2803_sel_x_b_2(DELAY,813)
    redist84_i_unnamed_gmm_substract2803_sel_x_b_2 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_gmm_substract2803_sel_x_b, xout => redist84_i_unnamed_gmm_substract2803_sel_x_b_2_q, clk => clock, aclr => resetn );

    -- i_acl_462_gmm_substract(ADD,186)@62
    i_acl_462_gmm_substract_a <= STD_LOGIC_VECTOR("0" & redist84_i_unnamed_gmm_substract2803_sel_x_b_2_q);
    i_acl_462_gmm_substract_b <= STD_LOGIC_VECTOR("0" & i_phitmp1790_1_gmm_substract_vt_join_q);
    i_acl_462_gmm_substract_o <= STD_LOGIC_VECTOR(UNSIGNED(i_acl_462_gmm_substract_a) + UNSIGNED(i_acl_462_gmm_substract_b));
    i_acl_462_gmm_substract_q <= i_acl_462_gmm_substract_o(8 downto 0);

    -- bgTrunc_i_acl_462_gmm_substract_sel_x(BITSELECT,2)@62
    bgTrunc_i_acl_462_gmm_substract_sel_x_b <= i_acl_462_gmm_substract_q(7 downto 0);

    -- i_acl_463_gmm_substract(LOGICAL,187)@61 + 1
    i_acl_463_gmm_substract_qi <= redist40_i_cmp_i_i_i53_1_gmm_substract_c_60_q and i_not_cmp_i_i_i57_1_gmm_substract_q;
    i_acl_463_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_463_gmm_substract_qi, xout => i_acl_463_gmm_substract_q, clk => clock, aclr => resetn );

    -- i_ffwd_dst_cmp_i_i_i279_12669_gmm_substract(BLACKBOX,369)@62
    thei_ffwd_dst_cmp_i_i_i279_12669_gmm_substract : i_ffwd_dst_cmp_i_i_i279_12669_gmm_substract2813
    PORT MAP (
        in_intel_reserved_ffwd_35_0 => in_intel_reserved_ffwd_35_0,
        in_stall_in => GND_q,
        in_valid_in => redist77_sync_in_aunroll_x_in_i_valid_62_q,
        out_dest_data_out_35_0 => i_ffwd_dst_cmp_i_i_i279_12669_gmm_substract_out_dest_data_out_35_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_464_gmm_substract(LOGICAL,188)@62
    i_acl_464_gmm_substract_q <= i_ffwd_dst_cmp_i_i_i279_12669_gmm_substract_out_dest_data_out_35_0 and i_acl_463_gmm_substract_q;

    -- i_acl_465_gmm_substract(MUX,189)@62 + 1
    i_acl_465_gmm_substract_s <= i_acl_464_gmm_substract_q;
    i_acl_465_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_465_gmm_substract_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_acl_465_gmm_substract_s) IS
                WHEN "0" => i_acl_465_gmm_substract_q <= bgTrunc_i_acl_462_gmm_substract_sel_x_b;
                WHEN "1" => i_acl_465_gmm_substract_q <= c_i8_3gr_q;
                WHEN OTHERS => i_acl_465_gmm_substract_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_ffwd_dst_cmp_i_i_i279_12668_gmm_substract(BLACKBOX,368)@61
    thei_ffwd_dst_cmp_i_i_i279_12668_gmm_substract : i_ffwd_dst_cmp_i_i_i279_12668_gmm_substract2815
    PORT MAP (
        in_intel_reserved_ffwd_35_0 => in_intel_reserved_ffwd_35_0,
        in_stall_in => GND_q,
        in_valid_in => redist76_sync_in_aunroll_x_in_i_valid_61_q,
        out_dest_data_out_35_0 => i_ffwd_dst_cmp_i_i_i279_12668_gmm_substract_out_dest_data_out_35_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_466_gmm_substract(LOGICAL,190)@61 + 1
    i_acl_466_gmm_substract_qi <= i_ffwd_dst_cmp_i_i_i279_12668_gmm_substract_out_dest_data_out_35_0 and redist37_i_cmp_i_i_i57_1_gmm_substract_c_60_q;
    i_acl_466_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_466_gmm_substract_qi, xout => i_acl_466_gmm_substract_q, clk => clock, aclr => resetn );

    -- redist63_i_acl_466_gmm_substract_q_2(DELAY,792)
    redist63_i_acl_466_gmm_substract_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_466_gmm_substract_q, xout => redist63_i_acl_466_gmm_substract_q_2_q, clk => clock, aclr => resetn );

    -- i_acl_467_gmm_substract(MUX,191)@63 + 1
    i_acl_467_gmm_substract_s <= redist63_i_acl_466_gmm_substract_q_2_q;
    i_acl_467_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_467_gmm_substract_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_acl_467_gmm_substract_s) IS
                WHEN "0" => i_acl_467_gmm_substract_q <= i_acl_465_gmm_substract_q;
                WHEN "1" => i_acl_467_gmm_substract_q <= c_i8_63_q;
                WHEN OTHERS => i_acl_467_gmm_substract_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist62_i_acl_467_gmm_substract_q_27_wraddr(REG,880)
    redist62_i_acl_467_gmm_substract_q_27_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist62_i_acl_467_gmm_substract_q_27_wraddr_q <= "11000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist62_i_acl_467_gmm_substract_q_27_wraddr_q <= STD_LOGIC_VECTOR(redist62_i_acl_467_gmm_substract_q_27_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist62_i_acl_467_gmm_substract_q_27_mem(DUALMEM,878)
    redist62_i_acl_467_gmm_substract_q_27_mem_ia <= STD_LOGIC_VECTOR(i_acl_467_gmm_substract_q);
    redist62_i_acl_467_gmm_substract_q_27_mem_aa <= redist62_i_acl_467_gmm_substract_q_27_wraddr_q;
    redist62_i_acl_467_gmm_substract_q_27_mem_ab <= redist62_i_acl_467_gmm_substract_q_27_rdcnt_q;
    redist62_i_acl_467_gmm_substract_q_27_mem_reset0 <= not (resetn);
    redist62_i_acl_467_gmm_substract_q_27_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 5,
        numwords_a => 25,
        width_b => 8,
        widthad_b => 5,
        numwords_b => 25,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist62_i_acl_467_gmm_substract_q_27_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist62_i_acl_467_gmm_substract_q_27_mem_reset0,
        clock1 => clock,
        address_a => redist62_i_acl_467_gmm_substract_q_27_mem_aa,
        data_a => redist62_i_acl_467_gmm_substract_q_27_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist62_i_acl_467_gmm_substract_q_27_mem_ab,
        q_b => redist62_i_acl_467_gmm_substract_q_27_mem_iq
    );
    redist62_i_acl_467_gmm_substract_q_27_mem_q <= redist62_i_acl_467_gmm_substract_q_27_mem_iq(7 downto 0);

    -- i_ffwd_dst_unnamed_gmm_substract106_gmm_substract(BLACKBOX,412)@90
    thei_ffwd_dst_unnamed_gmm_substract106_gmm_substract : i_ffwd_dst_unnamed_gmm_substract106_gmm_substract2817
    PORT MAP (
        in_intel_reserved_ffwd_8_0 => in_intel_reserved_ffwd_8_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_8_0 => i_ffwd_dst_unnamed_gmm_substract106_gmm_substract_out_dest_data_out_8_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_cmp_i_i_i279_12667_gmm_substract(BLACKBOX,367)@90
    thei_ffwd_dst_cmp_i_i_i279_12667_gmm_substract : i_ffwd_dst_cmp_i_i_i279_12667_gmm_substract2819
    PORT MAP (
        in_intel_reserved_ffwd_35_0 => in_intel_reserved_ffwd_35_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_35_0 => i_ffwd_dst_cmp_i_i_i279_12667_gmm_substract_out_dest_data_out_35_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_468_gmm_substract(MUX,192)@90
    i_acl_468_gmm_substract_s <= i_ffwd_dst_cmp_i_i_i279_12667_gmm_substract_out_dest_data_out_35_0;
    i_acl_468_gmm_substract_combproc: PROCESS (i_acl_468_gmm_substract_s, i_ffwd_dst_unnamed_gmm_substract106_gmm_substract_out_dest_data_out_8_0, redist62_i_acl_467_gmm_substract_q_27_mem_q)
    BEGIN
        CASE (i_acl_468_gmm_substract_s) IS
            WHEN "0" => i_acl_468_gmm_substract_q <= i_ffwd_dst_unnamed_gmm_substract106_gmm_substract_out_dest_data_out_8_0;
            WHEN "1" => i_acl_468_gmm_substract_q <= redist62_i_acl_467_gmm_substract_q_27_mem_q;
            WHEN OTHERS => i_acl_468_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_dst_select5982746_gmm_substract(BLACKBOX,399)@90
    thei_ffwd_dst_select5982746_gmm_substract : i_ffwd_dst_select5982746_gmm_substract2825
    PORT MAP (
        in_intel_reserved_ffwd_65_0 => in_intel_reserved_ffwd_65_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_65_0 => i_ffwd_dst_select5982746_gmm_substract_out_dest_data_out_65_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_unnamed_gmm_substract107_gmm_substract(BLACKBOX,413)@90
    thei_ffwd_dst_unnamed_gmm_substract107_gmm_substract : i_ffwd_dst_unnamed_gmm_substract107_gmm_substract2821
    PORT MAP (
        in_intel_reserved_ffwd_7_0 => in_intel_reserved_ffwd_7_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_7_0 => i_ffwd_dst_unnamed_gmm_substract107_gmm_substract_out_dest_data_out_7_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_cmp_i_i_i279_12666_gmm_substract(BLACKBOX,366)@90
    thei_ffwd_dst_cmp_i_i_i279_12666_gmm_substract : i_ffwd_dst_cmp_i_i_i279_12666_gmm_substract2823
    PORT MAP (
        in_intel_reserved_ffwd_35_0 => in_intel_reserved_ffwd_35_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_35_0 => i_ffwd_dst_cmp_i_i_i279_12666_gmm_substract_out_dest_data_out_35_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_469_gmm_substract(MUX,193)@90
    i_acl_469_gmm_substract_s <= i_ffwd_dst_cmp_i_i_i279_12666_gmm_substract_out_dest_data_out_35_0;
    i_acl_469_gmm_substract_combproc: PROCESS (i_acl_469_gmm_substract_s, i_ffwd_dst_unnamed_gmm_substract107_gmm_substract_out_dest_data_out_7_0, i_ffwd_dst_select5982746_gmm_substract_out_dest_data_out_65_0)
    BEGIN
        CASE (i_acl_469_gmm_substract_s) IS
            WHEN "0" => i_acl_469_gmm_substract_q <= i_ffwd_dst_unnamed_gmm_substract107_gmm_substract_out_dest_data_out_7_0;
            WHEN "1" => i_acl_469_gmm_substract_q <= i_ffwd_dst_select5982746_gmm_substract_out_dest_data_out_65_0;
            WHEN OTHERS => i_acl_469_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_dst_select6042747_gmm_substract(BLACKBOX,400)@90
    thei_ffwd_dst_select6042747_gmm_substract : i_ffwd_dst_select6042747_gmm_substract2831
    PORT MAP (
        in_intel_reserved_ffwd_66_0 => in_intel_reserved_ffwd_66_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_66_0 => i_ffwd_dst_select6042747_gmm_substract_out_dest_data_out_66_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_unnamed_gmm_substract108_gmm_substract(BLACKBOX,414)@90
    thei_ffwd_dst_unnamed_gmm_substract108_gmm_substract : i_ffwd_dst_unnamed_gmm_substract108_gmm_substract2827
    PORT MAP (
        in_intel_reserved_ffwd_6_0 => in_intel_reserved_ffwd_6_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_6_0 => i_ffwd_dst_unnamed_gmm_substract108_gmm_substract_out_dest_data_out_6_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_cmp_i_i_i279_12665_gmm_substract(BLACKBOX,365)@90
    thei_ffwd_dst_cmp_i_i_i279_12665_gmm_substract : i_ffwd_dst_cmp_i_i_i279_12665_gmm_substract2829
    PORT MAP (
        in_intel_reserved_ffwd_35_0 => in_intel_reserved_ffwd_35_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_35_0 => i_ffwd_dst_cmp_i_i_i279_12665_gmm_substract_out_dest_data_out_35_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_470_gmm_substract(MUX,194)@90
    i_acl_470_gmm_substract_s <= i_ffwd_dst_cmp_i_i_i279_12665_gmm_substract_out_dest_data_out_35_0;
    i_acl_470_gmm_substract_combproc: PROCESS (i_acl_470_gmm_substract_s, i_ffwd_dst_unnamed_gmm_substract108_gmm_substract_out_dest_data_out_6_0, i_ffwd_dst_select6042747_gmm_substract_out_dest_data_out_66_0)
    BEGIN
        CASE (i_acl_470_gmm_substract_s) IS
            WHEN "0" => i_acl_470_gmm_substract_q <= i_ffwd_dst_unnamed_gmm_substract108_gmm_substract_out_dest_data_out_6_0;
            WHEN "1" => i_acl_470_gmm_substract_q <= i_ffwd_dst_select6042747_gmm_substract_out_dest_data_out_66_0;
            WHEN OTHERS => i_acl_470_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_dst_select5442737_gmm_substract(BLACKBOX,390)@90
    thei_ffwd_dst_select5442737_gmm_substract : i_ffwd_dst_select5442737_gmm_substract2837
    PORT MAP (
        in_intel_reserved_ffwd_56_0 => in_intel_reserved_ffwd_56_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_56_0 => i_ffwd_dst_select5442737_gmm_substract_out_dest_data_out_56_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_unnamed_gmm_substract109_gmm_substract(BLACKBOX,415)@90
    thei_ffwd_dst_unnamed_gmm_substract109_gmm_substract : i_ffwd_dst_unnamed_gmm_substract109_gmm_substract2833
    PORT MAP (
        in_intel_reserved_ffwd_5_0 => in_intel_reserved_ffwd_5_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_5_0 => i_ffwd_dst_unnamed_gmm_substract109_gmm_substract_out_dest_data_out_5_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_cmp_i_i_i279_12664_gmm_substract(BLACKBOX,364)@90
    thei_ffwd_dst_cmp_i_i_i279_12664_gmm_substract : i_ffwd_dst_cmp_i_i_i279_12664_gmm_substract2835
    PORT MAP (
        in_intel_reserved_ffwd_35_0 => in_intel_reserved_ffwd_35_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_35_0 => i_ffwd_dst_cmp_i_i_i279_12664_gmm_substract_out_dest_data_out_35_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_471_gmm_substract(MUX,195)@90
    i_acl_471_gmm_substract_s <= i_ffwd_dst_cmp_i_i_i279_12664_gmm_substract_out_dest_data_out_35_0;
    i_acl_471_gmm_substract_combproc: PROCESS (i_acl_471_gmm_substract_s, i_ffwd_dst_unnamed_gmm_substract109_gmm_substract_out_dest_data_out_5_0, i_ffwd_dst_select5442737_gmm_substract_out_dest_data_out_56_0)
    BEGIN
        CASE (i_acl_471_gmm_substract_s) IS
            WHEN "0" => i_acl_471_gmm_substract_q <= i_ffwd_dst_unnamed_gmm_substract109_gmm_substract_out_dest_data_out_5_0;
            WHEN "1" => i_acl_471_gmm_substract_q <= i_ffwd_dst_select5442737_gmm_substract_out_dest_data_out_56_0;
            WHEN OTHERS => i_acl_471_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist65_i_acl_444_gmm_substract_q_37_split_0_notEnable(LOGICAL,905)
    redist65_i_acl_444_gmm_substract_q_37_split_0_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist65_i_acl_444_gmm_substract_q_37_split_0_nor(LOGICAL,906)
    redist65_i_acl_444_gmm_substract_q_37_split_0_nor_q <= not (redist65_i_acl_444_gmm_substract_q_37_split_0_notEnable_q or redist65_i_acl_444_gmm_substract_q_37_split_0_sticky_ena_q);

    -- redist65_i_acl_444_gmm_substract_q_37_split_0_mem_last(CONSTANT,902)
    redist65_i_acl_444_gmm_substract_q_37_split_0_mem_last_q <= "011101";

    -- redist65_i_acl_444_gmm_substract_q_37_split_0_cmp(LOGICAL,903)
    redist65_i_acl_444_gmm_substract_q_37_split_0_cmp_b <= STD_LOGIC_VECTOR("0" & redist65_i_acl_444_gmm_substract_q_37_split_0_rdcnt_q);
    redist65_i_acl_444_gmm_substract_q_37_split_0_cmp_q <= "1" WHEN redist65_i_acl_444_gmm_substract_q_37_split_0_mem_last_q = redist65_i_acl_444_gmm_substract_q_37_split_0_cmp_b ELSE "0";

    -- redist65_i_acl_444_gmm_substract_q_37_split_0_cmpReg(REG,904)
    redist65_i_acl_444_gmm_substract_q_37_split_0_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist65_i_acl_444_gmm_substract_q_37_split_0_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist65_i_acl_444_gmm_substract_q_37_split_0_cmpReg_q <= STD_LOGIC_VECTOR(redist65_i_acl_444_gmm_substract_q_37_split_0_cmp_q);
        END IF;
    END PROCESS;

    -- redist65_i_acl_444_gmm_substract_q_37_split_0_sticky_ena(REG,907)
    redist65_i_acl_444_gmm_substract_q_37_split_0_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist65_i_acl_444_gmm_substract_q_37_split_0_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist65_i_acl_444_gmm_substract_q_37_split_0_nor_q = "1") THEN
                redist65_i_acl_444_gmm_substract_q_37_split_0_sticky_ena_q <= STD_LOGIC_VECTOR(redist65_i_acl_444_gmm_substract_q_37_split_0_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist65_i_acl_444_gmm_substract_q_37_split_0_enaAnd(LOGICAL,908)
    redist65_i_acl_444_gmm_substract_q_37_split_0_enaAnd_q <= redist65_i_acl_444_gmm_substract_q_37_split_0_sticky_ena_q and VCC_q;

    -- redist65_i_acl_444_gmm_substract_q_37_split_0_rdcnt(COUNTER,900)
    -- low=0, high=30, step=1, init=0
    redist65_i_acl_444_gmm_substract_q_37_split_0_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist65_i_acl_444_gmm_substract_q_37_split_0_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist65_i_acl_444_gmm_substract_q_37_split_0_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist65_i_acl_444_gmm_substract_q_37_split_0_rdcnt_i = TO_UNSIGNED(29, 5)) THEN
                redist65_i_acl_444_gmm_substract_q_37_split_0_rdcnt_eq <= '1';
            ELSE
                redist65_i_acl_444_gmm_substract_q_37_split_0_rdcnt_eq <= '0';
            END IF;
            IF (redist65_i_acl_444_gmm_substract_q_37_split_0_rdcnt_eq = '1') THEN
                redist65_i_acl_444_gmm_substract_q_37_split_0_rdcnt_i <= redist65_i_acl_444_gmm_substract_q_37_split_0_rdcnt_i + 2;
            ELSE
                redist65_i_acl_444_gmm_substract_q_37_split_0_rdcnt_i <= redist65_i_acl_444_gmm_substract_q_37_split_0_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist65_i_acl_444_gmm_substract_q_37_split_0_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist65_i_acl_444_gmm_substract_q_37_split_0_rdcnt_i, 5)));

    -- i_ffwd_dst_unnamed_gmm_substract100_gmm_substract(BLACKBOX,406)@53
    thei_ffwd_dst_unnamed_gmm_substract100_gmm_substract : i_ffwd_dst_unnamed_gmm_substract100_gmm_substract2773
    PORT MAP (
        in_intel_reserved_ffwd_4_0 => in_intel_reserved_ffwd_4_0,
        in_stall_in => GND_q,
        in_valid_in => redist72_sync_in_aunroll_x_in_i_valid_53_q,
        out_dest_data_out_4_0 => i_ffwd_dst_unnamed_gmm_substract100_gmm_substract_out_dest_data_out_4_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_cmp_i_i_i2792637_gmm_substract(BLACKBOX,349)@53
    thei_ffwd_dst_cmp_i_i_i2792637_gmm_substract : i_ffwd_dst_cmp_i_i_i2792637_gmm_substract2775
    PORT MAP (
        in_intel_reserved_ffwd_32_0 => in_intel_reserved_ffwd_32_0,
        in_stall_in => GND_q,
        in_valid_in => redist72_sync_in_aunroll_x_in_i_valid_53_q,
        out_dest_data_out_32_0 => i_ffwd_dst_cmp_i_i_i2792637_gmm_substract_out_dest_data_out_32_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_444_gmm_substract(MUX,174)@53 + 1
    i_acl_444_gmm_substract_s <= i_ffwd_dst_cmp_i_i_i2792637_gmm_substract_out_dest_data_out_32_0;
    i_acl_444_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_444_gmm_substract_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_acl_444_gmm_substract_s) IS
                WHEN "0" => i_acl_444_gmm_substract_q <= i_select501_gmm_substract_q;
                WHEN "1" => i_acl_444_gmm_substract_q <= i_ffwd_dst_unnamed_gmm_substract100_gmm_substract_out_dest_data_out_4_0;
                WHEN OTHERS => i_acl_444_gmm_substract_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist65_i_acl_444_gmm_substract_q_37_split_0_wraddr(REG,901)
    redist65_i_acl_444_gmm_substract_q_37_split_0_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist65_i_acl_444_gmm_substract_q_37_split_0_wraddr_q <= "11110";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist65_i_acl_444_gmm_substract_q_37_split_0_wraddr_q <= STD_LOGIC_VECTOR(redist65_i_acl_444_gmm_substract_q_37_split_0_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist65_i_acl_444_gmm_substract_q_37_split_0_mem(DUALMEM,899)
    redist65_i_acl_444_gmm_substract_q_37_split_0_mem_ia <= STD_LOGIC_VECTOR(i_acl_444_gmm_substract_q);
    redist65_i_acl_444_gmm_substract_q_37_split_0_mem_aa <= redist65_i_acl_444_gmm_substract_q_37_split_0_wraddr_q;
    redist65_i_acl_444_gmm_substract_q_37_split_0_mem_ab <= redist65_i_acl_444_gmm_substract_q_37_split_0_rdcnt_q;
    redist65_i_acl_444_gmm_substract_q_37_split_0_mem_reset0 <= not (resetn);
    redist65_i_acl_444_gmm_substract_q_37_split_0_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 5,
        numwords_a => 31,
        width_b => 8,
        widthad_b => 5,
        numwords_b => 31,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist65_i_acl_444_gmm_substract_q_37_split_0_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist65_i_acl_444_gmm_substract_q_37_split_0_mem_reset0,
        clock1 => clock,
        address_a => redist65_i_acl_444_gmm_substract_q_37_split_0_mem_aa,
        data_a => redist65_i_acl_444_gmm_substract_q_37_split_0_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist65_i_acl_444_gmm_substract_q_37_split_0_mem_ab,
        q_b => redist65_i_acl_444_gmm_substract_q_37_split_0_mem_iq
    );
    redist65_i_acl_444_gmm_substract_q_37_split_0_mem_q <= redist65_i_acl_444_gmm_substract_q_37_split_0_mem_iq(7 downto 0);

    -- redist65_i_acl_444_gmm_substract_q_37_split_0_outputreg(DELAY,898)
    redist65_i_acl_444_gmm_substract_q_37_split_0_outputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist65_i_acl_444_gmm_substract_q_37_split_0_mem_q, xout => redist65_i_acl_444_gmm_substract_q_37_split_0_outputreg_q, clk => clock, aclr => resetn );

    -- redist65_i_acl_444_gmm_substract_q_37(DELAY,794)
    redist65_i_acl_444_gmm_substract_q_37 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist65_i_acl_444_gmm_substract_q_37_split_0_outputreg_q, xout => redist65_i_acl_444_gmm_substract_q_37_q, clk => clock, aclr => resetn );

    -- redist64_i_acl_454_gmm_substract_q_28_notEnable(LOGICAL,894)
    redist64_i_acl_454_gmm_substract_q_28_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist64_i_acl_454_gmm_substract_q_28_nor(LOGICAL,895)
    redist64_i_acl_454_gmm_substract_q_28_nor_q <= not (redist64_i_acl_454_gmm_substract_q_28_notEnable_q or redist64_i_acl_454_gmm_substract_q_28_sticky_ena_q);

    -- redist64_i_acl_454_gmm_substract_q_28_mem_last(CONSTANT,891)
    redist64_i_acl_454_gmm_substract_q_28_mem_last_q <= "011000";

    -- redist64_i_acl_454_gmm_substract_q_28_cmp(LOGICAL,892)
    redist64_i_acl_454_gmm_substract_q_28_cmp_b <= STD_LOGIC_VECTOR("0" & redist64_i_acl_454_gmm_substract_q_28_rdcnt_q);
    redist64_i_acl_454_gmm_substract_q_28_cmp_q <= "1" WHEN redist64_i_acl_454_gmm_substract_q_28_mem_last_q = redist64_i_acl_454_gmm_substract_q_28_cmp_b ELSE "0";

    -- redist64_i_acl_454_gmm_substract_q_28_cmpReg(REG,893)
    redist64_i_acl_454_gmm_substract_q_28_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist64_i_acl_454_gmm_substract_q_28_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist64_i_acl_454_gmm_substract_q_28_cmpReg_q <= STD_LOGIC_VECTOR(redist64_i_acl_454_gmm_substract_q_28_cmp_q);
        END IF;
    END PROCESS;

    -- redist64_i_acl_454_gmm_substract_q_28_sticky_ena(REG,896)
    redist64_i_acl_454_gmm_substract_q_28_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist64_i_acl_454_gmm_substract_q_28_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist64_i_acl_454_gmm_substract_q_28_nor_q = "1") THEN
                redist64_i_acl_454_gmm_substract_q_28_sticky_ena_q <= STD_LOGIC_VECTOR(redist64_i_acl_454_gmm_substract_q_28_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist64_i_acl_454_gmm_substract_q_28_enaAnd(LOGICAL,897)
    redist64_i_acl_454_gmm_substract_q_28_enaAnd_q <= redist64_i_acl_454_gmm_substract_q_28_sticky_ena_q and VCC_q;

    -- redist64_i_acl_454_gmm_substract_q_28_rdcnt(COUNTER,889)
    -- low=0, high=25, step=1, init=0
    redist64_i_acl_454_gmm_substract_q_28_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist64_i_acl_454_gmm_substract_q_28_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist64_i_acl_454_gmm_substract_q_28_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist64_i_acl_454_gmm_substract_q_28_rdcnt_i = TO_UNSIGNED(24, 5)) THEN
                redist64_i_acl_454_gmm_substract_q_28_rdcnt_eq <= '1';
            ELSE
                redist64_i_acl_454_gmm_substract_q_28_rdcnt_eq <= '0';
            END IF;
            IF (redist64_i_acl_454_gmm_substract_q_28_rdcnt_eq = '1') THEN
                redist64_i_acl_454_gmm_substract_q_28_rdcnt_i <= redist64_i_acl_454_gmm_substract_q_28_rdcnt_i + 7;
            ELSE
                redist64_i_acl_454_gmm_substract_q_28_rdcnt_i <= redist64_i_acl_454_gmm_substract_q_28_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist64_i_acl_454_gmm_substract_q_28_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist64_i_acl_454_gmm_substract_q_28_rdcnt_i, 5)));

    -- i_ffwd_dst_unnamed_gmm_substract101_gmm_substract(BLACKBOX,407)@62
    thei_ffwd_dst_unnamed_gmm_substract101_gmm_substract : i_ffwd_dst_unnamed_gmm_substract101_gmm_substract2783
    PORT MAP (
        in_intel_reserved_ffwd_3_0 => in_intel_reserved_ffwd_3_0,
        in_stall_in => GND_q,
        in_valid_in => redist77_sync_in_aunroll_x_in_i_valid_62_q,
        out_dest_data_out_3_0 => i_ffwd_dst_unnamed_gmm_substract101_gmm_substract_out_dest_data_out_3_0,
        clock => clock,
        resetn => resetn
    );

    -- rightShiftStage0Idx1Rng1_uid703_i_shr_i_i29_gmm_substract_gmm_substract2771_shift_x(BITSELECT,702)@60
    rightShiftStage0Idx1Rng1_uid703_i_shr_i_i29_gmm_substract_gmm_substract2771_shift_x_b <= i_conv2_i_i_i_gmm_substract_q(9 downto 1);

    -- rightShiftStage0Idx1_uid705_i_shr_i_i29_gmm_substract_gmm_substract2771_shift_x(BITJOIN,704)@60
    rightShiftStage0Idx1_uid705_i_shr_i_i29_gmm_substract_gmm_substract2771_shift_x_q <= GND_q & rightShiftStage0Idx1Rng1_uid703_i_shr_i_i29_gmm_substract_gmm_substract2771_shift_x_b;

    -- dupName_1_constMult_x(BLACKBOX,10)@36
    -- out out_primWireOut@39
    thedupName_1_constMult_x : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA0Z2cdo6u2ocpq6c0ouq3cz
    PORT MAP (
        in_0 => redist27_i_conv802_gmm_substract_out_primWireOut_26_outputreg_q,
        out_primWireOut => dupName_1_constMult_x_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist89_dupName_1_constMult_x_out_primWireOut_1(DELAY,818)
    redist89_dupName_1_constMult_x_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => dupName_1_constMult_x_out_primWireOut, xout => redist89_dupName_1_constMult_x_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_acl_sqrtf_call_i_gmm_substract(BLACKBOX,218)@40
    -- out out_primWireOut@55
    thei_acl_sqrtf_call_i_gmm_substract : floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA1Z4ce2a150g24ad2045eny
    PORT MAP (
        in_0 => redist89_dupName_1_constMult_x_out_primWireOut_1_q,
        out_primWireOut => i_acl_sqrtf_call_i_gmm_substract_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_convert_fptosi_64_fsi_gmm_substract(EXTIFACE,209)@55 + 5
    i_acl_convert_fptosi_64_fsi_gmm_substract_dataa <= i_acl_sqrtf_call_i_gmm_substract_out_primWireOut;
    i_acl_convert_fptosi_64_fsi_gmm_substract_enable <= VCC_q;
    i_acl_convert_fptosi_64_fsi_gmm_substract_stall_in <= GND_q;
    i_acl_convert_fptosi_64_fsi_gmm_substract_valid_in <= VCC_q;
    i_acl_convert_fptosi_64_fsi_gmm_substract_enable_bitsignaltemp <= i_acl_convert_fptosi_64_fsi_gmm_substract_enable(0);
    i_acl_convert_fptosi_64_fsi_gmm_substract_stall_in_bitsignaltemp <= i_acl_convert_fptosi_64_fsi_gmm_substract_stall_in(0);
    i_acl_convert_fptosi_64_fsi_gmm_substract_valid_in_bitsignaltemp <= i_acl_convert_fptosi_64_fsi_gmm_substract_valid_in(0);
    thei_acl_convert_fptosi_64_fsi_gmm_substract : acl_fp_convert_with_rounding_64
    GENERIC MAP (
        ROUNDING_MODE => 2,
        UNSIGNED => 0
    )
    PORT MAP (
        dataa => i_acl_sqrtf_call_i_gmm_substract_out_primWireOut,
        enable => i_acl_convert_fptosi_64_fsi_gmm_substract_enable_bitsignaltemp,
        stall_in => i_acl_convert_fptosi_64_fsi_gmm_substract_stall_in_bitsignaltemp,
        valid_in => i_acl_convert_fptosi_64_fsi_gmm_substract_valid_in_bitsignaltemp,
        result => i_acl_convert_fptosi_64_fsi_gmm_substract_result,
        clock => clock,
        resetn => resetn
    );

    -- i_unnamed_gmm_substract2769_sel_x(BITSELECT,127)@60
    i_unnamed_gmm_substract2769_sel_x_b <= i_acl_convert_fptosi_64_fsi_gmm_substract_result(9 downto 0);

    -- i_and_i_i_gmm_substract(LOGICAL,271)@55
    i_and_i_i_gmm_substract_q <= i_acl_sqrtf_call_i_gmm_substract_out_primWireOut and c_i32_2139095040_q;

    -- i_and_i_i_gmm_substract_vt_select_30(BITSELECT,275)@55
    i_and_i_i_gmm_substract_vt_select_30_b <= i_and_i_i_gmm_substract_q(30 downto 23);

    -- redist44_i_and_i_i_gmm_substract_vt_select_30_b_1(DELAY,773)
    redist44_i_and_i_i_gmm_substract_vt_select_30_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_and_i_i_gmm_substract_vt_select_30_b, xout => redist44_i_and_i_i_gmm_substract_vt_select_30_b_1_q, clk => clock, aclr => resetn );

    -- i_and_i_i_gmm_substract_vt_join(BITJOIN,274)@56
    i_and_i_i_gmm_substract_vt_join_q <= GND_q & redist44_i_and_i_i_gmm_substract_vt_select_30_b_1_q & i_and_i_i71_1_gmm_substract_vt_const_22_q;

    -- i_cmp_i_i44_gmm_substract(LOGICAL,302)@56 + 1
    i_cmp_i_i44_gmm_substract_qi <= "1" WHEN i_and_i_i_gmm_substract_vt_join_q = c_i32_0gr_q ELSE "0";
    i_cmp_i_i44_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_i_i44_gmm_substract_qi, xout => i_cmp_i_i44_gmm_substract_q, clk => clock, aclr => resetn );

    -- redist41_i_cmp_i_i44_gmm_substract_q_4(DELAY,770)
    redist41_i_cmp_i_i44_gmm_substract_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_i_i44_gmm_substract_q, xout => redist41_i_cmp_i_i44_gmm_substract_q_4_q, clk => clock, aclr => resetn );

    -- i_conv2_i_i_i_gmm_substract(MUX,317)@60
    i_conv2_i_i_i_gmm_substract_s <= redist41_i_cmp_i_i44_gmm_substract_q_4_q;
    i_conv2_i_i_i_gmm_substract_combproc: PROCESS (i_conv2_i_i_i_gmm_substract_s, i_unnamed_gmm_substract2769_sel_x_b, c_i10_0gr_q)
    BEGIN
        CASE (i_conv2_i_i_i_gmm_substract_s) IS
            WHEN "0" => i_conv2_i_i_i_gmm_substract_q <= i_unnamed_gmm_substract2769_sel_x_b;
            WHEN "1" => i_conv2_i_i_i_gmm_substract_q <= c_i10_0gr_q;
            WHEN OTHERS => i_conv2_i_i_i_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage0_uid707_i_shr_i_i29_gmm_substract_gmm_substract2771_shift_x(MUX,706)@60
    rightShiftStage0_uid707_i_shr_i_i29_gmm_substract_gmm_substract2771_shift_x_s <= VCC_q;
    rightShiftStage0_uid707_i_shr_i_i29_gmm_substract_gmm_substract2771_shift_x_combproc: PROCESS (rightShiftStage0_uid707_i_shr_i_i29_gmm_substract_gmm_substract2771_shift_x_s, i_conv2_i_i_i_gmm_substract_q, rightShiftStage0Idx1_uid705_i_shr_i_i29_gmm_substract_gmm_substract2771_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid707_i_shr_i_i29_gmm_substract_gmm_substract2771_shift_x_s) IS
            WHEN "0" => rightShiftStage0_uid707_i_shr_i_i29_gmm_substract_gmm_substract2771_shift_x_q <= i_conv2_i_i_i_gmm_substract_q;
            WHEN "1" => rightShiftStage0_uid707_i_shr_i_i29_gmm_substract_gmm_substract2771_shift_x_q <= rightShiftStage0Idx1_uid705_i_shr_i_i29_gmm_substract_gmm_substract2771_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid707_i_shr_i_i29_gmm_substract_gmm_substract2771_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_shr_i_i29_gmm_substract_vt_select_8(BITSELECT,512)@60
    i_shr_i_i29_gmm_substract_vt_select_8_b <= rightShiftStage0_uid707_i_shr_i_i29_gmm_substract_gmm_substract2771_shift_x_q(8 downto 0);

    -- i_shr_i_i29_gmm_substract_vt_join(BITJOIN,511)@60
    i_shr_i_i29_gmm_substract_vt_join_q <= GND_q & i_shr_i_i29_gmm_substract_vt_select_8_b;

    -- i_unnamed_gmm_substract2772_sel_x(BITSELECT,128)@60
    i_unnamed_gmm_substract2772_sel_x_b <= i_shr_i_i29_gmm_substract_vt_join_q(7 downto 0);

    -- redist85_i_unnamed_gmm_substract2772_sel_x_b_1(DELAY,814)
    redist85_i_unnamed_gmm_substract2772_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_gmm_substract2772_sel_x_b, xout => redist85_i_unnamed_gmm_substract2772_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_phitmp1790_gmm_substract(ADD,457)@60
    i_phitmp1790_gmm_substract_a <= STD_LOGIC_VECTOR("0" & i_unnamed_gmm_substract2772_sel_x_b);
    i_phitmp1790_gmm_substract_b <= STD_LOGIC_VECTOR("0" & c_i8_1gr_q);
    i_phitmp1790_gmm_substract_o <= STD_LOGIC_VECTOR(UNSIGNED(i_phitmp1790_gmm_substract_a) + UNSIGNED(i_phitmp1790_gmm_substract_b));
    i_phitmp1790_gmm_substract_q <= i_phitmp1790_gmm_substract_o(8 downto 0);

    -- bgTrunc_i_phitmp1790_gmm_substract_sel_x(BITSELECT,4)@60
    bgTrunc_i_phitmp1790_gmm_substract_sel_x_b <= i_phitmp1790_gmm_substract_q(7 downto 0);

    -- redist91_bgTrunc_i_phitmp1790_gmm_substract_sel_x_b_1(DELAY,820)
    redist91_bgTrunc_i_phitmp1790_gmm_substract_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_phitmp1790_gmm_substract_sel_x_b, xout => redist91_bgTrunc_i_phitmp1790_gmm_substract_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_ffwd_dst_not_cmp_i_i_i2792647_gmm_substract(BLACKBOX,389)@60
    thei_ffwd_dst_not_cmp_i_i_i2792647_gmm_substract : i_ffwd_dst_not_cmp_i_i_i2792647_gmm_substract2777
    PORT MAP (
        in_intel_reserved_ffwd_34_0 => in_intel_reserved_ffwd_34_0,
        in_stall_in => GND_q,
        in_valid_in => redist75_sync_in_aunroll_x_in_i_valid_60_q,
        out_dest_data_out_34_0 => i_ffwd_dst_not_cmp_i_i_i2792647_gmm_substract_out_dest_data_out_34_0,
        clock => clock,
        resetn => resetn
    );

    -- i_cmp_i_i_i57_gmm_substract(COMPARE,314)@1 + 1
    i_cmp_i_i_i57_gmm_substract_a <= STD_LOGIC_VECTOR("00" & c_i16_3969_q);
    i_cmp_i_i_i57_gmm_substract_b <= STD_LOGIC_VECTOR("00" & i_select498_gmm_substract_q);
    i_cmp_i_i_i57_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp_i_i_i57_gmm_substract_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp_i_i_i57_gmm_substract_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i_i57_gmm_substract_a) - UNSIGNED(i_cmp_i_i_i57_gmm_substract_b));
        END IF;
    END PROCESS;
    i_cmp_i_i_i57_gmm_substract_c(0) <= i_cmp_i_i_i57_gmm_substract_o(17);

    -- redist35_i_cmp_i_i_i57_gmm_substract_c_59(DELAY,764)
    redist35_i_cmp_i_i_i57_gmm_substract_c_59 : dspba_delay
    GENERIC MAP ( width => 1, depth => 58, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_i_i_i57_gmm_substract_c, xout => redist35_i_cmp_i_i_i57_gmm_substract_c_59_q, clk => clock, aclr => resetn );

    -- i_acl_445_gmm_substract(LOGICAL,175)@60 + 1
    i_acl_445_gmm_substract_qi <= redist35_i_cmp_i_i_i57_gmm_substract_c_59_q and i_ffwd_dst_not_cmp_i_i_i2792647_gmm_substract_out_dest_data_out_34_0;
    i_acl_445_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_445_gmm_substract_qi, xout => i_acl_445_gmm_substract_q, clk => clock, aclr => resetn );

    -- i_acl_446_gmm_substract(MUX,176)@61
    i_acl_446_gmm_substract_s <= i_acl_445_gmm_substract_q;
    i_acl_446_gmm_substract_combproc: PROCESS (i_acl_446_gmm_substract_s, redist91_bgTrunc_i_phitmp1790_gmm_substract_sel_x_b_1_q, c_i8_63_q)
    BEGIN
        CASE (i_acl_446_gmm_substract_s) IS
            WHEN "0" => i_acl_446_gmm_substract_q <= redist91_bgTrunc_i_phitmp1790_gmm_substract_sel_x_b_1_q;
            WHEN "1" => i_acl_446_gmm_substract_q <= c_i8_63_q;
            WHEN OTHERS => i_acl_446_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_dst_not_cmp_i_i_i2792646_gmm_substract(BLACKBOX,388)@60
    thei_ffwd_dst_not_cmp_i_i_i2792646_gmm_substract : i_ffwd_dst_not_cmp_i_i_i2792646_gmm_substract2779
    PORT MAP (
        in_intel_reserved_ffwd_34_0 => in_intel_reserved_ffwd_34_0,
        in_stall_in => GND_q,
        in_valid_in => redist75_sync_in_aunroll_x_in_i_valid_60_q,
        out_dest_data_out_34_0 => i_ffwd_dst_not_cmp_i_i_i2792646_gmm_substract_out_dest_data_out_34_0,
        clock => clock,
        resetn => resetn
    );

    -- i_not_cmp_i_i_i57_gmm_substract(LOGICAL,435)@60
    i_not_cmp_i_i_i57_gmm_substract_q <= redist35_i_cmp_i_i_i57_gmm_substract_c_59_q xor VCC_q;

    -- i_cmp_i_i_i53_gmm_substract(COMPARE,311)@1 + 1
    i_cmp_i_i_i53_gmm_substract_a <= STD_LOGIC_VECTOR("00" & i_select498_gmm_substract_q);
    i_cmp_i_i_i53_gmm_substract_b <= STD_LOGIC_VECTOR("00" & c_i16_9gr_q);
    i_cmp_i_i_i53_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp_i_i_i53_gmm_substract_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp_i_i_i53_gmm_substract_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp_i_i_i53_gmm_substract_a) - UNSIGNED(i_cmp_i_i_i53_gmm_substract_b));
        END IF;
    END PROCESS;
    i_cmp_i_i_i53_gmm_substract_c(0) <= i_cmp_i_i_i53_gmm_substract_o(17);

    -- redist38_i_cmp_i_i_i53_gmm_substract_c_59(DELAY,767)
    redist38_i_cmp_i_i_i53_gmm_substract_c_59 : dspba_delay
    GENERIC MAP ( width => 1, depth => 58, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp_i_i_i53_gmm_substract_c, xout => redist38_i_cmp_i_i_i53_gmm_substract_c_59_q, clk => clock, aclr => resetn );

    -- i_acl_447_gmm_substract(LOGICAL,177)@60
    i_acl_447_gmm_substract_q <= redist38_i_cmp_i_i_i53_gmm_substract_c_59_q and i_not_cmp_i_i_i57_gmm_substract_q;

    -- i_acl_448_gmm_substract(LOGICAL,178)@60 + 1
    i_acl_448_gmm_substract_qi <= i_acl_447_gmm_substract_q and i_ffwd_dst_not_cmp_i_i_i2792646_gmm_substract_out_dest_data_out_34_0;
    i_acl_448_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_448_gmm_substract_qi, xout => i_acl_448_gmm_substract_q, clk => clock, aclr => resetn );

    -- i_acl_449_gmm_substract(MUX,179)@61
    i_acl_449_gmm_substract_s <= i_acl_448_gmm_substract_q;
    i_acl_449_gmm_substract_combproc: PROCESS (i_acl_449_gmm_substract_s, i_acl_446_gmm_substract_q, c_i8_3gr_q)
    BEGIN
        CASE (i_acl_449_gmm_substract_s) IS
            WHEN "0" => i_acl_449_gmm_substract_q <= i_acl_446_gmm_substract_q;
            WHEN "1" => i_acl_449_gmm_substract_q <= c_i8_3gr_q;
            WHEN OTHERS => i_acl_449_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_dst_not_cmp_i_i_i2792645_gmm_substract(BLACKBOX,387)@61
    thei_ffwd_dst_not_cmp_i_i_i2792645_gmm_substract : i_ffwd_dst_not_cmp_i_i_i2792645_gmm_substract2781
    PORT MAP (
        in_intel_reserved_ffwd_34_0 => in_intel_reserved_ffwd_34_0,
        in_stall_in => GND_q,
        in_valid_in => redist76_sync_in_aunroll_x_in_i_valid_61_q,
        out_dest_data_out_34_0 => i_ffwd_dst_not_cmp_i_i_i2792645_gmm_substract_out_dest_data_out_34_0,
        clock => clock,
        resetn => resetn
    );

    -- i_and_i1784_gmm_substract(LOGICAL,227)@60
    i_and_i1784_gmm_substract_q <= i_conv2_i_i_i_gmm_substract_q and c_i10_1gr_q;

    -- i_and_i1784_gmm_substract_vt_select_0(BITSELECT,230)@60
    i_and_i1784_gmm_substract_vt_select_0_b <= i_and_i1784_gmm_substract_q(0 downto 0);

    -- i_and_i1784_gmm_substract_vt_join(BITJOIN,229)@60
    i_and_i1784_gmm_substract_vt_join_q <= i_and_i1784_1_gmm_substract_vt_const_9_q & i_and_i1784_gmm_substract_vt_select_0_b;

    -- i_phitmp1787_gmm_substract(LOGICAL,448)@60 + 1
    i_phitmp1787_gmm_substract_qi <= "1" WHEN i_and_i1784_gmm_substract_vt_join_q = c_i10_0gr_q ELSE "0";
    i_phitmp1787_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_phitmp1787_gmm_substract_qi, xout => i_phitmp1787_gmm_substract_q, clk => clock, aclr => resetn );

    -- i_reduction_gmm_substract_78_gmm_substract(LOGICAL,459)@61
    i_reduction_gmm_substract_78_gmm_substract_q <= i_phitmp1787_gmm_substract_q and i_ffwd_dst_not_cmp_i_i_i2792645_gmm_substract_out_dest_data_out_34_0;

    -- i_not_cmp_i_i_i53_gmm_substract(LOGICAL,432)@60
    i_not_cmp_i_i_i53_gmm_substract_q <= redist38_i_cmp_i_i_i53_gmm_substract_c_59_q xor VCC_q;

    -- i_reduction_gmm_substract_77_gmm_substract(LOGICAL,458)@60 + 1
    i_reduction_gmm_substract_77_gmm_substract_qi <= i_not_cmp_i_i_i53_gmm_substract_q and i_not_cmp_i_i_i57_gmm_substract_q;
    i_reduction_gmm_substract_77_gmm_substract_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_reduction_gmm_substract_77_gmm_substract_qi, xout => i_reduction_gmm_substract_77_gmm_substract_q, clk => clock, aclr => resetn );

    -- i_reduction_gmm_substract_79_gmm_substract(LOGICAL,460)@61
    i_reduction_gmm_substract_79_gmm_substract_q <= i_reduction_gmm_substract_77_gmm_substract_q and i_reduction_gmm_substract_78_gmm_substract_q;

    -- i_acl_453_gmm_substract(MUX,180)@61 + 1
    i_acl_453_gmm_substract_s <= i_reduction_gmm_substract_79_gmm_substract_q;
    i_acl_453_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_453_gmm_substract_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_acl_453_gmm_substract_s) IS
                WHEN "0" => i_acl_453_gmm_substract_q <= i_acl_449_gmm_substract_q;
                WHEN "1" => i_acl_453_gmm_substract_q <= redist85_i_unnamed_gmm_substract2772_sel_x_b_1_q;
                WHEN OTHERS => i_acl_453_gmm_substract_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_ffwd_dst_cmp_i_i_i2792636_gmm_substract(BLACKBOX,348)@62
    thei_ffwd_dst_cmp_i_i_i2792636_gmm_substract : i_ffwd_dst_cmp_i_i_i2792636_gmm_substract2785
    PORT MAP (
        in_intel_reserved_ffwd_32_0 => in_intel_reserved_ffwd_32_0,
        in_stall_in => GND_q,
        in_valid_in => redist77_sync_in_aunroll_x_in_i_valid_62_q,
        out_dest_data_out_32_0 => i_ffwd_dst_cmp_i_i_i2792636_gmm_substract_out_dest_data_out_32_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_454_gmm_substract(MUX,181)@62 + 1
    i_acl_454_gmm_substract_s <= i_ffwd_dst_cmp_i_i_i2792636_gmm_substract_out_dest_data_out_32_0;
    i_acl_454_gmm_substract_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_454_gmm_substract_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_acl_454_gmm_substract_s) IS
                WHEN "0" => i_acl_454_gmm_substract_q <= i_acl_453_gmm_substract_q;
                WHEN "1" => i_acl_454_gmm_substract_q <= i_ffwd_dst_unnamed_gmm_substract101_gmm_substract_out_dest_data_out_3_0;
                WHEN OTHERS => i_acl_454_gmm_substract_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist64_i_acl_454_gmm_substract_q_28_wraddr(REG,890)
    redist64_i_acl_454_gmm_substract_q_28_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist64_i_acl_454_gmm_substract_q_28_wraddr_q <= "11001";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist64_i_acl_454_gmm_substract_q_28_wraddr_q <= STD_LOGIC_VECTOR(redist64_i_acl_454_gmm_substract_q_28_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist64_i_acl_454_gmm_substract_q_28_mem(DUALMEM,888)
    redist64_i_acl_454_gmm_substract_q_28_mem_ia <= STD_LOGIC_VECTOR(i_acl_454_gmm_substract_q);
    redist64_i_acl_454_gmm_substract_q_28_mem_aa <= redist64_i_acl_454_gmm_substract_q_28_wraddr_q;
    redist64_i_acl_454_gmm_substract_q_28_mem_ab <= redist64_i_acl_454_gmm_substract_q_28_rdcnt_q;
    redist64_i_acl_454_gmm_substract_q_28_mem_reset0 <= not (resetn);
    redist64_i_acl_454_gmm_substract_q_28_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 5,
        numwords_a => 26,
        width_b => 8,
        widthad_b => 5,
        numwords_b => 26,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist64_i_acl_454_gmm_substract_q_28_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist64_i_acl_454_gmm_substract_q_28_mem_reset0,
        clock1 => clock,
        address_a => redist64_i_acl_454_gmm_substract_q_28_mem_aa,
        data_a => redist64_i_acl_454_gmm_substract_q_28_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist64_i_acl_454_gmm_substract_q_28_mem_ab,
        q_b => redist64_i_acl_454_gmm_substract_q_28_mem_iq
    );
    redist64_i_acl_454_gmm_substract_q_28_mem_q <= redist64_i_acl_454_gmm_substract_q_28_mem_iq(7 downto 0);

    -- i_ffwd_dst_unnamed_gmm_substract102_gmm_substract(BLACKBOX,408)@90
    thei_ffwd_dst_unnamed_gmm_substract102_gmm_substract : i_ffwd_dst_unnamed_gmm_substract102_gmm_substract2787
    PORT MAP (
        in_intel_reserved_ffwd_2_0 => in_intel_reserved_ffwd_2_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_2_0 => i_ffwd_dst_unnamed_gmm_substract102_gmm_substract_out_dest_data_out_2_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_select5502738_gmm_substract(BLACKBOX,391)@90
    thei_ffwd_dst_select5502738_gmm_substract : i_ffwd_dst_select5502738_gmm_substract2679
    PORT MAP (
        in_intel_reserved_ffwd_57_0 => in_intel_reserved_ffwd_57_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_57_0 => i_ffwd_dst_select5502738_gmm_substract_out_dest_data_out_57_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_extract_t22962708_gmm_substract(BLACKBOX,381)@90
    thei_ffwd_dst_extract_t22962708_gmm_substract : i_ffwd_dst_extract_t22962708_gmm_substract2677
    PORT MAP (
        in_intel_reserved_ffwd_43_0 => in_intel_reserved_ffwd_43_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_43_0 => i_ffwd_dst_extract_t22962708_gmm_substract_out_dest_data_out_43_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_cmp_i_i_i279_12650_gmm_substract(BLACKBOX,351)@90
    thei_ffwd_dst_cmp_i_i_i279_12650_gmm_substract : i_ffwd_dst_cmp_i_i_i279_12650_gmm_substract2675
    PORT MAP (
        in_intel_reserved_ffwd_35_0 => in_intel_reserved_ffwd_35_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_35_0 => i_ffwd_dst_cmp_i_i_i279_12650_gmm_substract_out_dest_data_out_35_0,
        clock => clock,
        resetn => resetn
    );

    -- i_select489_gmm_substract(MUX,467)@90
    i_select489_gmm_substract_s <= i_ffwd_dst_cmp_i_i_i279_12650_gmm_substract_out_dest_data_out_35_0;
    i_select489_gmm_substract_combproc: PROCESS (i_select489_gmm_substract_s, i_ffwd_dst_extract_t22962708_gmm_substract_out_dest_data_out_43_0, i_ffwd_dst_select5502738_gmm_substract_out_dest_data_out_57_0)
    BEGIN
        CASE (i_select489_gmm_substract_s) IS
            WHEN "0" => i_select489_gmm_substract_q <= i_ffwd_dst_extract_t22962708_gmm_substract_out_dest_data_out_43_0;
            WHEN "1" => i_select489_gmm_substract_q <= i_ffwd_dst_select5502738_gmm_substract_out_dest_data_out_57_0;
            WHEN OTHERS => i_select489_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_dst_cmp_i_i_i2792635_gmm_substract(BLACKBOX,347)@90
    thei_ffwd_dst_cmp_i_i_i2792635_gmm_substract : i_ffwd_dst_cmp_i_i_i2792635_gmm_substract2789
    PORT MAP (
        in_intel_reserved_ffwd_32_0 => in_intel_reserved_ffwd_32_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_32_0 => i_ffwd_dst_cmp_i_i_i2792635_gmm_substract_out_dest_data_out_32_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_455_gmm_substract(MUX,182)@90
    i_acl_455_gmm_substract_s <= i_ffwd_dst_cmp_i_i_i2792635_gmm_substract_out_dest_data_out_32_0;
    i_acl_455_gmm_substract_combproc: PROCESS (i_acl_455_gmm_substract_s, i_select489_gmm_substract_q, i_ffwd_dst_unnamed_gmm_substract102_gmm_substract_out_dest_data_out_2_0)
    BEGIN
        CASE (i_acl_455_gmm_substract_s) IS
            WHEN "0" => i_acl_455_gmm_substract_q <= i_select489_gmm_substract_q;
            WHEN "1" => i_acl_455_gmm_substract_q <= i_ffwd_dst_unnamed_gmm_substract102_gmm_substract_out_dest_data_out_2_0;
            WHEN OTHERS => i_acl_455_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_dst_unnamed_gmm_substract103_gmm_substract(BLACKBOX,409)@90
    thei_ffwd_dst_unnamed_gmm_substract103_gmm_substract : i_ffwd_dst_unnamed_gmm_substract103_gmm_substract2791
    PORT MAP (
        in_intel_reserved_ffwd_1_0 => in_intel_reserved_ffwd_1_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_1_0 => i_ffwd_dst_unnamed_gmm_substract103_gmm_substract_out_dest_data_out_1_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_select5562739_gmm_substract(BLACKBOX,392)@90
    thei_ffwd_dst_select5562739_gmm_substract : i_ffwd_dst_select5562739_gmm_substract2685
    PORT MAP (
        in_intel_reserved_ffwd_58_0 => in_intel_reserved_ffwd_58_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_58_0 => i_ffwd_dst_select5562739_gmm_substract_out_dest_data_out_58_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_extract_t23002711_gmm_substract(BLACKBOX,382)@90
    thei_ffwd_dst_extract_t23002711_gmm_substract : i_ffwd_dst_extract_t23002711_gmm_substract2683
    PORT MAP (
        in_intel_reserved_ffwd_44_0 => in_intel_reserved_ffwd_44_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_44_0 => i_ffwd_dst_extract_t23002711_gmm_substract_out_dest_data_out_44_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_cmp_i_i_i279_12651_gmm_substract(BLACKBOX,352)@90
    thei_ffwd_dst_cmp_i_i_i279_12651_gmm_substract : i_ffwd_dst_cmp_i_i_i279_12651_gmm_substract2681
    PORT MAP (
        in_intel_reserved_ffwd_35_0 => in_intel_reserved_ffwd_35_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_35_0 => i_ffwd_dst_cmp_i_i_i279_12651_gmm_substract_out_dest_data_out_35_0,
        clock => clock,
        resetn => resetn
    );

    -- i_select492_gmm_substract(MUX,468)@90
    i_select492_gmm_substract_s <= i_ffwd_dst_cmp_i_i_i279_12651_gmm_substract_out_dest_data_out_35_0;
    i_select492_gmm_substract_combproc: PROCESS (i_select492_gmm_substract_s, i_ffwd_dst_extract_t23002711_gmm_substract_out_dest_data_out_44_0, i_ffwd_dst_select5562739_gmm_substract_out_dest_data_out_58_0)
    BEGIN
        CASE (i_select492_gmm_substract_s) IS
            WHEN "0" => i_select492_gmm_substract_q <= i_ffwd_dst_extract_t23002711_gmm_substract_out_dest_data_out_44_0;
            WHEN "1" => i_select492_gmm_substract_q <= i_ffwd_dst_select5562739_gmm_substract_out_dest_data_out_58_0;
            WHEN OTHERS => i_select492_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_dst_cmp_i_i_i2792634_gmm_substract(BLACKBOX,346)@90
    thei_ffwd_dst_cmp_i_i_i2792634_gmm_substract : i_ffwd_dst_cmp_i_i_i2792634_gmm_substract2793
    PORT MAP (
        in_intel_reserved_ffwd_32_0 => in_intel_reserved_ffwd_32_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_32_0 => i_ffwd_dst_cmp_i_i_i2792634_gmm_substract_out_dest_data_out_32_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_456_gmm_substract(MUX,183)@90
    i_acl_456_gmm_substract_s <= i_ffwd_dst_cmp_i_i_i2792634_gmm_substract_out_dest_data_out_32_0;
    i_acl_456_gmm_substract_combproc: PROCESS (i_acl_456_gmm_substract_s, i_select492_gmm_substract_q, i_ffwd_dst_unnamed_gmm_substract103_gmm_substract_out_dest_data_out_1_0)
    BEGIN
        CASE (i_acl_456_gmm_substract_s) IS
            WHEN "0" => i_acl_456_gmm_substract_q <= i_select492_gmm_substract_q;
            WHEN "1" => i_acl_456_gmm_substract_q <= i_ffwd_dst_unnamed_gmm_substract103_gmm_substract_out_dest_data_out_1_0;
            WHEN OTHERS => i_acl_456_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_dst_unnamed_gmm_substract104_gmm_substract(BLACKBOX,410)@90
    thei_ffwd_dst_unnamed_gmm_substract104_gmm_substract : i_ffwd_dst_unnamed_gmm_substract104_gmm_substract2795
    PORT MAP (
        in_intel_reserved_ffwd_0_0 => in_intel_reserved_ffwd_0_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_0_0 => i_ffwd_dst_unnamed_gmm_substract104_gmm_substract_out_dest_data_out_0_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_select5622740_gmm_substract(BLACKBOX,393)@90
    thei_ffwd_dst_select5622740_gmm_substract : i_ffwd_dst_select5622740_gmm_substract2691
    PORT MAP (
        in_intel_reserved_ffwd_59_0 => in_intel_reserved_ffwd_59_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_59_0 => i_ffwd_dst_select5622740_gmm_substract_out_dest_data_out_59_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_extract_t23042714_gmm_substract(BLACKBOX,383)@90
    thei_ffwd_dst_extract_t23042714_gmm_substract : i_ffwd_dst_extract_t23042714_gmm_substract2689
    PORT MAP (
        in_intel_reserved_ffwd_45_0 => in_intel_reserved_ffwd_45_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_45_0 => i_ffwd_dst_extract_t23042714_gmm_substract_out_dest_data_out_45_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_cmp_i_i_i279_12652_gmm_substract(BLACKBOX,353)@90
    thei_ffwd_dst_cmp_i_i_i279_12652_gmm_substract : i_ffwd_dst_cmp_i_i_i279_12652_gmm_substract2687
    PORT MAP (
        in_intel_reserved_ffwd_35_0 => in_intel_reserved_ffwd_35_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_35_0 => i_ffwd_dst_cmp_i_i_i279_12652_gmm_substract_out_dest_data_out_35_0,
        clock => clock,
        resetn => resetn
    );

    -- i_select495_gmm_substract(MUX,469)@90
    i_select495_gmm_substract_s <= i_ffwd_dst_cmp_i_i_i279_12652_gmm_substract_out_dest_data_out_35_0;
    i_select495_gmm_substract_combproc: PROCESS (i_select495_gmm_substract_s, i_ffwd_dst_extract_t23042714_gmm_substract_out_dest_data_out_45_0, i_ffwd_dst_select5622740_gmm_substract_out_dest_data_out_59_0)
    BEGIN
        CASE (i_select495_gmm_substract_s) IS
            WHEN "0" => i_select495_gmm_substract_q <= i_ffwd_dst_extract_t23042714_gmm_substract_out_dest_data_out_45_0;
            WHEN "1" => i_select495_gmm_substract_q <= i_ffwd_dst_select5622740_gmm_substract_out_dest_data_out_59_0;
            WHEN OTHERS => i_select495_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_dst_cmp_i_i_i2792633_gmm_substract(BLACKBOX,345)@90
    thei_ffwd_dst_cmp_i_i_i2792633_gmm_substract : i_ffwd_dst_cmp_i_i_i2792633_gmm_substract2797
    PORT MAP (
        in_intel_reserved_ffwd_32_0 => in_intel_reserved_ffwd_32_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_32_0 => i_ffwd_dst_cmp_i_i_i2792633_gmm_substract_out_dest_data_out_32_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_457_gmm_substract(MUX,184)@90
    i_acl_457_gmm_substract_s <= i_ffwd_dst_cmp_i_i_i2792633_gmm_substract_out_dest_data_out_32_0;
    i_acl_457_gmm_substract_combproc: PROCESS (i_acl_457_gmm_substract_s, i_select495_gmm_substract_q, i_ffwd_dst_unnamed_gmm_substract104_gmm_substract_out_dest_data_out_0_0)
    BEGIN
        CASE (i_acl_457_gmm_substract_s) IS
            WHEN "0" => i_acl_457_gmm_substract_q <= i_select495_gmm_substract_q;
            WHEN "1" => i_acl_457_gmm_substract_q <= i_ffwd_dst_unnamed_gmm_substract104_gmm_substract_out_dest_data_out_0_0;
            WHEN OTHERS => i_acl_457_gmm_substract_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_ffwd_dst_acl_3732630_gmm_substract(BLACKBOX,337)@90
    thei_ffwd_dst_acl_3732630_gmm_substract : i_ffwd_dst_acl_3732630_gmm_substract2876
    PORT MAP (
        in_intel_reserved_ffwd_30_0 => in_intel_reserved_ffwd_30_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_30_0 => i_ffwd_dst_acl_3732630_gmm_substract_out_dest_data_out_30_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_unnamed_gmm_substract115_gmm_substract_aunroll_x(BLACKBOX,106)@90
    thei_ffwd_dst_unnamed_gmm_substract115_gmm_substract_aunroll_x : i_ffwd_dst_unnamed_gmm_substract115_gmm_substract2874
    PORT MAP (
        in_intel_reserved_ffwd_16_0_0 => in_intel_reserved_ffwd_16_0_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_16_0_0 => i_ffwd_dst_unnamed_gmm_substract115_gmm_substract_aunroll_x_out_dest_data_out_16_0_0,
        clock => clock,
        resetn => resetn
    );

    -- i_ffwd_dst_acl_3762632_gmm_substract(BLACKBOX,338)@90
    thei_ffwd_dst_acl_3762632_gmm_substract : i_ffwd_dst_acl_3762632_gmm_substract2872
    PORT MAP (
        in_intel_reserved_ffwd_31_0 => in_intel_reserved_ffwd_31_0,
        in_stall_in => GND_q,
        in_valid_in => redist82_sync_in_aunroll_x_in_i_valid_90_q,
        out_dest_data_out_31_0 => i_ffwd_dst_acl_3762632_gmm_substract_out_dest_data_out_31_0,
        clock => clock,
        resetn => resetn
    );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,136)@90
    out_c0_exi12834_0 <= GND_q;
    out_c0_exi12834_1 <= i_ffwd_dst_acl_3762632_gmm_substract_out_dest_data_out_31_0;
    out_c0_exi12834_2 <= i_ffwd_dst_unnamed_gmm_substract115_gmm_substract_aunroll_x_out_dest_data_out_16_0_0;
    out_c0_exi12834_3 <= i_ffwd_dst_acl_3732630_gmm_substract_out_dest_data_out_30_0;
    out_c0_exi12834_4 <= i_acl_457_gmm_substract_q;
    out_c0_exi12834_5 <= i_acl_456_gmm_substract_q;
    out_c0_exi12834_6 <= i_acl_455_gmm_substract_q;
    out_c0_exi12834_7 <= redist64_i_acl_454_gmm_substract_q_28_mem_q;
    out_c0_exi12834_8 <= redist65_i_acl_444_gmm_substract_q_37_q;
    out_c0_exi12834_9 <= i_acl_471_gmm_substract_q;
    out_c0_exi12834_10 <= i_acl_470_gmm_substract_q;
    out_c0_exi12834_11 <= i_acl_469_gmm_substract_q;
    out_c0_exi12834_12 <= i_acl_468_gmm_substract_q;
    out_c0_exi12834_13 <= i_acl_458_gmm_substract_q;
    out_c0_exi12834_14 <= i_acl_485_gmm_substract_q;
    out_c0_exi12834_15 <= i_acl_484_gmm_substract_q;
    out_c0_exi12834_16 <= i_acl_483_gmm_substract_q;
    out_c0_exi12834_17 <= i_acl_482_gmm_substract_q;
    out_c0_exi12834_18 <= redist61_i_acl_472_gmm_substract_q_34_mem_q;
    out_c0_exi12834_19 <= i_ffwd_dst_unnamed_gmm_substract116_gmm_substract_aunroll_x_out_dest_data_out_15_0_0;
    out_c0_exi12834_20 <= i_ffwd_dst_unnamed_gmm_substract116_gmm_substract_aunroll_x_out_dest_data_out_15_0_1;
    out_c0_exi12834_21 <= i_ffwd_dst_unnamed_gmm_substract116_gmm_substract_aunroll_x_out_dest_data_out_15_0_2;
    out_c0_exi12834_22 <= i_cmp848_gmm_substract_c;
    out_o_valid <= redist82_sync_in_aunroll_x_in_i_valid_90_q;

END normal;
