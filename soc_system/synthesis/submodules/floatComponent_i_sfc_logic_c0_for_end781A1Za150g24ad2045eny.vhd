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

-- VHDL created from floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA1Z4ce2a150g24ad2045eny
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

entity floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA1Z4ce2a150g24ad2045eny is
    port (
        in_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        out_primWireOut : out std_logic_vector(31 downto 0);  -- float32_m23
        clock : in std_logic;
        resetn : in std_logic
    );
end floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA1Z4ce2a150g24ad2045eny;

architecture normal of floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA1Z4ce2a150g24ad2045eny is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid6_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal signX_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid8_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWF_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid10_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_x_uid12_block_rsrvd_fix_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_x_uid13_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid13_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid14_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid15_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid15_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid16_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid17_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid18_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid19_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid21_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sBias_uid22_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expEvenSig_uid24_block_rsrvd_fix_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expEvenSig_uid24_block_rsrvd_fix_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expEvenSig_uid24_block_rsrvd_fix_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expEvenSig_uid24_block_rsrvd_fix_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expREven_uid25_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal sBiasM1_uid26_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expOddSig_uid27_block_rsrvd_fix_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expOddSig_uid27_block_rsrvd_fix_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expOddSig_uid27_block_rsrvd_fix_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expOddSig_uid27_block_rsrvd_fix_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expROdd_uid28_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expX0PS_uid29_block_rsrvd_fix_in : STD_LOGIC_VECTOR (0 downto 0);
    signal expX0PS_uid29_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expOddSelect_uid30_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expRMux_uid31_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRMux_uid31_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal addrFull_uid33_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal yAddr_uid35_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal yForPe_uid36_block_rsrvd_fix_in : STD_LOGIC_VECTOR (15 downto 0);
    signal yForPe_uid36_block_rsrvd_fix_b : STD_LOGIC_VECTOR (15 downto 0);
    signal expIncPEOnly_uid38_block_rsrvd_fix_in : STD_LOGIC_VECTOR (30 downto 0);
    signal expIncPEOnly_uid38_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPreCR_uid39_block_rsrvd_fix_in : STD_LOGIC_VECTOR (28 downto 0);
    signal fracRPreCR_uid39_block_rsrvd_fix_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracPaddingOne_uid41_block_rsrvd_fix_q : STD_LOGIC_VECTOR (24 downto 0);
    signal oFracX_uid44_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal oFracXZ_mergedSignalTM_uid47_block_rsrvd_fix_q : STD_LOGIC_VECTOR (24 downto 0);
    signal oFracXSignExt_mergedSignalTM_uid52_block_rsrvd_fix_q : STD_LOGIC_VECTOR (24 downto 0);
    signal normalizedXForComp_uid54_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal normalizedXForComp_uid54_block_rsrvd_fix_q : STD_LOGIC_VECTOR (24 downto 0);
    signal paddingY_uid55_block_rsrvd_fix_q : STD_LOGIC_VECTOR (24 downto 0);
    signal updatedY_uid56_block_rsrvd_fix_q : STD_LOGIC_VECTOR (49 downto 0);
    signal squaredResultGTEIn_uid55_block_rsrvd_fix_a : STD_LOGIC_VECTOR (51 downto 0);
    signal squaredResultGTEIn_uid55_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal squaredResultGTEIn_uid55_block_rsrvd_fix_o : STD_LOGIC_VECTOR (51 downto 0);
    signal squaredResultGTEIn_uid55_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal pLTOne_uid58_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fxpSqrtResPostUpdateE_uid60_block_rsrvd_fix_a : STD_LOGIC_VECTOR (24 downto 0);
    signal fxpSqrtResPostUpdateE_uid60_block_rsrvd_fix_b : STD_LOGIC_VECTOR (24 downto 0);
    signal fxpSqrtResPostUpdateE_uid60_block_rsrvd_fix_o : STD_LOGIC_VECTOR (24 downto 0);
    signal fxpSqrtResPostUpdateE_uid60_block_rsrvd_fix_q : STD_LOGIC_VECTOR (24 downto 0);
    signal fracPENotOne_uid62_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPENotOneAndCRRoundsExp_uid63_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expInc_uid64_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expR_uid66_block_rsrvd_fix_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expR_uid66_block_rsrvd_fix_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expR_uid66_block_rsrvd_fix_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expR_uid66_block_rsrvd_fix_q : STD_LOGIC_VECTOR (8 downto 0);
    signal invSignX_uid67_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal inInfAndNotNeg_uid68_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal minReg_uid69_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal minInf_uid70_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid71_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid71_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excConc_uid72_block_rsrvd_fix_q : STD_LOGIC_VECTOR (2 downto 0);
    signal fracSelIn_uid73_block_rsrvd_fix_q : STD_LOGIC_VECTOR (3 downto 0);
    signal fracSel_uid74_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal expRR_uid77_block_rsrvd_fix_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expRR_uid77_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expRPostExc_uid79_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid79_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal fracNaN_uid80_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPostExc_uid84_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid84_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal negZero_uid85_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal RSqrt_uid86_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal yT1_uid100_invPolyEval_b : STD_LOGIC_VECTOR (11 downto 0);
    signal lowRangeB_uid102_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid102_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid103_invPolyEval_b : STD_LOGIC_VECTOR (11 downto 0);
    signal s1sumAHighB_uid104_invPolyEval_a : STD_LOGIC_VECTOR (21 downto 0);
    signal s1sumAHighB_uid104_invPolyEval_b : STD_LOGIC_VECTOR (21 downto 0);
    signal s1sumAHighB_uid104_invPolyEval_o : STD_LOGIC_VECTOR (21 downto 0);
    signal s1sumAHighB_uid104_invPolyEval_q : STD_LOGIC_VECTOR (21 downto 0);
    signal s1_uid105_invPolyEval_q : STD_LOGIC_VECTOR (22 downto 0);
    signal lowRangeB_uid108_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid108_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid109_invPolyEval_b : STD_LOGIC_VECTOR (21 downto 0);
    signal s2sumAHighB_uid110_invPolyEval_a : STD_LOGIC_VECTOR (29 downto 0);
    signal s2sumAHighB_uid110_invPolyEval_b : STD_LOGIC_VECTOR (29 downto 0);
    signal s2sumAHighB_uid110_invPolyEval_o : STD_LOGIC_VECTOR (29 downto 0);
    signal s2sumAHighB_uid110_invPolyEval_q : STD_LOGIC_VECTOR (29 downto 0);
    signal s2_uid111_invPolyEval_q : STD_LOGIC_VECTOR (31 downto 0);
    signal osig_uid114_pT1_uid101_invPolyEval_b : STD_LOGIC_VECTOR (12 downto 0);
    signal osig_uid117_pT2_uid107_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal memoryC0_uid88_sqrtTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid88_sqrtTables_lutmem_ia : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC0_uid88_sqrtTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid88_sqrtTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid88_sqrtTables_lutmem_ir : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC0_uid88_sqrtTables_lutmem_r : STD_LOGIC_VECTOR (28 downto 0);
    signal memoryC1_uid91_sqrtTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid91_sqrtTables_lutmem_ia : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC1_uid91_sqrtTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid91_sqrtTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid91_sqrtTables_lutmem_ir : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC1_uid91_sqrtTables_lutmem_r : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC2_uid94_sqrtTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid94_sqrtTables_lutmem_ia : STD_LOGIC_VECTOR (11 downto 0);
    signal memoryC2_uid94_sqrtTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid94_sqrtTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid94_sqrtTables_lutmem_ir : STD_LOGIC_VECTOR (11 downto 0);
    signal memoryC2_uid94_sqrtTables_lutmem_r : STD_LOGIC_VECTOR (11 downto 0);
    signal squaredResult_uid42_block_rsrvd_fix_cma_reset : std_logic;
    type squaredResult_uid42_block_rsrvd_fix_cma_a0type is array(NATURAL range <>) of UNSIGNED(24 downto 0);
    signal squaredResult_uid42_block_rsrvd_fix_cma_a0 : squaredResult_uid42_block_rsrvd_fix_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of squaredResult_uid42_block_rsrvd_fix_cma_a0 : signal is true;
    signal squaredResult_uid42_block_rsrvd_fix_cma_c0 : squaredResult_uid42_block_rsrvd_fix_cma_a0type(0 to 0);
    attribute preserve of squaredResult_uid42_block_rsrvd_fix_cma_c0 : signal is true;
    type squaredResult_uid42_block_rsrvd_fix_cma_ptype is array(NATURAL range <>) of UNSIGNED(49 downto 0);
    signal squaredResult_uid42_block_rsrvd_fix_cma_p : squaredResult_uid42_block_rsrvd_fix_cma_ptype(0 to 0);
    signal squaredResult_uid42_block_rsrvd_fix_cma_u : squaredResult_uid42_block_rsrvd_fix_cma_ptype(0 to 0);
    signal squaredResult_uid42_block_rsrvd_fix_cma_w : squaredResult_uid42_block_rsrvd_fix_cma_ptype(0 to 0);
    signal squaredResult_uid42_block_rsrvd_fix_cma_x : squaredResult_uid42_block_rsrvd_fix_cma_ptype(0 to 0);
    signal squaredResult_uid42_block_rsrvd_fix_cma_y : squaredResult_uid42_block_rsrvd_fix_cma_ptype(0 to 0);
    signal squaredResult_uid42_block_rsrvd_fix_cma_s : squaredResult_uid42_block_rsrvd_fix_cma_ptype(0 to 0);
    signal squaredResult_uid42_block_rsrvd_fix_cma_qq : STD_LOGIC_VECTOR (49 downto 0);
    signal squaredResult_uid42_block_rsrvd_fix_cma_q : STD_LOGIC_VECTOR (49 downto 0);
    signal squaredResult_uid42_block_rsrvd_fix_cma_ena0 : std_logic;
    signal squaredResult_uid42_block_rsrvd_fix_cma_ena1 : std_logic;
    signal prodXY_uid113_pT1_uid101_invPolyEval_cma_reset : std_logic;
    type prodXY_uid113_pT1_uid101_invPolyEval_cma_a0type is array(NATURAL range <>) of UNSIGNED(11 downto 0);
    signal prodXY_uid113_pT1_uid101_invPolyEval_cma_a0 : prodXY_uid113_pT1_uid101_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid113_pT1_uid101_invPolyEval_cma_a0 : signal is true;
    type prodXY_uid113_pT1_uid101_invPolyEval_cma_c0type is array(NATURAL range <>) of SIGNED(11 downto 0);
    signal prodXY_uid113_pT1_uid101_invPolyEval_cma_c0 : prodXY_uid113_pT1_uid101_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of prodXY_uid113_pT1_uid101_invPolyEval_cma_c0 : signal is true;
    type prodXY_uid113_pT1_uid101_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(12 downto 0);
    signal prodXY_uid113_pT1_uid101_invPolyEval_cma_l : prodXY_uid113_pT1_uid101_invPolyEval_cma_ltype(0 to 0);
    type prodXY_uid113_pT1_uid101_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(24 downto 0);
    signal prodXY_uid113_pT1_uid101_invPolyEval_cma_p : prodXY_uid113_pT1_uid101_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid113_pT1_uid101_invPolyEval_cma_u : prodXY_uid113_pT1_uid101_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid113_pT1_uid101_invPolyEval_cma_w : prodXY_uid113_pT1_uid101_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid113_pT1_uid101_invPolyEval_cma_x : prodXY_uid113_pT1_uid101_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid113_pT1_uid101_invPolyEval_cma_y : prodXY_uid113_pT1_uid101_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid113_pT1_uid101_invPolyEval_cma_s : prodXY_uid113_pT1_uid101_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid113_pT1_uid101_invPolyEval_cma_qq : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid113_pT1_uid101_invPolyEval_cma_q : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid113_pT1_uid101_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid113_pT1_uid101_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid116_pT2_uid107_invPolyEval_cma_reset : std_logic;
    type prodXY_uid116_pT2_uid107_invPolyEval_cma_a0type is array(NATURAL range <>) of UNSIGNED(15 downto 0);
    signal prodXY_uid116_pT2_uid107_invPolyEval_cma_a0 : prodXY_uid116_pT2_uid107_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid116_pT2_uid107_invPolyEval_cma_a0 : signal is true;
    type prodXY_uid116_pT2_uid107_invPolyEval_cma_c0type is array(NATURAL range <>) of SIGNED(22 downto 0);
    signal prodXY_uid116_pT2_uid107_invPolyEval_cma_c0 : prodXY_uid116_pT2_uid107_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of prodXY_uid116_pT2_uid107_invPolyEval_cma_c0 : signal is true;
    type prodXY_uid116_pT2_uid107_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(16 downto 0);
    signal prodXY_uid116_pT2_uid107_invPolyEval_cma_l : prodXY_uid116_pT2_uid107_invPolyEval_cma_ltype(0 to 0);
    type prodXY_uid116_pT2_uid107_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(39 downto 0);
    signal prodXY_uid116_pT2_uid107_invPolyEval_cma_p : prodXY_uid116_pT2_uid107_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid116_pT2_uid107_invPolyEval_cma_u : prodXY_uid116_pT2_uid107_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid116_pT2_uid107_invPolyEval_cma_w : prodXY_uid116_pT2_uid107_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid116_pT2_uid107_invPolyEval_cma_x : prodXY_uid116_pT2_uid107_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid116_pT2_uid107_invPolyEval_cma_y : prodXY_uid116_pT2_uid107_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid116_pT2_uid107_invPolyEval_cma_s : prodXY_uid116_pT2_uid107_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid116_pT2_uid107_invPolyEval_cma_qq : STD_LOGIC_VECTOR (38 downto 0);
    signal prodXY_uid116_pT2_uid107_invPolyEval_cma_q : STD_LOGIC_VECTOR (38 downto 0);
    signal prodXY_uid116_pT2_uid107_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid116_pT2_uid107_invPolyEval_cma_ena1 : std_logic;
    signal expUpdateCRU_uid61_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expUpdateCRU_uid61_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (22 downto 0);
    signal redist0_expUpdateCRU_uid61_block_rsrvd_fix_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_expUpdateCRU_uid61_block_rsrvd_fix_merged_bit_select_c_2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist2_squaredResult_uid42_block_rsrvd_fix_cma_q_1_q : STD_LOGIC_VECTOR (49 downto 0);
    signal redist3_memoryC0_uid88_sqrtTables_lutmem_r_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal redist4_osig_uid117_pT2_uid107_invPolyEval_b_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist5_lowRangeB_uid102_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_expRR_uid77_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist7_fracRPreCR_uid39_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist9_expIncPEOnly_uid38_block_rsrvd_fix_b_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_yAddr_uid35_block_rsrvd_fix_b_2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist12_yAddr_uid35_block_rsrvd_fix_b_5_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist13_expOddSelect_uid30_block_rsrvd_fix_q_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_expOddSelect_uid30_block_rsrvd_fix_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_excI_x_uid17_block_rsrvd_fix_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_fracXIsZero_uid15_block_rsrvd_fix_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_excZ_x_uid13_block_rsrvd_fix_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_frac_x_uid12_block_rsrvd_fix_b_2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist20_signX_uid7_block_rsrvd_fix_b_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_signX_uid7_block_rsrvd_fix_b_15_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_mem_reset0 : std_logic;
    signal redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_mem_ia : STD_LOGIC_VECTOR (23 downto 0);
    signal redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_mem_iq : STD_LOGIC_VECTOR (23 downto 0);
    signal redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_mem_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_rdcnt_i : signal is true;
    signal redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_rdcnt_eq : std_logic;
    attribute preserve of redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_rdcnt_eq : signal is true;
    signal redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_sticky_ena_q : signal is true;
    signal redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_yForPe_uid36_block_rsrvd_fix_b_3_mem_reset0 : std_logic;
    signal redist10_yForPe_uid36_block_rsrvd_fix_b_3_mem_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal redist10_yForPe_uid36_block_rsrvd_fix_b_3_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_yForPe_uid36_block_rsrvd_fix_b_3_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_yForPe_uid36_block_rsrvd_fix_b_3_mem_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal redist10_yForPe_uid36_block_rsrvd_fix_b_3_mem_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist10_yForPe_uid36_block_rsrvd_fix_b_3_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_yForPe_uid36_block_rsrvd_fix_b_3_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of redist10_yForPe_uid36_block_rsrvd_fix_b_3_rdcnt_i : signal is true;
    signal redist10_yForPe_uid36_block_rsrvd_fix_b_3_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_yForPe_uid36_block_rsrvd_fix_b_3_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_yForPe_uid36_block_rsrvd_fix_b_3_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_yForPe_uid36_block_rsrvd_fix_b_3_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_yForPe_uid36_block_rsrvd_fix_b_3_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist10_yForPe_uid36_block_rsrvd_fix_b_3_sticky_ena_q : signal is true;
    signal redist10_yForPe_uid36_block_rsrvd_fix_b_3_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_frac_x_uid12_block_rsrvd_fix_b_11_outputreg_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist19_frac_x_uid12_block_rsrvd_fix_b_11_mem_reset0 : std_logic;
    signal redist19_frac_x_uid12_block_rsrvd_fix_b_11_mem_ia : STD_LOGIC_VECTOR (22 downto 0);
    signal redist19_frac_x_uid12_block_rsrvd_fix_b_11_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist19_frac_x_uid12_block_rsrvd_fix_b_11_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist19_frac_x_uid12_block_rsrvd_fix_b_11_mem_iq : STD_LOGIC_VECTOR (22 downto 0);
    signal redist19_frac_x_uid12_block_rsrvd_fix_b_11_mem_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist19_frac_x_uid12_block_rsrvd_fix_b_11_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist19_frac_x_uid12_block_rsrvd_fix_b_11_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist19_frac_x_uid12_block_rsrvd_fix_b_11_rdcnt_i : signal is true;
    signal redist19_frac_x_uid12_block_rsrvd_fix_b_11_rdcnt_eq : std_logic;
    attribute preserve of redist19_frac_x_uid12_block_rsrvd_fix_b_11_rdcnt_eq : signal is true;
    signal redist19_frac_x_uid12_block_rsrvd_fix_b_11_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist19_frac_x_uid12_block_rsrvd_fix_b_11_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist19_frac_x_uid12_block_rsrvd_fix_b_11_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist19_frac_x_uid12_block_rsrvd_fix_b_11_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_frac_x_uid12_block_rsrvd_fix_b_11_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_frac_x_uid12_block_rsrvd_fix_b_11_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_frac_x_uid12_block_rsrvd_fix_b_11_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_frac_x_uid12_block_rsrvd_fix_b_11_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist19_frac_x_uid12_block_rsrvd_fix_b_11_sticky_ena_q : signal is true;
    signal redist19_frac_x_uid12_block_rsrvd_fix_b_11_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_expX_uid6_block_rsrvd_fix_b_13_outputreg_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist22_expX_uid6_block_rsrvd_fix_b_13_mem_reset0 : std_logic;
    signal redist22_expX_uid6_block_rsrvd_fix_b_13_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist22_expX_uid6_block_rsrvd_fix_b_13_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist22_expX_uid6_block_rsrvd_fix_b_13_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist22_expX_uid6_block_rsrvd_fix_b_13_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist22_expX_uid6_block_rsrvd_fix_b_13_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist22_expX_uid6_block_rsrvd_fix_b_13_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist22_expX_uid6_block_rsrvd_fix_b_13_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve of redist22_expX_uid6_block_rsrvd_fix_b_13_rdcnt_i : signal is true;
    signal redist22_expX_uid6_block_rsrvd_fix_b_13_rdcnt_eq : std_logic;
    attribute preserve of redist22_expX_uid6_block_rsrvd_fix_b_13_rdcnt_eq : signal is true;
    signal redist22_expX_uid6_block_rsrvd_fix_b_13_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist22_expX_uid6_block_rsrvd_fix_b_13_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist22_expX_uid6_block_rsrvd_fix_b_13_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist22_expX_uid6_block_rsrvd_fix_b_13_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_expX_uid6_block_rsrvd_fix_b_13_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_expX_uid6_block_rsrvd_fix_b_13_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_expX_uid6_block_rsrvd_fix_b_13_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_expX_uid6_block_rsrvd_fix_b_13_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist22_expX_uid6_block_rsrvd_fix_b_13_sticky_ena_q : signal is true;
    signal redist22_expX_uid6_block_rsrvd_fix_b_13_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- signX_uid7_block_rsrvd_fix(BITSELECT,6)@0
    signX_uid7_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(in_0(31 downto 31));

    -- redist20_signX_uid7_block_rsrvd_fix_b_14(DELAY,145)
    redist20_signX_uid7_block_rsrvd_fix_b_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 14, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => signX_uid7_block_rsrvd_fix_b, xout => redist20_signX_uid7_block_rsrvd_fix_b_14_q, clk => clock, aclr => resetn );

    -- redist21_signX_uid7_block_rsrvd_fix_b_15(DELAY,146)
    redist21_signX_uid7_block_rsrvd_fix_b_15 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist20_signX_uid7_block_rsrvd_fix_b_14_q, xout => redist21_signX_uid7_block_rsrvd_fix_b_15_q, clk => clock, aclr => resetn );

    -- cstAllZWE_uid10_block_rsrvd_fix(CONSTANT,9)
    cstAllZWE_uid10_block_rsrvd_fix_q <= "00000000";

    -- redist22_expX_uid6_block_rsrvd_fix_b_13_notEnable(LOGICAL,184)
    redist22_expX_uid6_block_rsrvd_fix_b_13_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist22_expX_uid6_block_rsrvd_fix_b_13_nor(LOGICAL,185)
    redist22_expX_uid6_block_rsrvd_fix_b_13_nor_q <= not (redist22_expX_uid6_block_rsrvd_fix_b_13_notEnable_q or redist22_expX_uid6_block_rsrvd_fix_b_13_sticky_ena_q);

    -- redist22_expX_uid6_block_rsrvd_fix_b_13_mem_last(CONSTANT,181)
    redist22_expX_uid6_block_rsrvd_fix_b_13_mem_last_q <= "01001";

    -- redist22_expX_uid6_block_rsrvd_fix_b_13_cmp(LOGICAL,182)
    redist22_expX_uid6_block_rsrvd_fix_b_13_cmp_b <= STD_LOGIC_VECTOR("0" & redist22_expX_uid6_block_rsrvd_fix_b_13_rdcnt_q);
    redist22_expX_uid6_block_rsrvd_fix_b_13_cmp_q <= "1" WHEN redist22_expX_uid6_block_rsrvd_fix_b_13_mem_last_q = redist22_expX_uid6_block_rsrvd_fix_b_13_cmp_b ELSE "0";

    -- redist22_expX_uid6_block_rsrvd_fix_b_13_cmpReg(REG,183)
    redist22_expX_uid6_block_rsrvd_fix_b_13_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist22_expX_uid6_block_rsrvd_fix_b_13_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist22_expX_uid6_block_rsrvd_fix_b_13_cmpReg_q <= STD_LOGIC_VECTOR(redist22_expX_uid6_block_rsrvd_fix_b_13_cmp_q);
        END IF;
    END PROCESS;

    -- redist22_expX_uid6_block_rsrvd_fix_b_13_sticky_ena(REG,186)
    redist22_expX_uid6_block_rsrvd_fix_b_13_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist22_expX_uid6_block_rsrvd_fix_b_13_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist22_expX_uid6_block_rsrvd_fix_b_13_nor_q = "1") THEN
                redist22_expX_uid6_block_rsrvd_fix_b_13_sticky_ena_q <= STD_LOGIC_VECTOR(redist22_expX_uid6_block_rsrvd_fix_b_13_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist22_expX_uid6_block_rsrvd_fix_b_13_enaAnd(LOGICAL,187)
    redist22_expX_uid6_block_rsrvd_fix_b_13_enaAnd_q <= redist22_expX_uid6_block_rsrvd_fix_b_13_sticky_ena_q and VCC_q;

    -- redist22_expX_uid6_block_rsrvd_fix_b_13_rdcnt(COUNTER,179)
    -- low=0, high=10, step=1, init=0
    redist22_expX_uid6_block_rsrvd_fix_b_13_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist22_expX_uid6_block_rsrvd_fix_b_13_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist22_expX_uid6_block_rsrvd_fix_b_13_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist22_expX_uid6_block_rsrvd_fix_b_13_rdcnt_i = TO_UNSIGNED(9, 4)) THEN
                redist22_expX_uid6_block_rsrvd_fix_b_13_rdcnt_eq <= '1';
            ELSE
                redist22_expX_uid6_block_rsrvd_fix_b_13_rdcnt_eq <= '0';
            END IF;
            IF (redist22_expX_uid6_block_rsrvd_fix_b_13_rdcnt_eq = '1') THEN
                redist22_expX_uid6_block_rsrvd_fix_b_13_rdcnt_i <= redist22_expX_uid6_block_rsrvd_fix_b_13_rdcnt_i + 6;
            ELSE
                redist22_expX_uid6_block_rsrvd_fix_b_13_rdcnt_i <= redist22_expX_uid6_block_rsrvd_fix_b_13_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist22_expX_uid6_block_rsrvd_fix_b_13_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist22_expX_uid6_block_rsrvd_fix_b_13_rdcnt_i, 4)));

    -- expX_uid6_block_rsrvd_fix(BITSELECT,5)@0
    expX_uid6_block_rsrvd_fix_b <= in_0(30 downto 23);

    -- redist22_expX_uid6_block_rsrvd_fix_b_13_wraddr(REG,180)
    redist22_expX_uid6_block_rsrvd_fix_b_13_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist22_expX_uid6_block_rsrvd_fix_b_13_wraddr_q <= "1010";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist22_expX_uid6_block_rsrvd_fix_b_13_wraddr_q <= STD_LOGIC_VECTOR(redist22_expX_uid6_block_rsrvd_fix_b_13_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist22_expX_uid6_block_rsrvd_fix_b_13_mem(DUALMEM,178)
    redist22_expX_uid6_block_rsrvd_fix_b_13_mem_ia <= STD_LOGIC_VECTOR(expX_uid6_block_rsrvd_fix_b);
    redist22_expX_uid6_block_rsrvd_fix_b_13_mem_aa <= redist22_expX_uid6_block_rsrvd_fix_b_13_wraddr_q;
    redist22_expX_uid6_block_rsrvd_fix_b_13_mem_ab <= redist22_expX_uid6_block_rsrvd_fix_b_13_rdcnt_q;
    redist22_expX_uid6_block_rsrvd_fix_b_13_mem_reset0 <= not (resetn);
    redist22_expX_uid6_block_rsrvd_fix_b_13_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 4,
        numwords_a => 11,
        width_b => 8,
        widthad_b => 4,
        numwords_b => 11,
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
        clocken1 => redist22_expX_uid6_block_rsrvd_fix_b_13_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist22_expX_uid6_block_rsrvd_fix_b_13_mem_reset0,
        clock1 => clock,
        address_a => redist22_expX_uid6_block_rsrvd_fix_b_13_mem_aa,
        data_a => redist22_expX_uid6_block_rsrvd_fix_b_13_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist22_expX_uid6_block_rsrvd_fix_b_13_mem_ab,
        q_b => redist22_expX_uid6_block_rsrvd_fix_b_13_mem_iq
    );
    redist22_expX_uid6_block_rsrvd_fix_b_13_mem_q <= redist22_expX_uid6_block_rsrvd_fix_b_13_mem_iq(7 downto 0);

    -- redist22_expX_uid6_block_rsrvd_fix_b_13_outputreg(DELAY,177)
    redist22_expX_uid6_block_rsrvd_fix_b_13_outputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist22_expX_uid6_block_rsrvd_fix_b_13_mem_q, xout => redist22_expX_uid6_block_rsrvd_fix_b_13_outputreg_q, clk => clock, aclr => resetn );

    -- excZ_x_uid13_block_rsrvd_fix(LOGICAL,12)@13 + 1
    excZ_x_uid13_block_rsrvd_fix_qi <= "1" WHEN redist22_expX_uid6_block_rsrvd_fix_b_13_outputreg_q = cstAllZWE_uid10_block_rsrvd_fix_q ELSE "0";
    excZ_x_uid13_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excZ_x_uid13_block_rsrvd_fix_qi, xout => excZ_x_uid13_block_rsrvd_fix_q, clk => clock, aclr => resetn );

    -- redist17_excZ_x_uid13_block_rsrvd_fix_q_2(DELAY,142)
    redist17_excZ_x_uid13_block_rsrvd_fix_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excZ_x_uid13_block_rsrvd_fix_q, xout => redist17_excZ_x_uid13_block_rsrvd_fix_q_2_q, clk => clock, aclr => resetn );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- negZero_uid85_block_rsrvd_fix(LOGICAL,84)@15
    negZero_uid85_block_rsrvd_fix_q <= redist17_excZ_x_uid13_block_rsrvd_fix_q_2_q and redist21_signX_uid7_block_rsrvd_fix_b_15_q;

    -- cstAllOWE_uid8_block_rsrvd_fix(CONSTANT,7)
    cstAllOWE_uid8_block_rsrvd_fix_q <= "11111111";

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- redist19_frac_x_uid12_block_rsrvd_fix_b_11_notEnable(LOGICAL,173)
    redist19_frac_x_uid12_block_rsrvd_fix_b_11_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist19_frac_x_uid12_block_rsrvd_fix_b_11_nor(LOGICAL,174)
    redist19_frac_x_uid12_block_rsrvd_fix_b_11_nor_q <= not (redist19_frac_x_uid12_block_rsrvd_fix_b_11_notEnable_q or redist19_frac_x_uid12_block_rsrvd_fix_b_11_sticky_ena_q);

    -- redist19_frac_x_uid12_block_rsrvd_fix_b_11_mem_last(CONSTANT,170)
    redist19_frac_x_uid12_block_rsrvd_fix_b_11_mem_last_q <= "0101";

    -- redist19_frac_x_uid12_block_rsrvd_fix_b_11_cmp(LOGICAL,171)
    redist19_frac_x_uid12_block_rsrvd_fix_b_11_cmp_b <= STD_LOGIC_VECTOR("0" & redist19_frac_x_uid12_block_rsrvd_fix_b_11_rdcnt_q);
    redist19_frac_x_uid12_block_rsrvd_fix_b_11_cmp_q <= "1" WHEN redist19_frac_x_uid12_block_rsrvd_fix_b_11_mem_last_q = redist19_frac_x_uid12_block_rsrvd_fix_b_11_cmp_b ELSE "0";

    -- redist19_frac_x_uid12_block_rsrvd_fix_b_11_cmpReg(REG,172)
    redist19_frac_x_uid12_block_rsrvd_fix_b_11_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist19_frac_x_uid12_block_rsrvd_fix_b_11_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist19_frac_x_uid12_block_rsrvd_fix_b_11_cmpReg_q <= STD_LOGIC_VECTOR(redist19_frac_x_uid12_block_rsrvd_fix_b_11_cmp_q);
        END IF;
    END PROCESS;

    -- redist19_frac_x_uid12_block_rsrvd_fix_b_11_sticky_ena(REG,175)
    redist19_frac_x_uid12_block_rsrvd_fix_b_11_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist19_frac_x_uid12_block_rsrvd_fix_b_11_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist19_frac_x_uid12_block_rsrvd_fix_b_11_nor_q = "1") THEN
                redist19_frac_x_uid12_block_rsrvd_fix_b_11_sticky_ena_q <= STD_LOGIC_VECTOR(redist19_frac_x_uid12_block_rsrvd_fix_b_11_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist19_frac_x_uid12_block_rsrvd_fix_b_11_enaAnd(LOGICAL,176)
    redist19_frac_x_uid12_block_rsrvd_fix_b_11_enaAnd_q <= redist19_frac_x_uid12_block_rsrvd_fix_b_11_sticky_ena_q and VCC_q;

    -- redist19_frac_x_uid12_block_rsrvd_fix_b_11_rdcnt(COUNTER,168)
    -- low=0, high=6, step=1, init=0
    redist19_frac_x_uid12_block_rsrvd_fix_b_11_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist19_frac_x_uid12_block_rsrvd_fix_b_11_rdcnt_i <= TO_UNSIGNED(0, 3);
            redist19_frac_x_uid12_block_rsrvd_fix_b_11_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist19_frac_x_uid12_block_rsrvd_fix_b_11_rdcnt_i = TO_UNSIGNED(5, 3)) THEN
                redist19_frac_x_uid12_block_rsrvd_fix_b_11_rdcnt_eq <= '1';
            ELSE
                redist19_frac_x_uid12_block_rsrvd_fix_b_11_rdcnt_eq <= '0';
            END IF;
            IF (redist19_frac_x_uid12_block_rsrvd_fix_b_11_rdcnt_eq = '1') THEN
                redist19_frac_x_uid12_block_rsrvd_fix_b_11_rdcnt_i <= redist19_frac_x_uid12_block_rsrvd_fix_b_11_rdcnt_i + 2;
            ELSE
                redist19_frac_x_uid12_block_rsrvd_fix_b_11_rdcnt_i <= redist19_frac_x_uid12_block_rsrvd_fix_b_11_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist19_frac_x_uid12_block_rsrvd_fix_b_11_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist19_frac_x_uid12_block_rsrvd_fix_b_11_rdcnt_i, 3)));

    -- frac_x_uid12_block_rsrvd_fix(BITSELECT,11)@0
    frac_x_uid12_block_rsrvd_fix_b <= in_0(22 downto 0);

    -- redist18_frac_x_uid12_block_rsrvd_fix_b_2(DELAY,143)
    redist18_frac_x_uid12_block_rsrvd_fix_b_2 : dspba_delay
    GENERIC MAP ( width => 23, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => frac_x_uid12_block_rsrvd_fix_b, xout => redist18_frac_x_uid12_block_rsrvd_fix_b_2_q, clk => clock, aclr => resetn );

    -- redist19_frac_x_uid12_block_rsrvd_fix_b_11_wraddr(REG,169)
    redist19_frac_x_uid12_block_rsrvd_fix_b_11_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist19_frac_x_uid12_block_rsrvd_fix_b_11_wraddr_q <= "110";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist19_frac_x_uid12_block_rsrvd_fix_b_11_wraddr_q <= STD_LOGIC_VECTOR(redist19_frac_x_uid12_block_rsrvd_fix_b_11_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist19_frac_x_uid12_block_rsrvd_fix_b_11_mem(DUALMEM,167)
    redist19_frac_x_uid12_block_rsrvd_fix_b_11_mem_ia <= STD_LOGIC_VECTOR(redist18_frac_x_uid12_block_rsrvd_fix_b_2_q);
    redist19_frac_x_uid12_block_rsrvd_fix_b_11_mem_aa <= redist19_frac_x_uid12_block_rsrvd_fix_b_11_wraddr_q;
    redist19_frac_x_uid12_block_rsrvd_fix_b_11_mem_ab <= redist19_frac_x_uid12_block_rsrvd_fix_b_11_rdcnt_q;
    redist19_frac_x_uid12_block_rsrvd_fix_b_11_mem_reset0 <= not (resetn);
    redist19_frac_x_uid12_block_rsrvd_fix_b_11_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 23,
        widthad_b => 3,
        numwords_b => 7,
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
        clocken1 => redist19_frac_x_uid12_block_rsrvd_fix_b_11_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist19_frac_x_uid12_block_rsrvd_fix_b_11_mem_reset0,
        clock1 => clock,
        address_a => redist19_frac_x_uid12_block_rsrvd_fix_b_11_mem_aa,
        data_a => redist19_frac_x_uid12_block_rsrvd_fix_b_11_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist19_frac_x_uid12_block_rsrvd_fix_b_11_mem_ab,
        q_b => redist19_frac_x_uid12_block_rsrvd_fix_b_11_mem_iq
    );
    redist19_frac_x_uid12_block_rsrvd_fix_b_11_mem_q <= redist19_frac_x_uid12_block_rsrvd_fix_b_11_mem_iq(22 downto 0);

    -- redist19_frac_x_uid12_block_rsrvd_fix_b_11_outputreg(DELAY,166)
    redist19_frac_x_uid12_block_rsrvd_fix_b_11_outputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist19_frac_x_uid12_block_rsrvd_fix_b_11_mem_q, xout => redist19_frac_x_uid12_block_rsrvd_fix_b_11_outputreg_q, clk => clock, aclr => resetn );

    -- oFracX_uid44_block_rsrvd_fix(BITJOIN,43)@11
    oFracX_uid44_block_rsrvd_fix_q <= VCC_q & redist19_frac_x_uid12_block_rsrvd_fix_b_11_outputreg_q;

    -- oFracXZ_mergedSignalTM_uid47_block_rsrvd_fix(BITJOIN,46)@11
    oFracXZ_mergedSignalTM_uid47_block_rsrvd_fix_q <= oFracX_uid44_block_rsrvd_fix_q & GND_q;

    -- oFracXSignExt_mergedSignalTM_uid52_block_rsrvd_fix(BITJOIN,51)@11
    oFracXSignExt_mergedSignalTM_uid52_block_rsrvd_fix_q <= GND_q & oFracX_uid44_block_rsrvd_fix_q;

    -- expX0PS_uid29_block_rsrvd_fix(BITSELECT,28)@0
    expX0PS_uid29_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(expX_uid6_block_rsrvd_fix_b(0 downto 0));
    expX0PS_uid29_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(expX0PS_uid29_block_rsrvd_fix_in(0 downto 0));

    -- expOddSelect_uid30_block_rsrvd_fix(LOGICAL,29)@0
    expOddSelect_uid30_block_rsrvd_fix_q <= not (expX0PS_uid29_block_rsrvd_fix_b);

    -- redist13_expOddSelect_uid30_block_rsrvd_fix_q_11(DELAY,138)
    redist13_expOddSelect_uid30_block_rsrvd_fix_q_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => expOddSelect_uid30_block_rsrvd_fix_q, xout => redist13_expOddSelect_uid30_block_rsrvd_fix_q_11_q, clk => clock, aclr => resetn );

    -- normalizedXForComp_uid54_block_rsrvd_fix(MUX,53)@11 + 1
    normalizedXForComp_uid54_block_rsrvd_fix_s <= redist13_expOddSelect_uid30_block_rsrvd_fix_q_11_q;
    normalizedXForComp_uid54_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            normalizedXForComp_uid54_block_rsrvd_fix_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (normalizedXForComp_uid54_block_rsrvd_fix_s) IS
                WHEN "0" => normalizedXForComp_uid54_block_rsrvd_fix_q <= oFracXSignExt_mergedSignalTM_uid52_block_rsrvd_fix_q;
                WHEN "1" => normalizedXForComp_uid54_block_rsrvd_fix_q <= oFracXZ_mergedSignalTM_uid47_block_rsrvd_fix_q;
                WHEN OTHERS => normalizedXForComp_uid54_block_rsrvd_fix_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- paddingY_uid55_block_rsrvd_fix(CONSTANT,54)
    paddingY_uid55_block_rsrvd_fix_q <= "0000000000000000000000000";

    -- updatedY_uid56_block_rsrvd_fix(BITJOIN,55)@12
    updatedY_uid56_block_rsrvd_fix_q <= normalizedXForComp_uid54_block_rsrvd_fix_q & paddingY_uid55_block_rsrvd_fix_q;

    -- addrFull_uid33_block_rsrvd_fix(BITJOIN,32)@0
    addrFull_uid33_block_rsrvd_fix_q <= expOddSelect_uid30_block_rsrvd_fix_q & frac_x_uid12_block_rsrvd_fix_b;

    -- yAddr_uid35_block_rsrvd_fix(BITSELECT,34)@0
    yAddr_uid35_block_rsrvd_fix_b <= addrFull_uid33_block_rsrvd_fix_q(23 downto 16);

    -- memoryC2_uid94_sqrtTables_lutmem(DUALMEM,120)@0 + 2
    -- in j@20000000
    memoryC2_uid94_sqrtTables_lutmem_aa <= yAddr_uid35_block_rsrvd_fix_b;
    memoryC2_uid94_sqrtTables_lutmem_reset0 <= not (resetn);
    memoryC2_uid94_sqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "floatComponent_i_sfc_logic_c0_for_end781A2ZqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid94_sqrtTables_lutmem_reset0,
        clock0 => clock,
        address_a => memoryC2_uid94_sqrtTables_lutmem_aa,
        q_a => memoryC2_uid94_sqrtTables_lutmem_ir
    );
    memoryC2_uid94_sqrtTables_lutmem_r <= memoryC2_uid94_sqrtTables_lutmem_ir(11 downto 0);

    -- yForPe_uid36_block_rsrvd_fix(BITSELECT,35)@2
    yForPe_uid36_block_rsrvd_fix_in <= redist18_frac_x_uid12_block_rsrvd_fix_b_2_q(15 downto 0);
    yForPe_uid36_block_rsrvd_fix_b <= yForPe_uid36_block_rsrvd_fix_in(15 downto 0);

    -- yT1_uid100_invPolyEval(BITSELECT,99)@2
    yT1_uid100_invPolyEval_b <= yForPe_uid36_block_rsrvd_fix_b(15 downto 4);

    -- prodXY_uid113_pT1_uid101_invPolyEval_cma(CHAINMULTADD,122)@2 + 2
    prodXY_uid113_pT1_uid101_invPolyEval_cma_reset <= not (resetn);
    prodXY_uid113_pT1_uid101_invPolyEval_cma_ena0 <= '1';
    prodXY_uid113_pT1_uid101_invPolyEval_cma_ena1 <= prodXY_uid113_pT1_uid101_invPolyEval_cma_ena0;
    prodXY_uid113_pT1_uid101_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid113_pT1_uid101_invPolyEval_cma_a0(0),13));
    prodXY_uid113_pT1_uid101_invPolyEval_cma_p(0) <= prodXY_uid113_pT1_uid101_invPolyEval_cma_l(0) * prodXY_uid113_pT1_uid101_invPolyEval_cma_c0(0);
    prodXY_uid113_pT1_uid101_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid113_pT1_uid101_invPolyEval_cma_p(0),25);
    prodXY_uid113_pT1_uid101_invPolyEval_cma_w(0) <= prodXY_uid113_pT1_uid101_invPolyEval_cma_u(0);
    prodXY_uid113_pT1_uid101_invPolyEval_cma_x(0) <= prodXY_uid113_pT1_uid101_invPolyEval_cma_w(0);
    prodXY_uid113_pT1_uid101_invPolyEval_cma_y(0) <= prodXY_uid113_pT1_uid101_invPolyEval_cma_x(0);
    prodXY_uid113_pT1_uid101_invPolyEval_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodXY_uid113_pT1_uid101_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid113_pT1_uid101_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (prodXY_uid113_pT1_uid101_invPolyEval_cma_ena0 = '1') THEN
                prodXY_uid113_pT1_uid101_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(yT1_uid100_invPolyEval_b),12);
                prodXY_uid113_pT1_uid101_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(memoryC2_uid94_sqrtTables_lutmem_r),12);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid113_pT1_uid101_invPolyEval_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodXY_uid113_pT1_uid101_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (prodXY_uid113_pT1_uid101_invPolyEval_cma_ena1 = '1') THEN
                prodXY_uid113_pT1_uid101_invPolyEval_cma_s(0) <= prodXY_uid113_pT1_uid101_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid113_pT1_uid101_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 24, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid113_pT1_uid101_invPolyEval_cma_s(0)(23 downto 0)), xout => prodXY_uid113_pT1_uid101_invPolyEval_cma_qq, clk => clock, aclr => resetn );
    prodXY_uid113_pT1_uid101_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid113_pT1_uid101_invPolyEval_cma_qq(23 downto 0));

    -- osig_uid114_pT1_uid101_invPolyEval(BITSELECT,113)@4
    osig_uid114_pT1_uid101_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid113_pT1_uid101_invPolyEval_cma_q(23 downto 11));

    -- highBBits_uid103_invPolyEval(BITSELECT,102)@4
    highBBits_uid103_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid114_pT1_uid101_invPolyEval_b(12 downto 1));

    -- redist11_yAddr_uid35_block_rsrvd_fix_b_2(DELAY,136)
    redist11_yAddr_uid35_block_rsrvd_fix_b_2 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => yAddr_uid35_block_rsrvd_fix_b, xout => redist11_yAddr_uid35_block_rsrvd_fix_b_2_q, clk => clock, aclr => resetn );

    -- memoryC1_uid91_sqrtTables_lutmem(DUALMEM,119)@2 + 2
    -- in j@20000000
    memoryC1_uid91_sqrtTables_lutmem_aa <= redist11_yAddr_uid35_block_rsrvd_fix_b_2_q;
    memoryC1_uid91_sqrtTables_lutmem_reset0 <= not (resetn);
    memoryC1_uid91_sqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 21,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "floatComponent_i_sfc_logic_c0_for_end781A1ZqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid91_sqrtTables_lutmem_reset0,
        clock0 => clock,
        address_a => memoryC1_uid91_sqrtTables_lutmem_aa,
        q_a => memoryC1_uid91_sqrtTables_lutmem_ir
    );
    memoryC1_uid91_sqrtTables_lutmem_r <= memoryC1_uid91_sqrtTables_lutmem_ir(20 downto 0);

    -- s1sumAHighB_uid104_invPolyEval(ADD,103)@4 + 1
    s1sumAHighB_uid104_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => memoryC1_uid91_sqrtTables_lutmem_r(20)) & memoryC1_uid91_sqrtTables_lutmem_r));
    s1sumAHighB_uid104_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 12 => highBBits_uid103_invPolyEval_b(11)) & highBBits_uid103_invPolyEval_b));
    s1sumAHighB_uid104_invPolyEval_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            s1sumAHighB_uid104_invPolyEval_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            s1sumAHighB_uid104_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid104_invPolyEval_a) + SIGNED(s1sumAHighB_uid104_invPolyEval_b));
        END IF;
    END PROCESS;
    s1sumAHighB_uid104_invPolyEval_q <= s1sumAHighB_uid104_invPolyEval_o(21 downto 0);

    -- lowRangeB_uid102_invPolyEval(BITSELECT,101)@4
    lowRangeB_uid102_invPolyEval_in <= osig_uid114_pT1_uid101_invPolyEval_b(0 downto 0);
    lowRangeB_uid102_invPolyEval_b <= lowRangeB_uid102_invPolyEval_in(0 downto 0);

    -- redist5_lowRangeB_uid102_invPolyEval_b_1(DELAY,130)
    redist5_lowRangeB_uid102_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => lowRangeB_uid102_invPolyEval_b, xout => redist5_lowRangeB_uid102_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- s1_uid105_invPolyEval(BITJOIN,104)@5
    s1_uid105_invPolyEval_q <= s1sumAHighB_uid104_invPolyEval_q & redist5_lowRangeB_uid102_invPolyEval_b_1_q;

    -- redist10_yForPe_uid36_block_rsrvd_fix_b_3_notEnable(LOGICAL,162)
    redist10_yForPe_uid36_block_rsrvd_fix_b_3_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist10_yForPe_uid36_block_rsrvd_fix_b_3_nor(LOGICAL,163)
    redist10_yForPe_uid36_block_rsrvd_fix_b_3_nor_q <= not (redist10_yForPe_uid36_block_rsrvd_fix_b_3_notEnable_q or redist10_yForPe_uid36_block_rsrvd_fix_b_3_sticky_ena_q);

    -- redist10_yForPe_uid36_block_rsrvd_fix_b_3_cmpReg(REG,161)
    redist10_yForPe_uid36_block_rsrvd_fix_b_3_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist10_yForPe_uid36_block_rsrvd_fix_b_3_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist10_yForPe_uid36_block_rsrvd_fix_b_3_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
        END IF;
    END PROCESS;

    -- redist10_yForPe_uid36_block_rsrvd_fix_b_3_sticky_ena(REG,164)
    redist10_yForPe_uid36_block_rsrvd_fix_b_3_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist10_yForPe_uid36_block_rsrvd_fix_b_3_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist10_yForPe_uid36_block_rsrvd_fix_b_3_nor_q = "1") THEN
                redist10_yForPe_uid36_block_rsrvd_fix_b_3_sticky_ena_q <= STD_LOGIC_VECTOR(redist10_yForPe_uid36_block_rsrvd_fix_b_3_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist10_yForPe_uid36_block_rsrvd_fix_b_3_enaAnd(LOGICAL,165)
    redist10_yForPe_uid36_block_rsrvd_fix_b_3_enaAnd_q <= redist10_yForPe_uid36_block_rsrvd_fix_b_3_sticky_ena_q and VCC_q;

    -- redist10_yForPe_uid36_block_rsrvd_fix_b_3_rdcnt(COUNTER,159)
    -- low=0, high=1, step=1, init=0
    redist10_yForPe_uid36_block_rsrvd_fix_b_3_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist10_yForPe_uid36_block_rsrvd_fix_b_3_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist10_yForPe_uid36_block_rsrvd_fix_b_3_rdcnt_i <= redist10_yForPe_uid36_block_rsrvd_fix_b_3_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist10_yForPe_uid36_block_rsrvd_fix_b_3_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist10_yForPe_uid36_block_rsrvd_fix_b_3_rdcnt_i, 1)));

    -- redist10_yForPe_uid36_block_rsrvd_fix_b_3_wraddr(REG,160)
    redist10_yForPe_uid36_block_rsrvd_fix_b_3_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist10_yForPe_uid36_block_rsrvd_fix_b_3_wraddr_q <= "1";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist10_yForPe_uid36_block_rsrvd_fix_b_3_wraddr_q <= STD_LOGIC_VECTOR(redist10_yForPe_uid36_block_rsrvd_fix_b_3_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist10_yForPe_uid36_block_rsrvd_fix_b_3_mem(DUALMEM,158)
    redist10_yForPe_uid36_block_rsrvd_fix_b_3_mem_ia <= STD_LOGIC_VECTOR(yForPe_uid36_block_rsrvd_fix_b);
    redist10_yForPe_uid36_block_rsrvd_fix_b_3_mem_aa <= redist10_yForPe_uid36_block_rsrvd_fix_b_3_wraddr_q;
    redist10_yForPe_uid36_block_rsrvd_fix_b_3_mem_ab <= redist10_yForPe_uid36_block_rsrvd_fix_b_3_rdcnt_q;
    redist10_yForPe_uid36_block_rsrvd_fix_b_3_mem_reset0 <= not (resetn);
    redist10_yForPe_uid36_block_rsrvd_fix_b_3_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
        widthad_b => 1,
        numwords_b => 2,
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
        clocken1 => redist10_yForPe_uid36_block_rsrvd_fix_b_3_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist10_yForPe_uid36_block_rsrvd_fix_b_3_mem_reset0,
        clock1 => clock,
        address_a => redist10_yForPe_uid36_block_rsrvd_fix_b_3_mem_aa,
        data_a => redist10_yForPe_uid36_block_rsrvd_fix_b_3_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist10_yForPe_uid36_block_rsrvd_fix_b_3_mem_ab,
        q_b => redist10_yForPe_uid36_block_rsrvd_fix_b_3_mem_iq
    );
    redist10_yForPe_uid36_block_rsrvd_fix_b_3_mem_q <= redist10_yForPe_uid36_block_rsrvd_fix_b_3_mem_iq(15 downto 0);

    -- prodXY_uid116_pT2_uid107_invPolyEval_cma(CHAINMULTADD,123)@5 + 2
    prodXY_uid116_pT2_uid107_invPolyEval_cma_reset <= not (resetn);
    prodXY_uid116_pT2_uid107_invPolyEval_cma_ena0 <= '1';
    prodXY_uid116_pT2_uid107_invPolyEval_cma_ena1 <= prodXY_uid116_pT2_uid107_invPolyEval_cma_ena0;
    prodXY_uid116_pT2_uid107_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid116_pT2_uid107_invPolyEval_cma_a0(0),17));
    prodXY_uid116_pT2_uid107_invPolyEval_cma_p(0) <= prodXY_uid116_pT2_uid107_invPolyEval_cma_l(0) * prodXY_uid116_pT2_uid107_invPolyEval_cma_c0(0);
    prodXY_uid116_pT2_uid107_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid116_pT2_uid107_invPolyEval_cma_p(0),40);
    prodXY_uid116_pT2_uid107_invPolyEval_cma_w(0) <= prodXY_uid116_pT2_uid107_invPolyEval_cma_u(0);
    prodXY_uid116_pT2_uid107_invPolyEval_cma_x(0) <= prodXY_uid116_pT2_uid107_invPolyEval_cma_w(0);
    prodXY_uid116_pT2_uid107_invPolyEval_cma_y(0) <= prodXY_uid116_pT2_uid107_invPolyEval_cma_x(0);
    prodXY_uid116_pT2_uid107_invPolyEval_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodXY_uid116_pT2_uid107_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid116_pT2_uid107_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (prodXY_uid116_pT2_uid107_invPolyEval_cma_ena0 = '1') THEN
                prodXY_uid116_pT2_uid107_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(redist10_yForPe_uid36_block_rsrvd_fix_b_3_mem_q),16);
                prodXY_uid116_pT2_uid107_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(s1_uid105_invPolyEval_q),23);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid116_pT2_uid107_invPolyEval_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            prodXY_uid116_pT2_uid107_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (prodXY_uid116_pT2_uid107_invPolyEval_cma_ena1 = '1') THEN
                prodXY_uid116_pT2_uid107_invPolyEval_cma_s(0) <= prodXY_uid116_pT2_uid107_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid116_pT2_uid107_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 39, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid116_pT2_uid107_invPolyEval_cma_s(0)(38 downto 0)), xout => prodXY_uid116_pT2_uid107_invPolyEval_cma_qq, clk => clock, aclr => resetn );
    prodXY_uid116_pT2_uid107_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid116_pT2_uid107_invPolyEval_cma_qq(38 downto 0));

    -- osig_uid117_pT2_uid107_invPolyEval(BITSELECT,116)@7
    osig_uid117_pT2_uid107_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid116_pT2_uid107_invPolyEval_cma_q(38 downto 15));

    -- redist4_osig_uid117_pT2_uid107_invPolyEval_b_1(DELAY,129)
    redist4_osig_uid117_pT2_uid107_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => osig_uid117_pT2_uid107_invPolyEval_b, xout => redist4_osig_uid117_pT2_uid107_invPolyEval_b_1_q, clk => clock, aclr => resetn );

    -- highBBits_uid109_invPolyEval(BITSELECT,108)@8
    highBBits_uid109_invPolyEval_b <= STD_LOGIC_VECTOR(redist4_osig_uid117_pT2_uid107_invPolyEval_b_1_q(23 downto 2));

    -- redist12_yAddr_uid35_block_rsrvd_fix_b_5(DELAY,137)
    redist12_yAddr_uid35_block_rsrvd_fix_b_5 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist11_yAddr_uid35_block_rsrvd_fix_b_2_q, xout => redist12_yAddr_uid35_block_rsrvd_fix_b_5_q, clk => clock, aclr => resetn );

    -- memoryC0_uid88_sqrtTables_lutmem(DUALMEM,118)@5 + 2
    -- in j@20000000
    memoryC0_uid88_sqrtTables_lutmem_aa <= redist12_yAddr_uid35_block_rsrvd_fix_b_5_q;
    memoryC0_uid88_sqrtTables_lutmem_reset0 <= not (resetn);
    memoryC0_uid88_sqrtTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 29,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "floatComponent_i_sfc_logic_c0_for_end781A0ZqrtTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid88_sqrtTables_lutmem_reset0,
        clock0 => clock,
        address_a => memoryC0_uid88_sqrtTables_lutmem_aa,
        q_a => memoryC0_uid88_sqrtTables_lutmem_ir
    );
    memoryC0_uid88_sqrtTables_lutmem_r <= memoryC0_uid88_sqrtTables_lutmem_ir(28 downto 0);

    -- redist3_memoryC0_uid88_sqrtTables_lutmem_r_1(DELAY,128)
    redist3_memoryC0_uid88_sqrtTables_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 29, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => memoryC0_uid88_sqrtTables_lutmem_r, xout => redist3_memoryC0_uid88_sqrtTables_lutmem_r_1_q, clk => clock, aclr => resetn );

    -- s2sumAHighB_uid110_invPolyEval(ADD,109)@8
    s2sumAHighB_uid110_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => redist3_memoryC0_uid88_sqrtTables_lutmem_r_1_q(28)) & redist3_memoryC0_uid88_sqrtTables_lutmem_r_1_q));
    s2sumAHighB_uid110_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 22 => highBBits_uid109_invPolyEval_b(21)) & highBBits_uid109_invPolyEval_b));
    s2sumAHighB_uid110_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s2sumAHighB_uid110_invPolyEval_a) + SIGNED(s2sumAHighB_uid110_invPolyEval_b));
    s2sumAHighB_uid110_invPolyEval_q <= s2sumAHighB_uid110_invPolyEval_o(29 downto 0);

    -- lowRangeB_uid108_invPolyEval(BITSELECT,107)@8
    lowRangeB_uid108_invPolyEval_in <= redist4_osig_uid117_pT2_uid107_invPolyEval_b_1_q(1 downto 0);
    lowRangeB_uid108_invPolyEval_b <= lowRangeB_uid108_invPolyEval_in(1 downto 0);

    -- s2_uid111_invPolyEval(BITJOIN,110)@8
    s2_uid111_invPolyEval_q <= s2sumAHighB_uid110_invPolyEval_q & lowRangeB_uid108_invPolyEval_b;

    -- fracRPreCR_uid39_block_rsrvd_fix(BITSELECT,38)@8
    fracRPreCR_uid39_block_rsrvd_fix_in <= s2_uid111_invPolyEval_q(28 downto 0);
    fracRPreCR_uid39_block_rsrvd_fix_b <= fracRPreCR_uid39_block_rsrvd_fix_in(28 downto 5);

    -- redist7_fracRPreCR_uid39_block_rsrvd_fix_b_1(DELAY,132)
    redist7_fracRPreCR_uid39_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => fracRPreCR_uid39_block_rsrvd_fix_b, xout => redist7_fracRPreCR_uid39_block_rsrvd_fix_b_1_q, clk => clock, aclr => resetn );

    -- fracPaddingOne_uid41_block_rsrvd_fix(BITJOIN,40)@9
    fracPaddingOne_uid41_block_rsrvd_fix_q <= VCC_q & redist7_fracRPreCR_uid39_block_rsrvd_fix_b_1_q;

    -- squaredResult_uid42_block_rsrvd_fix_cma(CHAINMULTADD,121)@9 + 2
    squaredResult_uid42_block_rsrvd_fix_cma_reset <= not (resetn);
    squaredResult_uid42_block_rsrvd_fix_cma_ena0 <= '1';
    squaredResult_uid42_block_rsrvd_fix_cma_ena1 <= squaredResult_uid42_block_rsrvd_fix_cma_ena0;
    squaredResult_uid42_block_rsrvd_fix_cma_p(0) <= squaredResult_uid42_block_rsrvd_fix_cma_a0(0) * squaredResult_uid42_block_rsrvd_fix_cma_c0(0);
    squaredResult_uid42_block_rsrvd_fix_cma_u(0) <= RESIZE(squaredResult_uid42_block_rsrvd_fix_cma_p(0),50);
    squaredResult_uid42_block_rsrvd_fix_cma_w(0) <= squaredResult_uid42_block_rsrvd_fix_cma_u(0);
    squaredResult_uid42_block_rsrvd_fix_cma_x(0) <= squaredResult_uid42_block_rsrvd_fix_cma_w(0);
    squaredResult_uid42_block_rsrvd_fix_cma_y(0) <= squaredResult_uid42_block_rsrvd_fix_cma_x(0);
    squaredResult_uid42_block_rsrvd_fix_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            squaredResult_uid42_block_rsrvd_fix_cma_a0 <= (others => (others => '0'));
            squaredResult_uid42_block_rsrvd_fix_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (squaredResult_uid42_block_rsrvd_fix_cma_ena0 = '1') THEN
                squaredResult_uid42_block_rsrvd_fix_cma_a0(0) <= RESIZE(UNSIGNED(fracPaddingOne_uid41_block_rsrvd_fix_q),25);
                squaredResult_uid42_block_rsrvd_fix_cma_c0(0) <= RESIZE(UNSIGNED(fracPaddingOne_uid41_block_rsrvd_fix_q),25);
            END IF;
        END IF;
    END PROCESS;
    squaredResult_uid42_block_rsrvd_fix_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            squaredResult_uid42_block_rsrvd_fix_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (squaredResult_uid42_block_rsrvd_fix_cma_ena1 = '1') THEN
                squaredResult_uid42_block_rsrvd_fix_cma_s(0) <= squaredResult_uid42_block_rsrvd_fix_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    squaredResult_uid42_block_rsrvd_fix_cma_delay : dspba_delay
    GENERIC MAP ( width => 50, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(squaredResult_uid42_block_rsrvd_fix_cma_s(0)(49 downto 0)), xout => squaredResult_uid42_block_rsrvd_fix_cma_qq, clk => clock, aclr => resetn );
    squaredResult_uid42_block_rsrvd_fix_cma_q <= STD_LOGIC_VECTOR(squaredResult_uid42_block_rsrvd_fix_cma_qq(49 downto 0));

    -- redist2_squaredResult_uid42_block_rsrvd_fix_cma_q_1(DELAY,127)
    redist2_squaredResult_uid42_block_rsrvd_fix_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 50, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => squaredResult_uid42_block_rsrvd_fix_cma_q, xout => redist2_squaredResult_uid42_block_rsrvd_fix_cma_q_1_q, clk => clock, aclr => resetn );

    -- squaredResultGTEIn_uid55_block_rsrvd_fix(COMPARE,56)@12 + 1
    squaredResultGTEIn_uid55_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("00" & redist2_squaredResult_uid42_block_rsrvd_fix_cma_q_1_q);
    squaredResultGTEIn_uid55_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00" & updatedY_uid56_block_rsrvd_fix_q);
    squaredResultGTEIn_uid55_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            squaredResultGTEIn_uid55_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            squaredResultGTEIn_uid55_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(squaredResultGTEIn_uid55_block_rsrvd_fix_a) - UNSIGNED(squaredResultGTEIn_uid55_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    squaredResultGTEIn_uid55_block_rsrvd_fix_n(0) <= not (squaredResultGTEIn_uid55_block_rsrvd_fix_o(51));

    -- pLTOne_uid58_block_rsrvd_fix(LOGICAL,57)@13
    pLTOne_uid58_block_rsrvd_fix_q <= not (squaredResultGTEIn_uid55_block_rsrvd_fix_n);

    -- redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_notEnable(LOGICAL,154)
    redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_nor(LOGICAL,155)
    redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_nor_q <= not (redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_notEnable_q or redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_sticky_ena_q);

    -- redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_mem_last(CONSTANT,151)
    redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_mem_last_q <= "01";

    -- redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_cmp(LOGICAL,152)
    redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_cmp_q <= "1" WHEN redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_mem_last_q = redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_rdcnt_q ELSE "0";

    -- redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_cmpReg(REG,153)
    redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_cmpReg_q <= STD_LOGIC_VECTOR(redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_cmp_q);
        END IF;
    END PROCESS;

    -- redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_sticky_ena(REG,156)
    redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_nor_q = "1") THEN
                redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_sticky_ena_q <= STD_LOGIC_VECTOR(redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_enaAnd(LOGICAL,157)
    redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_enaAnd_q <= redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_sticky_ena_q and VCC_q;

    -- redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_rdcnt(COUNTER,149)
    -- low=0, high=2, step=1, init=0
    redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_rdcnt_i <= TO_UNSIGNED(0, 2);
            redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_rdcnt_eq <= '1';
            ELSE
                redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_rdcnt_eq <= '0';
            END IF;
            IF (redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_rdcnt_eq = '1') THEN
                redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_rdcnt_i <= redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_rdcnt_i + 2;
            ELSE
                redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_rdcnt_i <= redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_rdcnt_i, 2)));

    -- redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_wraddr(REG,150)
    redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_wraddr_q <= "10";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_wraddr_q <= STD_LOGIC_VECTOR(redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_mem(DUALMEM,148)
    redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_mem_ia <= STD_LOGIC_VECTOR(redist7_fracRPreCR_uid39_block_rsrvd_fix_b_1_q);
    redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_mem_aa <= redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_wraddr_q;
    redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_mem_ab <= redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_rdcnt_q;
    redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_mem_reset0 <= not (resetn);
    redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 24,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 24,
        widthad_b => 2,
        numwords_b => 3,
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
        clocken1 => redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_mem_reset0,
        clock1 => clock,
        address_a => redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_mem_aa,
        data_a => redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_mem_ab,
        q_b => redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_mem_iq
    );
    redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_mem_q <= redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_mem_iq(23 downto 0);

    -- fxpSqrtResPostUpdateE_uid60_block_rsrvd_fix(ADD,59)@13
    fxpSqrtResPostUpdateE_uid60_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & redist8_fracRPreCR_uid39_block_rsrvd_fix_b_5_mem_q);
    fxpSqrtResPostUpdateE_uid60_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("000000000000000000000000" & pLTOne_uid58_block_rsrvd_fix_q);
    fxpSqrtResPostUpdateE_uid60_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(fxpSqrtResPostUpdateE_uid60_block_rsrvd_fix_a) + UNSIGNED(fxpSqrtResPostUpdateE_uid60_block_rsrvd_fix_b));
    fxpSqrtResPostUpdateE_uid60_block_rsrvd_fix_q <= fxpSqrtResPostUpdateE_uid60_block_rsrvd_fix_o(24 downto 0);

    -- expUpdateCRU_uid61_block_rsrvd_fix_merged_bit_select(BITSELECT,124)@13
    expUpdateCRU_uid61_block_rsrvd_fix_merged_bit_select_b <= fxpSqrtResPostUpdateE_uid60_block_rsrvd_fix_q(24 downto 24);
    expUpdateCRU_uid61_block_rsrvd_fix_merged_bit_select_c <= fxpSqrtResPostUpdateE_uid60_block_rsrvd_fix_q(23 downto 1);

    -- redist0_expUpdateCRU_uid61_block_rsrvd_fix_merged_bit_select_b_1(DELAY,125)
    redist0_expUpdateCRU_uid61_block_rsrvd_fix_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => expUpdateCRU_uid61_block_rsrvd_fix_merged_bit_select_b, xout => redist0_expUpdateCRU_uid61_block_rsrvd_fix_merged_bit_select_b_1_q, clk => clock, aclr => resetn );

    -- fracPENotOne_uid62_block_rsrvd_fix(LOGICAL,61)@14
    fracPENotOne_uid62_block_rsrvd_fix_q <= not (redist9_expIncPEOnly_uid38_block_rsrvd_fix_b_6_q);

    -- fracPENotOneAndCRRoundsExp_uid63_block_rsrvd_fix(LOGICAL,62)@14
    fracPENotOneAndCRRoundsExp_uid63_block_rsrvd_fix_q <= fracPENotOne_uid62_block_rsrvd_fix_q and redist0_expUpdateCRU_uid61_block_rsrvd_fix_merged_bit_select_b_1_q;

    -- expIncPEOnly_uid38_block_rsrvd_fix(BITSELECT,37)@8
    expIncPEOnly_uid38_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(s2_uid111_invPolyEval_q(30 downto 0));
    expIncPEOnly_uid38_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(expIncPEOnly_uid38_block_rsrvd_fix_in(30 downto 30));

    -- redist9_expIncPEOnly_uid38_block_rsrvd_fix_b_6(DELAY,134)
    redist9_expIncPEOnly_uid38_block_rsrvd_fix_b_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => expIncPEOnly_uid38_block_rsrvd_fix_b, xout => redist9_expIncPEOnly_uid38_block_rsrvd_fix_b_6_q, clk => clock, aclr => resetn );

    -- expInc_uid64_block_rsrvd_fix(LOGICAL,63)@14
    expInc_uid64_block_rsrvd_fix_q <= redist9_expIncPEOnly_uid38_block_rsrvd_fix_b_6_q or fracPENotOneAndCRRoundsExp_uid63_block_rsrvd_fix_q;

    -- sBiasM1_uid26_block_rsrvd_fix(CONSTANT,25)
    sBiasM1_uid26_block_rsrvd_fix_q <= "01111110";

    -- expOddSig_uid27_block_rsrvd_fix(ADD,26)@13
    expOddSig_uid27_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & redist22_expX_uid6_block_rsrvd_fix_b_13_outputreg_q);
    expOddSig_uid27_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0" & sBiasM1_uid26_block_rsrvd_fix_q);
    expOddSig_uid27_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(expOddSig_uid27_block_rsrvd_fix_a) + UNSIGNED(expOddSig_uid27_block_rsrvd_fix_b));
    expOddSig_uid27_block_rsrvd_fix_q <= expOddSig_uid27_block_rsrvd_fix_o(8 downto 0);

    -- expROdd_uid28_block_rsrvd_fix(BITSELECT,27)@13
    expROdd_uid28_block_rsrvd_fix_b <= expOddSig_uid27_block_rsrvd_fix_q(8 downto 1);

    -- sBias_uid22_block_rsrvd_fix(CONSTANT,21)
    sBias_uid22_block_rsrvd_fix_q <= "01111111";

    -- expEvenSig_uid24_block_rsrvd_fix(ADD,23)@13
    expEvenSig_uid24_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & redist22_expX_uid6_block_rsrvd_fix_b_13_outputreg_q);
    expEvenSig_uid24_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0" & sBias_uid22_block_rsrvd_fix_q);
    expEvenSig_uid24_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(expEvenSig_uid24_block_rsrvd_fix_a) + UNSIGNED(expEvenSig_uid24_block_rsrvd_fix_b));
    expEvenSig_uid24_block_rsrvd_fix_q <= expEvenSig_uid24_block_rsrvd_fix_o(8 downto 0);

    -- expREven_uid25_block_rsrvd_fix(BITSELECT,24)@13
    expREven_uid25_block_rsrvd_fix_b <= expEvenSig_uid24_block_rsrvd_fix_q(8 downto 1);

    -- redist14_expOddSelect_uid30_block_rsrvd_fix_q_13(DELAY,139)
    redist14_expOddSelect_uid30_block_rsrvd_fix_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist13_expOddSelect_uid30_block_rsrvd_fix_q_11_q, xout => redist14_expOddSelect_uid30_block_rsrvd_fix_q_13_q, clk => clock, aclr => resetn );

    -- expRMux_uid31_block_rsrvd_fix(MUX,30)@13 + 1
    expRMux_uid31_block_rsrvd_fix_s <= redist14_expOddSelect_uid30_block_rsrvd_fix_q_13_q;
    expRMux_uid31_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            expRMux_uid31_block_rsrvd_fix_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (expRMux_uid31_block_rsrvd_fix_s) IS
                WHEN "0" => expRMux_uid31_block_rsrvd_fix_q <= expREven_uid25_block_rsrvd_fix_b;
                WHEN "1" => expRMux_uid31_block_rsrvd_fix_q <= expROdd_uid28_block_rsrvd_fix_b;
                WHEN OTHERS => expRMux_uid31_block_rsrvd_fix_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- expR_uid66_block_rsrvd_fix(ADD,65)@14
    expR_uid66_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & expRMux_uid31_block_rsrvd_fix_q);
    expR_uid66_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00000000" & expInc_uid64_block_rsrvd_fix_q);
    expR_uid66_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(expR_uid66_block_rsrvd_fix_a) + UNSIGNED(expR_uid66_block_rsrvd_fix_b));
    expR_uid66_block_rsrvd_fix_q <= expR_uid66_block_rsrvd_fix_o(8 downto 0);

    -- expRR_uid77_block_rsrvd_fix(BITSELECT,76)@14
    expRR_uid77_block_rsrvd_fix_in <= expR_uid66_block_rsrvd_fix_q(7 downto 0);
    expRR_uid77_block_rsrvd_fix_b <= expRR_uid77_block_rsrvd_fix_in(7 downto 0);

    -- redist6_expRR_uid77_block_rsrvd_fix_b_1(DELAY,131)
    redist6_expRR_uid77_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => expRR_uid77_block_rsrvd_fix_b, xout => redist6_expRR_uid77_block_rsrvd_fix_b_1_q, clk => clock, aclr => resetn );

    -- expXIsMax_uid14_block_rsrvd_fix(LOGICAL,13)@13 + 1
    expXIsMax_uid14_block_rsrvd_fix_qi <= "1" WHEN redist22_expX_uid6_block_rsrvd_fix_b_13_outputreg_q = cstAllOWE_uid8_block_rsrvd_fix_q ELSE "0";
    expXIsMax_uid14_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => expXIsMax_uid14_block_rsrvd_fix_qi, xout => expXIsMax_uid14_block_rsrvd_fix_q, clk => clock, aclr => resetn );

    -- invExpXIsMax_uid19_block_rsrvd_fix(LOGICAL,18)@14
    invExpXIsMax_uid19_block_rsrvd_fix_q <= not (expXIsMax_uid14_block_rsrvd_fix_q);

    -- InvExpXIsZero_uid20_block_rsrvd_fix(LOGICAL,19)@14
    InvExpXIsZero_uid20_block_rsrvd_fix_q <= not (excZ_x_uid13_block_rsrvd_fix_q);

    -- excR_x_uid21_block_rsrvd_fix(LOGICAL,20)@14
    excR_x_uid21_block_rsrvd_fix_q <= InvExpXIsZero_uid20_block_rsrvd_fix_q and invExpXIsMax_uid19_block_rsrvd_fix_q;

    -- minReg_uid69_block_rsrvd_fix(LOGICAL,68)@14
    minReg_uid69_block_rsrvd_fix_q <= excR_x_uid21_block_rsrvd_fix_q and redist20_signX_uid7_block_rsrvd_fix_b_14_q;

    -- cstZeroWF_uid9_block_rsrvd_fix(CONSTANT,8)
    cstZeroWF_uid9_block_rsrvd_fix_q <= "00000000000000000000000";

    -- fracXIsZero_uid15_block_rsrvd_fix(LOGICAL,14)@11 + 1
    fracXIsZero_uid15_block_rsrvd_fix_qi <= "1" WHEN cstZeroWF_uid9_block_rsrvd_fix_q = redist19_frac_x_uid12_block_rsrvd_fix_b_11_outputreg_q ELSE "0";
    fracXIsZero_uid15_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => fracXIsZero_uid15_block_rsrvd_fix_qi, xout => fracXIsZero_uid15_block_rsrvd_fix_q, clk => clock, aclr => resetn );

    -- redist16_fracXIsZero_uid15_block_rsrvd_fix_q_3(DELAY,141)
    redist16_fracXIsZero_uid15_block_rsrvd_fix_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => fracXIsZero_uid15_block_rsrvd_fix_q, xout => redist16_fracXIsZero_uid15_block_rsrvd_fix_q_3_q, clk => clock, aclr => resetn );

    -- excI_x_uid17_block_rsrvd_fix(LOGICAL,16)@14
    excI_x_uid17_block_rsrvd_fix_q <= expXIsMax_uid14_block_rsrvd_fix_q and redist16_fracXIsZero_uid15_block_rsrvd_fix_q_3_q;

    -- minInf_uid70_block_rsrvd_fix(LOGICAL,69)@14
    minInf_uid70_block_rsrvd_fix_q <= excI_x_uid17_block_rsrvd_fix_q and redist20_signX_uid7_block_rsrvd_fix_b_14_q;

    -- fracXIsNotZero_uid16_block_rsrvd_fix(LOGICAL,15)@14
    fracXIsNotZero_uid16_block_rsrvd_fix_q <= not (redist16_fracXIsZero_uid15_block_rsrvd_fix_q_3_q);

    -- excN_x_uid18_block_rsrvd_fix(LOGICAL,17)@14
    excN_x_uid18_block_rsrvd_fix_q <= expXIsMax_uid14_block_rsrvd_fix_q and fracXIsNotZero_uid16_block_rsrvd_fix_q;

    -- excRNaN_uid71_block_rsrvd_fix(LOGICAL,70)@14 + 1
    excRNaN_uid71_block_rsrvd_fix_qi <= excN_x_uid18_block_rsrvd_fix_q or minInf_uid70_block_rsrvd_fix_q or minReg_uid69_block_rsrvd_fix_q;
    excRNaN_uid71_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excRNaN_uid71_block_rsrvd_fix_qi, xout => excRNaN_uid71_block_rsrvd_fix_q, clk => clock, aclr => resetn );

    -- invSignX_uid67_block_rsrvd_fix(LOGICAL,66)@15
    invSignX_uid67_block_rsrvd_fix_q <= not (redist21_signX_uid7_block_rsrvd_fix_b_15_q);

    -- redist15_excI_x_uid17_block_rsrvd_fix_q_1(DELAY,140)
    redist15_excI_x_uid17_block_rsrvd_fix_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excI_x_uid17_block_rsrvd_fix_q, xout => redist15_excI_x_uid17_block_rsrvd_fix_q_1_q, clk => clock, aclr => resetn );

    -- inInfAndNotNeg_uid68_block_rsrvd_fix(LOGICAL,67)@15
    inInfAndNotNeg_uid68_block_rsrvd_fix_q <= redist15_excI_x_uid17_block_rsrvd_fix_q_1_q and invSignX_uid67_block_rsrvd_fix_q;

    -- excConc_uid72_block_rsrvd_fix(BITJOIN,71)@15
    excConc_uid72_block_rsrvd_fix_q <= excRNaN_uid71_block_rsrvd_fix_q & inInfAndNotNeg_uid68_block_rsrvd_fix_q & redist17_excZ_x_uid13_block_rsrvd_fix_q_2_q;

    -- fracSelIn_uid73_block_rsrvd_fix(BITJOIN,72)@15
    fracSelIn_uid73_block_rsrvd_fix_q <= redist21_signX_uid7_block_rsrvd_fix_b_15_q & excConc_uid72_block_rsrvd_fix_q;

    -- fracSel_uid74_block_rsrvd_fix(LOOKUP,73)@15
    fracSel_uid74_block_rsrvd_fix_combproc: PROCESS (fracSelIn_uid73_block_rsrvd_fix_q)
    BEGIN
        -- Begin reserved scope level
        CASE (fracSelIn_uid73_block_rsrvd_fix_q) IS
            WHEN "0000" => fracSel_uid74_block_rsrvd_fix_q <= "01";
            WHEN "0001" => fracSel_uid74_block_rsrvd_fix_q <= "00";
            WHEN "0010" => fracSel_uid74_block_rsrvd_fix_q <= "10";
            WHEN "0011" => fracSel_uid74_block_rsrvd_fix_q <= "00";
            WHEN "0100" => fracSel_uid74_block_rsrvd_fix_q <= "11";
            WHEN "0101" => fracSel_uid74_block_rsrvd_fix_q <= "00";
            WHEN "0110" => fracSel_uid74_block_rsrvd_fix_q <= "10";
            WHEN "0111" => fracSel_uid74_block_rsrvd_fix_q <= "00";
            WHEN "1000" => fracSel_uid74_block_rsrvd_fix_q <= "11";
            WHEN "1001" => fracSel_uid74_block_rsrvd_fix_q <= "00";
            WHEN "1010" => fracSel_uid74_block_rsrvd_fix_q <= "11";
            WHEN "1011" => fracSel_uid74_block_rsrvd_fix_q <= "11";
            WHEN "1100" => fracSel_uid74_block_rsrvd_fix_q <= "11";
            WHEN "1101" => fracSel_uid74_block_rsrvd_fix_q <= "11";
            WHEN "1110" => fracSel_uid74_block_rsrvd_fix_q <= "11";
            WHEN "1111" => fracSel_uid74_block_rsrvd_fix_q <= "11";
            WHEN OTHERS => -- unreachable
                           fracSel_uid74_block_rsrvd_fix_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid79_block_rsrvd_fix(MUX,78)@15
    expRPostExc_uid79_block_rsrvd_fix_s <= fracSel_uid74_block_rsrvd_fix_q;
    expRPostExc_uid79_block_rsrvd_fix_combproc: PROCESS (expRPostExc_uid79_block_rsrvd_fix_s, cstAllZWE_uid10_block_rsrvd_fix_q, redist6_expRR_uid77_block_rsrvd_fix_b_1_q, cstAllOWE_uid8_block_rsrvd_fix_q)
    BEGIN
        CASE (expRPostExc_uid79_block_rsrvd_fix_s) IS
            WHEN "00" => expRPostExc_uid79_block_rsrvd_fix_q <= cstAllZWE_uid10_block_rsrvd_fix_q;
            WHEN "01" => expRPostExc_uid79_block_rsrvd_fix_q <= redist6_expRR_uid77_block_rsrvd_fix_b_1_q;
            WHEN "10" => expRPostExc_uid79_block_rsrvd_fix_q <= cstAllOWE_uid8_block_rsrvd_fix_q;
            WHEN "11" => expRPostExc_uid79_block_rsrvd_fix_q <= cstAllOWE_uid8_block_rsrvd_fix_q;
            WHEN OTHERS => expRPostExc_uid79_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracNaN_uid80_block_rsrvd_fix(CONSTANT,79)
    fracNaN_uid80_block_rsrvd_fix_q <= "00000000000000000000001";

    -- redist1_expUpdateCRU_uid61_block_rsrvd_fix_merged_bit_select_c_2(DELAY,126)
    redist1_expUpdateCRU_uid61_block_rsrvd_fix_merged_bit_select_c_2 : dspba_delay
    GENERIC MAP ( width => 23, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => expUpdateCRU_uid61_block_rsrvd_fix_merged_bit_select_c, xout => redist1_expUpdateCRU_uid61_block_rsrvd_fix_merged_bit_select_c_2_q, clk => clock, aclr => resetn );

    -- fracRPostExc_uid84_block_rsrvd_fix(MUX,83)@15
    fracRPostExc_uid84_block_rsrvd_fix_s <= fracSel_uid74_block_rsrvd_fix_q;
    fracRPostExc_uid84_block_rsrvd_fix_combproc: PROCESS (fracRPostExc_uid84_block_rsrvd_fix_s, cstZeroWF_uid9_block_rsrvd_fix_q, redist1_expUpdateCRU_uid61_block_rsrvd_fix_merged_bit_select_c_2_q, fracNaN_uid80_block_rsrvd_fix_q)
    BEGIN
        CASE (fracRPostExc_uid84_block_rsrvd_fix_s) IS
            WHEN "00" => fracRPostExc_uid84_block_rsrvd_fix_q <= cstZeroWF_uid9_block_rsrvd_fix_q;
            WHEN "01" => fracRPostExc_uid84_block_rsrvd_fix_q <= redist1_expUpdateCRU_uid61_block_rsrvd_fix_merged_bit_select_c_2_q;
            WHEN "10" => fracRPostExc_uid84_block_rsrvd_fix_q <= cstZeroWF_uid9_block_rsrvd_fix_q;
            WHEN "11" => fracRPostExc_uid84_block_rsrvd_fix_q <= fracNaN_uid80_block_rsrvd_fix_q;
            WHEN OTHERS => fracRPostExc_uid84_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- RSqrt_uid86_block_rsrvd_fix(BITJOIN,85)@15
    RSqrt_uid86_block_rsrvd_fix_q <= negZero_uid85_block_rsrvd_fix_q & expRPostExc_uid79_block_rsrvd_fix_q & fracRPostExc_uid84_block_rsrvd_fix_q;

    -- out_primWireOut(GPOUT,4)@15
    out_primWireOut <= RSqrt_uid86_block_rsrvd_fix_q;

END normal;
