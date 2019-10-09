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

-- VHDL created from floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA0Z4ce2a150g24ad2045eny
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

entity floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA0Z4ce2a150g24ad2045eny is
    port (
        in_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        out_primWireOut : out std_logic_vector(31 downto 0);  -- float32_m23
        clock : in std_logic;
        resetn : in std_logic
    );
end floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA0Z4ce2a150g24ad2045eny;

architecture normal of floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA0Z4ce2a150g24ad2045eny is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid6_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal signX_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracX_uid8_block_rsrvd_fix_b : STD_LOGIC_VECTOR (22 downto 0);
    signal cstBias_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWE_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWEP1_uid15_block_rsrvd_fix_q : STD_LOGIC_VECTOR (8 downto 0);
    signal cstBiasPWE_uid16_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstAllOWE_uid17_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWF_uid18_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_x_uid22_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid23_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid24_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid24_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid25_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid26_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid26_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid27_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid27_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid28_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid29_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid30_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid30_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstBiasPWE_uid31_block_rsrvd_fix_q : STD_LOGIC_VECTOR (5 downto 0);
    signal oFracX_uid32_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal oFracX_uid33_block_rsrvd_fix_q : STD_LOGIC_VECTOR (24 downto 0);
    signal onesCmpFxpInX_uid34_block_rsrvd_fix_b : STD_LOGIC_VECTOR (24 downto 0);
    signal onesCmpFxpInX_uid34_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (24 downto 0);
    signal onesCmpFxpInX_uid34_block_rsrvd_fix_q : STD_LOGIC_VECTOR (24 downto 0);
    signal fxpInExtX_uid35_block_rsrvd_fix_a : STD_LOGIC_VECTOR (25 downto 0);
    signal fxpInExtX_uid35_block_rsrvd_fix_b : STD_LOGIC_VECTOR (25 downto 0);
    signal fxpInExtX_uid35_block_rsrvd_fix_o : STD_LOGIC_VECTOR (25 downto 0);
    signal fxpInExtX_uid35_block_rsrvd_fix_q : STD_LOGIC_VECTOR (25 downto 0);
    signal fxpInPreAlign_uid36_block_rsrvd_fix_in : STD_LOGIC_VECTOR (24 downto 0);
    signal fxpInPreAlign_uid36_block_rsrvd_fix_b : STD_LOGIC_VECTOR (24 downto 0);
    signal oFracXZwE_uid39_block_rsrvd_fix_q : STD_LOGIC_VECTOR (36 downto 0);
    signal shiftValuePreSat_uid41_block_rsrvd_fix_a : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftValuePreSat_uid41_block_rsrvd_fix_b : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftValuePreSat_uid41_block_rsrvd_fix_o : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftValuePreSat_uid41_block_rsrvd_fix_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expOvfInitial_uid42_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftUdf_uid43_block_rsrvd_fix_a : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftUdf_uid43_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftUdf_uid43_block_rsrvd_fix_o : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftUdf_uid43_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftValuePreSatRed_uid44_block_rsrvd_fix_in : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValuePreSatRed_uid44_block_rsrvd_fix_b : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftVal_uid45_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftVal_uid45_block_rsrvd_fix_q : STD_LOGIC_VECTOR (5 downto 0);
    signal topRangeFxpEPreRnd_uid46_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal oFracXZwE_uid52_block_rsrvd_fix_q : STD_LOGIC_VECTOR (33 downto 0);
    signal onesCmpFxpIn_uid53_block_rsrvd_fix_b : STD_LOGIC_VECTOR (33 downto 0);
    signal onesCmpFxpIn_uid53_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (33 downto 0);
    signal onesCmpFxpIn_uid53_block_rsrvd_fix_q : STD_LOGIC_VECTOR (33 downto 0);
    signal fxpInExt_uid54_block_rsrvd_fix_a : STD_LOGIC_VECTOR (34 downto 0);
    signal fxpInExt_uid54_block_rsrvd_fix_b : STD_LOGIC_VECTOR (34 downto 0);
    signal fxpInExt_uid54_block_rsrvd_fix_o : STD_LOGIC_VECTOR (34 downto 0);
    signal fxpInExt_uid54_block_rsrvd_fix_q : STD_LOGIC_VECTOR (34 downto 0);
    signal fxpInPreAlign_uid55_block_rsrvd_fix_in : STD_LOGIC_VECTOR (33 downto 0);
    signal fxpInPreAlign_uid55_block_rsrvd_fix_b : STD_LOGIC_VECTOR (33 downto 0);
    signal aPostPad_uid63_block_rsrvd_fix_q : STD_LOGIC_VECTOR (41 downto 0);
    signal yExt_uid64_block_rsrvd_fix_a : STD_LOGIC_VECTOR (43 downto 0);
    signal yExt_uid64_block_rsrvd_fix_b : STD_LOGIC_VECTOR (43 downto 0);
    signal yExt_uid64_block_rsrvd_fix_o : STD_LOGIC_VECTOR (43 downto 0);
    signal yExt_uid64_block_rsrvd_fix_q : STD_LOGIC_VECTOR (43 downto 0);
    signal msbUYExt_uid65_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal zY_uid66_block_rsrvd_fix_q : STD_LOGIC_VECTOR (25 downto 0);
    signal yRed_uid67_block_rsrvd_fix_in : STD_LOGIC_VECTOR (31 downto 0);
    signal yRed_uid67_block_rsrvd_fix_b : STD_LOGIC_VECTOR (25 downto 0);
    signal yRedPostMux_uid68_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yRedPostMux_uid68_block_rsrvd_fix_q : STD_LOGIC_VECTOR (25 downto 0);
    signal peOR_uid73_block_rsrvd_fix_in : STD_LOGIC_VECTOR (28 downto 0);
    signal peOR_uid73_block_rsrvd_fix_b : STD_LOGIC_VECTOR (23 downto 0);
    signal peORExpInc_uid74_block_rsrvd_fix_in : STD_LOGIC_VECTOR (29 downto 0);
    signal peORExpInc_uid74_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expRPostBiasPreExc0_uid75_block_rsrvd_fix_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expRPostBiasPreExc0_uid75_block_rsrvd_fix_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expRPostBiasPreExc0_uid75_block_rsrvd_fix_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expRPostBiasPreExc0_uid75_block_rsrvd_fix_q : STD_LOGIC_VECTOR (11 downto 0);
    signal expRPostBiasPreExc_uid76_block_rsrvd_fix_a : STD_LOGIC_VECTOR (13 downto 0);
    signal expRPostBiasPreExc_uid76_block_rsrvd_fix_b : STD_LOGIC_VECTOR (13 downto 0);
    signal expRPostBiasPreExc_uid76_block_rsrvd_fix_o : STD_LOGIC_VECTOR (13 downto 0);
    signal expRPostBiasPreExc_uid76_block_rsrvd_fix_q : STD_LOGIC_VECTOR (12 downto 0);
    signal fracR_uid77_block_rsrvd_fix_in : STD_LOGIC_VECTOR (22 downto 0);
    signal fracR_uid77_block_rsrvd_fix_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expUdf_uid78_block_rsrvd_fix_a : STD_LOGIC_VECTOR (14 downto 0);
    signal expUdf_uid78_block_rsrvd_fix_b : STD_LOGIC_VECTOR (14 downto 0);
    signal expUdf_uid78_block_rsrvd_fix_o : STD_LOGIC_VECTOR (14 downto 0);
    signal expUdf_uid78_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid80_block_rsrvd_fix_a : STD_LOGIC_VECTOR (14 downto 0);
    signal expOvf_uid80_block_rsrvd_fix_b : STD_LOGIC_VECTOR (14 downto 0);
    signal expOvf_uid80_block_rsrvd_fix_o : STD_LOGIC_VECTOR (14 downto 0);
    signal expOvf_uid80_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expR_uid81_block_rsrvd_fix_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expR_uid81_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal negInf_uid82_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regXAndExpOverflowAndNeg_uid83_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpOvfInitial_uid84_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regXAndUdf_uid85_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid86_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignX_uid87_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regXAndExpOverflowAndPos_uid88_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regInAndOvf_uid90_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal posInf_uid92_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid93_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid94_block_rsrvd_fix_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid95_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal oneFracRPostExc2_uid96_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPostExc_uid99_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid99_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid103_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid103_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal RExpE_uid104_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal xv0_uid106_xTimesOOlog2Ext_uid37_block_rsrvd_fix_in : STD_LOGIC_VECTOR (5 downto 0);
    signal xv0_uid106_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b : STD_LOGIC_VECTOR (5 downto 0);
    signal xv1_uid107_xTimesOOlog2Ext_uid37_block_rsrvd_fix_in : STD_LOGIC_VECTOR (11 downto 0);
    signal xv1_uid107_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b : STD_LOGIC_VECTOR (5 downto 0);
    signal xv2_uid108_xTimesOOlog2Ext_uid37_block_rsrvd_fix_in : STD_LOGIC_VECTOR (17 downto 0);
    signal xv2_uid108_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b : STD_LOGIC_VECTOR (5 downto 0);
    signal xv3_uid109_xTimesOOlog2Ext_uid37_block_rsrvd_fix_in : STD_LOGIC_VECTOR (23 downto 0);
    signal xv3_uid109_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b : STD_LOGIC_VECTOR (5 downto 0);
    signal xv4_uid110_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal p4_uid111_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (32 downto 0);
    signal p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (25 downto 0);
    signal p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (19 downto 0);
    signal p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (13 downto 0);
    signal lev1_a0sumAHighB_uid118_xTimesOOlog2Ext_uid37_block_rsrvd_fix_a : STD_LOGIC_VECTOR (34 downto 0);
    signal lev1_a0sumAHighB_uid118_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b : STD_LOGIC_VECTOR (34 downto 0);
    signal lev1_a0sumAHighB_uid118_xTimesOOlog2Ext_uid37_block_rsrvd_fix_o : STD_LOGIC_VECTOR (34 downto 0);
    signal lev1_a0sumAHighB_uid118_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0_uid119_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (34 downto 0);
    signal lev1_a1_uid120_xTimesOOlog2Ext_uid37_block_rsrvd_fix_a : STD_LOGIC_VECTOR (26 downto 0);
    signal lev1_a1_uid120_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b : STD_LOGIC_VECTOR (26 downto 0);
    signal lev1_a1_uid120_xTimesOOlog2Ext_uid37_block_rsrvd_fix_o : STD_LOGIC_VECTOR (26 downto 0);
    signal lev1_a1_uid120_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (26 downto 0);
    signal lev2_a0_uid121_xTimesOOlog2Ext_uid37_block_rsrvd_fix_a : STD_LOGIC_VECTOR (36 downto 0);
    signal lev2_a0_uid121_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b : STD_LOGIC_VECTOR (36 downto 0);
    signal lev2_a0_uid121_xTimesOOlog2Ext_uid37_block_rsrvd_fix_o : STD_LOGIC_VECTOR (36 downto 0);
    signal lev2_a0_uid121_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (35 downto 0);
    signal lev3_a0_uid122_xTimesOOlog2Ext_uid37_block_rsrvd_fix_a : STD_LOGIC_VECTOR (37 downto 0);
    signal lev3_a0_uid122_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b : STD_LOGIC_VECTOR (37 downto 0);
    signal lev3_a0_uid122_xTimesOOlog2Ext_uid37_block_rsrvd_fix_o : STD_LOGIC_VECTOR (37 downto 0);
    signal lev3_a0_uid122_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (36 downto 0);
    signal maxValInOutFormat_uid123_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (28 downto 0);
    signal minValueInFormat_uid124_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (28 downto 0);
    signal paddingX_uid125_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (3 downto 0);
    signal updatedX_uid126_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (32 downto 0);
    signal ovf_uid125_xTimesOOlog2Ext_uid37_block_rsrvd_fix_a : STD_LOGIC_VECTOR (38 downto 0);
    signal ovf_uid125_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b : STD_LOGIC_VECTOR (38 downto 0);
    signal ovf_uid125_xTimesOOlog2Ext_uid37_block_rsrvd_fix_o : STD_LOGIC_VECTOR (38 downto 0);
    signal ovf_uid125_xTimesOOlog2Ext_uid37_block_rsrvd_fix_c : STD_LOGIC_VECTOR (0 downto 0);
    signal updatedY_uid129_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (32 downto 0);
    signal udf_uid128_xTimesOOlog2Ext_uid37_block_rsrvd_fix_a : STD_LOGIC_VECTOR (38 downto 0);
    signal udf_uid128_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b : STD_LOGIC_VECTOR (38 downto 0);
    signal udf_uid128_xTimesOOlog2Ext_uid37_block_rsrvd_fix_o : STD_LOGIC_VECTOR (38 downto 0);
    signal udf_uid128_xTimesOOlog2Ext_uid37_block_rsrvd_fix_c : STD_LOGIC_VECTOR (0 downto 0);
    signal ovfudfcond_uid131_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sR_uid132_xTimesOOlog2Ext_uid37_block_rsrvd_fix_in : STD_LOGIC_VECTOR (32 downto 0);
    signal sR_uid132_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b : STD_LOGIC_VECTOR (28 downto 0);
    signal sRA0_uid133_xTimesOOlog2Ext_uid37_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal sRA0_uid133_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (28 downto 0);
    signal xv0_uid161_eRndXlog2_uid50_block_rsrvd_fix_in : STD_LOGIC_VECTOR (5 downto 0);
    signal xv0_uid161_eRndXlog2_uid50_block_rsrvd_fix_b : STD_LOGIC_VECTOR (5 downto 0);
    signal xv1_uid162_eRndXlog2_uid50_block_rsrvd_fix_b : STD_LOGIC_VECTOR (4 downto 0);
    signal p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q : STD_LOGIC_VECTOR (45 downto 0);
    signal p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q : STD_LOGIC_VECTOR (40 downto 0);
    signal lev1_a0sumAHighB_uid167_eRndXlog2_uid50_block_rsrvd_fix_a : STD_LOGIC_VECTOR (47 downto 0);
    signal lev1_a0sumAHighB_uid167_eRndXlog2_uid50_block_rsrvd_fix_b : STD_LOGIC_VECTOR (47 downto 0);
    signal lev1_a0sumAHighB_uid167_eRndXlog2_uid50_block_rsrvd_fix_o : STD_LOGIC_VECTOR (47 downto 0);
    signal lev1_a0sumAHighB_uid167_eRndXlog2_uid50_block_rsrvd_fix_q : STD_LOGIC_VECTOR (46 downto 0);
    signal lev1_a0_uid168_eRndXlog2_uid50_block_rsrvd_fix_q : STD_LOGIC_VECTOR (47 downto 0);
    signal maxValInOutFormat_uid169_eRndXlog2_uid50_block_rsrvd_fix_q : STD_LOGIC_VECTOR (42 downto 0);
    signal minValueInFormat_uid170_eRndXlog2_uid50_block_rsrvd_fix_q : STD_LOGIC_VECTOR (42 downto 0);
    signal paddingX_uid171_eRndXlog2_uid50_block_rsrvd_fix_q : STD_LOGIC_VECTOR (2 downto 0);
    signal updatedX_uid172_eRndXlog2_uid50_block_rsrvd_fix_q : STD_LOGIC_VECTOR (45 downto 0);
    signal ovf_uid171_eRndXlog2_uid50_block_rsrvd_fix_a : STD_LOGIC_VECTOR (49 downto 0);
    signal ovf_uid171_eRndXlog2_uid50_block_rsrvd_fix_b : STD_LOGIC_VECTOR (49 downto 0);
    signal ovf_uid171_eRndXlog2_uid50_block_rsrvd_fix_o : STD_LOGIC_VECTOR (49 downto 0);
    signal ovf_uid171_eRndXlog2_uid50_block_rsrvd_fix_c : STD_LOGIC_VECTOR (0 downto 0);
    signal updatedY_uid175_eRndXlog2_uid50_block_rsrvd_fix_q : STD_LOGIC_VECTOR (45 downto 0);
    signal udf_uid174_eRndXlog2_uid50_block_rsrvd_fix_a : STD_LOGIC_VECTOR (49 downto 0);
    signal udf_uid174_eRndXlog2_uid50_block_rsrvd_fix_b : STD_LOGIC_VECTOR (49 downto 0);
    signal udf_uid174_eRndXlog2_uid50_block_rsrvd_fix_o : STD_LOGIC_VECTOR (49 downto 0);
    signal udf_uid174_eRndXlog2_uid50_block_rsrvd_fix_c : STD_LOGIC_VECTOR (0 downto 0);
    signal ovfudfcond_uid177_eRndXlog2_uid50_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sR_uid178_eRndXlog2_uid50_block_rsrvd_fix_in : STD_LOGIC_VECTOR (45 downto 0);
    signal sR_uid178_eRndXlog2_uid50_block_rsrvd_fix_b : STD_LOGIC_VECTOR (42 downto 0);
    signal sRA0_uid179_eRndXlog2_uid50_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal sRA0_uid179_eRndXlog2_uid50_block_rsrvd_fix_q : STD_LOGIC_VECTOR (42 downto 0);
    signal memoryC0_uid205_expTables_q : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC1_uid208_expTables_q : STD_LOGIC_VECTOR (21 downto 0);
    signal memoryC2_uid211_expTables_q : STD_LOGIC_VECTOR (13 downto 0);
    signal yT1_uid217_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal lowRangeB_uid219_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid219_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid220_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal s1sumAHighB_uid221_invPolyEval_a : STD_LOGIC_VECTOR (22 downto 0);
    signal s1sumAHighB_uid221_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal s1sumAHighB_uid221_invPolyEval_o : STD_LOGIC_VECTOR (22 downto 0);
    signal s1sumAHighB_uid221_invPolyEval_q : STD_LOGIC_VECTOR (22 downto 0);
    signal s1_uid222_invPolyEval_q : STD_LOGIC_VECTOR (23 downto 0);
    signal lowRangeB_uid225_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid225_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid226_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal s2sumAHighB_uid227_invPolyEval_a : STD_LOGIC_VECTOR (29 downto 0);
    signal s2sumAHighB_uid227_invPolyEval_b : STD_LOGIC_VECTOR (29 downto 0);
    signal s2sumAHighB_uid227_invPolyEval_o : STD_LOGIC_VECTOR (29 downto 0);
    signal s2sumAHighB_uid227_invPolyEval_q : STD_LOGIC_VECTOR (29 downto 0);
    signal s2_uid228_invPolyEval_q : STD_LOGIC_VECTOR (31 downto 0);
    signal osig_uid231_pT1_uid218_invPolyEval_b : STD_LOGIC_VECTOR (14 downto 0);
    signal osig_uid234_pT2_uid224_invPolyEval_b : STD_LOGIC_VECTOR (24 downto 0);
    signal xMSB_uid236_fxpInPostAlign_uid47_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal wIntCst_uid238_fxpInPostAlign_uid47_block_rsrvd_fix_q : STD_LOGIC_VECTOR (3 downto 0);
    signal shiftedOut_uid239_fxpInPostAlign_uid47_block_rsrvd_fix_a : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftedOut_uid239_fxpInPostAlign_uid47_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftedOut_uid239_fxpInPostAlign_uid47_block_rsrvd_fix_o : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftedOut_uid239_fxpInPostAlign_uid47_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal seMsb_to4_uid240_in : STD_LOGIC_VECTOR (3 downto 0);
    signal seMsb_to4_uid240_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage0Idx1Rng4_uid241_fxpInPostAlign_uid47_block_rsrvd_fix_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rightShiftStage0Idx1_uid242_fxpInPostAlign_uid47_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal seMsb_to8_uid243_in : STD_LOGIC_VECTOR (7 downto 0);
    signal seMsb_to8_uid243_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx2Rng8_uid244_fxpInPostAlign_uid47_block_rsrvd_fix_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage0Idx2_uid245_fxpInPostAlign_uid47_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal stageIndexName_to11_uid246_in : STD_LOGIC_VECTOR (10 downto 0);
    signal stageIndexName_to11_uid246_b : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage0_uid249_fxpInPostAlign_uid47_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid249_fxpInPostAlign_uid47_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage1Idx1Rng1_uid250_fxpInPostAlign_uid47_block_rsrvd_fix_b : STD_LOGIC_VECTOR (9 downto 0);
    signal rightShiftStage1Idx1_uid251_fxpInPostAlign_uid47_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal seMsb_to2_uid252_in : STD_LOGIC_VECTOR (1 downto 0);
    signal seMsb_to2_uid252_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1Idx2Rng2_uid253_fxpInPostAlign_uid47_block_rsrvd_fix_b : STD_LOGIC_VECTOR (8 downto 0);
    signal rightShiftStage1Idx2_uid254_fxpInPostAlign_uid47_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal seMsb_to3_uid255_in : STD_LOGIC_VECTOR (2 downto 0);
    signal seMsb_to3_uid255_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage1Idx3Rng3_uid256_fxpInPostAlign_uid47_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage1Idx3_uid257_fxpInPostAlign_uid47_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage1_uid259_fxpInPostAlign_uid47_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid259_fxpInPostAlign_uid47_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal xMSB_uid264_fxpInPostAlign_X_uid60_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal seMsb_to16_uid266_in : STD_LOGIC_VECTOR (15 downto 0);
    signal seMsb_to16_uid266_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx1Rng16_uid267_fxpInPostAlign_X_uid60_block_rsrvd_fix_b : STD_LOGIC_VECTOR (17 downto 0);
    signal rightShiftStage0Idx1_uid268_fxpInPostAlign_X_uid60_block_rsrvd_fix_q : STD_LOGIC_VECTOR (33 downto 0);
    signal seMsb_to32_uid269_in : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to32_uid269_b : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0Idx2Rng32_uid270_fxpInPostAlign_X_uid60_block_rsrvd_fix_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0Idx2_uid271_fxpInPostAlign_X_uid60_block_rsrvd_fix_q : STD_LOGIC_VECTOR (33 downto 0);
    signal stageIndexName_to34_uid272_in : STD_LOGIC_VECTOR (33 downto 0);
    signal stageIndexName_to34_uid272_b : STD_LOGIC_VECTOR (33 downto 0);
    signal rightShiftStage0_uid275_fxpInPostAlign_X_uid60_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid275_fxpInPostAlign_X_uid60_block_rsrvd_fix_q : STD_LOGIC_VECTOR (33 downto 0);
    signal seMsb_to4_uid276_in : STD_LOGIC_VECTOR (3 downto 0);
    signal seMsb_to4_uid276_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage1Idx1Rng4_uid277_fxpInPostAlign_X_uid60_block_rsrvd_fix_b : STD_LOGIC_VECTOR (29 downto 0);
    signal rightShiftStage1Idx1_uid278_fxpInPostAlign_X_uid60_block_rsrvd_fix_q : STD_LOGIC_VECTOR (33 downto 0);
    signal seMsb_to8_uid279_in : STD_LOGIC_VECTOR (7 downto 0);
    signal seMsb_to8_uid279_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage1Idx2Rng8_uid280_fxpInPostAlign_X_uid60_block_rsrvd_fix_b : STD_LOGIC_VECTOR (25 downto 0);
    signal rightShiftStage1Idx2_uid281_fxpInPostAlign_X_uid60_block_rsrvd_fix_q : STD_LOGIC_VECTOR (33 downto 0);
    signal seMsb_to12_uid282_in : STD_LOGIC_VECTOR (11 downto 0);
    signal seMsb_to12_uid282_b : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage1Idx3Rng12_uid283_fxpInPostAlign_X_uid60_block_rsrvd_fix_b : STD_LOGIC_VECTOR (21 downto 0);
    signal rightShiftStage1Idx3_uid284_fxpInPostAlign_X_uid60_block_rsrvd_fix_q : STD_LOGIC_VECTOR (33 downto 0);
    signal rightShiftStage1_uid286_fxpInPostAlign_X_uid60_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid286_fxpInPostAlign_X_uid60_block_rsrvd_fix_q : STD_LOGIC_VECTOR (33 downto 0);
    signal rightShiftStage2Idx1Rng1_uid287_fxpInPostAlign_X_uid60_block_rsrvd_fix_b : STD_LOGIC_VECTOR (32 downto 0);
    signal rightShiftStage2Idx1_uid288_fxpInPostAlign_X_uid60_block_rsrvd_fix_q : STD_LOGIC_VECTOR (33 downto 0);
    signal seMsb_to2_uid289_in : STD_LOGIC_VECTOR (1 downto 0);
    signal seMsb_to2_uid289_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage2Idx2Rng2_uid290_fxpInPostAlign_X_uid60_block_rsrvd_fix_b : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage2Idx2_uid291_fxpInPostAlign_X_uid60_block_rsrvd_fix_q : STD_LOGIC_VECTOR (33 downto 0);
    signal seMsb_to3_uid292_in : STD_LOGIC_VECTOR (2 downto 0);
    signal seMsb_to3_uid292_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage2Idx3Rng3_uid293_fxpInPostAlign_X_uid60_block_rsrvd_fix_b : STD_LOGIC_VECTOR (30 downto 0);
    signal rightShiftStage2Idx3_uid294_fxpInPostAlign_X_uid60_block_rsrvd_fix_q : STD_LOGIC_VECTOR (33 downto 0);
    signal rightShiftStage2_uid296_fxpInPostAlign_X_uid60_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage2_uid296_fxpInPostAlign_X_uid60_block_rsrvd_fix_q : STD_LOGIC_VECTOR (33 downto 0);
    signal prodXY_uid230_pT1_uid218_invPolyEval_cma_reset : std_logic;
    type prodXY_uid230_pT1_uid218_invPolyEval_cma_a0type is array(NATURAL range <>) of UNSIGNED(13 downto 0);
    signal prodXY_uid230_pT1_uid218_invPolyEval_cma_a0 : prodXY_uid230_pT1_uid218_invPolyEval_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of prodXY_uid230_pT1_uid218_invPolyEval_cma_a0 : signal is true;
    type prodXY_uid230_pT1_uid218_invPolyEval_cma_c0type is array(NATURAL range <>) of SIGNED(13 downto 0);
    signal prodXY_uid230_pT1_uid218_invPolyEval_cma_c0 : prodXY_uid230_pT1_uid218_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of prodXY_uid230_pT1_uid218_invPolyEval_cma_c0 : signal is true;
    type prodXY_uid230_pT1_uid218_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(14 downto 0);
    signal prodXY_uid230_pT1_uid218_invPolyEval_cma_l : prodXY_uid230_pT1_uid218_invPolyEval_cma_ltype(0 to 0);
    type prodXY_uid230_pT1_uid218_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(28 downto 0);
    signal prodXY_uid230_pT1_uid218_invPolyEval_cma_p : prodXY_uid230_pT1_uid218_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid230_pT1_uid218_invPolyEval_cma_u : prodXY_uid230_pT1_uid218_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid230_pT1_uid218_invPolyEval_cma_w : prodXY_uid230_pT1_uid218_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid230_pT1_uid218_invPolyEval_cma_x : prodXY_uid230_pT1_uid218_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid230_pT1_uid218_invPolyEval_cma_y : prodXY_uid230_pT1_uid218_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid230_pT1_uid218_invPolyEval_cma_s : prodXY_uid230_pT1_uid218_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid230_pT1_uid218_invPolyEval_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal prodXY_uid230_pT1_uid218_invPolyEval_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal prodXY_uid230_pT1_uid218_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid230_pT1_uid218_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid233_pT2_uid224_invPolyEval_cma_reset : std_logic;
    type prodXY_uid233_pT2_uid224_invPolyEval_cma_a0type is array(NATURAL range <>) of UNSIGNED(18 downto 0);
    signal prodXY_uid233_pT2_uid224_invPolyEval_cma_a0 : prodXY_uid233_pT2_uid224_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid233_pT2_uid224_invPolyEval_cma_a0 : signal is true;
    type prodXY_uid233_pT2_uid224_invPolyEval_cma_c0type is array(NATURAL range <>) of SIGNED(23 downto 0);
    signal prodXY_uid233_pT2_uid224_invPolyEval_cma_c0 : prodXY_uid233_pT2_uid224_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of prodXY_uid233_pT2_uid224_invPolyEval_cma_c0 : signal is true;
    type prodXY_uid233_pT2_uid224_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(19 downto 0);
    signal prodXY_uid233_pT2_uid224_invPolyEval_cma_l : prodXY_uid233_pT2_uid224_invPolyEval_cma_ltype(0 to 0);
    type prodXY_uid233_pT2_uid224_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(43 downto 0);
    signal prodXY_uid233_pT2_uid224_invPolyEval_cma_p : prodXY_uid233_pT2_uid224_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid233_pT2_uid224_invPolyEval_cma_u : prodXY_uid233_pT2_uid224_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid233_pT2_uid224_invPolyEval_cma_w : prodXY_uid233_pT2_uid224_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid233_pT2_uid224_invPolyEval_cma_x : prodXY_uid233_pT2_uid224_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid233_pT2_uid224_invPolyEval_cma_y : prodXY_uid233_pT2_uid224_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid233_pT2_uid224_invPolyEval_cma_s : prodXY_uid233_pT2_uid224_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid233_pT2_uid224_invPolyEval_cma_qq : STD_LOGIC_VECTOR (42 downto 0);
    signal prodXY_uid233_pT2_uid224_invPolyEval_cma_q : STD_LOGIC_VECTOR (42 downto 0);
    signal prodXY_uid233_pT2_uid224_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid233_pT2_uid224_invPolyEval_cma_ena1 : std_logic;
    signal rightShiftStageSel3Dto2_uid248_fxpInPostAlign_uid47_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel3Dto2_uid248_fxpInPostAlign_uid47_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel3Dto2_uid248_fxpInPostAlign_uid47_block_rsrvd_fix_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal yAddr_uid70_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (6 downto 0);
    signal yAddr_uid70_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (18 downto 0);
    signal lowRangeB_uid116_xTimesOOlog2Ext_uid37_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid116_xTimesOOlog2Ext_uid37_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (30 downto 0);
    signal lowRangeB_uid165_eRndXlog2_uid50_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid165_eRndXlog2_uid50_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (39 downto 0);
    signal redist0_lowRangeB_uid165_eRndXlog2_uid50_block_rsrvd_fix_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_lowRangeB_uid116_xTimesOOlog2Ext_uid37_block_rsrvd_fix_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_yAddr_uid70_block_rsrvd_fix_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist3_yAddr_uid70_block_rsrvd_fix_merged_bit_select_b_5_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist4_yAddr_uid70_block_rsrvd_fix_merged_bit_select_c_3_q : STD_LOGIC_VECTOR (18 downto 0);
    signal redist5_rightShiftStageSel3Dto2_uid248_fxpInPostAlign_uid47_block_rsrvd_fix_merged_bit_select_b_4_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist6_rightShiftStageSel3Dto2_uid248_fxpInPostAlign_uid47_block_rsrvd_fix_merged_bit_select_c_4_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist7_rightShiftStageSel3Dto2_uid248_fxpInPostAlign_uid47_block_rsrvd_fix_merged_bit_select_d_4_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist9_stageIndexName_to11_uid246_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist10_osig_uid234_pT2_uid224_invPolyEval_b_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist11_lowRangeB_uid219_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_sR_uid178_eRndXlog2_uid50_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (42 downto 0);
    signal redist13_sR_uid132_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal redist14_xv4_uid110_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_xv0_uid106_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist16_expR_uid81_block_rsrvd_fix_b_2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist17_fracR_uid77_block_rsrvd_fix_b_4_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist18_peORExpInc_uid74_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_yRed_uid67_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist20_msbUYExt_uid65_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_fxpInPreAlign_uid55_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist22_expOvfInitial_uid42_block_rsrvd_fix_b_16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_fxpInPreAlign_uid36_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist25_excR_x_uid30_block_rsrvd_fix_q_17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_excN_x_uid27_block_rsrvd_fix_q_17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_excI_x_uid26_block_rsrvd_fix_q_17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_fracXIsZero_uid24_block_rsrvd_fix_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_signX_uid7_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_signX_uid7_block_rsrvd_fix_b_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_signX_uid7_block_rsrvd_fix_b_10_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_signX_uid7_block_rsrvd_fix_b_22_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_expX_uid6_block_rsrvd_fix_b_5_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist4_yAddr_uid70_block_rsrvd_fix_merged_bit_select_c_3_inputreg_q : STD_LOGIC_VECTOR (18 downto 0);
    signal redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_inputreg_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_outputreg_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_mem_reset0 : std_logic;
    signal redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_mem_ia : STD_LOGIC_VECTOR (10 downto 0);
    signal redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_mem_iq : STD_LOGIC_VECTOR (10 downto 0);
    signal redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_mem_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_rdcnt_i : signal is true;
    signal redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_sticky_ena_q : signal is true;
    signal redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_fracR_uid77_block_rsrvd_fix_b_4_inputreg_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist24_oFracX_uid32_block_rsrvd_fix_q_9_mem_reset0 : std_logic;
    signal redist24_oFracX_uid32_block_rsrvd_fix_q_9_mem_ia : STD_LOGIC_VECTOR (23 downto 0);
    signal redist24_oFracX_uid32_block_rsrvd_fix_q_9_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist24_oFracX_uid32_block_rsrvd_fix_q_9_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist24_oFracX_uid32_block_rsrvd_fix_q_9_mem_iq : STD_LOGIC_VECTOR (23 downto 0);
    signal redist24_oFracX_uid32_block_rsrvd_fix_q_9_mem_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist24_oFracX_uid32_block_rsrvd_fix_q_9_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist24_oFracX_uid32_block_rsrvd_fix_q_9_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist24_oFracX_uid32_block_rsrvd_fix_q_9_rdcnt_i : signal is true;
    signal redist24_oFracX_uid32_block_rsrvd_fix_q_9_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist24_oFracX_uid32_block_rsrvd_fix_q_9_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist24_oFracX_uid32_block_rsrvd_fix_q_9_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist24_oFracX_uid32_block_rsrvd_fix_q_9_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_oFracX_uid32_block_rsrvd_fix_q_9_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_oFracX_uid32_block_rsrvd_fix_q_9_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_oFracX_uid32_block_rsrvd_fix_q_9_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_oFracX_uid32_block_rsrvd_fix_q_9_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist24_oFracX_uid32_block_rsrvd_fix_q_9_sticky_ena_q : signal is true;
    signal redist24_oFracX_uid32_block_rsrvd_fix_q_9_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_expX_uid6_block_rsrvd_fix_b_5_outputreg_q : STD_LOGIC_VECTOR (7 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- cstAllOWE_uid17_block_rsrvd_fix(CONSTANT,16)
    cstAllOWE_uid17_block_rsrvd_fix_q <= "11111111";

    -- zY_uid66_block_rsrvd_fix(CONSTANT,65)
    zY_uid66_block_rsrvd_fix_q <= "00000000000000000000000000";

    -- maxValInOutFormat_uid169_eRndXlog2_uid50_block_rsrvd_fix(CONSTANT,168)
    maxValInOutFormat_uid169_eRndXlog2_uid50_block_rsrvd_fix_q <= "0111111111111111111111111111111111111111111";

    -- minValueInFormat_uid170_eRndXlog2_uid50_block_rsrvd_fix(CONSTANT,169)
    minValueInFormat_uid170_eRndXlog2_uid50_block_rsrvd_fix_q <= "1000000000000000000000000000000000000000000";

    -- maxValInOutFormat_uid123_xTimesOOlog2Ext_uid37_block_rsrvd_fix(CONSTANT,122)
    maxValInOutFormat_uid123_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01111111111111111111111111111";

    -- minValueInFormat_uid124_xTimesOOlog2Ext_uid37_block_rsrvd_fix(CONSTANT,123)
    minValueInFormat_uid124_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10000000000000000000000000000";

    -- signX_uid7_block_rsrvd_fix(BITSELECT,6)@0
    signX_uid7_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(in_0(31 downto 31));

    -- redist29_signX_uid7_block_rsrvd_fix_b_1(DELAY,332)
    redist29_signX_uid7_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => signX_uid7_block_rsrvd_fix_b, xout => redist29_signX_uid7_block_rsrvd_fix_b_1_q, clk => clock, aclr => resetn );

    -- fracX_uid8_block_rsrvd_fix(BITSELECT,7)@0
    fracX_uid8_block_rsrvd_fix_b <= in_0(22 downto 0);

    -- oFracX_uid32_block_rsrvd_fix(BITJOIN,31)@0
    oFracX_uid32_block_rsrvd_fix_q <= VCC_q & fracX_uid8_block_rsrvd_fix_b;

    -- oFracX_uid33_block_rsrvd_fix(BITJOIN,32)@0
    oFracX_uid33_block_rsrvd_fix_q <= GND_q & oFracX_uid32_block_rsrvd_fix_q;

    -- onesCmpFxpInX_uid34_block_rsrvd_fix(LOGICAL,33)@0 + 1
    onesCmpFxpInX_uid34_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 1 => signX_uid7_block_rsrvd_fix_b(0)) & signX_uid7_block_rsrvd_fix_b));
    onesCmpFxpInX_uid34_block_rsrvd_fix_qi <= oFracX_uid33_block_rsrvd_fix_q xor onesCmpFxpInX_uid34_block_rsrvd_fix_b;
    onesCmpFxpInX_uid34_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => onesCmpFxpInX_uid34_block_rsrvd_fix_qi, xout => onesCmpFxpInX_uid34_block_rsrvd_fix_q, clk => clock, aclr => resetn );

    -- fxpInExtX_uid35_block_rsrvd_fix(ADD,34)@1
    fxpInExtX_uid35_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & onesCmpFxpInX_uid34_block_rsrvd_fix_q);
    fxpInExtX_uid35_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0000000000000000000000000" & redist29_signX_uid7_block_rsrvd_fix_b_1_q);
    fxpInExtX_uid35_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(fxpInExtX_uid35_block_rsrvd_fix_a) + UNSIGNED(fxpInExtX_uid35_block_rsrvd_fix_b));
    fxpInExtX_uid35_block_rsrvd_fix_q <= fxpInExtX_uid35_block_rsrvd_fix_o(25 downto 0);

    -- fxpInPreAlign_uid36_block_rsrvd_fix(BITSELECT,35)@1
    fxpInPreAlign_uid36_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(fxpInExtX_uid35_block_rsrvd_fix_q(24 downto 0));
    fxpInPreAlign_uid36_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(fxpInPreAlign_uid36_block_rsrvd_fix_in(24 downto 0));

    -- redist23_fxpInPreAlign_uid36_block_rsrvd_fix_b_1(DELAY,326)
    redist23_fxpInPreAlign_uid36_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => fxpInPreAlign_uid36_block_rsrvd_fix_b, xout => redist23_fxpInPreAlign_uid36_block_rsrvd_fix_b_1_q, clk => clock, aclr => resetn );

    -- xv0_uid106_xTimesOOlog2Ext_uid37_block_rsrvd_fix(BITSELECT,105)@2
    xv0_uid106_xTimesOOlog2Ext_uid37_block_rsrvd_fix_in <= redist23_fxpInPreAlign_uid36_block_rsrvd_fix_b_1_q(5 downto 0);
    xv0_uid106_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b <= xv0_uid106_xTimesOOlog2Ext_uid37_block_rsrvd_fix_in(5 downto 0);

    -- redist15_xv0_uid106_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b_2(DELAY,318)
    redist15_xv0_uid106_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => xv0_uid106_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b, xout => redist15_xv0_uid106_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b_2_q, clk => clock, aclr => resetn );

    -- p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix(LOOKUP,114)@4 + 1
    p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (redist15_xv0_uid106_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b_2_q) IS
                WHEN "000000" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00000000000000";
                WHEN "000001" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00000010111000";
                WHEN "000010" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00000101110001";
                WHEN "000011" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00001000101001";
                WHEN "000100" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00001011100010";
                WHEN "000101" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00001110011011";
                WHEN "000110" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00010001010011";
                WHEN "000111" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00010100001100";
                WHEN "001000" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00010111000101";
                WHEN "001001" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00011001111101";
                WHEN "001010" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00011100110110";
                WHEN "001011" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00011111101111";
                WHEN "001100" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00100010100111";
                WHEN "001101" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00100101100000";
                WHEN "001110" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00101000011001";
                WHEN "001111" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00101011010001";
                WHEN "010000" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00101110001010";
                WHEN "010001" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00110001000011";
                WHEN "010010" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00110011111011";
                WHEN "010011" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00110110110100";
                WHEN "010100" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00111001101101";
                WHEN "010101" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00111100100101";
                WHEN "010110" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00111111011110";
                WHEN "010111" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01000010010111";
                WHEN "011000" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01000101001111";
                WHEN "011001" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01001000001000";
                WHEN "011010" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01001011000001";
                WHEN "011011" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01001101111001";
                WHEN "011100" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01010000110010";
                WHEN "011101" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01010011101011";
                WHEN "011110" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01010110100011";
                WHEN "011111" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01011001011100";
                WHEN "100000" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01011100010101";
                WHEN "100001" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01011111001101";
                WHEN "100010" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01100010000110";
                WHEN "100011" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01100100111111";
                WHEN "100100" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01100111110111";
                WHEN "100101" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01101010110000";
                WHEN "100110" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01101101101001";
                WHEN "100111" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01110000100001";
                WHEN "101000" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01110011011010";
                WHEN "101001" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01110110010011";
                WHEN "101010" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01111001001011";
                WHEN "101011" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01111100000100";
                WHEN "101100" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01111110111101";
                WHEN "101101" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10000001110101";
                WHEN "101110" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10000100101110";
                WHEN "101111" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10000111100111";
                WHEN "110000" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10001010011111";
                WHEN "110001" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10001101011000";
                WHEN "110010" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10010000010001";
                WHEN "110011" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10010011001001";
                WHEN "110100" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10010110000010";
                WHEN "110101" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10011000111011";
                WHEN "110110" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10011011110011";
                WHEN "110111" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10011110101100";
                WHEN "111000" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10100001100101";
                WHEN "111001" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10100100011101";
                WHEN "111010" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10100111010110";
                WHEN "111011" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10101010001111";
                WHEN "111100" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10101101000111";
                WHEN "111101" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10110000000000";
                WHEN "111110" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10110010111001";
                WHEN "111111" => p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10110101110001";
                WHEN OTHERS => -- unreachable
                               p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- xv1_uid107_xTimesOOlog2Ext_uid37_block_rsrvd_fix(BITSELECT,106)@2
    xv1_uid107_xTimesOOlog2Ext_uid37_block_rsrvd_fix_in <= redist23_fxpInPreAlign_uid36_block_rsrvd_fix_b_1_q(11 downto 0);
    xv1_uid107_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b <= xv1_uid107_xTimesOOlog2Ext_uid37_block_rsrvd_fix_in(11 downto 6);

    -- p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix(LOOKUP,113)@2 + 1
    p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (xv1_uid107_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b) IS
                WHEN "000000" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00000000000000000000";
                WHEN "000001" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00000010111000101010";
                WHEN "000010" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00000101110001010101";
                WHEN "000011" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00001000101001111111";
                WHEN "000100" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00001011100010101010";
                WHEN "000101" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00001110011011010100";
                WHEN "000110" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00010001010011111111";
                WHEN "000111" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00010100001100101001";
                WHEN "001000" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00010111000101010100";
                WHEN "001001" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00011001111101111111";
                WHEN "001010" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00011100110110101001";
                WHEN "001011" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00011111101111010100";
                WHEN "001100" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00100010100111111110";
                WHEN "001101" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00100101100000101001";
                WHEN "001110" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00101000011001010011";
                WHEN "001111" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00101011010001111110";
                WHEN "010000" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00101110001010101000";
                WHEN "010001" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00110001000011010011";
                WHEN "010010" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00110011111011111110";
                WHEN "010011" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00110110110100101000";
                WHEN "010100" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00111001101101010011";
                WHEN "010101" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00111100100101111101";
                WHEN "010110" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00111111011110101000";
                WHEN "010111" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01000010010111010010";
                WHEN "011000" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01000101001111111101";
                WHEN "011001" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01001000001000100111";
                WHEN "011010" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01001011000001010010";
                WHEN "011011" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01001101111001111101";
                WHEN "011100" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01010000110010100111";
                WHEN "011101" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01010011101011010010";
                WHEN "011110" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01010110100011111100";
                WHEN "011111" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01011001011100100111";
                WHEN "100000" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01011100010101010001";
                WHEN "100001" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01011111001101111100";
                WHEN "100010" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01100010000110100110";
                WHEN "100011" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01100100111111010001";
                WHEN "100100" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01100111110111111100";
                WHEN "100101" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01101010110000100110";
                WHEN "100110" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01101101101001010001";
                WHEN "100111" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01110000100001111011";
                WHEN "101000" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01110011011010100110";
                WHEN "101001" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01110110010011010000";
                WHEN "101010" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01111001001011111011";
                WHEN "101011" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01111100000100100101";
                WHEN "101100" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01111110111101010000";
                WHEN "101101" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10000001110101111011";
                WHEN "101110" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10000100101110100101";
                WHEN "101111" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10000111100111010000";
                WHEN "110000" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10001010011111111010";
                WHEN "110001" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10001101011000100101";
                WHEN "110010" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10010000010001001111";
                WHEN "110011" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10010011001001111010";
                WHEN "110100" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10010110000010100101";
                WHEN "110101" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10011000111011001111";
                WHEN "110110" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10011011110011111010";
                WHEN "110111" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10011110101100100100";
                WHEN "111000" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10100001100101001111";
                WHEN "111001" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10100100011101111001";
                WHEN "111010" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10100111010110100100";
                WHEN "111011" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10101010001111001110";
                WHEN "111100" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10101101000111111001";
                WHEN "111101" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10110000000000100100";
                WHEN "111110" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10110010111001001110";
                WHEN "111111" => p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10110101110001111001";
                WHEN OTHERS => -- unreachable
                               p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- xv2_uid108_xTimesOOlog2Ext_uid37_block_rsrvd_fix(BITSELECT,107)@2
    xv2_uid108_xTimesOOlog2Ext_uid37_block_rsrvd_fix_in <= redist23_fxpInPreAlign_uid36_block_rsrvd_fix_b_1_q(17 downto 0);
    xv2_uid108_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b <= xv2_uid108_xTimesOOlog2Ext_uid37_block_rsrvd_fix_in(17 downto 12);

    -- p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix(LOOKUP,112)@2 + 1
    p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (xv2_uid108_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b) IS
                WHEN "000000" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00000000000000000000000000";
                WHEN "000001" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00000010111000101010100011";
                WHEN "000010" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00000101110001010101000111";
                WHEN "000011" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00001000101001111111101011";
                WHEN "000100" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00001011100010101010001110";
                WHEN "000101" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00001110011011010100110010";
                WHEN "000110" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00010001010011111111010110";
                WHEN "000111" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00010100001100101001111001";
                WHEN "001000" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00010111000101010100011101";
                WHEN "001001" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00011001111101111111000001";
                WHEN "001010" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00011100110110101001100100";
                WHEN "001011" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00011111101111010100001000";
                WHEN "001100" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00100010100111111110101100";
                WHEN "001101" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00100101100000101001010000";
                WHEN "001110" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00101000011001010011110011";
                WHEN "001111" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00101011010001111110010111";
                WHEN "010000" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00101110001010101000111011";
                WHEN "010001" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00110001000011010011011110";
                WHEN "010010" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00110011111011111110000010";
                WHEN "010011" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00110110110100101000100110";
                WHEN "010100" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00111001101101010011001001";
                WHEN "010101" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00111100100101111101101101";
                WHEN "010110" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00111111011110101000010001";
                WHEN "010111" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01000010010111010010110101";
                WHEN "011000" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01000101001111111101011000";
                WHEN "011001" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01001000001000100111111100";
                WHEN "011010" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01001011000001010010100000";
                WHEN "011011" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01001101111001111101000011";
                WHEN "011100" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01010000110010100111100111";
                WHEN "011101" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01010011101011010010001011";
                WHEN "011110" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01010110100011111100101110";
                WHEN "011111" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01011001011100100111010010";
                WHEN "100000" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01011100010101010001110110";
                WHEN "100001" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01011111001101111100011010";
                WHEN "100010" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01100010000110100110111101";
                WHEN "100011" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01100100111111010001100001";
                WHEN "100100" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01100111110111111100000101";
                WHEN "100101" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01101010110000100110101000";
                WHEN "100110" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01101101101001010001001100";
                WHEN "100111" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01110000100001111011110000";
                WHEN "101000" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01110011011010100110010011";
                WHEN "101001" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01110110010011010000110111";
                WHEN "101010" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01111001001011111011011011";
                WHEN "101011" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01111100000100100101111110";
                WHEN "101100" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01111110111101010000100010";
                WHEN "101101" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10000001110101111011000110";
                WHEN "101110" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10000100101110100101101010";
                WHEN "101111" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10000111100111010000001101";
                WHEN "110000" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10001010011111111010110001";
                WHEN "110001" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10001101011000100101010101";
                WHEN "110010" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10010000010001001111111000";
                WHEN "110011" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10010011001001111010011100";
                WHEN "110100" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10010110000010100101000000";
                WHEN "110101" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10011000111011001111100011";
                WHEN "110110" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10011011110011111010000111";
                WHEN "110111" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10011110101100100100101011";
                WHEN "111000" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10100001100101001111001111";
                WHEN "111001" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10100100011101111001110010";
                WHEN "111010" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10100111010110100100010110";
                WHEN "111011" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10101010001111001110111010";
                WHEN "111100" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10101101000111111001011101";
                WHEN "111101" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10110000000000100100000001";
                WHEN "111110" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10110010111001001110100101";
                WHEN "111111" => p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10110101110001111001001000";
                WHEN OTHERS => -- unreachable
                               p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- lev1_a1_uid120_xTimesOOlog2Ext_uid37_block_rsrvd_fix(ADD,119)@3 + 1
    lev1_a1_uid120_xTimesOOlog2Ext_uid37_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & p2_uid113_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q);
    lev1_a1_uid120_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0000000" & p1_uid114_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q);
    lev1_a1_uid120_xTimesOOlog2Ext_uid37_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            lev1_a1_uid120_xTimesOOlog2Ext_uid37_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            lev1_a1_uid120_xTimesOOlog2Ext_uid37_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(lev1_a1_uid120_xTimesOOlog2Ext_uid37_block_rsrvd_fix_a) + UNSIGNED(lev1_a1_uid120_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    lev1_a1_uid120_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= lev1_a1_uid120_xTimesOOlog2Ext_uid37_block_rsrvd_fix_o(26 downto 0);

    -- xv3_uid109_xTimesOOlog2Ext_uid37_block_rsrvd_fix(BITSELECT,108)@2
    xv3_uid109_xTimesOOlog2Ext_uid37_block_rsrvd_fix_in <= redist23_fxpInPreAlign_uid36_block_rsrvd_fix_b_1_q(23 downto 0);
    xv3_uid109_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b <= xv3_uid109_xTimesOOlog2Ext_uid37_block_rsrvd_fix_in(23 downto 18);

    -- p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix(LOOKUP,111)@2 + 1
    p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (xv3_uid109_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b) IS
                WHEN "000000" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00000000000000000000000000000000";
                WHEN "000001" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00000010111000101010100011101100";
                WHEN "000010" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00000101110001010101000111011001";
                WHEN "000011" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00001000101001111111101011000101";
                WHEN "000100" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00001011100010101010001110110010";
                WHEN "000101" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00001110011011010100110010011111";
                WHEN "000110" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00010001010011111111010110001011";
                WHEN "000111" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00010100001100101001111001111000";
                WHEN "001000" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00010111000101010100011101100101";
                WHEN "001001" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00011001111101111111000001010001";
                WHEN "001010" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00011100110110101001100100111110";
                WHEN "001011" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00011111101111010100001000101010";
                WHEN "001100" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00100010100111111110101100010111";
                WHEN "001101" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00100101100000101001010000000100";
                WHEN "001110" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00101000011001010011110011110000";
                WHEN "001111" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00101011010001111110010111011101";
                WHEN "010000" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00101110001010101000111011001010";
                WHEN "010001" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00110001000011010011011110110110";
                WHEN "010010" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00110011111011111110000010100011";
                WHEN "010011" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00110110110100101000100110001111";
                WHEN "010100" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00111001101101010011001001111100";
                WHEN "010101" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00111100100101111101101101101001";
                WHEN "010110" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "00111111011110101000010001010101";
                WHEN "010111" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01000010010111010010110101000010";
                WHEN "011000" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01000101001111111101011000101111";
                WHEN "011001" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01001000001000100111111100011011";
                WHEN "011010" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01001011000001010010100000001000";
                WHEN "011011" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01001101111001111101000011110100";
                WHEN "011100" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01010000110010100111100111100001";
                WHEN "011101" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01010011101011010010001011001110";
                WHEN "011110" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01010110100011111100101110111010";
                WHEN "011111" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01011001011100100111010010100111";
                WHEN "100000" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01011100010101010001110110010100";
                WHEN "100001" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01011111001101111100011010000000";
                WHEN "100010" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01100010000110100110111101101101";
                WHEN "100011" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01100100111111010001100001011001";
                WHEN "100100" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01100111110111111100000101000110";
                WHEN "100101" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01101010110000100110101000110011";
                WHEN "100110" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01101101101001010001001100011111";
                WHEN "100111" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01110000100001111011110000001100";
                WHEN "101000" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01110011011010100110010011111001";
                WHEN "101001" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01110110010011010000110111100101";
                WHEN "101010" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01111001001011111011011011010010";
                WHEN "101011" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01111100000100100101111110111110";
                WHEN "101100" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "01111110111101010000100010101011";
                WHEN "101101" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10000001110101111011000110011000";
                WHEN "101110" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10000100101110100101101010000100";
                WHEN "101111" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10000111100111010000001101110001";
                WHEN "110000" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10001010011111111010110001011110";
                WHEN "110001" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10001101011000100101010101001010";
                WHEN "110010" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10010000010001001111111000110111";
                WHEN "110011" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10010011001001111010011100100011";
                WHEN "110100" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10010110000010100101000000010000";
                WHEN "110101" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10011000111011001111100011111101";
                WHEN "110110" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10011011110011111010000111101001";
                WHEN "110111" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10011110101100100100101011010110";
                WHEN "111000" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10100001100101001111001111000011";
                WHEN "111001" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10100100011101111001110010101111";
                WHEN "111010" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10100111010110100100010110011100";
                WHEN "111011" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10101010001111001110111010001000";
                WHEN "111100" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10101101000111111001011101110101";
                WHEN "111101" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10110000000000100100000001100010";
                WHEN "111110" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10110010111001001110100101001110";
                WHEN "111111" => p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "10110101110001111001001000111011";
                WHEN OTHERS => -- unreachable
                               p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- lowRangeB_uid116_xTimesOOlog2Ext_uid37_block_rsrvd_fix_merged_bit_select(BITSELECT,301)@3
    lowRangeB_uid116_xTimesOOlog2Ext_uid37_block_rsrvd_fix_merged_bit_select_b <= p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q(0 downto 0);
    lowRangeB_uid116_xTimesOOlog2Ext_uid37_block_rsrvd_fix_merged_bit_select_c <= p3_uid112_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q(31 downto 1);

    -- xv4_uid110_xTimesOOlog2Ext_uid37_block_rsrvd_fix(BITSELECT,109)@2
    xv4_uid110_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(redist23_fxpInPreAlign_uid36_block_rsrvd_fix_b_1_q(24 downto 24));

    -- redist14_xv4_uid110_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b_1(DELAY,317)
    redist14_xv4_uid110_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => xv4_uid110_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b, xout => redist14_xv4_uid110_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b_1_q, clk => clock, aclr => resetn );

    -- p4_uid111_xTimesOOlog2Ext_uid37_block_rsrvd_fix(LOOKUP,110)@3
    p4_uid111_xTimesOOlog2Ext_uid37_block_rsrvd_fix_combproc: PROCESS (redist14_xv4_uid110_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b_1_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist14_xv4_uid110_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b_1_q) IS
            WHEN "0" => p4_uid111_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "000000000000000000000000000000100";
            WHEN "1" => p4_uid111_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "110100011101010101110001001110000";
            WHEN OTHERS => -- unreachable
                           p4_uid111_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- lev1_a0sumAHighB_uid118_xTimesOOlog2Ext_uid37_block_rsrvd_fix(ADD,117)@3 + 1
    lev1_a0sumAHighB_uid118_xTimesOOlog2Ext_uid37_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => p4_uid111_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q(32)) & p4_uid111_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q));
    lev1_a0sumAHighB_uid118_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & lowRangeB_uid116_xTimesOOlog2Ext_uid37_block_rsrvd_fix_merged_bit_select_c));
    lev1_a0sumAHighB_uid118_xTimesOOlog2Ext_uid37_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            lev1_a0sumAHighB_uid118_xTimesOOlog2Ext_uid37_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            lev1_a0sumAHighB_uid118_xTimesOOlog2Ext_uid37_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid118_xTimesOOlog2Ext_uid37_block_rsrvd_fix_a) + SIGNED(lev1_a0sumAHighB_uid118_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    lev1_a0sumAHighB_uid118_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= lev1_a0sumAHighB_uid118_xTimesOOlog2Ext_uid37_block_rsrvd_fix_o(33 downto 0);

    -- redist1_lowRangeB_uid116_xTimesOOlog2Ext_uid37_block_rsrvd_fix_merged_bit_select_b_1(DELAY,304)
    redist1_lowRangeB_uid116_xTimesOOlog2Ext_uid37_block_rsrvd_fix_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lowRangeB_uid116_xTimesOOlog2Ext_uid37_block_rsrvd_fix_merged_bit_select_b, xout => redist1_lowRangeB_uid116_xTimesOOlog2Ext_uid37_block_rsrvd_fix_merged_bit_select_b_1_q, clk => clock, aclr => resetn );

    -- lev1_a0_uid119_xTimesOOlog2Ext_uid37_block_rsrvd_fix(BITJOIN,118)@4
    lev1_a0_uid119_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= lev1_a0sumAHighB_uid118_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q & redist1_lowRangeB_uid116_xTimesOOlog2Ext_uid37_block_rsrvd_fix_merged_bit_select_b_1_q;

    -- lev2_a0_uid121_xTimesOOlog2Ext_uid37_block_rsrvd_fix(ADD,120)@4 + 1
    lev2_a0_uid121_xTimesOOlog2Ext_uid37_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 35 => lev1_a0_uid119_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q(34)) & lev1_a0_uid119_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q));
    lev2_a0_uid121_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000" & lev1_a1_uid120_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q));
    lev2_a0_uid121_xTimesOOlog2Ext_uid37_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            lev2_a0_uid121_xTimesOOlog2Ext_uid37_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            lev2_a0_uid121_xTimesOOlog2Ext_uid37_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(lev2_a0_uid121_xTimesOOlog2Ext_uid37_block_rsrvd_fix_a) + SIGNED(lev2_a0_uid121_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    lev2_a0_uid121_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= lev2_a0_uid121_xTimesOOlog2Ext_uid37_block_rsrvd_fix_o(35 downto 0);

    -- lev3_a0_uid122_xTimesOOlog2Ext_uid37_block_rsrvd_fix(ADD,121)@5 + 1
    lev3_a0_uid122_xTimesOOlog2Ext_uid37_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((37 downto 36 => lev2_a0_uid121_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q(35)) & lev2_a0_uid121_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q));
    lev3_a0_uid122_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000000000000000000000" & p0_uid115_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q));
    lev3_a0_uid122_xTimesOOlog2Ext_uid37_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            lev3_a0_uid122_xTimesOOlog2Ext_uid37_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            lev3_a0_uid122_xTimesOOlog2Ext_uid37_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(lev3_a0_uid122_xTimesOOlog2Ext_uid37_block_rsrvd_fix_a) + SIGNED(lev3_a0_uid122_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    lev3_a0_uid122_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= lev3_a0_uid122_xTimesOOlog2Ext_uid37_block_rsrvd_fix_o(36 downto 0);

    -- sR_uid132_xTimesOOlog2Ext_uid37_block_rsrvd_fix(BITSELECT,131)@6
    sR_uid132_xTimesOOlog2Ext_uid37_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(lev3_a0_uid122_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q(32 downto 0));
    sR_uid132_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(sR_uid132_xTimesOOlog2Ext_uid37_block_rsrvd_fix_in(32 downto 4));

    -- redist13_sR_uid132_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b_1(DELAY,316)
    redist13_sR_uid132_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 29, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sR_uid132_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b, xout => redist13_sR_uid132_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b_1_q, clk => clock, aclr => resetn );

    -- paddingX_uid125_xTimesOOlog2Ext_uid37_block_rsrvd_fix(CONSTANT,124)
    paddingX_uid125_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= "0000";

    -- updatedX_uid126_xTimesOOlog2Ext_uid37_block_rsrvd_fix(BITJOIN,125)@6
    updatedX_uid126_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= maxValInOutFormat_uid123_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q & paddingX_uid125_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q;

    -- ovf_uid125_xTimesOOlog2Ext_uid37_block_rsrvd_fix(COMPARE,126)@6 + 1
    ovf_uid125_xTimesOOlog2Ext_uid37_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((38 downto 33 => updatedX_uid126_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q(32)) & updatedX_uid126_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q));
    ovf_uid125_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((38 downto 37 => lev3_a0_uid122_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q(36)) & lev3_a0_uid122_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q));
    ovf_uid125_xTimesOOlog2Ext_uid37_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ovf_uid125_xTimesOOlog2Ext_uid37_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            ovf_uid125_xTimesOOlog2Ext_uid37_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(ovf_uid125_xTimesOOlog2Ext_uid37_block_rsrvd_fix_a) - SIGNED(ovf_uid125_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    ovf_uid125_xTimesOOlog2Ext_uid37_block_rsrvd_fix_c(0) <= ovf_uid125_xTimesOOlog2Ext_uid37_block_rsrvd_fix_o(38);

    -- updatedY_uid129_xTimesOOlog2Ext_uid37_block_rsrvd_fix(BITJOIN,128)@6
    updatedY_uid129_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= minValueInFormat_uid124_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q & paddingX_uid125_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q;

    -- udf_uid128_xTimesOOlog2Ext_uid37_block_rsrvd_fix(COMPARE,129)@6 + 1
    udf_uid128_xTimesOOlog2Ext_uid37_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((38 downto 37 => lev3_a0_uid122_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q(36)) & lev3_a0_uid122_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q));
    udf_uid128_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((38 downto 33 => updatedY_uid129_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q(32)) & updatedY_uid129_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q));
    udf_uid128_xTimesOOlog2Ext_uid37_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            udf_uid128_xTimesOOlog2Ext_uid37_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            udf_uid128_xTimesOOlog2Ext_uid37_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(udf_uid128_xTimesOOlog2Ext_uid37_block_rsrvd_fix_a) - SIGNED(udf_uid128_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    udf_uid128_xTimesOOlog2Ext_uid37_block_rsrvd_fix_c(0) <= udf_uid128_xTimesOOlog2Ext_uid37_block_rsrvd_fix_o(38);

    -- ovfudfcond_uid131_xTimesOOlog2Ext_uid37_block_rsrvd_fix(BITJOIN,130)@7
    ovfudfcond_uid131_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= ovf_uid125_xTimesOOlog2Ext_uid37_block_rsrvd_fix_c & udf_uid128_xTimesOOlog2Ext_uid37_block_rsrvd_fix_c;

    -- sRA0_uid133_xTimesOOlog2Ext_uid37_block_rsrvd_fix(MUX,132)@7
    sRA0_uid133_xTimesOOlog2Ext_uid37_block_rsrvd_fix_s <= ovfudfcond_uid131_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q;
    sRA0_uid133_xTimesOOlog2Ext_uid37_block_rsrvd_fix_combproc: PROCESS (sRA0_uid133_xTimesOOlog2Ext_uid37_block_rsrvd_fix_s, redist13_sR_uid132_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b_1_q, minValueInFormat_uid124_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q, maxValInOutFormat_uid123_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q)
    BEGIN
        CASE (sRA0_uid133_xTimesOOlog2Ext_uid37_block_rsrvd_fix_s) IS
            WHEN "00" => sRA0_uid133_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= redist13_sR_uid132_xTimesOOlog2Ext_uid37_block_rsrvd_fix_b_1_q;
            WHEN "01" => sRA0_uid133_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= minValueInFormat_uid124_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q;
            WHEN "10" => sRA0_uid133_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= maxValInOutFormat_uid123_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q;
            WHEN "11" => sRA0_uid133_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= maxValInOutFormat_uid123_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q;
            WHEN OTHERS => sRA0_uid133_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oFracXZwE_uid39_block_rsrvd_fix(BITJOIN,38)@7
    oFracXZwE_uid39_block_rsrvd_fix_q <= sRA0_uid133_xTimesOOlog2Ext_uid37_block_rsrvd_fix_q & cstZeroWE_uid14_block_rsrvd_fix_q;

    -- topRangeFxpEPreRnd_uid46_block_rsrvd_fix(BITSELECT,45)@7
    topRangeFxpEPreRnd_uid46_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(oFracXZwE_uid39_block_rsrvd_fix_q(36 downto 26));

    -- xMSB_uid236_fxpInPostAlign_uid47_block_rsrvd_fix(BITSELECT,235)@7
    xMSB_uid236_fxpInPostAlign_uid47_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(topRangeFxpEPreRnd_uid46_block_rsrvd_fix_b(10 downto 10));

    -- stageIndexName_to11_uid246(BITSELECT,245)@7
    stageIndexName_to11_uid246_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 1 => xMSB_uid236_fxpInPostAlign_uid47_block_rsrvd_fix_b(0)) & xMSB_uid236_fxpInPostAlign_uid47_block_rsrvd_fix_b));
    stageIndexName_to11_uid246_b <= STD_LOGIC_VECTOR(stageIndexName_to11_uid246_in(10 downto 0));

    -- redist9_stageIndexName_to11_uid246_b_1(DELAY,312)
    redist9_stageIndexName_to11_uid246_b_1 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => stageIndexName_to11_uid246_b, xout => redist9_stageIndexName_to11_uid246_b_1_q, clk => clock, aclr => resetn );

    -- seMsb_to3_uid255(BITSELECT,254)@7
    seMsb_to3_uid255_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((2 downto 1 => xMSB_uid236_fxpInPostAlign_uid47_block_rsrvd_fix_b(0)) & xMSB_uid236_fxpInPostAlign_uid47_block_rsrvd_fix_b));
    seMsb_to3_uid255_b <= STD_LOGIC_VECTOR(seMsb_to3_uid255_in(2 downto 0));

    -- rightShiftStage1Idx3Rng3_uid256_fxpInPostAlign_uid47_block_rsrvd_fix(BITSELECT,255)@7
    rightShiftStage1Idx3Rng3_uid256_fxpInPostAlign_uid47_block_rsrvd_fix_b <= rightShiftStage0_uid249_fxpInPostAlign_uid47_block_rsrvd_fix_q(10 downto 3);

    -- rightShiftStage1Idx3_uid257_fxpInPostAlign_uid47_block_rsrvd_fix(BITJOIN,256)@7
    rightShiftStage1Idx3_uid257_fxpInPostAlign_uid47_block_rsrvd_fix_q <= seMsb_to3_uid255_b & rightShiftStage1Idx3Rng3_uid256_fxpInPostAlign_uid47_block_rsrvd_fix_b;

    -- seMsb_to2_uid252(BITSELECT,251)@7
    seMsb_to2_uid252_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((1 downto 1 => xMSB_uid236_fxpInPostAlign_uid47_block_rsrvd_fix_b(0)) & xMSB_uid236_fxpInPostAlign_uid47_block_rsrvd_fix_b));
    seMsb_to2_uid252_b <= STD_LOGIC_VECTOR(seMsb_to2_uid252_in(1 downto 0));

    -- rightShiftStage1Idx2Rng2_uid253_fxpInPostAlign_uid47_block_rsrvd_fix(BITSELECT,252)@7
    rightShiftStage1Idx2Rng2_uid253_fxpInPostAlign_uid47_block_rsrvd_fix_b <= rightShiftStage0_uid249_fxpInPostAlign_uid47_block_rsrvd_fix_q(10 downto 2);

    -- rightShiftStage1Idx2_uid254_fxpInPostAlign_uid47_block_rsrvd_fix(BITJOIN,253)@7
    rightShiftStage1Idx2_uid254_fxpInPostAlign_uid47_block_rsrvd_fix_q <= seMsb_to2_uid252_b & rightShiftStage1Idx2Rng2_uid253_fxpInPostAlign_uid47_block_rsrvd_fix_b;

    -- rightShiftStage1Idx1Rng1_uid250_fxpInPostAlign_uid47_block_rsrvd_fix(BITSELECT,249)@7
    rightShiftStage1Idx1Rng1_uid250_fxpInPostAlign_uid47_block_rsrvd_fix_b <= rightShiftStage0_uid249_fxpInPostAlign_uid47_block_rsrvd_fix_q(10 downto 1);

    -- rightShiftStage1Idx1_uid251_fxpInPostAlign_uid47_block_rsrvd_fix(BITJOIN,250)@7
    rightShiftStage1Idx1_uid251_fxpInPostAlign_uid47_block_rsrvd_fix_q <= xMSB_uid236_fxpInPostAlign_uid47_block_rsrvd_fix_b & rightShiftStage1Idx1Rng1_uid250_fxpInPostAlign_uid47_block_rsrvd_fix_b;

    -- seMsb_to8_uid243(BITSELECT,242)@7
    seMsb_to8_uid243_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((7 downto 1 => xMSB_uid236_fxpInPostAlign_uid47_block_rsrvd_fix_b(0)) & xMSB_uid236_fxpInPostAlign_uid47_block_rsrvd_fix_b));
    seMsb_to8_uid243_b <= STD_LOGIC_VECTOR(seMsb_to8_uid243_in(7 downto 0));

    -- rightShiftStage0Idx2Rng8_uid244_fxpInPostAlign_uid47_block_rsrvd_fix(BITSELECT,243)@7
    rightShiftStage0Idx2Rng8_uid244_fxpInPostAlign_uid47_block_rsrvd_fix_b <= topRangeFxpEPreRnd_uid46_block_rsrvd_fix_b(10 downto 8);

    -- rightShiftStage0Idx2_uid245_fxpInPostAlign_uid47_block_rsrvd_fix(BITJOIN,244)@7
    rightShiftStage0Idx2_uid245_fxpInPostAlign_uid47_block_rsrvd_fix_q <= seMsb_to8_uid243_b & rightShiftStage0Idx2Rng8_uid244_fxpInPostAlign_uid47_block_rsrvd_fix_b;

    -- seMsb_to4_uid240(BITSELECT,239)@7
    seMsb_to4_uid240_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 1 => xMSB_uid236_fxpInPostAlign_uid47_block_rsrvd_fix_b(0)) & xMSB_uid236_fxpInPostAlign_uid47_block_rsrvd_fix_b));
    seMsb_to4_uid240_b <= STD_LOGIC_VECTOR(seMsb_to4_uid240_in(3 downto 0));

    -- rightShiftStage0Idx1Rng4_uid241_fxpInPostAlign_uid47_block_rsrvd_fix(BITSELECT,240)@7
    rightShiftStage0Idx1Rng4_uid241_fxpInPostAlign_uid47_block_rsrvd_fix_b <= topRangeFxpEPreRnd_uid46_block_rsrvd_fix_b(10 downto 4);

    -- rightShiftStage0Idx1_uid242_fxpInPostAlign_uid47_block_rsrvd_fix(BITJOIN,241)@7
    rightShiftStage0Idx1_uid242_fxpInPostAlign_uid47_block_rsrvd_fix_q <= seMsb_to4_uid240_b & rightShiftStage0Idx1Rng4_uid241_fxpInPostAlign_uid47_block_rsrvd_fix_b;

    -- rightShiftStage0_uid249_fxpInPostAlign_uid47_block_rsrvd_fix(MUX,248)@7
    rightShiftStage0_uid249_fxpInPostAlign_uid47_block_rsrvd_fix_s <= rightShiftStageSel3Dto2_uid248_fxpInPostAlign_uid47_block_rsrvd_fix_merged_bit_select_b;
    rightShiftStage0_uid249_fxpInPostAlign_uid47_block_rsrvd_fix_combproc: PROCESS (rightShiftStage0_uid249_fxpInPostAlign_uid47_block_rsrvd_fix_s, topRangeFxpEPreRnd_uid46_block_rsrvd_fix_b, rightShiftStage0Idx1_uid242_fxpInPostAlign_uid47_block_rsrvd_fix_q, rightShiftStage0Idx2_uid245_fxpInPostAlign_uid47_block_rsrvd_fix_q, stageIndexName_to11_uid246_b)
    BEGIN
        CASE (rightShiftStage0_uid249_fxpInPostAlign_uid47_block_rsrvd_fix_s) IS
            WHEN "00" => rightShiftStage0_uid249_fxpInPostAlign_uid47_block_rsrvd_fix_q <= topRangeFxpEPreRnd_uid46_block_rsrvd_fix_b;
            WHEN "01" => rightShiftStage0_uid249_fxpInPostAlign_uid47_block_rsrvd_fix_q <= rightShiftStage0Idx1_uid242_fxpInPostAlign_uid47_block_rsrvd_fix_q;
            WHEN "10" => rightShiftStage0_uid249_fxpInPostAlign_uid47_block_rsrvd_fix_q <= rightShiftStage0Idx2_uid245_fxpInPostAlign_uid47_block_rsrvd_fix_q;
            WHEN "11" => rightShiftStage0_uid249_fxpInPostAlign_uid47_block_rsrvd_fix_q <= stageIndexName_to11_uid246_b;
            WHEN OTHERS => rightShiftStage0_uid249_fxpInPostAlign_uid47_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cstBiasPWE_uid31_block_rsrvd_fix(CONSTANT,30)
    cstBiasPWE_uid31_block_rsrvd_fix_q <= "100001";

    -- expX_uid6_block_rsrvd_fix(BITSELECT,5)@0
    expX_uid6_block_rsrvd_fix_b <= in_0(30 downto 23);

    -- redist33_expX_uid6_block_rsrvd_fix_b_5(DELAY,336)
    redist33_expX_uid6_block_rsrvd_fix_b_5 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => expX_uid6_block_rsrvd_fix_b, xout => redist33_expX_uid6_block_rsrvd_fix_b_5_q, clk => clock, aclr => resetn );

    -- redist33_expX_uid6_block_rsrvd_fix_b_5_outputreg(DELAY,361)
    redist33_expX_uid6_block_rsrvd_fix_b_5_outputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist33_expX_uid6_block_rsrvd_fix_b_5_q, xout => redist33_expX_uid6_block_rsrvd_fix_b_5_outputreg_q, clk => clock, aclr => resetn );

    -- cstBiasPWE_uid16_block_rsrvd_fix(CONSTANT,15)
    cstBiasPWE_uid16_block_rsrvd_fix_q <= "10000111";

    -- shiftValuePreSat_uid41_block_rsrvd_fix(SUB,40)@5 + 1
    shiftValuePreSat_uid41_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & cstBiasPWE_uid16_block_rsrvd_fix_q);
    shiftValuePreSat_uid41_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0" & redist33_expX_uid6_block_rsrvd_fix_b_5_outputreg_q);
    shiftValuePreSat_uid41_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            shiftValuePreSat_uid41_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            shiftValuePreSat_uid41_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValuePreSat_uid41_block_rsrvd_fix_a) - UNSIGNED(shiftValuePreSat_uid41_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    shiftValuePreSat_uid41_block_rsrvd_fix_q <= shiftValuePreSat_uid41_block_rsrvd_fix_o(8 downto 0);

    -- shiftValuePreSatRed_uid44_block_rsrvd_fix(BITSELECT,43)@6
    shiftValuePreSatRed_uid44_block_rsrvd_fix_in <= shiftValuePreSat_uid41_block_rsrvd_fix_q(5 downto 0);
    shiftValuePreSatRed_uid44_block_rsrvd_fix_b <= shiftValuePreSatRed_uid44_block_rsrvd_fix_in(5 downto 0);

    -- shiftUdf_uid43_block_rsrvd_fix(COMPARE,42)@6
    shiftUdf_uid43_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 9 => shiftValuePreSat_uid41_block_rsrvd_fix_q(8)) & shiftValuePreSat_uid41_block_rsrvd_fix_q));
    shiftUdf_uid43_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000" & cstBiasPWE_uid31_block_rsrvd_fix_q));
    shiftUdf_uid43_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(shiftUdf_uid43_block_rsrvd_fix_a) - SIGNED(shiftUdf_uid43_block_rsrvd_fix_b));
    shiftUdf_uid43_block_rsrvd_fix_n(0) <= not (shiftUdf_uid43_block_rsrvd_fix_o(10));

    -- shiftVal_uid45_block_rsrvd_fix(MUX,44)@6 + 1
    shiftVal_uid45_block_rsrvd_fix_s <= shiftUdf_uid43_block_rsrvd_fix_n;
    shiftVal_uid45_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            shiftVal_uid45_block_rsrvd_fix_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (shiftVal_uid45_block_rsrvd_fix_s) IS
                WHEN "0" => shiftVal_uid45_block_rsrvd_fix_q <= shiftValuePreSatRed_uid44_block_rsrvd_fix_b;
                WHEN "1" => shiftVal_uid45_block_rsrvd_fix_q <= cstBiasPWE_uid31_block_rsrvd_fix_q;
                WHEN OTHERS => shiftVal_uid45_block_rsrvd_fix_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rightShiftStageSel3Dto2_uid248_fxpInPostAlign_uid47_block_rsrvd_fix_merged_bit_select(BITSELECT,299)@7
    rightShiftStageSel3Dto2_uid248_fxpInPostAlign_uid47_block_rsrvd_fix_merged_bit_select_b <= shiftVal_uid45_block_rsrvd_fix_q(3 downto 2);
    rightShiftStageSel3Dto2_uid248_fxpInPostAlign_uid47_block_rsrvd_fix_merged_bit_select_c <= shiftVal_uid45_block_rsrvd_fix_q(1 downto 0);
    rightShiftStageSel3Dto2_uid248_fxpInPostAlign_uid47_block_rsrvd_fix_merged_bit_select_d <= shiftVal_uid45_block_rsrvd_fix_q(5 downto 4);

    -- rightShiftStage1_uid259_fxpInPostAlign_uid47_block_rsrvd_fix(MUX,258)@7 + 1
    rightShiftStage1_uid259_fxpInPostAlign_uid47_block_rsrvd_fix_s <= rightShiftStageSel3Dto2_uid248_fxpInPostAlign_uid47_block_rsrvd_fix_merged_bit_select_c;
    rightShiftStage1_uid259_fxpInPostAlign_uid47_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            rightShiftStage1_uid259_fxpInPostAlign_uid47_block_rsrvd_fix_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (rightShiftStage1_uid259_fxpInPostAlign_uid47_block_rsrvd_fix_s) IS
                WHEN "00" => rightShiftStage1_uid259_fxpInPostAlign_uid47_block_rsrvd_fix_q <= rightShiftStage0_uid249_fxpInPostAlign_uid47_block_rsrvd_fix_q;
                WHEN "01" => rightShiftStage1_uid259_fxpInPostAlign_uid47_block_rsrvd_fix_q <= rightShiftStage1Idx1_uid251_fxpInPostAlign_uid47_block_rsrvd_fix_q;
                WHEN "10" => rightShiftStage1_uid259_fxpInPostAlign_uid47_block_rsrvd_fix_q <= rightShiftStage1Idx2_uid254_fxpInPostAlign_uid47_block_rsrvd_fix_q;
                WHEN "11" => rightShiftStage1_uid259_fxpInPostAlign_uid47_block_rsrvd_fix_q <= rightShiftStage1Idx3_uid257_fxpInPostAlign_uid47_block_rsrvd_fix_q;
                WHEN OTHERS => rightShiftStage1_uid259_fxpInPostAlign_uid47_block_rsrvd_fix_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- wIntCst_uid238_fxpInPostAlign_uid47_block_rsrvd_fix(CONSTANT,237)
    wIntCst_uid238_fxpInPostAlign_uid47_block_rsrvd_fix_q <= "1011";

    -- shiftedOut_uid239_fxpInPostAlign_uid47_block_rsrvd_fix(COMPARE,238)@7 + 1
    shiftedOut_uid239_fxpInPostAlign_uid47_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("00" & shiftVal_uid45_block_rsrvd_fix_q);
    shiftedOut_uid239_fxpInPostAlign_uid47_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0000" & wIntCst_uid238_fxpInPostAlign_uid47_block_rsrvd_fix_q);
    shiftedOut_uid239_fxpInPostAlign_uid47_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            shiftedOut_uid239_fxpInPostAlign_uid47_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            shiftedOut_uid239_fxpInPostAlign_uid47_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid239_fxpInPostAlign_uid47_block_rsrvd_fix_a) - UNSIGNED(shiftedOut_uid239_fxpInPostAlign_uid47_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    shiftedOut_uid239_fxpInPostAlign_uid47_block_rsrvd_fix_n(0) <= not (shiftedOut_uid239_fxpInPostAlign_uid47_block_rsrvd_fix_o(7));

    -- r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix(MUX,261)@8
    r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_s <= shiftedOut_uid239_fxpInPostAlign_uid47_block_rsrvd_fix_n;
    r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_combproc: PROCESS (r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_s, rightShiftStage1_uid259_fxpInPostAlign_uid47_block_rsrvd_fix_q, redist9_stageIndexName_to11_uid246_b_1_q)
    BEGIN
        CASE (r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_s) IS
            WHEN "0" => r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q <= rightShiftStage1_uid259_fxpInPostAlign_uid47_block_rsrvd_fix_q;
            WHEN "1" => r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q <= redist9_stageIndexName_to11_uid246_b_1_q;
            WHEN OTHERS => r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- xv0_uid161_eRndXlog2_uid50_block_rsrvd_fix(BITSELECT,160)@8
    xv0_uid161_eRndXlog2_uid50_block_rsrvd_fix_in <= r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q(5 downto 0);
    xv0_uid161_eRndXlog2_uid50_block_rsrvd_fix_b <= xv0_uid161_eRndXlog2_uid50_block_rsrvd_fix_in(5 downto 0);

    -- p0_uid164_eRndXlog2_uid50_block_rsrvd_fix(LOOKUP,163)@8 + 1
    p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "00000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (xv0_uid161_eRndXlog2_uid50_block_rsrvd_fix_b) IS
                WHEN "000000" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "00000000000000000000000000000000000000000";
                WHEN "000001" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "00000010110001011100100001011111110111110";
                WHEN "000010" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "00000101100010111001000010111111101111100";
                WHEN "000011" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "00001000010100010101100100011111100111010";
                WHEN "000100" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "00001011000101110010000101111111011111000";
                WHEN "000101" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "00001101110111001110100111011111010110110";
                WHEN "000110" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "00010000101000101011001000111111001110100";
                WHEN "000111" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "00010011011010000111101010011111000110010";
                WHEN "001000" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "00010110001011100100001011111110111110000";
                WHEN "001001" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "00011000111101000000101101011110110101110";
                WHEN "001010" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "00011011101110011101001110111110101101100";
                WHEN "001011" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "00011110011111111001110000011110100101010";
                WHEN "001100" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "00100001010001010110010001111110011101000";
                WHEN "001101" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "00100100000010110010110011011110010100110";
                WHEN "001110" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "00100110110100001111010100111110001100100";
                WHEN "001111" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "00101001100101101011110110011110000100010";
                WHEN "010000" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "00101100010111001000010111111101111100000";
                WHEN "010001" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "00101111001000100100111001011101110011110";
                WHEN "010010" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "00110001111010000001011010111101101011100";
                WHEN "010011" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "00110100101011011101111100011101100011010";
                WHEN "010100" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "00110111011100111010011101111101011011000";
                WHEN "010101" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "00111010001110010110111111011101010010110";
                WHEN "010110" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "00111100111111110011100000111101001010100";
                WHEN "010111" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "00111111110001010000000010011101000010010";
                WHEN "011000" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "01000010100010101100100011111100111010000";
                WHEN "011001" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "01000101010100001001000101011100110001110";
                WHEN "011010" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "01001000000101100101100110111100101001100";
                WHEN "011011" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "01001010110111000010001000011100100001010";
                WHEN "011100" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "01001101101000011110101001111100011001000";
                WHEN "011101" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "01010000011001111011001011011100010000110";
                WHEN "011110" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "01010011001011010111101100111100001000100";
                WHEN "011111" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "01010101111100110100001110011100000000010";
                WHEN "100000" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "01011000101110010000101111111011111000000";
                WHEN "100001" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "01011011011111101101010001011011101111110";
                WHEN "100010" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "01011110010001001001110010111011100111100";
                WHEN "100011" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "01100001000010100110010100011011011111010";
                WHEN "100100" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "01100011110100000010110101111011010111000";
                WHEN "100101" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "01100110100101011111010111011011001110110";
                WHEN "100110" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "01101001010110111011111000111011000110100";
                WHEN "100111" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "01101100001000011000011010011010111110010";
                WHEN "101000" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "01101110111001110100111011111010110110000";
                WHEN "101001" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "01110001101011010001011101011010101101110";
                WHEN "101010" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "01110100011100101101111110111010100101100";
                WHEN "101011" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "01110111001110001010100000011010011101010";
                WHEN "101100" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "01111001111111100111000001111010010101000";
                WHEN "101101" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "01111100110001000011100011011010001100110";
                WHEN "101110" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "01111111100010100000000100111010000100100";
                WHEN "101111" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "10000010010011111100100110011001111100010";
                WHEN "110000" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "10000101000101011001000111111001110100000";
                WHEN "110001" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "10000111110110110101101001011001101011110";
                WHEN "110010" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "10001010101000010010001010111001100011100";
                WHEN "110011" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "10001101011001101110101100011001011011010";
                WHEN "110100" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "10010000001011001011001101111001010011000";
                WHEN "110101" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "10010010111100100111101111011001001010110";
                WHEN "110110" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "10010101101110000100010000111001000010100";
                WHEN "110111" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "10011000011111100000110010011000111010010";
                WHEN "111000" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "10011011010000111101010011111000110010000";
                WHEN "111001" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "10011110000010011001110101011000101001110";
                WHEN "111010" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "10100000110011110110010110111000100001100";
                WHEN "111011" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "10100011100101010010111000011000011001010";
                WHEN "111100" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "10100110010110101111011001111000010001000";
                WHEN "111101" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "10101001001000001011111011011000001000110";
                WHEN "111110" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "10101011111001101000011100111000000000100";
                WHEN "111111" => p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= "10101110101011000100111110010111111000010";
                WHEN OTHERS => -- unreachable
                               p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- lowRangeB_uid165_eRndXlog2_uid50_block_rsrvd_fix_merged_bit_select(BITSELECT,302)@9
    lowRangeB_uid165_eRndXlog2_uid50_block_rsrvd_fix_merged_bit_select_b <= p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q(0 downto 0);
    lowRangeB_uid165_eRndXlog2_uid50_block_rsrvd_fix_merged_bit_select_c <= p0_uid164_eRndXlog2_uid50_block_rsrvd_fix_q(40 downto 1);

    -- xv1_uid162_eRndXlog2_uid50_block_rsrvd_fix(BITSELECT,161)@8
    xv1_uid162_eRndXlog2_uid50_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q(10 downto 6));

    -- p1_uid163_eRndXlog2_uid50_block_rsrvd_fix(LOOKUP,162)@8 + 1
    p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "0000000000000000000000000000000000000000000010";
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (xv1_uid162_eRndXlog2_uid50_block_rsrvd_fix_b) IS
                WHEN "00000" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "0000000000000000000000000000000000000000000010";
                WHEN "00001" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "0000001011000101110010000101111111011111000010";
                WHEN "00010" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "0000010110001011100100001011111110111110000010";
                WHEN "00011" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "0000100001010001010110010001111110011101000010";
                WHEN "00100" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "0000101100010111001000010111111101111100000010";
                WHEN "00101" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "0000110111011100111010011101111101011011000010";
                WHEN "00110" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "0001000010100010101100100011111100111010000010";
                WHEN "00111" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "0001001101101000011110101001111100011001000010";
                WHEN "01000" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "0001011000101110010000101111111011111000000010";
                WHEN "01001" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "0001100011110100000010110101111011010111000010";
                WHEN "01010" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "0001101110111001110100111011111010110110000010";
                WHEN "01011" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "0001111001111111100111000001111010010101000010";
                WHEN "01100" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "0010000101000101011001000111111001110100000010";
                WHEN "01101" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "0010010000001011001011001101111001010011000010";
                WHEN "01110" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "0010011011010000111101010011111000110010000010";
                WHEN "01111" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "0010100110010110101111011001111000010001000010";
                WHEN "10000" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "1101001110100011011110100000001000010000000010";
                WHEN "10001" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "1101011001101001010000100110000111101111000010";
                WHEN "10010" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "1101100100101111000010101100000111001110000010";
                WHEN "10011" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "1101101111110100110100110010000110101101000010";
                WHEN "10100" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "1101111010111010100110111000000110001100000010";
                WHEN "10101" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "1110000110000000011000111110000101101011000010";
                WHEN "10110" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "1110010001000110001011000100000101001010000010";
                WHEN "10111" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "1110011100001011111101001010000100101001000010";
                WHEN "11000" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "1110100111010001101111010000000100001000000010";
                WHEN "11001" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "1110110010010111100001010110000011100111000010";
                WHEN "11010" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "1110111101011101010011011100000011000110000010";
                WHEN "11011" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "1111001000100011000101100010000010100101000010";
                WHEN "11100" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "1111010011101000110111101000000010000100000010";
                WHEN "11101" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "1111011110101110101001101110000001100011000010";
                WHEN "11110" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "1111101001110100011011110100000001000010000010";
                WHEN "11111" => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= "1111110100111010001101111010000000100001000010";
                WHEN OTHERS => -- unreachable
                               p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- lev1_a0sumAHighB_uid167_eRndXlog2_uid50_block_rsrvd_fix(ADD,166)@9 + 1
    lev1_a0sumAHighB_uid167_eRndXlog2_uid50_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((47 downto 46 => p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q(45)) & p1_uid163_eRndXlog2_uid50_block_rsrvd_fix_q));
    lev1_a0sumAHighB_uid167_eRndXlog2_uid50_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000" & lowRangeB_uid165_eRndXlog2_uid50_block_rsrvd_fix_merged_bit_select_c));
    lev1_a0sumAHighB_uid167_eRndXlog2_uid50_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            lev1_a0sumAHighB_uid167_eRndXlog2_uid50_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            lev1_a0sumAHighB_uid167_eRndXlog2_uid50_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid167_eRndXlog2_uid50_block_rsrvd_fix_a) + SIGNED(lev1_a0sumAHighB_uid167_eRndXlog2_uid50_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    lev1_a0sumAHighB_uid167_eRndXlog2_uid50_block_rsrvd_fix_q <= lev1_a0sumAHighB_uid167_eRndXlog2_uid50_block_rsrvd_fix_o(46 downto 0);

    -- redist0_lowRangeB_uid165_eRndXlog2_uid50_block_rsrvd_fix_merged_bit_select_b_1(DELAY,303)
    redist0_lowRangeB_uid165_eRndXlog2_uid50_block_rsrvd_fix_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lowRangeB_uid165_eRndXlog2_uid50_block_rsrvd_fix_merged_bit_select_b, xout => redist0_lowRangeB_uid165_eRndXlog2_uid50_block_rsrvd_fix_merged_bit_select_b_1_q, clk => clock, aclr => resetn );

    -- lev1_a0_uid168_eRndXlog2_uid50_block_rsrvd_fix(BITJOIN,167)@10
    lev1_a0_uid168_eRndXlog2_uid50_block_rsrvd_fix_q <= lev1_a0sumAHighB_uid167_eRndXlog2_uid50_block_rsrvd_fix_q & redist0_lowRangeB_uid165_eRndXlog2_uid50_block_rsrvd_fix_merged_bit_select_b_1_q;

    -- sR_uid178_eRndXlog2_uid50_block_rsrvd_fix(BITSELECT,177)@10
    sR_uid178_eRndXlog2_uid50_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(lev1_a0_uid168_eRndXlog2_uid50_block_rsrvd_fix_q(45 downto 0));
    sR_uid178_eRndXlog2_uid50_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(sR_uid178_eRndXlog2_uid50_block_rsrvd_fix_in(45 downto 3));

    -- redist12_sR_uid178_eRndXlog2_uid50_block_rsrvd_fix_b_1(DELAY,315)
    redist12_sR_uid178_eRndXlog2_uid50_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 43, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sR_uid178_eRndXlog2_uid50_block_rsrvd_fix_b, xout => redist12_sR_uid178_eRndXlog2_uid50_block_rsrvd_fix_b_1_q, clk => clock, aclr => resetn );

    -- paddingX_uid171_eRndXlog2_uid50_block_rsrvd_fix(CONSTANT,170)
    paddingX_uid171_eRndXlog2_uid50_block_rsrvd_fix_q <= "000";

    -- updatedX_uid172_eRndXlog2_uid50_block_rsrvd_fix(BITJOIN,171)@10
    updatedX_uid172_eRndXlog2_uid50_block_rsrvd_fix_q <= maxValInOutFormat_uid169_eRndXlog2_uid50_block_rsrvd_fix_q & paddingX_uid171_eRndXlog2_uid50_block_rsrvd_fix_q;

    -- ovf_uid171_eRndXlog2_uid50_block_rsrvd_fix(COMPARE,172)@10 + 1
    ovf_uid171_eRndXlog2_uid50_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((49 downto 46 => updatedX_uid172_eRndXlog2_uid50_block_rsrvd_fix_q(45)) & updatedX_uid172_eRndXlog2_uid50_block_rsrvd_fix_q));
    ovf_uid171_eRndXlog2_uid50_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((49 downto 48 => lev1_a0_uid168_eRndXlog2_uid50_block_rsrvd_fix_q(47)) & lev1_a0_uid168_eRndXlog2_uid50_block_rsrvd_fix_q));
    ovf_uid171_eRndXlog2_uid50_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ovf_uid171_eRndXlog2_uid50_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            ovf_uid171_eRndXlog2_uid50_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(ovf_uid171_eRndXlog2_uid50_block_rsrvd_fix_a) - SIGNED(ovf_uid171_eRndXlog2_uid50_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    ovf_uid171_eRndXlog2_uid50_block_rsrvd_fix_c(0) <= ovf_uid171_eRndXlog2_uid50_block_rsrvd_fix_o(49);

    -- updatedY_uid175_eRndXlog2_uid50_block_rsrvd_fix(BITJOIN,174)@10
    updatedY_uid175_eRndXlog2_uid50_block_rsrvd_fix_q <= minValueInFormat_uid170_eRndXlog2_uid50_block_rsrvd_fix_q & paddingX_uid171_eRndXlog2_uid50_block_rsrvd_fix_q;

    -- udf_uid174_eRndXlog2_uid50_block_rsrvd_fix(COMPARE,175)@10 + 1
    udf_uid174_eRndXlog2_uid50_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((49 downto 48 => lev1_a0_uid168_eRndXlog2_uid50_block_rsrvd_fix_q(47)) & lev1_a0_uid168_eRndXlog2_uid50_block_rsrvd_fix_q));
    udf_uid174_eRndXlog2_uid50_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((49 downto 46 => updatedY_uid175_eRndXlog2_uid50_block_rsrvd_fix_q(45)) & updatedY_uid175_eRndXlog2_uid50_block_rsrvd_fix_q));
    udf_uid174_eRndXlog2_uid50_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            udf_uid174_eRndXlog2_uid50_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            udf_uid174_eRndXlog2_uid50_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(udf_uid174_eRndXlog2_uid50_block_rsrvd_fix_a) - SIGNED(udf_uid174_eRndXlog2_uid50_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    udf_uid174_eRndXlog2_uid50_block_rsrvd_fix_c(0) <= udf_uid174_eRndXlog2_uid50_block_rsrvd_fix_o(49);

    -- ovfudfcond_uid177_eRndXlog2_uid50_block_rsrvd_fix(BITJOIN,176)@11
    ovfudfcond_uid177_eRndXlog2_uid50_block_rsrvd_fix_q <= ovf_uid171_eRndXlog2_uid50_block_rsrvd_fix_c & udf_uid174_eRndXlog2_uid50_block_rsrvd_fix_c;

    -- sRA0_uid179_eRndXlog2_uid50_block_rsrvd_fix(MUX,178)@11 + 1
    sRA0_uid179_eRndXlog2_uid50_block_rsrvd_fix_s <= ovfudfcond_uid177_eRndXlog2_uid50_block_rsrvd_fix_q;
    sRA0_uid179_eRndXlog2_uid50_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sRA0_uid179_eRndXlog2_uid50_block_rsrvd_fix_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (sRA0_uid179_eRndXlog2_uid50_block_rsrvd_fix_s) IS
                WHEN "00" => sRA0_uid179_eRndXlog2_uid50_block_rsrvd_fix_q <= redist12_sR_uid178_eRndXlog2_uid50_block_rsrvd_fix_b_1_q;
                WHEN "01" => sRA0_uid179_eRndXlog2_uid50_block_rsrvd_fix_q <= minValueInFormat_uid170_eRndXlog2_uid50_block_rsrvd_fix_q;
                WHEN "10" => sRA0_uid179_eRndXlog2_uid50_block_rsrvd_fix_q <= maxValInOutFormat_uid169_eRndXlog2_uid50_block_rsrvd_fix_q;
                WHEN "11" => sRA0_uid179_eRndXlog2_uid50_block_rsrvd_fix_q <= maxValInOutFormat_uid169_eRndXlog2_uid50_block_rsrvd_fix_q;
                WHEN OTHERS => sRA0_uid179_eRndXlog2_uid50_block_rsrvd_fix_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist30_signX_uid7_block_rsrvd_fix_b_9(DELAY,333)
    redist30_signX_uid7_block_rsrvd_fix_b_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist29_signX_uid7_block_rsrvd_fix_b_1_q, xout => redist30_signX_uid7_block_rsrvd_fix_b_9_q, clk => clock, aclr => resetn );

    -- redist31_signX_uid7_block_rsrvd_fix_b_10(DELAY,334)
    redist31_signX_uid7_block_rsrvd_fix_b_10 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist30_signX_uid7_block_rsrvd_fix_b_9_q, xout => redist31_signX_uid7_block_rsrvd_fix_b_10_q, clk => clock, aclr => resetn );

    -- redist24_oFracX_uid32_block_rsrvd_fix_q_9_notEnable(LOGICAL,357)
    redist24_oFracX_uid32_block_rsrvd_fix_q_9_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist24_oFracX_uid32_block_rsrvd_fix_q_9_nor(LOGICAL,358)
    redist24_oFracX_uid32_block_rsrvd_fix_q_9_nor_q <= not (redist24_oFracX_uid32_block_rsrvd_fix_q_9_notEnable_q or redist24_oFracX_uid32_block_rsrvd_fix_q_9_sticky_ena_q);

    -- redist24_oFracX_uid32_block_rsrvd_fix_q_9_mem_last(CONSTANT,354)
    redist24_oFracX_uid32_block_rsrvd_fix_q_9_mem_last_q <= "0110";

    -- redist24_oFracX_uid32_block_rsrvd_fix_q_9_cmp(LOGICAL,355)
    redist24_oFracX_uid32_block_rsrvd_fix_q_9_cmp_b <= STD_LOGIC_VECTOR("0" & redist24_oFracX_uid32_block_rsrvd_fix_q_9_rdcnt_q);
    redist24_oFracX_uid32_block_rsrvd_fix_q_9_cmp_q <= "1" WHEN redist24_oFracX_uid32_block_rsrvd_fix_q_9_mem_last_q = redist24_oFracX_uid32_block_rsrvd_fix_q_9_cmp_b ELSE "0";

    -- redist24_oFracX_uid32_block_rsrvd_fix_q_9_cmpReg(REG,356)
    redist24_oFracX_uid32_block_rsrvd_fix_q_9_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist24_oFracX_uid32_block_rsrvd_fix_q_9_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist24_oFracX_uid32_block_rsrvd_fix_q_9_cmpReg_q <= STD_LOGIC_VECTOR(redist24_oFracX_uid32_block_rsrvd_fix_q_9_cmp_q);
        END IF;
    END PROCESS;

    -- redist24_oFracX_uid32_block_rsrvd_fix_q_9_sticky_ena(REG,359)
    redist24_oFracX_uid32_block_rsrvd_fix_q_9_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist24_oFracX_uid32_block_rsrvd_fix_q_9_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist24_oFracX_uid32_block_rsrvd_fix_q_9_nor_q = "1") THEN
                redist24_oFracX_uid32_block_rsrvd_fix_q_9_sticky_ena_q <= STD_LOGIC_VECTOR(redist24_oFracX_uid32_block_rsrvd_fix_q_9_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist24_oFracX_uid32_block_rsrvd_fix_q_9_enaAnd(LOGICAL,360)
    redist24_oFracX_uid32_block_rsrvd_fix_q_9_enaAnd_q <= redist24_oFracX_uid32_block_rsrvd_fix_q_9_sticky_ena_q and VCC_q;

    -- redist24_oFracX_uid32_block_rsrvd_fix_q_9_rdcnt(COUNTER,352)
    -- low=0, high=7, step=1, init=0
    redist24_oFracX_uid32_block_rsrvd_fix_q_9_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist24_oFracX_uid32_block_rsrvd_fix_q_9_rdcnt_i <= TO_UNSIGNED(0, 3);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist24_oFracX_uid32_block_rsrvd_fix_q_9_rdcnt_i <= redist24_oFracX_uid32_block_rsrvd_fix_q_9_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist24_oFracX_uid32_block_rsrvd_fix_q_9_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist24_oFracX_uid32_block_rsrvd_fix_q_9_rdcnt_i, 3)));

    -- redist24_oFracX_uid32_block_rsrvd_fix_q_9_wraddr(REG,353)
    redist24_oFracX_uid32_block_rsrvd_fix_q_9_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist24_oFracX_uid32_block_rsrvd_fix_q_9_wraddr_q <= "111";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist24_oFracX_uid32_block_rsrvd_fix_q_9_wraddr_q <= STD_LOGIC_VECTOR(redist24_oFracX_uid32_block_rsrvd_fix_q_9_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist24_oFracX_uid32_block_rsrvd_fix_q_9_mem(DUALMEM,351)
    redist24_oFracX_uid32_block_rsrvd_fix_q_9_mem_ia <= STD_LOGIC_VECTOR(oFracX_uid32_block_rsrvd_fix_q);
    redist24_oFracX_uid32_block_rsrvd_fix_q_9_mem_aa <= redist24_oFracX_uid32_block_rsrvd_fix_q_9_wraddr_q;
    redist24_oFracX_uid32_block_rsrvd_fix_q_9_mem_ab <= redist24_oFracX_uid32_block_rsrvd_fix_q_9_rdcnt_q;
    redist24_oFracX_uid32_block_rsrvd_fix_q_9_mem_reset0 <= not (resetn);
    redist24_oFracX_uid32_block_rsrvd_fix_q_9_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 24,
        widthad_a => 3,
        numwords_a => 8,
        width_b => 24,
        widthad_b => 3,
        numwords_b => 8,
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
        clocken1 => redist24_oFracX_uid32_block_rsrvd_fix_q_9_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist24_oFracX_uid32_block_rsrvd_fix_q_9_mem_reset0,
        clock1 => clock,
        address_a => redist24_oFracX_uid32_block_rsrvd_fix_q_9_mem_aa,
        data_a => redist24_oFracX_uid32_block_rsrvd_fix_q_9_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist24_oFracX_uid32_block_rsrvd_fix_q_9_mem_ab,
        q_b => redist24_oFracX_uid32_block_rsrvd_fix_q_9_mem_iq
    );
    redist24_oFracX_uid32_block_rsrvd_fix_q_9_mem_q <= redist24_oFracX_uid32_block_rsrvd_fix_q_9_mem_iq(23 downto 0);

    -- cstZeroWEP1_uid15_block_rsrvd_fix(CONSTANT,14)
    cstZeroWEP1_uid15_block_rsrvd_fix_q <= "000000000";

    -- oFracXZwE_uid52_block_rsrvd_fix(BITJOIN,51)@9
    oFracXZwE_uid52_block_rsrvd_fix_q <= GND_q & redist24_oFracX_uid32_block_rsrvd_fix_q_9_mem_q & cstZeroWEP1_uid15_block_rsrvd_fix_q;

    -- onesCmpFxpIn_uid53_block_rsrvd_fix(LOGICAL,52)@9 + 1
    onesCmpFxpIn_uid53_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 1 => redist30_signX_uid7_block_rsrvd_fix_b_9_q(0)) & redist30_signX_uid7_block_rsrvd_fix_b_9_q));
    onesCmpFxpIn_uid53_block_rsrvd_fix_qi <= oFracXZwE_uid52_block_rsrvd_fix_q xor onesCmpFxpIn_uid53_block_rsrvd_fix_b;
    onesCmpFxpIn_uid53_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => onesCmpFxpIn_uid53_block_rsrvd_fix_qi, xout => onesCmpFxpIn_uid53_block_rsrvd_fix_q, clk => clock, aclr => resetn );

    -- fxpInExt_uid54_block_rsrvd_fix(ADD,53)@10
    fxpInExt_uid54_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & onesCmpFxpIn_uid53_block_rsrvd_fix_q);
    fxpInExt_uid54_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0000000000000000000000000000000000" & redist31_signX_uid7_block_rsrvd_fix_b_10_q);
    fxpInExt_uid54_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(fxpInExt_uid54_block_rsrvd_fix_a) + UNSIGNED(fxpInExt_uid54_block_rsrvd_fix_b));
    fxpInExt_uid54_block_rsrvd_fix_q <= fxpInExt_uid54_block_rsrvd_fix_o(34 downto 0);

    -- fxpInPreAlign_uid55_block_rsrvd_fix(BITSELECT,54)@10
    fxpInPreAlign_uid55_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(fxpInExt_uid54_block_rsrvd_fix_q(33 downto 0));
    fxpInPreAlign_uid55_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(fxpInPreAlign_uid55_block_rsrvd_fix_in(33 downto 0));

    -- redist21_fxpInPreAlign_uid55_block_rsrvd_fix_b_1(DELAY,324)
    redist21_fxpInPreAlign_uid55_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => fxpInPreAlign_uid55_block_rsrvd_fix_b, xout => redist21_fxpInPreAlign_uid55_block_rsrvd_fix_b_1_q, clk => clock, aclr => resetn );

    -- xMSB_uid264_fxpInPostAlign_X_uid60_block_rsrvd_fix(BITSELECT,263)@11
    xMSB_uid264_fxpInPostAlign_X_uid60_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(redist21_fxpInPreAlign_uid55_block_rsrvd_fix_b_1_q(33 downto 33));

    -- seMsb_to3_uid292(BITSELECT,291)@11
    seMsb_to3_uid292_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((2 downto 1 => xMSB_uid264_fxpInPostAlign_X_uid60_block_rsrvd_fix_b(0)) & xMSB_uid264_fxpInPostAlign_X_uid60_block_rsrvd_fix_b));
    seMsb_to3_uid292_b <= STD_LOGIC_VECTOR(seMsb_to3_uid292_in(2 downto 0));

    -- rightShiftStage2Idx3Rng3_uid293_fxpInPostAlign_X_uid60_block_rsrvd_fix(BITSELECT,292)@11
    rightShiftStage2Idx3Rng3_uid293_fxpInPostAlign_X_uid60_block_rsrvd_fix_b <= rightShiftStage1_uid286_fxpInPostAlign_X_uid60_block_rsrvd_fix_q(33 downto 3);

    -- rightShiftStage2Idx3_uid294_fxpInPostAlign_X_uid60_block_rsrvd_fix(BITJOIN,293)@11
    rightShiftStage2Idx3_uid294_fxpInPostAlign_X_uid60_block_rsrvd_fix_q <= seMsb_to3_uid292_b & rightShiftStage2Idx3Rng3_uid293_fxpInPostAlign_X_uid60_block_rsrvd_fix_b;

    -- seMsb_to2_uid289(BITSELECT,288)@11
    seMsb_to2_uid289_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((1 downto 1 => xMSB_uid264_fxpInPostAlign_X_uid60_block_rsrvd_fix_b(0)) & xMSB_uid264_fxpInPostAlign_X_uid60_block_rsrvd_fix_b));
    seMsb_to2_uid289_b <= STD_LOGIC_VECTOR(seMsb_to2_uid289_in(1 downto 0));

    -- rightShiftStage2Idx2Rng2_uid290_fxpInPostAlign_X_uid60_block_rsrvd_fix(BITSELECT,289)@11
    rightShiftStage2Idx2Rng2_uid290_fxpInPostAlign_X_uid60_block_rsrvd_fix_b <= rightShiftStage1_uid286_fxpInPostAlign_X_uid60_block_rsrvd_fix_q(33 downto 2);

    -- rightShiftStage2Idx2_uid291_fxpInPostAlign_X_uid60_block_rsrvd_fix(BITJOIN,290)@11
    rightShiftStage2Idx2_uid291_fxpInPostAlign_X_uid60_block_rsrvd_fix_q <= seMsb_to2_uid289_b & rightShiftStage2Idx2Rng2_uid290_fxpInPostAlign_X_uid60_block_rsrvd_fix_b;

    -- rightShiftStage2Idx1Rng1_uid287_fxpInPostAlign_X_uid60_block_rsrvd_fix(BITSELECT,286)@11
    rightShiftStage2Idx1Rng1_uid287_fxpInPostAlign_X_uid60_block_rsrvd_fix_b <= rightShiftStage1_uid286_fxpInPostAlign_X_uid60_block_rsrvd_fix_q(33 downto 1);

    -- rightShiftStage2Idx1_uid288_fxpInPostAlign_X_uid60_block_rsrvd_fix(BITJOIN,287)@11
    rightShiftStage2Idx1_uid288_fxpInPostAlign_X_uid60_block_rsrvd_fix_q <= xMSB_uid264_fxpInPostAlign_X_uid60_block_rsrvd_fix_b & rightShiftStage2Idx1Rng1_uid287_fxpInPostAlign_X_uid60_block_rsrvd_fix_b;

    -- seMsb_to12_uid282(BITSELECT,281)@11
    seMsb_to12_uid282_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 1 => xMSB_uid264_fxpInPostAlign_X_uid60_block_rsrvd_fix_b(0)) & xMSB_uid264_fxpInPostAlign_X_uid60_block_rsrvd_fix_b));
    seMsb_to12_uid282_b <= STD_LOGIC_VECTOR(seMsb_to12_uid282_in(11 downto 0));

    -- rightShiftStage1Idx3Rng12_uid283_fxpInPostAlign_X_uid60_block_rsrvd_fix(BITSELECT,282)@11
    rightShiftStage1Idx3Rng12_uid283_fxpInPostAlign_X_uid60_block_rsrvd_fix_b <= rightShiftStage0_uid275_fxpInPostAlign_X_uid60_block_rsrvd_fix_q(33 downto 12);

    -- rightShiftStage1Idx3_uid284_fxpInPostAlign_X_uid60_block_rsrvd_fix(BITJOIN,283)@11
    rightShiftStage1Idx3_uid284_fxpInPostAlign_X_uid60_block_rsrvd_fix_q <= seMsb_to12_uid282_b & rightShiftStage1Idx3Rng12_uid283_fxpInPostAlign_X_uid60_block_rsrvd_fix_b;

    -- seMsb_to8_uid279(BITSELECT,278)@11
    seMsb_to8_uid279_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((7 downto 1 => xMSB_uid264_fxpInPostAlign_X_uid60_block_rsrvd_fix_b(0)) & xMSB_uid264_fxpInPostAlign_X_uid60_block_rsrvd_fix_b));
    seMsb_to8_uid279_b <= STD_LOGIC_VECTOR(seMsb_to8_uid279_in(7 downto 0));

    -- rightShiftStage1Idx2Rng8_uid280_fxpInPostAlign_X_uid60_block_rsrvd_fix(BITSELECT,279)@11
    rightShiftStage1Idx2Rng8_uid280_fxpInPostAlign_X_uid60_block_rsrvd_fix_b <= rightShiftStage0_uid275_fxpInPostAlign_X_uid60_block_rsrvd_fix_q(33 downto 8);

    -- rightShiftStage1Idx2_uid281_fxpInPostAlign_X_uid60_block_rsrvd_fix(BITJOIN,280)@11
    rightShiftStage1Idx2_uid281_fxpInPostAlign_X_uid60_block_rsrvd_fix_q <= seMsb_to8_uid279_b & rightShiftStage1Idx2Rng8_uid280_fxpInPostAlign_X_uid60_block_rsrvd_fix_b;

    -- seMsb_to4_uid276(BITSELECT,275)@11
    seMsb_to4_uid276_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 1 => xMSB_uid264_fxpInPostAlign_X_uid60_block_rsrvd_fix_b(0)) & xMSB_uid264_fxpInPostAlign_X_uid60_block_rsrvd_fix_b));
    seMsb_to4_uid276_b <= STD_LOGIC_VECTOR(seMsb_to4_uid276_in(3 downto 0));

    -- rightShiftStage1Idx1Rng4_uid277_fxpInPostAlign_X_uid60_block_rsrvd_fix(BITSELECT,276)@11
    rightShiftStage1Idx1Rng4_uid277_fxpInPostAlign_X_uid60_block_rsrvd_fix_b <= rightShiftStage0_uid275_fxpInPostAlign_X_uid60_block_rsrvd_fix_q(33 downto 4);

    -- rightShiftStage1Idx1_uid278_fxpInPostAlign_X_uid60_block_rsrvd_fix(BITJOIN,277)@11
    rightShiftStage1Idx1_uid278_fxpInPostAlign_X_uid60_block_rsrvd_fix_q <= seMsb_to4_uid276_b & rightShiftStage1Idx1Rng4_uid277_fxpInPostAlign_X_uid60_block_rsrvd_fix_b;

    -- stageIndexName_to34_uid272(BITSELECT,271)@11
    stageIndexName_to34_uid272_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 1 => xMSB_uid264_fxpInPostAlign_X_uid60_block_rsrvd_fix_b(0)) & xMSB_uid264_fxpInPostAlign_X_uid60_block_rsrvd_fix_b));
    stageIndexName_to34_uid272_b <= STD_LOGIC_VECTOR(stageIndexName_to34_uid272_in(33 downto 0));

    -- seMsb_to32_uid269(BITSELECT,268)@11
    seMsb_to32_uid269_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 1 => xMSB_uid264_fxpInPostAlign_X_uid60_block_rsrvd_fix_b(0)) & xMSB_uid264_fxpInPostAlign_X_uid60_block_rsrvd_fix_b));
    seMsb_to32_uid269_b <= STD_LOGIC_VECTOR(seMsb_to32_uid269_in(31 downto 0));

    -- rightShiftStage0Idx2Rng32_uid270_fxpInPostAlign_X_uid60_block_rsrvd_fix(BITSELECT,269)@11
    rightShiftStage0Idx2Rng32_uid270_fxpInPostAlign_X_uid60_block_rsrvd_fix_b <= redist21_fxpInPreAlign_uid55_block_rsrvd_fix_b_1_q(33 downto 32);

    -- rightShiftStage0Idx2_uid271_fxpInPostAlign_X_uid60_block_rsrvd_fix(BITJOIN,270)@11
    rightShiftStage0Idx2_uid271_fxpInPostAlign_X_uid60_block_rsrvd_fix_q <= seMsb_to32_uid269_b & rightShiftStage0Idx2Rng32_uid270_fxpInPostAlign_X_uid60_block_rsrvd_fix_b;

    -- seMsb_to16_uid266(BITSELECT,265)@11
    seMsb_to16_uid266_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 1 => xMSB_uid264_fxpInPostAlign_X_uid60_block_rsrvd_fix_b(0)) & xMSB_uid264_fxpInPostAlign_X_uid60_block_rsrvd_fix_b));
    seMsb_to16_uid266_b <= STD_LOGIC_VECTOR(seMsb_to16_uid266_in(15 downto 0));

    -- rightShiftStage0Idx1Rng16_uid267_fxpInPostAlign_X_uid60_block_rsrvd_fix(BITSELECT,266)@11
    rightShiftStage0Idx1Rng16_uid267_fxpInPostAlign_X_uid60_block_rsrvd_fix_b <= redist21_fxpInPreAlign_uid55_block_rsrvd_fix_b_1_q(33 downto 16);

    -- rightShiftStage0Idx1_uid268_fxpInPostAlign_X_uid60_block_rsrvd_fix(BITJOIN,267)@11
    rightShiftStage0Idx1_uid268_fxpInPostAlign_X_uid60_block_rsrvd_fix_q <= seMsb_to16_uid266_b & rightShiftStage0Idx1Rng16_uid267_fxpInPostAlign_X_uid60_block_rsrvd_fix_b;

    -- redist7_rightShiftStageSel3Dto2_uid248_fxpInPostAlign_uid47_block_rsrvd_fix_merged_bit_select_d_4(DELAY,310)
    redist7_rightShiftStageSel3Dto2_uid248_fxpInPostAlign_uid47_block_rsrvd_fix_merged_bit_select_d_4 : dspba_delay
    GENERIC MAP ( width => 2, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rightShiftStageSel3Dto2_uid248_fxpInPostAlign_uid47_block_rsrvd_fix_merged_bit_select_d, xout => redist7_rightShiftStageSel3Dto2_uid248_fxpInPostAlign_uid47_block_rsrvd_fix_merged_bit_select_d_4_q, clk => clock, aclr => resetn );

    -- rightShiftStage0_uid275_fxpInPostAlign_X_uid60_block_rsrvd_fix(MUX,274)@11
    rightShiftStage0_uid275_fxpInPostAlign_X_uid60_block_rsrvd_fix_s <= redist7_rightShiftStageSel3Dto2_uid248_fxpInPostAlign_uid47_block_rsrvd_fix_merged_bit_select_d_4_q;
    rightShiftStage0_uid275_fxpInPostAlign_X_uid60_block_rsrvd_fix_combproc: PROCESS (rightShiftStage0_uid275_fxpInPostAlign_X_uid60_block_rsrvd_fix_s, redist21_fxpInPreAlign_uid55_block_rsrvd_fix_b_1_q, rightShiftStage0Idx1_uid268_fxpInPostAlign_X_uid60_block_rsrvd_fix_q, rightShiftStage0Idx2_uid271_fxpInPostAlign_X_uid60_block_rsrvd_fix_q, stageIndexName_to34_uid272_b)
    BEGIN
        CASE (rightShiftStage0_uid275_fxpInPostAlign_X_uid60_block_rsrvd_fix_s) IS
            WHEN "00" => rightShiftStage0_uid275_fxpInPostAlign_X_uid60_block_rsrvd_fix_q <= redist21_fxpInPreAlign_uid55_block_rsrvd_fix_b_1_q;
            WHEN "01" => rightShiftStage0_uid275_fxpInPostAlign_X_uid60_block_rsrvd_fix_q <= rightShiftStage0Idx1_uid268_fxpInPostAlign_X_uid60_block_rsrvd_fix_q;
            WHEN "10" => rightShiftStage0_uid275_fxpInPostAlign_X_uid60_block_rsrvd_fix_q <= rightShiftStage0Idx2_uid271_fxpInPostAlign_X_uid60_block_rsrvd_fix_q;
            WHEN "11" => rightShiftStage0_uid275_fxpInPostAlign_X_uid60_block_rsrvd_fix_q <= stageIndexName_to34_uid272_b;
            WHEN OTHERS => rightShiftStage0_uid275_fxpInPostAlign_X_uid60_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist5_rightShiftStageSel3Dto2_uid248_fxpInPostAlign_uid47_block_rsrvd_fix_merged_bit_select_b_4(DELAY,308)
    redist5_rightShiftStageSel3Dto2_uid248_fxpInPostAlign_uid47_block_rsrvd_fix_merged_bit_select_b_4 : dspba_delay
    GENERIC MAP ( width => 2, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rightShiftStageSel3Dto2_uid248_fxpInPostAlign_uid47_block_rsrvd_fix_merged_bit_select_b, xout => redist5_rightShiftStageSel3Dto2_uid248_fxpInPostAlign_uid47_block_rsrvd_fix_merged_bit_select_b_4_q, clk => clock, aclr => resetn );

    -- rightShiftStage1_uid286_fxpInPostAlign_X_uid60_block_rsrvd_fix(MUX,285)@11
    rightShiftStage1_uid286_fxpInPostAlign_X_uid60_block_rsrvd_fix_s <= redist5_rightShiftStageSel3Dto2_uid248_fxpInPostAlign_uid47_block_rsrvd_fix_merged_bit_select_b_4_q;
    rightShiftStage1_uid286_fxpInPostAlign_X_uid60_block_rsrvd_fix_combproc: PROCESS (rightShiftStage1_uid286_fxpInPostAlign_X_uid60_block_rsrvd_fix_s, rightShiftStage0_uid275_fxpInPostAlign_X_uid60_block_rsrvd_fix_q, rightShiftStage1Idx1_uid278_fxpInPostAlign_X_uid60_block_rsrvd_fix_q, rightShiftStage1Idx2_uid281_fxpInPostAlign_X_uid60_block_rsrvd_fix_q, rightShiftStage1Idx3_uid284_fxpInPostAlign_X_uid60_block_rsrvd_fix_q)
    BEGIN
        CASE (rightShiftStage1_uid286_fxpInPostAlign_X_uid60_block_rsrvd_fix_s) IS
            WHEN "00" => rightShiftStage1_uid286_fxpInPostAlign_X_uid60_block_rsrvd_fix_q <= rightShiftStage0_uid275_fxpInPostAlign_X_uid60_block_rsrvd_fix_q;
            WHEN "01" => rightShiftStage1_uid286_fxpInPostAlign_X_uid60_block_rsrvd_fix_q <= rightShiftStage1Idx1_uid278_fxpInPostAlign_X_uid60_block_rsrvd_fix_q;
            WHEN "10" => rightShiftStage1_uid286_fxpInPostAlign_X_uid60_block_rsrvd_fix_q <= rightShiftStage1Idx2_uid281_fxpInPostAlign_X_uid60_block_rsrvd_fix_q;
            WHEN "11" => rightShiftStage1_uid286_fxpInPostAlign_X_uid60_block_rsrvd_fix_q <= rightShiftStage1Idx3_uid284_fxpInPostAlign_X_uid60_block_rsrvd_fix_q;
            WHEN OTHERS => rightShiftStage1_uid286_fxpInPostAlign_X_uid60_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist6_rightShiftStageSel3Dto2_uid248_fxpInPostAlign_uid47_block_rsrvd_fix_merged_bit_select_c_4(DELAY,309)
    redist6_rightShiftStageSel3Dto2_uid248_fxpInPostAlign_uid47_block_rsrvd_fix_merged_bit_select_c_4 : dspba_delay
    GENERIC MAP ( width => 2, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rightShiftStageSel3Dto2_uid248_fxpInPostAlign_uid47_block_rsrvd_fix_merged_bit_select_c, xout => redist6_rightShiftStageSel3Dto2_uid248_fxpInPostAlign_uid47_block_rsrvd_fix_merged_bit_select_c_4_q, clk => clock, aclr => resetn );

    -- rightShiftStage2_uid296_fxpInPostAlign_X_uid60_block_rsrvd_fix(MUX,295)@11 + 1
    rightShiftStage2_uid296_fxpInPostAlign_X_uid60_block_rsrvd_fix_s <= redist6_rightShiftStageSel3Dto2_uid248_fxpInPostAlign_uid47_block_rsrvd_fix_merged_bit_select_c_4_q;
    rightShiftStage2_uid296_fxpInPostAlign_X_uid60_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            rightShiftStage2_uid296_fxpInPostAlign_X_uid60_block_rsrvd_fix_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (rightShiftStage2_uid296_fxpInPostAlign_X_uid60_block_rsrvd_fix_s) IS
                WHEN "00" => rightShiftStage2_uid296_fxpInPostAlign_X_uid60_block_rsrvd_fix_q <= rightShiftStage1_uid286_fxpInPostAlign_X_uid60_block_rsrvd_fix_q;
                WHEN "01" => rightShiftStage2_uid296_fxpInPostAlign_X_uid60_block_rsrvd_fix_q <= rightShiftStage2Idx1_uid288_fxpInPostAlign_X_uid60_block_rsrvd_fix_q;
                WHEN "10" => rightShiftStage2_uid296_fxpInPostAlign_X_uid60_block_rsrvd_fix_q <= rightShiftStage2Idx2_uid291_fxpInPostAlign_X_uid60_block_rsrvd_fix_q;
                WHEN "11" => rightShiftStage2_uid296_fxpInPostAlign_X_uid60_block_rsrvd_fix_q <= rightShiftStage2Idx3_uid294_fxpInPostAlign_X_uid60_block_rsrvd_fix_q;
                WHEN OTHERS => rightShiftStage2_uid296_fxpInPostAlign_X_uid60_block_rsrvd_fix_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- aPostPad_uid63_block_rsrvd_fix(BITJOIN,62)@12
    aPostPad_uid63_block_rsrvd_fix_q <= rightShiftStage2_uid296_fxpInPostAlign_X_uid60_block_rsrvd_fix_q & cstZeroWE_uid14_block_rsrvd_fix_q;

    -- yExt_uid64_block_rsrvd_fix(SUB,63)@12
    yExt_uid64_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((43 downto 42 => aPostPad_uid63_block_rsrvd_fix_q(41)) & aPostPad_uid63_block_rsrvd_fix_q));
    yExt_uid64_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((43 downto 43 => sRA0_uid179_eRndXlog2_uid50_block_rsrvd_fix_q(42)) & sRA0_uid179_eRndXlog2_uid50_block_rsrvd_fix_q));
    yExt_uid64_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(yExt_uid64_block_rsrvd_fix_a) - SIGNED(yExt_uid64_block_rsrvd_fix_b));
    yExt_uid64_block_rsrvd_fix_q <= yExt_uid64_block_rsrvd_fix_o(43 downto 0);

    -- yRed_uid67_block_rsrvd_fix(BITSELECT,66)@12
    yRed_uid67_block_rsrvd_fix_in <= yExt_uid64_block_rsrvd_fix_q(31 downto 0);
    yRed_uid67_block_rsrvd_fix_b <= yRed_uid67_block_rsrvd_fix_in(31 downto 6);

    -- redist19_yRed_uid67_block_rsrvd_fix_b_1(DELAY,322)
    redist19_yRed_uid67_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 26, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => yRed_uid67_block_rsrvd_fix_b, xout => redist19_yRed_uid67_block_rsrvd_fix_b_1_q, clk => clock, aclr => resetn );

    -- msbUYExt_uid65_block_rsrvd_fix(BITSELECT,64)@12
    msbUYExt_uid65_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(yExt_uid64_block_rsrvd_fix_q(43 downto 43));

    -- redist20_msbUYExt_uid65_block_rsrvd_fix_b_1(DELAY,323)
    redist20_msbUYExt_uid65_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => msbUYExt_uid65_block_rsrvd_fix_b, xout => redist20_msbUYExt_uid65_block_rsrvd_fix_b_1_q, clk => clock, aclr => resetn );

    -- yRedPostMux_uid68_block_rsrvd_fix(MUX,67)@13
    yRedPostMux_uid68_block_rsrvd_fix_s <= redist20_msbUYExt_uid65_block_rsrvd_fix_b_1_q;
    yRedPostMux_uid68_block_rsrvd_fix_combproc: PROCESS (yRedPostMux_uid68_block_rsrvd_fix_s, redist19_yRed_uid67_block_rsrvd_fix_b_1_q, zY_uid66_block_rsrvd_fix_q)
    BEGIN
        CASE (yRedPostMux_uid68_block_rsrvd_fix_s) IS
            WHEN "0" => yRedPostMux_uid68_block_rsrvd_fix_q <= redist19_yRed_uid67_block_rsrvd_fix_b_1_q;
            WHEN "1" => yRedPostMux_uid68_block_rsrvd_fix_q <= zY_uid66_block_rsrvd_fix_q;
            WHEN OTHERS => yRedPostMux_uid68_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- yAddr_uid70_block_rsrvd_fix_merged_bit_select(BITSELECT,300)@13
    yAddr_uid70_block_rsrvd_fix_merged_bit_select_b <= yRedPostMux_uid68_block_rsrvd_fix_q(25 downto 19);
    yAddr_uid70_block_rsrvd_fix_merged_bit_select_c <= yRedPostMux_uid68_block_rsrvd_fix_q(18 downto 0);

    -- memoryC2_uid211_expTables(LOOKUP,210)@13
    memoryC2_uid211_expTables_combproc: PROCESS (yAddr_uid70_block_rsrvd_fix_merged_bit_select_b)
    BEGIN
        -- Begin reserved scope level
        CASE (yAddr_uid70_block_rsrvd_fix_merged_bit_select_b) IS
            WHEN "0000000" => memoryC2_uid211_expTables_q <= "00100000000111";
            WHEN "0000001" => memoryC2_uid211_expTables_q <= "00100000011010";
            WHEN "0000010" => memoryC2_uid211_expTables_q <= "00100000101001";
            WHEN "0000011" => memoryC2_uid211_expTables_q <= "00100000111001";
            WHEN "0000100" => memoryC2_uid211_expTables_q <= "00100001001001";
            WHEN "0000101" => memoryC2_uid211_expTables_q <= "00100001011000";
            WHEN "0000110" => memoryC2_uid211_expTables_q <= "00100001101010";
            WHEN "0000111" => memoryC2_uid211_expTables_q <= "00100001111101";
            WHEN "0001000" => memoryC2_uid211_expTables_q <= "00100010001100";
            WHEN "0001001" => memoryC2_uid211_expTables_q <= "00100010011101";
            WHEN "0001010" => memoryC2_uid211_expTables_q <= "00100010101111";
            WHEN "0001011" => memoryC2_uid211_expTables_q <= "00100011000001";
            WHEN "0001100" => memoryC2_uid211_expTables_q <= "00100011010010";
            WHEN "0001101" => memoryC2_uid211_expTables_q <= "00100011100100";
            WHEN "0001110" => memoryC2_uid211_expTables_q <= "00100011110110";
            WHEN "0001111" => memoryC2_uid211_expTables_q <= "00100100000111";
            WHEN "0010000" => memoryC2_uid211_expTables_q <= "00100100011010";
            WHEN "0010001" => memoryC2_uid211_expTables_q <= "00100100101011";
            WHEN "0010010" => memoryC2_uid211_expTables_q <= "00100100111110";
            WHEN "0010011" => memoryC2_uid211_expTables_q <= "00100101010001";
            WHEN "0010100" => memoryC2_uid211_expTables_q <= "00100101100100";
            WHEN "0010101" => memoryC2_uid211_expTables_q <= "00100101110111";
            WHEN "0010110" => memoryC2_uid211_expTables_q <= "00100110001000";
            WHEN "0010111" => memoryC2_uid211_expTables_q <= "00100110011110";
            WHEN "0011000" => memoryC2_uid211_expTables_q <= "00100110101111";
            WHEN "0011001" => memoryC2_uid211_expTables_q <= "00100111000101";
            WHEN "0011010" => memoryC2_uid211_expTables_q <= "00100111011000";
            WHEN "0011011" => memoryC2_uid211_expTables_q <= "00100111101001";
            WHEN "0011100" => memoryC2_uid211_expTables_q <= "00101000000000";
            WHEN "0011101" => memoryC2_uid211_expTables_q <= "00101000010011";
            WHEN "0011110" => memoryC2_uid211_expTables_q <= "00101000101000";
            WHEN "0011111" => memoryC2_uid211_expTables_q <= "00101000111100";
            WHEN "0100000" => memoryC2_uid211_expTables_q <= "00101001001110";
            WHEN "0100001" => memoryC2_uid211_expTables_q <= "00101001100101";
            WHEN "0100010" => memoryC2_uid211_expTables_q <= "00101001111000";
            WHEN "0100011" => memoryC2_uid211_expTables_q <= "00101010001111";
            WHEN "0100100" => memoryC2_uid211_expTables_q <= "00101010100011";
            WHEN "0100101" => memoryC2_uid211_expTables_q <= "00101010111000";
            WHEN "0100110" => memoryC2_uid211_expTables_q <= "00101011001100";
            WHEN "0100111" => memoryC2_uid211_expTables_q <= "00101011100100";
            WHEN "0101000" => memoryC2_uid211_expTables_q <= "00101011111100";
            WHEN "0101001" => memoryC2_uid211_expTables_q <= "00101100001111";
            WHEN "0101010" => memoryC2_uid211_expTables_q <= "00101100100111";
            WHEN "0101011" => memoryC2_uid211_expTables_q <= "00101100111100";
            WHEN "0101100" => memoryC2_uid211_expTables_q <= "00101101010010";
            WHEN "0101101" => memoryC2_uid211_expTables_q <= "00101101101011";
            WHEN "0101110" => memoryC2_uid211_expTables_q <= "00101110000010";
            WHEN "0101111" => memoryC2_uid211_expTables_q <= "00101110011010";
            WHEN "0110000" => memoryC2_uid211_expTables_q <= "00101110101111";
            WHEN "0110001" => memoryC2_uid211_expTables_q <= "00101111000101";
            WHEN "0110010" => memoryC2_uid211_expTables_q <= "00101111100000";
            WHEN "0110011" => memoryC2_uid211_expTables_q <= "00101111111000";
            WHEN "0110100" => memoryC2_uid211_expTables_q <= "00110000001101";
            WHEN "0110101" => memoryC2_uid211_expTables_q <= "00110000101000";
            WHEN "0110110" => memoryC2_uid211_expTables_q <= "00110000111110";
            WHEN "0110111" => memoryC2_uid211_expTables_q <= "00110001011001";
            WHEN "0111000" => memoryC2_uid211_expTables_q <= "00110001110000";
            WHEN "0111001" => memoryC2_uid211_expTables_q <= "00110010001010";
            WHEN "0111010" => memoryC2_uid211_expTables_q <= "00110010100010";
            WHEN "0111011" => memoryC2_uid211_expTables_q <= "00110010111100";
            WHEN "0111100" => memoryC2_uid211_expTables_q <= "00110011010110";
            WHEN "0111101" => memoryC2_uid211_expTables_q <= "00110011110000";
            WHEN "0111110" => memoryC2_uid211_expTables_q <= "00110100000111";
            WHEN "0111111" => memoryC2_uid211_expTables_q <= "00110100100011";
            WHEN "1000000" => memoryC2_uid211_expTables_q <= "00110100111101";
            WHEN "1000001" => memoryC2_uid211_expTables_q <= "00110101011001";
            WHEN "1000010" => memoryC2_uid211_expTables_q <= "00110101110011";
            WHEN "1000011" => memoryC2_uid211_expTables_q <= "00110110001110";
            WHEN "1000100" => memoryC2_uid211_expTables_q <= "00110110101001";
            WHEN "1000101" => memoryC2_uid211_expTables_q <= "00110111000101";
            WHEN "1000110" => memoryC2_uid211_expTables_q <= "00110111100000";
            WHEN "1000111" => memoryC2_uid211_expTables_q <= "00110111111011";
            WHEN "1001000" => memoryC2_uid211_expTables_q <= "00111000011010";
            WHEN "1001001" => memoryC2_uid211_expTables_q <= "00111000110100";
            WHEN "1001010" => memoryC2_uid211_expTables_q <= "00111001010001";
            WHEN "1001011" => memoryC2_uid211_expTables_q <= "00111001101110";
            WHEN "1001100" => memoryC2_uid211_expTables_q <= "00111010001010";
            WHEN "1001101" => memoryC2_uid211_expTables_q <= "00111010100111";
            WHEN "1001110" => memoryC2_uid211_expTables_q <= "00111011000111";
            WHEN "1001111" => memoryC2_uid211_expTables_q <= "00111011100000";
            WHEN "1010000" => memoryC2_uid211_expTables_q <= "00111100000010";
            WHEN "1010001" => memoryC2_uid211_expTables_q <= "00111100011110";
            WHEN "1010010" => memoryC2_uid211_expTables_q <= "00111101000000";
            WHEN "1010011" => memoryC2_uid211_expTables_q <= "00111101011101";
            WHEN "1010100" => memoryC2_uid211_expTables_q <= "00111101111010";
            WHEN "1010101" => memoryC2_uid211_expTables_q <= "00111110011011";
            WHEN "1010110" => memoryC2_uid211_expTables_q <= "00111110111010";
            WHEN "1010111" => memoryC2_uid211_expTables_q <= "00111111011001";
            WHEN "1011000" => memoryC2_uid211_expTables_q <= "00111111111010";
            WHEN "1011001" => memoryC2_uid211_expTables_q <= "01000000010111";
            WHEN "1011010" => memoryC2_uid211_expTables_q <= "01000000111001";
            WHEN "1011011" => memoryC2_uid211_expTables_q <= "01000001011011";
            WHEN "1011100" => memoryC2_uid211_expTables_q <= "01000001111011";
            WHEN "1011101" => memoryC2_uid211_expTables_q <= "01000010011100";
            WHEN "1011110" => memoryC2_uid211_expTables_q <= "01000010111111";
            WHEN "1011111" => memoryC2_uid211_expTables_q <= "01000011011111";
            WHEN "1100000" => memoryC2_uid211_expTables_q <= "01000100000011";
            WHEN "1100001" => memoryC2_uid211_expTables_q <= "01000100100001";
            WHEN "1100010" => memoryC2_uid211_expTables_q <= "01000101000100";
            WHEN "1100011" => memoryC2_uid211_expTables_q <= "01000101101001";
            WHEN "1100100" => memoryC2_uid211_expTables_q <= "01000110001100";
            WHEN "1100101" => memoryC2_uid211_expTables_q <= "01000110101111";
            WHEN "1100110" => memoryC2_uid211_expTables_q <= "01000111010010";
            WHEN "1100111" => memoryC2_uid211_expTables_q <= "01000111110101";
            WHEN "1101000" => memoryC2_uid211_expTables_q <= "01001000011010";
            WHEN "1101001" => memoryC2_uid211_expTables_q <= "01001000111100";
            WHEN "1101010" => memoryC2_uid211_expTables_q <= "01001001100100";
            WHEN "1101011" => memoryC2_uid211_expTables_q <= "01001010000110";
            WHEN "1101100" => memoryC2_uid211_expTables_q <= "01001010101110";
            WHEN "1101101" => memoryC2_uid211_expTables_q <= "01001011010001";
            WHEN "1101110" => memoryC2_uid211_expTables_q <= "01001011111000";
            WHEN "1101111" => memoryC2_uid211_expTables_q <= "01001100011101";
            WHEN "1110000" => memoryC2_uid211_expTables_q <= "01001101000100";
            WHEN "1110001" => memoryC2_uid211_expTables_q <= "01001101101101";
            WHEN "1110010" => memoryC2_uid211_expTables_q <= "01001110010100";
            WHEN "1110011" => memoryC2_uid211_expTables_q <= "01001110111000";
            WHEN "1110100" => memoryC2_uid211_expTables_q <= "01001111100010";
            WHEN "1110101" => memoryC2_uid211_expTables_q <= "01010000000111";
            WHEN "1110110" => memoryC2_uid211_expTables_q <= "01010000110001";
            WHEN "1110111" => memoryC2_uid211_expTables_q <= "01010001011001";
            WHEN "1111000" => memoryC2_uid211_expTables_q <= "01010010000010";
            WHEN "1111001" => memoryC2_uid211_expTables_q <= "01010010101011";
            WHEN "1111010" => memoryC2_uid211_expTables_q <= "01010011010101";
            WHEN "1111011" => memoryC2_uid211_expTables_q <= "01010100000000";
            WHEN "1111100" => memoryC2_uid211_expTables_q <= "01010100101010";
            WHEN "1111101" => memoryC2_uid211_expTables_q <= "01010101010101";
            WHEN "1111110" => memoryC2_uid211_expTables_q <= "01010101111111";
            WHEN "1111111" => memoryC2_uid211_expTables_q <= "01010110101001";
            WHEN OTHERS => -- unreachable
                           memoryC2_uid211_expTables_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- yT1_uid217_invPolyEval(BITSELECT,216)@13
    yT1_uid217_invPolyEval_b <= yAddr_uid70_block_rsrvd_fix_merged_bit_select_c(18 downto 5);

    -- prodXY_uid230_pT1_uid218_invPolyEval_cma(CHAINMULTADD,297)@13 + 2
    prodXY_uid230_pT1_uid218_invPolyEval_cma_reset <= not (resetn);
    prodXY_uid230_pT1_uid218_invPolyEval_cma_ena0 <= '1';
    prodXY_uid230_pT1_uid218_invPolyEval_cma_ena1 <= prodXY_uid230_pT1_uid218_invPolyEval_cma_ena0;
    prodXY_uid230_pT1_uid218_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid230_pT1_uid218_invPolyEval_cma_a0(0),15));
    prodXY_uid230_pT1_uid218_invPolyEval_cma_p(0) <= prodXY_uid230_pT1_uid218_invPolyEval_cma_l(0) * prodXY_uid230_pT1_uid218_invPolyEval_cma_c0(0);
    prodXY_uid230_pT1_uid218_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid230_pT1_uid218_invPolyEval_cma_p(0),29);
    prodXY_uid230_pT1_uid218_invPolyEval_cma_w(0) <= prodXY_uid230_pT1_uid218_invPolyEval_cma_u(0);
    prodXY_uid230_pT1_uid218_invPolyEval_cma_x(0) <= prodXY_uid230_pT1_uid218_invPolyEval_cma_w(0);
    prodXY_uid230_pT1_uid218_invPolyEval_cma_y(0) <= prodXY_uid230_pT1_uid218_invPolyEval_cma_x(0);
    prodXY_uid230_pT1_uid218_invPolyEval_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodXY_uid230_pT1_uid218_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid230_pT1_uid218_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (prodXY_uid230_pT1_uid218_invPolyEval_cma_ena0 = '1') THEN
                prodXY_uid230_pT1_uid218_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(yT1_uid217_invPolyEval_b),14);
                prodXY_uid230_pT1_uid218_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(memoryC2_uid211_expTables_q),14);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid230_pT1_uid218_invPolyEval_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodXY_uid230_pT1_uid218_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (prodXY_uid230_pT1_uid218_invPolyEval_cma_ena1 = '1') THEN
                prodXY_uid230_pT1_uid218_invPolyEval_cma_s(0) <= prodXY_uid230_pT1_uid218_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid230_pT1_uid218_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid230_pT1_uid218_invPolyEval_cma_s(0)(27 downto 0)), xout => prodXY_uid230_pT1_uid218_invPolyEval_cma_qq, clk => clock, aclr => resetn );
    prodXY_uid230_pT1_uid218_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid230_pT1_uid218_invPolyEval_cma_qq(27 downto 0));

    -- osig_uid231_pT1_uid218_invPolyEval(BITSELECT,230)@15
    osig_uid231_pT1_uid218_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid230_pT1_uid218_invPolyEval_cma_q(27 downto 13));

    -- highBBits_uid220_invPolyEval(BITSELECT,219)@15
    highBBits_uid220_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid231_pT1_uid218_invPolyEval_b(14 downto 1));

    -- redist2_yAddr_uid70_block_rsrvd_fix_merged_bit_select_b_1(DELAY,305)
    redist2_yAddr_uid70_block_rsrvd_fix_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 7, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => yAddr_uid70_block_rsrvd_fix_merged_bit_select_b, xout => redist2_yAddr_uid70_block_rsrvd_fix_merged_bit_select_b_1_q, clk => clock, aclr => resetn );

    -- memoryC1_uid208_expTables(LOOKUP,207)@14 + 1
    memoryC1_uid208_expTables_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            memoryC1_uid208_expTables_q <= "0001111111111111111110";
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (redist2_yAddr_uid70_block_rsrvd_fix_merged_bit_select_b_1_q) IS
                WHEN "0000000" => memoryC1_uid208_expTables_q <= "0001111111111111111110";
                WHEN "0000001" => memoryC1_uid208_expTables_q <= "0010000001000000001011";
                WHEN "0000010" => memoryC1_uid208_expTables_q <= "0010000010000000111101";
                WHEN "0000011" => memoryC1_uid208_expTables_q <= "0010000011000010001110";
                WHEN "0000100" => memoryC1_uid208_expTables_q <= "0010000100000100000000";
                WHEN "0000101" => memoryC1_uid208_expTables_q <= "0010000101000110010100";
                WHEN "0000110" => memoryC1_uid208_expTables_q <= "0010000110001001000110";
                WHEN "0000111" => memoryC1_uid208_expTables_q <= "0010000111001100011010";
                WHEN "0001000" => memoryC1_uid208_expTables_q <= "0010001000010000010011";
                WHEN "0001001" => memoryC1_uid208_expTables_q <= "0010001001010100101101";
                WHEN "0001010" => memoryC1_uid208_expTables_q <= "0010001010011001101000";
                WHEN "0001011" => memoryC1_uid208_expTables_q <= "0010001011011111000101";
                WHEN "0001100" => memoryC1_uid208_expTables_q <= "0010001100100101000111";
                WHEN "0001101" => memoryC1_uid208_expTables_q <= "0010001101101011101011";
                WHEN "0001110" => memoryC1_uid208_expTables_q <= "0010001110110010110010";
                WHEN "0001111" => memoryC1_uid208_expTables_q <= "0010001111111010011110";
                WHEN "0010000" => memoryC1_uid208_expTables_q <= "0010010001000010101100";
                WHEN "0010001" => memoryC1_uid208_expTables_q <= "0010010010001011100010";
                WHEN "0010010" => memoryC1_uid208_expTables_q <= "0010010011010100111001";
                WHEN "0010011" => memoryC1_uid208_expTables_q <= "0010010100011110110110";
                WHEN "0010100" => memoryC1_uid208_expTables_q <= "0010010101101001010111";
                WHEN "0010101" => memoryC1_uid208_expTables_q <= "0010010110110100011111";
                WHEN "0010110" => memoryC1_uid208_expTables_q <= "0010011000000000001101";
                WHEN "0010111" => memoryC1_uid208_expTables_q <= "0010011001001100011110";
                WHEN "0011000" => memoryC1_uid208_expTables_q <= "0010011010011001011001";
                WHEN "0011001" => memoryC1_uid208_expTables_q <= "0010011011100110110111";
                WHEN "0011010" => memoryC1_uid208_expTables_q <= "0010011100110100111111";
                WHEN "0011011" => memoryC1_uid208_expTables_q <= "0010011110000011101111";
                WHEN "0011100" => memoryC1_uid208_expTables_q <= "0010011111010011000010";
                WHEN "0011101" => memoryC1_uid208_expTables_q <= "0010100000100011000001";
                WHEN "0011110" => memoryC1_uid208_expTables_q <= "0010100001110011100110";
                WHEN "0011111" => memoryC1_uid208_expTables_q <= "0010100011000100110100";
                WHEN "0100000" => memoryC1_uid208_expTables_q <= "0010100100010110101101";
                WHEN "0100001" => memoryC1_uid208_expTables_q <= "0010100101101001001011";
                WHEN "0100010" => memoryC1_uid208_expTables_q <= "0010100110111100010110";
                WHEN "0100011" => memoryC1_uid208_expTables_q <= "0010101000010000000111";
                WHEN "0100100" => memoryC1_uid208_expTables_q <= "0010101001100100100110";
                WHEN "0100101" => memoryC1_uid208_expTables_q <= "0010101010111001101110";
                WHEN "0100110" => memoryC1_uid208_expTables_q <= "0010101100001111100001";
                WHEN "0100111" => memoryC1_uid208_expTables_q <= "0010101101100101111100";
                WHEN "0101000" => memoryC1_uid208_expTables_q <= "0010101110111101000011";
                WHEN "0101001" => memoryC1_uid208_expTables_q <= "0010110000010100111010";
                WHEN "0101010" => memoryC1_uid208_expTables_q <= "0010110001101101011001";
                WHEN "0101011" => memoryC1_uid208_expTables_q <= "0010110011000110101000";
                WHEN "0101100" => memoryC1_uid208_expTables_q <= "0010110100100000100010";
                WHEN "0101101" => memoryC1_uid208_expTables_q <= "0010110101111011000110";
                WHEN "0101110" => memoryC1_uid208_expTables_q <= "0010110111010110011010";
                WHEN "0101111" => memoryC1_uid208_expTables_q <= "0010111000110010011100";
                WHEN "0110000" => memoryC1_uid208_expTables_q <= "0010111010001111001111";
                WHEN "0110001" => memoryC1_uid208_expTables_q <= "0010111011101100101111";
                WHEN "0110010" => memoryC1_uid208_expTables_q <= "0010111101001010111010";
                WHEN "0110011" => memoryC1_uid208_expTables_q <= "0010111110101001110111";
                WHEN "0110100" => memoryC1_uid208_expTables_q <= "0011000000001001100110";
                WHEN "0110101" => memoryC1_uid208_expTables_q <= "0011000001101010000001";
                WHEN "0110110" => memoryC1_uid208_expTables_q <= "0011000011001011010000";
                WHEN "0110111" => memoryC1_uid208_expTables_q <= "0011000100101101001100";
                WHEN "0111000" => memoryC1_uid208_expTables_q <= "0011000110001111111101";
                WHEN "0111001" => memoryC1_uid208_expTables_q <= "0011000111110011011100";
                WHEN "0111010" => memoryC1_uid208_expTables_q <= "0011001001010111110000";
                WHEN "0111011" => memoryC1_uid208_expTables_q <= "0011001010111100110101";
                WHEN "0111100" => memoryC1_uid208_expTables_q <= "0011001100100010101100";
                WHEN "0111101" => memoryC1_uid208_expTables_q <= "0011001110001001010111";
                WHEN "0111110" => memoryC1_uid208_expTables_q <= "0011001111110000111001";
                WHEN "0111111" => memoryC1_uid208_expTables_q <= "0011010001011001001001";
                WHEN "1000000" => memoryC1_uid208_expTables_q <= "0011010011000010010000";
                WHEN "1000001" => memoryC1_uid208_expTables_q <= "0011010100101100001011";
                WHEN "1000010" => memoryC1_uid208_expTables_q <= "0011010110010110111101";
                WHEN "1000011" => memoryC1_uid208_expTables_q <= "0011011000000010100011";
                WHEN "1000100" => memoryC1_uid208_expTables_q <= "0011011001101111000000";
                WHEN "1000101" => memoryC1_uid208_expTables_q <= "0011011011011100010010";
                WHEN "1000110" => memoryC1_uid208_expTables_q <= "0011011101001010011100";
                WHEN "1000111" => memoryC1_uid208_expTables_q <= "0011011110111001011110";
                WHEN "1001000" => memoryC1_uid208_expTables_q <= "0011100000101001010011";
                WHEN "1001001" => memoryC1_uid208_expTables_q <= "0011100010011010000111";
                WHEN "1001010" => memoryC1_uid208_expTables_q <= "0011100100001011110000";
                WHEN "1001011" => memoryC1_uid208_expTables_q <= "0011100101111110010010";
                WHEN "1001100" => memoryC1_uid208_expTables_q <= "0011100111110001101111";
                WHEN "1001101" => memoryC1_uid208_expTables_q <= "0011101001100110000101";
                WHEN "1001110" => memoryC1_uid208_expTables_q <= "0011101011011011010010";
                WHEN "1001111" => memoryC1_uid208_expTables_q <= "0011101101010001100010";
                WHEN "1010000" => memoryC1_uid208_expTables_q <= "0011101111001000100101";
                WHEN "1010001" => memoryC1_uid208_expTables_q <= "0011110001000000101001";
                WHEN "1010010" => memoryC1_uid208_expTables_q <= "0011110010111001100100";
                WHEN "1010011" => memoryC1_uid208_expTables_q <= "0011110100110011100001";
                WHEN "1010100" => memoryC1_uid208_expTables_q <= "0011110110101110011011";
                WHEN "1010101" => memoryC1_uid208_expTables_q <= "0011111000101010001111";
                WHEN "1010110" => memoryC1_uid208_expTables_q <= "0011111010100111000011";
                WHEN "1010111" => memoryC1_uid208_expTables_q <= "0011111100100100110111";
                WHEN "1011000" => memoryC1_uid208_expTables_q <= "0011111110100011101000";
                WHEN "1011001" => memoryC1_uid208_expTables_q <= "0100000000100011011101";
                WHEN "1011010" => memoryC1_uid208_expTables_q <= "0100000010100100001101";
                WHEN "1011011" => memoryC1_uid208_expTables_q <= "0100000100100101111110";
                WHEN "1011100" => memoryC1_uid208_expTables_q <= "0100000110101000110010";
                WHEN "1011101" => memoryC1_uid208_expTables_q <= "0100001000101100101000";
                WHEN "1011110" => memoryC1_uid208_expTables_q <= "0100001010110001011110";
                WHEN "1011111" => memoryC1_uid208_expTables_q <= "0100001100110111011010";
                WHEN "1100000" => memoryC1_uid208_expTables_q <= "0100001110111110010101";
                WHEN "1100001" => memoryC1_uid208_expTables_q <= "0100010001000110011010";
                WHEN "1100010" => memoryC1_uid208_expTables_q <= "0100010011001111011111";
                WHEN "1100011" => memoryC1_uid208_expTables_q <= "0100010101011001100111";
                WHEN "1100100" => memoryC1_uid208_expTables_q <= "0100010111100100110110";
                WHEN "1100101" => memoryC1_uid208_expTables_q <= "0100011001110001001100";
                WHEN "1100110" => memoryC1_uid208_expTables_q <= "0100011011111110101000";
                WHEN "1100111" => memoryC1_uid208_expTables_q <= "0100011110001101001100";
                WHEN "1101000" => memoryC1_uid208_expTables_q <= "0100100000011100110110";
                WHEN "1101001" => memoryC1_uid208_expTables_q <= "0100100010101101101011";
                WHEN "1101010" => memoryC1_uid208_expTables_q <= "0100100100111111100011";
                WHEN "1101011" => memoryC1_uid208_expTables_q <= "0100100111010010101010";
                WHEN "1101100" => memoryC1_uid208_expTables_q <= "0100101001100110110110";
                WHEN "1101101" => memoryC1_uid208_expTables_q <= "0100101011111100010001";
                WHEN "1101110" => memoryC1_uid208_expTables_q <= "0100101110010010110011";
                WHEN "1101111" => memoryC1_uid208_expTables_q <= "0100110000101010100011";
                WHEN "1110000" => memoryC1_uid208_expTables_q <= "0100110011000011011111";
                WHEN "1110001" => memoryC1_uid208_expTables_q <= "0100110101011101100100";
                WHEN "1110010" => memoryC1_uid208_expTables_q <= "0100110111111000111010";
                WHEN "1110011" => memoryC1_uid208_expTables_q <= "0100111010010101100001";
                WHEN "1110100" => memoryC1_uid208_expTables_q <= "0100111100110011010001";
                WHEN "1110101" => memoryC1_uid208_expTables_q <= "0100111111010010010101";
                WHEN "1110110" => memoryC1_uid208_expTables_q <= "0101000001110010100100";
                WHEN "1110111" => memoryC1_uid208_expTables_q <= "0101000100010100000110";
                WHEN "1111000" => memoryC1_uid208_expTables_q <= "0101000110110110111001";
                WHEN "1111001" => memoryC1_uid208_expTables_q <= "0101001001011010111101";
                WHEN "1111010" => memoryC1_uid208_expTables_q <= "0101001100000000010100";
                WHEN "1111011" => memoryC1_uid208_expTables_q <= "0101001110100110111100";
                WHEN "1111100" => memoryC1_uid208_expTables_q <= "0101010001001110111010";
                WHEN "1111101" => memoryC1_uid208_expTables_q <= "0101010011111000001011";
                WHEN "1111110" => memoryC1_uid208_expTables_q <= "0101010110100010110010";
                WHEN "1111111" => memoryC1_uid208_expTables_q <= "0101011001001110110000";
                WHEN OTHERS => -- unreachable
                               memoryC1_uid208_expTables_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- s1sumAHighB_uid221_invPolyEval(ADD,220)@15 + 1
    s1sumAHighB_uid221_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => memoryC1_uid208_expTables_q(21)) & memoryC1_uid208_expTables_q));
    s1sumAHighB_uid221_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 14 => highBBits_uid220_invPolyEval_b(13)) & highBBits_uid220_invPolyEval_b));
    s1sumAHighB_uid221_invPolyEval_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            s1sumAHighB_uid221_invPolyEval_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            s1sumAHighB_uid221_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid221_invPolyEval_a) + SIGNED(s1sumAHighB_uid221_invPolyEval_b));
        END IF;
    END PROCESS;
    s1sumAHighB_uid221_invPolyEval_q <= s1sumAHighB_uid221_invPolyEval_o(22 downto 0);

    -- lowRangeB_uid219_invPolyEval(BITSELECT,218)@15
    lowRangeB_uid219_invPolyEval_in <= osig_uid231_pT1_uid218_invPolyEval_b(0 downto 0);
    lowRangeB_uid219_invPolyEval_b <= lowRangeB_uid219_invPolyEval_in(0 downto 0);

    -- redist11_lowRangeB_uid219_invPolyEval_b_1(DELAY,314)
    redist11_lowRangeB_uid219_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lowRangeB_uid219_invPolyEval_b, xout => redist11_lowRangeB_uid219_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- s1_uid222_invPolyEval(BITJOIN,221)@16
    s1_uid222_invPolyEval_q <= s1sumAHighB_uid221_invPolyEval_q & redist11_lowRangeB_uid219_invPolyEval_b_1_q;

    -- redist4_yAddr_uid70_block_rsrvd_fix_merged_bit_select_c_3_inputreg(DELAY,337)
    redist4_yAddr_uid70_block_rsrvd_fix_merged_bit_select_c_3_inputreg : dspba_delay
    GENERIC MAP ( width => 19, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => yAddr_uid70_block_rsrvd_fix_merged_bit_select_c, xout => redist4_yAddr_uid70_block_rsrvd_fix_merged_bit_select_c_3_inputreg_q, clk => clock, aclr => resetn );

    -- redist4_yAddr_uid70_block_rsrvd_fix_merged_bit_select_c_3(DELAY,307)
    redist4_yAddr_uid70_block_rsrvd_fix_merged_bit_select_c_3 : dspba_delay
    GENERIC MAP ( width => 19, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist4_yAddr_uid70_block_rsrvd_fix_merged_bit_select_c_3_inputreg_q, xout => redist4_yAddr_uid70_block_rsrvd_fix_merged_bit_select_c_3_q, clk => clock, aclr => resetn );

    -- prodXY_uid233_pT2_uid224_invPolyEval_cma(CHAINMULTADD,298)@16 + 2
    prodXY_uid233_pT2_uid224_invPolyEval_cma_reset <= not (resetn);
    prodXY_uid233_pT2_uid224_invPolyEval_cma_ena0 <= '1';
    prodXY_uid233_pT2_uid224_invPolyEval_cma_ena1 <= prodXY_uid233_pT2_uid224_invPolyEval_cma_ena0;
    prodXY_uid233_pT2_uid224_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid233_pT2_uid224_invPolyEval_cma_a0(0),20));
    prodXY_uid233_pT2_uid224_invPolyEval_cma_p(0) <= prodXY_uid233_pT2_uid224_invPolyEval_cma_l(0) * prodXY_uid233_pT2_uid224_invPolyEval_cma_c0(0);
    prodXY_uid233_pT2_uid224_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid233_pT2_uid224_invPolyEval_cma_p(0),44);
    prodXY_uid233_pT2_uid224_invPolyEval_cma_w(0) <= prodXY_uid233_pT2_uid224_invPolyEval_cma_u(0);
    prodXY_uid233_pT2_uid224_invPolyEval_cma_x(0) <= prodXY_uid233_pT2_uid224_invPolyEval_cma_w(0);
    prodXY_uid233_pT2_uid224_invPolyEval_cma_y(0) <= prodXY_uid233_pT2_uid224_invPolyEval_cma_x(0);
    prodXY_uid233_pT2_uid224_invPolyEval_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodXY_uid233_pT2_uid224_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid233_pT2_uid224_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (prodXY_uid233_pT2_uid224_invPolyEval_cma_ena0 = '1') THEN
                prodXY_uid233_pT2_uid224_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(redist4_yAddr_uid70_block_rsrvd_fix_merged_bit_select_c_3_q),19);
                prodXY_uid233_pT2_uid224_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(s1_uid222_invPolyEval_q),24);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid233_pT2_uid224_invPolyEval_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodXY_uid233_pT2_uid224_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (prodXY_uid233_pT2_uid224_invPolyEval_cma_ena1 = '1') THEN
                prodXY_uid233_pT2_uid224_invPolyEval_cma_s(0) <= prodXY_uid233_pT2_uid224_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid233_pT2_uid224_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 43, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid233_pT2_uid224_invPolyEval_cma_s(0)(42 downto 0)), xout => prodXY_uid233_pT2_uid224_invPolyEval_cma_qq, clk => clock, aclr => resetn );
    prodXY_uid233_pT2_uid224_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid233_pT2_uid224_invPolyEval_cma_qq(42 downto 0));

    -- osig_uid234_pT2_uid224_invPolyEval(BITSELECT,233)@18
    osig_uid234_pT2_uid224_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid233_pT2_uid224_invPolyEval_cma_q(42 downto 18));

    -- redist10_osig_uid234_pT2_uid224_invPolyEval_b_1(DELAY,313)
    redist10_osig_uid234_pT2_uid224_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => osig_uid234_pT2_uid224_invPolyEval_b, xout => redist10_osig_uid234_pT2_uid224_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- highBBits_uid226_invPolyEval(BITSELECT,225)@19
    highBBits_uid226_invPolyEval_b <= STD_LOGIC_VECTOR(redist10_osig_uid234_pT2_uid224_invPolyEval_b_1_q(24 downto 2));

    -- redist3_yAddr_uid70_block_rsrvd_fix_merged_bit_select_b_5(DELAY,306)
    redist3_yAddr_uid70_block_rsrvd_fix_merged_bit_select_b_5 : dspba_delay
    GENERIC MAP ( width => 7, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist2_yAddr_uid70_block_rsrvd_fix_merged_bit_select_b_1_q, xout => redist3_yAddr_uid70_block_rsrvd_fix_merged_bit_select_b_5_q, clk => clock, aclr => resetn );

    -- memoryC0_uid205_expTables(LOOKUP,204)@18 + 1
    memoryC0_uid205_expTables_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            memoryC0_uid205_expTables_q <= "00100000000000000000000000100";
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (redist3_yAddr_uid70_block_rsrvd_fix_merged_bit_select_b_5_q) IS
                WHEN "0000000" => memoryC0_uid205_expTables_q <= "00100000000000000000000000100";
                WHEN "0000001" => memoryC0_uid205_expTables_q <= "00100000010000000100000001010";
                WHEN "0000010" => memoryC0_uid205_expTables_q <= "00100000100000010000000101111";
                WHEN "0000011" => memoryC0_uid205_expTables_q <= "00100000110000100100010010101";
                WHEN "0000100" => memoryC0_uid205_expTables_q <= "00100001000001000000101011100";
                WHEN "0000101" => memoryC0_uid205_expTables_q <= "00100001010001100101010100101";
                WHEN "0000110" => memoryC0_uid205_expTables_q <= "00100001100010010010010010010";
                WHEN "0000111" => memoryC0_uid205_expTables_q <= "00100001110011000111101000011";
                WHEN "0001000" => memoryC0_uid205_expTables_q <= "00100010000100000101011011010";
                WHEN "0001001" => memoryC0_uid205_expTables_q <= "00100010010101001011101111001";
                WHEN "0001010" => memoryC0_uid205_expTables_q <= "00100010100110011010101000011";
                WHEN "0001011" => memoryC0_uid205_expTables_q <= "00100010110111110010001011010";
                WHEN "0001100" => memoryC0_uid205_expTables_q <= "00100011001001010010011100000";
                WHEN "0001101" => memoryC0_uid205_expTables_q <= "00100011011010111011011111001";
                WHEN "0001110" => memoryC0_uid205_expTables_q <= "00100011101100101101011001000";
                WHEN "0001111" => memoryC0_uid205_expTables_q <= "00100011111110101000001110000";
                WHEN "0010000" => memoryC0_uid205_expTables_q <= "00100100010000101100000010110";
                WHEN "0010001" => memoryC0_uid205_expTables_q <= "00100100100010111000111011100";
                WHEN "0010010" => memoryC0_uid205_expTables_q <= "00100100110101001110111101001";
                WHEN "0010011" => memoryC0_uid205_expTables_q <= "00100101000111101110001100000";
                WHEN "0010100" => memoryC0_uid205_expTables_q <= "00100101011010010110101100111";
                WHEN "0010101" => memoryC0_uid205_expTables_q <= "00100101101101001000100100010";
                WHEN "0010110" => memoryC0_uid205_expTables_q <= "00100110000000000011110111000";
                WHEN "0010111" => memoryC0_uid205_expTables_q <= "00100110010011001000101001110";
                WHEN "0011000" => memoryC0_uid205_expTables_q <= "00100110100110010111000001010";
                WHEN "0011001" => memoryC0_uid205_expTables_q <= "00100110111001101111000010011";
                WHEN "0011010" => memoryC0_uid205_expTables_q <= "00100111001101010000110001111";
                WHEN "0011011" => memoryC0_uid205_expTables_q <= "00100111100000111100010100110";
                WHEN "0011100" => memoryC0_uid205_expTables_q <= "00100111110100110001101111111";
                WHEN "0011101" => memoryC0_uid205_expTables_q <= "00101000001000110001001000001";
                WHEN "0011110" => memoryC0_uid205_expTables_q <= "00101000011100111010100010101";
                WHEN "0011111" => memoryC0_uid205_expTables_q <= "00101000110001001110000100011";
                WHEN "0100000" => memoryC0_uid205_expTables_q <= "00101001000101101011110010011";
                WHEN "0100001" => memoryC0_uid205_expTables_q <= "00101001011010010011110001111";
                WHEN "0100010" => memoryC0_uid205_expTables_q <= "00101001101111000110000111111";
                WHEN "0100011" => memoryC0_uid205_expTables_q <= "00101010000100000010111001110";
                WHEN "0100100" => memoryC0_uid205_expTables_q <= "00101010011001001010001100100";
                WHEN "0100101" => memoryC0_uid205_expTables_q <= "00101010101110011100000101101";
                WHEN "0100110" => memoryC0_uid205_expTables_q <= "00101011000011111000101010011";
                WHEN "0100111" => memoryC0_uid205_expTables_q <= "00101011011001100000000000001";
                WHEN "0101000" => memoryC0_uid205_expTables_q <= "00101011101111010010001100010";
                WHEN "0101001" => memoryC0_uid205_expTables_q <= "00101100000101001111010100001";
                WHEN "0101010" => memoryC0_uid205_expTables_q <= "00101100011011010111011101011";
                WHEN "0101011" => memoryC0_uid205_expTables_q <= "00101100110001101010101101011";
                WHEN "0101100" => memoryC0_uid205_expTables_q <= "00101101001000001001001001111";
                WHEN "0101101" => memoryC0_uid205_expTables_q <= "00101101011110110010111000100";
                WHEN "0101110" => memoryC0_uid205_expTables_q <= "00101101110101100111111110110";
                WHEN "0101111" => memoryC0_uid205_expTables_q <= "00101110001100101000100010011";
                WHEN "0110000" => memoryC0_uid205_expTables_q <= "00101110100011110100101001001";
                WHEN "0110001" => memoryC0_uid205_expTables_q <= "00101110111011001100011000111";
                WHEN "0110010" => memoryC0_uid205_expTables_q <= "00101111010010101111110111100";
                WHEN "0110011" => memoryC0_uid205_expTables_q <= "00101111101010011111001010110";
                WHEN "0110100" => memoryC0_uid205_expTables_q <= "00110000000010011010011000101";
                WHEN "0110101" => memoryC0_uid205_expTables_q <= "00110000011010100001100111001";
                WHEN "0110110" => memoryC0_uid205_expTables_q <= "00110000110010110100111100010";
                WHEN "0110111" => memoryC0_uid205_expTables_q <= "00110001001011010100011110001";
                WHEN "0111000" => memoryC0_uid205_expTables_q <= "00110001100100000000010010110";
                WHEN "0111001" => memoryC0_uid205_expTables_q <= "00110001111100111000100000100";
                WHEN "0111010" => memoryC0_uid205_expTables_q <= "00110010010101111101001101011";
                WHEN "0111011" => memoryC0_uid205_expTables_q <= "00110010101111001110011111110";
                WHEN "0111100" => memoryC0_uid205_expTables_q <= "00110011001000101100011110000";
                WHEN "0111101" => memoryC0_uid205_expTables_q <= "00110011100010010111001110011";
                WHEN "0111110" => memoryC0_uid205_expTables_q <= "00110011111100001110110111010";
                WHEN "0111111" => memoryC0_uid205_expTables_q <= "00110100010110010011011111011";
                WHEN "1000000" => memoryC0_uid205_expTables_q <= "00110100110000100101001101000";
                WHEN "1000001" => memoryC0_uid205_expTables_q <= "00110101001011000100000110110";
                WHEN "1000010" => memoryC0_uid205_expTables_q <= "00110101100101110000010011010";
                WHEN "1000011" => memoryC0_uid205_expTables_q <= "00110110000000101001111001010";
                WHEN "1000100" => memoryC0_uid205_expTables_q <= "00110110011011110000111111011";
                WHEN "1000101" => memoryC0_uid205_expTables_q <= "00110110110111000101101100100";
                WHEN "1000110" => memoryC0_uid205_expTables_q <= "00110111010010101000000111011";
                WHEN "1000111" => memoryC0_uid205_expTables_q <= "00110111101110011000010110111";
                WHEN "1001000" => memoryC0_uid205_expTables_q <= "00111000001010010110100010001";
                WHEN "1001001" => memoryC0_uid205_expTables_q <= "00111000100110100010101111110";
                WHEN "1001010" => memoryC0_uid205_expTables_q <= "00111001000010111101000111001";
                WHEN "1001011" => memoryC0_uid205_expTables_q <= "00111001011111100101101111010";
                WHEN "1001100" => memoryC0_uid205_expTables_q <= "00111001111100011100101111010";
                WHEN "1001101" => memoryC0_uid205_expTables_q <= "00111010011001100010001110011";
                WHEN "1001110" => memoryC0_uid205_expTables_q <= "00111010110110110110010100000";
                WHEN "1001111" => memoryC0_uid205_expTables_q <= "00111011010100011001000111001";
                WHEN "1010000" => memoryC0_uid205_expTables_q <= "00111011110010001010101111100";
                WHEN "1010001" => memoryC0_uid205_expTables_q <= "00111100010000001011010100011";
                WHEN "1010010" => memoryC0_uid205_expTables_q <= "00111100101110011010111101011";
                WHEN "1010011" => memoryC0_uid205_expTables_q <= "00111101001100111001110001111";
                WHEN "1010100" => memoryC0_uid205_expTables_q <= "00111101101011100111111001101";
                WHEN "1010101" => memoryC0_uid205_expTables_q <= "00111110001010100101011100011";
                WHEN "1010110" => memoryC0_uid205_expTables_q <= "00111110101001110010100001110";
                WHEN "1010111" => memoryC0_uid205_expTables_q <= "00111111001001001111010001100";
                WHEN "1011000" => memoryC0_uid205_expTables_q <= "00111111101000111011110011101";
                WHEN "1011001" => memoryC0_uid205_expTables_q <= "01000000001000111000001111111";
                WHEN "1011010" => memoryC0_uid205_expTables_q <= "01000000101001000100101110100";
                WHEN "1011011" => memoryC0_uid205_expTables_q <= "01000001001001100001010111011";
                WHEN "1011100" => memoryC0_uid205_expTables_q <= "01000001101010001110010010101";
                WHEN "1011101" => memoryC0_uid205_expTables_q <= "01000010001011001011101000011";
                WHEN "1011110" => memoryC0_uid205_expTables_q <= "01000010101100011001100001000";
                WHEN "1011111" => memoryC0_uid205_expTables_q <= "01000011001101111000000100101";
                WHEN "1100000" => memoryC0_uid205_expTables_q <= "01000011101111100111011011111";
                WHEN "1100001" => memoryC0_uid205_expTables_q <= "01000100010001100111101110111";
                WHEN "1100010" => memoryC0_uid205_expTables_q <= "01000100110011111001000110011";
                WHEN "1100011" => memoryC0_uid205_expTables_q <= "01000101010110011011101010111";
                WHEN "1100100" => memoryC0_uid205_expTables_q <= "01000101111001001111100101000";
                WHEN "1100101" => memoryC0_uid205_expTables_q <= "01000110011100010100111101011";
                WHEN "1100110" => memoryC0_uid205_expTables_q <= "01000110111111101011111100111";
                WHEN "1100111" => memoryC0_uid205_expTables_q <= "01000111100011010100101100010";
                WHEN "1101000" => memoryC0_uid205_expTables_q <= "01001000000111001111010100100";
                WHEN "1101001" => memoryC0_uid205_expTables_q <= "01001000101011011011111110100";
                WHEN "1101010" => memoryC0_uid205_expTables_q <= "01001001001111111010110011100";
                WHEN "1101011" => memoryC0_uid205_expTables_q <= "01001001110100101011111100011";
                WHEN "1101100" => memoryC0_uid205_expTables_q <= "01001010011001101111100010100";
                WHEN "1101101" => memoryC0_uid205_expTables_q <= "01001010111111000101101111000";
                WHEN "1101110" => memoryC0_uid205_expTables_q <= "01001011100100101110101011011";
                WHEN "1101111" => memoryC0_uid205_expTables_q <= "01001100001010101010100000111";
                WHEN "1110000" => memoryC0_uid205_expTables_q <= "01001100110000111001011001000";
                WHEN "1110001" => memoryC0_uid205_expTables_q <= "01001101010111011011011101100";
                WHEN "1110010" => memoryC0_uid205_expTables_q <= "01001101111110010000110111110";
                WHEN "1110011" => memoryC0_uid205_expTables_q <= "01001110100101011001110001100";
                WHEN "1110100" => memoryC0_uid205_expTables_q <= "01001111001100110110010100110";
                WHEN "1110101" => memoryC0_uid205_expTables_q <= "01001111110100100110101011001";
                WHEN "1110110" => memoryC0_uid205_expTables_q <= "01010000011100101010111110110";
                WHEN "1110111" => memoryC0_uid205_expTables_q <= "01010001000101000011011001100";
                WHEN "1111000" => memoryC0_uid205_expTables_q <= "01010001101101110000000101100";
                WHEN "1111001" => memoryC0_uid205_expTables_q <= "01010010010110110001001101000";
                WHEN "1111010" => memoryC0_uid205_expTables_q <= "01010011000000000110111010001";
                WHEN "1111011" => memoryC0_uid205_expTables_q <= "01010011101001110001010111011";
                WHEN "1111100" => memoryC0_uid205_expTables_q <= "01010100010011110000101111000";
                WHEN "1111101" => memoryC0_uid205_expTables_q <= "01010100111110000101001011101";
                WHEN "1111110" => memoryC0_uid205_expTables_q <= "01010101101000101110110111110";
                WHEN "1111111" => memoryC0_uid205_expTables_q <= "01010110010011101101111110000";
                WHEN OTHERS => -- unreachable
                               memoryC0_uid205_expTables_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- s2sumAHighB_uid227_invPolyEval(ADD,226)@19
    s2sumAHighB_uid227_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => memoryC0_uid205_expTables_q(28)) & memoryC0_uid205_expTables_q));
    s2sumAHighB_uid227_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 23 => highBBits_uid226_invPolyEval_b(22)) & highBBits_uid226_invPolyEval_b));
    s2sumAHighB_uid227_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s2sumAHighB_uid227_invPolyEval_a) + SIGNED(s2sumAHighB_uid227_invPolyEval_b));
    s2sumAHighB_uid227_invPolyEval_q <= s2sumAHighB_uid227_invPolyEval_o(29 downto 0);

    -- lowRangeB_uid225_invPolyEval(BITSELECT,224)@19
    lowRangeB_uid225_invPolyEval_in <= redist10_osig_uid234_pT2_uid224_invPolyEval_b_1_q(1 downto 0);
    lowRangeB_uid225_invPolyEval_b <= lowRangeB_uid225_invPolyEval_in(1 downto 0);

    -- s2_uid228_invPolyEval(BITJOIN,227)@19
    s2_uid228_invPolyEval_q <= s2sumAHighB_uid227_invPolyEval_q & lowRangeB_uid225_invPolyEval_b;

    -- peORExpInc_uid74_block_rsrvd_fix(BITSELECT,73)@19
    peORExpInc_uid74_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(s2_uid228_invPolyEval_q(29 downto 0));
    peORExpInc_uid74_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(peORExpInc_uid74_block_rsrvd_fix_in(29 downto 29));

    -- redist18_peORExpInc_uid74_block_rsrvd_fix_b_1(DELAY,321)
    redist18_peORExpInc_uid74_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => peORExpInc_uid74_block_rsrvd_fix_b, xout => redist18_peORExpInc_uid74_block_rsrvd_fix_b_1_q, clk => clock, aclr => resetn );

    -- cstBias_uid9_block_rsrvd_fix(CONSTANT,8)
    cstBias_uid9_block_rsrvd_fix_q <= "01111111";

    -- redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_notEnable(LOGICAL,346)
    redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_nor(LOGICAL,347)
    redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_nor_q <= not (redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_notEnable_q or redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_sticky_ena_q);

    -- redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_mem_last(CONSTANT,343)
    redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_mem_last_q <= "0110";

    -- redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_cmp(LOGICAL,344)
    redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_cmp_b <= STD_LOGIC_VECTOR("0" & redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_rdcnt_q);
    redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_cmp_q <= "1" WHEN redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_mem_last_q = redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_cmp_b ELSE "0";

    -- redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_cmpReg(REG,345)
    redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_cmpReg_q <= STD_LOGIC_VECTOR(redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_cmp_q);
        END IF;
    END PROCESS;

    -- redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_sticky_ena(REG,348)
    redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_nor_q = "1") THEN
                redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_sticky_ena_q <= STD_LOGIC_VECTOR(redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_enaAnd(LOGICAL,349)
    redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_enaAnd_q <= redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_sticky_ena_q and VCC_q;

    -- redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_rdcnt(COUNTER,341)
    -- low=0, high=7, step=1, init=0
    redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_rdcnt_i <= TO_UNSIGNED(0, 3);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_rdcnt_i <= redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_rdcnt_i, 3)));

    -- redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_inputreg(DELAY,338)
    redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_inputreg : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q, xout => redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_inputreg_q, clk => clock, aclr => resetn );

    -- redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_wraddr(REG,342)
    redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_wraddr_q <= "111";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_wraddr_q <= STD_LOGIC_VECTOR(redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_mem(DUALMEM,340)
    redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_mem_ia <= STD_LOGIC_VECTOR(redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_inputreg_q);
    redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_mem_aa <= redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_wraddr_q;
    redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_mem_ab <= redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_rdcnt_q;
    redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_mem_reset0 <= not (resetn);
    redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 11,
        widthad_a => 3,
        numwords_a => 8,
        width_b => 11,
        widthad_b => 3,
        numwords_b => 8,
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
        clocken1 => redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_mem_reset0,
        clock1 => clock,
        address_a => redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_mem_aa,
        data_a => redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_mem_ab,
        q_b => redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_mem_iq
    );
    redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_mem_q <= redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_mem_iq(10 downto 0);

    -- redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_outputreg(DELAY,339)
    redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_outputreg : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_mem_q, xout => redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_outputreg_q, clk => clock, aclr => resetn );

    -- expRPostBiasPreExc0_uid75_block_rsrvd_fix(ADD,74)@19 + 1
    expRPostBiasPreExc0_uid75_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_outputreg_q(10)) & redist8_r_uid262_fxpInPostAlign_uid47_block_rsrvd_fix_q_11_outputreg_q));
    expRPostBiasPreExc0_uid75_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000" & cstBias_uid9_block_rsrvd_fix_q));
    expRPostBiasPreExc0_uid75_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            expRPostBiasPreExc0_uid75_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            expRPostBiasPreExc0_uid75_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(expRPostBiasPreExc0_uid75_block_rsrvd_fix_a) + SIGNED(expRPostBiasPreExc0_uid75_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    expRPostBiasPreExc0_uid75_block_rsrvd_fix_q <= expRPostBiasPreExc0_uid75_block_rsrvd_fix_o(11 downto 0);

    -- expRPostBiasPreExc_uid76_block_rsrvd_fix(ADD,75)@20 + 1
    expRPostBiasPreExc_uid76_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => expRPostBiasPreExc0_uid75_block_rsrvd_fix_q(11)) & expRPostBiasPreExc0_uid75_block_rsrvd_fix_q));
    expRPostBiasPreExc_uid76_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000000" & redist18_peORExpInc_uid74_block_rsrvd_fix_b_1_q));
    expRPostBiasPreExc_uid76_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            expRPostBiasPreExc_uid76_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            expRPostBiasPreExc_uid76_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(expRPostBiasPreExc_uid76_block_rsrvd_fix_a) + SIGNED(expRPostBiasPreExc_uid76_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    expRPostBiasPreExc_uid76_block_rsrvd_fix_q <= expRPostBiasPreExc_uid76_block_rsrvd_fix_o(12 downto 0);

    -- expR_uid81_block_rsrvd_fix(BITSELECT,80)@21
    expR_uid81_block_rsrvd_fix_in <= expRPostBiasPreExc_uid76_block_rsrvd_fix_q(7 downto 0);
    expR_uid81_block_rsrvd_fix_b <= expR_uid81_block_rsrvd_fix_in(7 downto 0);

    -- redist16_expR_uid81_block_rsrvd_fix_b_2(DELAY,319)
    redist16_expR_uid81_block_rsrvd_fix_b_2 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => expR_uid81_block_rsrvd_fix_b, xout => redist16_expR_uid81_block_rsrvd_fix_b_2_q, clk => clock, aclr => resetn );

    -- cstZeroWE_uid14_block_rsrvd_fix(CONSTANT,13)
    cstZeroWE_uid14_block_rsrvd_fix_q <= "00000000";

    -- cstZeroWF_uid18_block_rsrvd_fix(CONSTANT,17)
    cstZeroWF_uid18_block_rsrvd_fix_q <= "00000000000000000000000";

    -- fracXIsZero_uid24_block_rsrvd_fix(LOGICAL,23)@0 + 1
    fracXIsZero_uid24_block_rsrvd_fix_qi <= "1" WHEN cstZeroWF_uid18_block_rsrvd_fix_q = fracX_uid8_block_rsrvd_fix_b ELSE "0";
    fracXIsZero_uid24_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => fracXIsZero_uid24_block_rsrvd_fix_qi, xout => fracXIsZero_uid24_block_rsrvd_fix_q, clk => clock, aclr => resetn );

    -- redist28_fracXIsZero_uid24_block_rsrvd_fix_q_5(DELAY,331)
    redist28_fracXIsZero_uid24_block_rsrvd_fix_q_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => fracXIsZero_uid24_block_rsrvd_fix_q, xout => redist28_fracXIsZero_uid24_block_rsrvd_fix_q_5_q, clk => clock, aclr => resetn );

    -- fracXIsNotZero_uid25_block_rsrvd_fix(LOGICAL,24)@5
    fracXIsNotZero_uid25_block_rsrvd_fix_q <= not (redist28_fracXIsZero_uid24_block_rsrvd_fix_q_5_q);

    -- expXIsMax_uid23_block_rsrvd_fix(LOGICAL,22)@5
    expXIsMax_uid23_block_rsrvd_fix_q <= "1" WHEN redist33_expX_uid6_block_rsrvd_fix_b_5_outputreg_q = cstAllOWE_uid17_block_rsrvd_fix_q ELSE "0";

    -- excN_x_uid27_block_rsrvd_fix(LOGICAL,26)@5 + 1
    excN_x_uid27_block_rsrvd_fix_qi <= expXIsMax_uid23_block_rsrvd_fix_q and fracXIsNotZero_uid25_block_rsrvd_fix_q;
    excN_x_uid27_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excN_x_uid27_block_rsrvd_fix_qi, xout => excN_x_uid27_block_rsrvd_fix_q, clk => clock, aclr => resetn );

    -- redist26_excN_x_uid27_block_rsrvd_fix_q_17(DELAY,329)
    redist26_excN_x_uid27_block_rsrvd_fix_q_17 : dspba_delay
    GENERIC MAP ( width => 1, depth => 16, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excN_x_uid27_block_rsrvd_fix_q, xout => redist26_excN_x_uid27_block_rsrvd_fix_q_17_q, clk => clock, aclr => resetn );

    -- redist32_signX_uid7_block_rsrvd_fix_b_22(DELAY,335)
    redist32_signX_uid7_block_rsrvd_fix_b_22 : dspba_delay
    GENERIC MAP ( width => 1, depth => 12, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist31_signX_uid7_block_rsrvd_fix_b_10_q, xout => redist32_signX_uid7_block_rsrvd_fix_b_22_q, clk => clock, aclr => resetn );

    -- invSignX_uid87_block_rsrvd_fix(LOGICAL,86)@22
    invSignX_uid87_block_rsrvd_fix_q <= not (redist32_signX_uid7_block_rsrvd_fix_b_22_q);

    -- expOvfInitial_uid42_block_rsrvd_fix(BITSELECT,41)@6
    expOvfInitial_uid42_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(shiftValuePreSat_uid41_block_rsrvd_fix_q(8 downto 8));

    -- redist22_expOvfInitial_uid42_block_rsrvd_fix_b_16(DELAY,325)
    redist22_expOvfInitial_uid42_block_rsrvd_fix_b_16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 16, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => expOvfInitial_uid42_block_rsrvd_fix_b, xout => redist22_expOvfInitial_uid42_block_rsrvd_fix_b_16_q, clk => clock, aclr => resetn );

    -- invExpXIsMax_uid28_block_rsrvd_fix(LOGICAL,27)@5
    invExpXIsMax_uid28_block_rsrvd_fix_q <= not (expXIsMax_uid23_block_rsrvd_fix_q);

    -- excZ_x_uid22_block_rsrvd_fix(LOGICAL,21)@5
    excZ_x_uid22_block_rsrvd_fix_q <= "1" WHEN redist33_expX_uid6_block_rsrvd_fix_b_5_outputreg_q = cstZeroWE_uid14_block_rsrvd_fix_q ELSE "0";

    -- InvExpXIsZero_uid29_block_rsrvd_fix(LOGICAL,28)@5
    InvExpXIsZero_uid29_block_rsrvd_fix_q <= not (excZ_x_uid22_block_rsrvd_fix_q);

    -- excR_x_uid30_block_rsrvd_fix(LOGICAL,29)@5 + 1
    excR_x_uid30_block_rsrvd_fix_qi <= InvExpXIsZero_uid29_block_rsrvd_fix_q and invExpXIsMax_uid28_block_rsrvd_fix_q;
    excR_x_uid30_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excR_x_uid30_block_rsrvd_fix_qi, xout => excR_x_uid30_block_rsrvd_fix_q, clk => clock, aclr => resetn );

    -- redist25_excR_x_uid30_block_rsrvd_fix_q_17(DELAY,328)
    redist25_excR_x_uid30_block_rsrvd_fix_q_17 : dspba_delay
    GENERIC MAP ( width => 1, depth => 16, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excR_x_uid30_block_rsrvd_fix_q, xout => redist25_excR_x_uid30_block_rsrvd_fix_q_17_q, clk => clock, aclr => resetn );

    -- regXAndExpOverflowAndPos_uid88_block_rsrvd_fix(LOGICAL,87)@22
    regXAndExpOverflowAndPos_uid88_block_rsrvd_fix_q <= redist25_excR_x_uid30_block_rsrvd_fix_q_17_q and redist22_expOvfInitial_uid42_block_rsrvd_fix_b_16_q and invSignX_uid87_block_rsrvd_fix_q;

    -- invExpOvfInitial_uid84_block_rsrvd_fix(LOGICAL,83)@22
    invExpOvfInitial_uid84_block_rsrvd_fix_q <= not (redist22_expOvfInitial_uid42_block_rsrvd_fix_b_16_q);

    -- expOvf_uid80_block_rsrvd_fix(COMPARE,79)@21 + 1
    expOvf_uid80_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => expRPostBiasPreExc_uid76_block_rsrvd_fix_q(12)) & expRPostBiasPreExc_uid76_block_rsrvd_fix_q));
    expOvf_uid80_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000" & cstAllOWE_uid17_block_rsrvd_fix_q));
    expOvf_uid80_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            expOvf_uid80_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            expOvf_uid80_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid80_block_rsrvd_fix_a) - SIGNED(expOvf_uid80_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    expOvf_uid80_block_rsrvd_fix_n(0) <= not (expOvf_uid80_block_rsrvd_fix_o(14));

    -- regInAndOvf_uid90_block_rsrvd_fix(LOGICAL,89)@22
    regInAndOvf_uid90_block_rsrvd_fix_q <= redist25_excR_x_uid30_block_rsrvd_fix_q_17_q and expOvf_uid80_block_rsrvd_fix_n and invExpOvfInitial_uid84_block_rsrvd_fix_q;

    -- excI_x_uid26_block_rsrvd_fix(LOGICAL,25)@5 + 1
    excI_x_uid26_block_rsrvd_fix_qi <= expXIsMax_uid23_block_rsrvd_fix_q and redist28_fracXIsZero_uid24_block_rsrvd_fix_q_5_q;
    excI_x_uid26_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excI_x_uid26_block_rsrvd_fix_qi, xout => excI_x_uid26_block_rsrvd_fix_q, clk => clock, aclr => resetn );

    -- redist27_excI_x_uid26_block_rsrvd_fix_q_17(DELAY,330)
    redist27_excI_x_uid26_block_rsrvd_fix_q_17 : dspba_delay
    GENERIC MAP ( width => 1, depth => 16, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excI_x_uid26_block_rsrvd_fix_q, xout => redist27_excI_x_uid26_block_rsrvd_fix_q_17_q, clk => clock, aclr => resetn );

    -- posInf_uid92_block_rsrvd_fix(LOGICAL,91)@22
    posInf_uid92_block_rsrvd_fix_q <= redist27_excI_x_uid26_block_rsrvd_fix_q_17_q and invSignX_uid87_block_rsrvd_fix_q;

    -- excRInf_uid93_block_rsrvd_fix(LOGICAL,92)@22
    excRInf_uid93_block_rsrvd_fix_q <= posInf_uid92_block_rsrvd_fix_q or regInAndOvf_uid90_block_rsrvd_fix_q or regXAndExpOverflowAndPos_uid88_block_rsrvd_fix_q;

    -- negInf_uid82_block_rsrvd_fix(LOGICAL,81)@22
    negInf_uid82_block_rsrvd_fix_q <= redist27_excI_x_uid26_block_rsrvd_fix_q_17_q and redist32_signX_uid7_block_rsrvd_fix_b_22_q;

    -- regXAndExpOverflowAndNeg_uid83_block_rsrvd_fix(LOGICAL,82)@22
    regXAndExpOverflowAndNeg_uid83_block_rsrvd_fix_q <= redist25_excR_x_uid30_block_rsrvd_fix_q_17_q and redist22_expOvfInitial_uid42_block_rsrvd_fix_b_16_q and redist32_signX_uid7_block_rsrvd_fix_b_22_q;

    -- expUdf_uid78_block_rsrvd_fix(COMPARE,77)@21 + 1
    expUdf_uid78_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000000" & GND_q));
    expUdf_uid78_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => expRPostBiasPreExc_uid76_block_rsrvd_fix_q(12)) & expRPostBiasPreExc_uid76_block_rsrvd_fix_q));
    expUdf_uid78_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            expUdf_uid78_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            expUdf_uid78_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid78_block_rsrvd_fix_a) - SIGNED(expUdf_uid78_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    expUdf_uid78_block_rsrvd_fix_n(0) <= not (expUdf_uid78_block_rsrvd_fix_o(14));

    -- regXAndUdf_uid85_block_rsrvd_fix(LOGICAL,84)@22
    regXAndUdf_uid85_block_rsrvd_fix_q <= redist25_excR_x_uid30_block_rsrvd_fix_q_17_q and expUdf_uid78_block_rsrvd_fix_n and invExpOvfInitial_uid84_block_rsrvd_fix_q;

    -- excRZero_uid86_block_rsrvd_fix(LOGICAL,85)@22
    excRZero_uid86_block_rsrvd_fix_q <= regXAndUdf_uid85_block_rsrvd_fix_q or regXAndExpOverflowAndNeg_uid83_block_rsrvd_fix_q or negInf_uid82_block_rsrvd_fix_q;

    -- concExc_uid94_block_rsrvd_fix(BITJOIN,93)@22
    concExc_uid94_block_rsrvd_fix_q <= redist26_excN_x_uid27_block_rsrvd_fix_q_17_q & excRInf_uid93_block_rsrvd_fix_q & excRZero_uid86_block_rsrvd_fix_q;

    -- excREnc_uid95_block_rsrvd_fix(LOOKUP,94)@22 + 1
    excREnc_uid95_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            excREnc_uid95_block_rsrvd_fix_q <= "01";
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (concExc_uid94_block_rsrvd_fix_q) IS
                WHEN "000" => excREnc_uid95_block_rsrvd_fix_q <= "01";
                WHEN "001" => excREnc_uid95_block_rsrvd_fix_q <= "00";
                WHEN "010" => excREnc_uid95_block_rsrvd_fix_q <= "10";
                WHEN "011" => excREnc_uid95_block_rsrvd_fix_q <= "00";
                WHEN "100" => excREnc_uid95_block_rsrvd_fix_q <= "11";
                WHEN "101" => excREnc_uid95_block_rsrvd_fix_q <= "00";
                WHEN "110" => excREnc_uid95_block_rsrvd_fix_q <= "00";
                WHEN "111" => excREnc_uid95_block_rsrvd_fix_q <= "00";
                WHEN OTHERS => -- unreachable
                               excREnc_uid95_block_rsrvd_fix_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- expRPostExc_uid103_block_rsrvd_fix(MUX,102)@23
    expRPostExc_uid103_block_rsrvd_fix_s <= excREnc_uid95_block_rsrvd_fix_q;
    expRPostExc_uid103_block_rsrvd_fix_combproc: PROCESS (expRPostExc_uid103_block_rsrvd_fix_s, cstZeroWE_uid14_block_rsrvd_fix_q, redist16_expR_uid81_block_rsrvd_fix_b_2_q, cstAllOWE_uid17_block_rsrvd_fix_q)
    BEGIN
        CASE (expRPostExc_uid103_block_rsrvd_fix_s) IS
            WHEN "00" => expRPostExc_uid103_block_rsrvd_fix_q <= cstZeroWE_uid14_block_rsrvd_fix_q;
            WHEN "01" => expRPostExc_uid103_block_rsrvd_fix_q <= redist16_expR_uid81_block_rsrvd_fix_b_2_q;
            WHEN "10" => expRPostExc_uid103_block_rsrvd_fix_q <= cstAllOWE_uid17_block_rsrvd_fix_q;
            WHEN "11" => expRPostExc_uid103_block_rsrvd_fix_q <= cstAllOWE_uid17_block_rsrvd_fix_q;
            WHEN OTHERS => expRPostExc_uid103_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid96_block_rsrvd_fix(CONSTANT,95)
    oneFracRPostExc2_uid96_block_rsrvd_fix_q <= "00000000000000000000001";

    -- peOR_uid73_block_rsrvd_fix(BITSELECT,72)@19
    peOR_uid73_block_rsrvd_fix_in <= s2_uid228_invPolyEval_q(28 downto 0);
    peOR_uid73_block_rsrvd_fix_b <= peOR_uid73_block_rsrvd_fix_in(28 downto 5);

    -- fracR_uid77_block_rsrvd_fix(BITSELECT,76)@19
    fracR_uid77_block_rsrvd_fix_in <= peOR_uid73_block_rsrvd_fix_b(22 downto 0);
    fracR_uid77_block_rsrvd_fix_b <= fracR_uid77_block_rsrvd_fix_in(22 downto 0);

    -- redist17_fracR_uid77_block_rsrvd_fix_b_4_inputreg(DELAY,350)
    redist17_fracR_uid77_block_rsrvd_fix_b_4_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => fracR_uid77_block_rsrvd_fix_b, xout => redist17_fracR_uid77_block_rsrvd_fix_b_4_inputreg_q, clk => clock, aclr => resetn );

    -- redist17_fracR_uid77_block_rsrvd_fix_b_4(DELAY,320)
    redist17_fracR_uid77_block_rsrvd_fix_b_4 : dspba_delay
    GENERIC MAP ( width => 23, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist17_fracR_uid77_block_rsrvd_fix_b_4_inputreg_q, xout => redist17_fracR_uid77_block_rsrvd_fix_b_4_q, clk => clock, aclr => resetn );

    -- fracRPostExc_uid99_block_rsrvd_fix(MUX,98)@23
    fracRPostExc_uid99_block_rsrvd_fix_s <= excREnc_uid95_block_rsrvd_fix_q;
    fracRPostExc_uid99_block_rsrvd_fix_combproc: PROCESS (fracRPostExc_uid99_block_rsrvd_fix_s, cstZeroWF_uid18_block_rsrvd_fix_q, redist17_fracR_uid77_block_rsrvd_fix_b_4_q, oneFracRPostExc2_uid96_block_rsrvd_fix_q)
    BEGIN
        CASE (fracRPostExc_uid99_block_rsrvd_fix_s) IS
            WHEN "00" => fracRPostExc_uid99_block_rsrvd_fix_q <= cstZeroWF_uid18_block_rsrvd_fix_q;
            WHEN "01" => fracRPostExc_uid99_block_rsrvd_fix_q <= redist17_fracR_uid77_block_rsrvd_fix_b_4_q;
            WHEN "10" => fracRPostExc_uid99_block_rsrvd_fix_q <= cstZeroWF_uid18_block_rsrvd_fix_q;
            WHEN "11" => fracRPostExc_uid99_block_rsrvd_fix_q <= oneFracRPostExc2_uid96_block_rsrvd_fix_q;
            WHEN OTHERS => fracRPostExc_uid99_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- RExpE_uid104_block_rsrvd_fix(BITJOIN,103)@23
    RExpE_uid104_block_rsrvd_fix_q <= GND_q & expRPostExc_uid103_block_rsrvd_fix_q & fracRPostExc_uid99_block_rsrvd_fix_q;

    -- out_primWireOut(GPOUT,4)@23
    out_primWireOut <= RExpE_uid104_block_rsrvd_fix_q;

END normal;
