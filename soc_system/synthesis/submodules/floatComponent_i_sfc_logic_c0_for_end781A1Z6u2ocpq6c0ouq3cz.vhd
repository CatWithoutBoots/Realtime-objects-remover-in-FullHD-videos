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

-- VHDL created from floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA1Z2cdo6u2ocpq6c0ouq3cz
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

entity floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA1Z2cdo6u2ocpq6c0ouq3cz is
    port (
        in_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        out_primWireOut : out std_logic_vector(31 downto 0);  -- float32_m23
        clock : in std_logic;
        resetn : in std_logic
    );
end floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA1Z2cdo6u2ocpq6c0ouq3cz;

architecture normal of floatComponent_i_sfc_logic_c0_for_end781_loopexit_loopexit_gmm_substract_c0_enteA1Z2cdo6u2ocpq6c0ouq3cz is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid6_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal cstAllOWE_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWF_uid8_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_x_uid11_block_rsrvd_fix_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_x_uid12_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid12_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid13_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid13_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid14_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid15_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid16_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid16_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid17_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid17_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid18_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid19_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracX_uid23_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal fxpFracProdMSB_uid26_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal normFracHigh_uid27_block_rsrvd_fix_in : STD_LOGIC_VECTOR (26 downto 0);
    signal normFracHigh_uid27_block_rsrvd_fix_b : STD_LOGIC_VECTOR (23 downto 0);
    signal normFracLow_uid28_block_rsrvd_fix_in : STD_LOGIC_VECTOR (25 downto 0);
    signal normFracLow_uid28_block_rsrvd_fix_b : STD_LOGIC_VECTOR (23 downto 0);
    signal normFrac_uid29_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal normFrac_uid29_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal cstExpSig_uid30_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal expUpdate_uid31_block_rsrvd_fix_a : STD_LOGIC_VECTOR (10 downto 0);
    signal expUpdate_uid31_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expUpdate_uid31_block_rsrvd_fix_o : STD_LOGIC_VECTOR (10 downto 0);
    signal expUpdate_uid31_block_rsrvd_fix_q : STD_LOGIC_VECTOR (9 downto 0);
    signal expFrac_uid32_block_rsrvd_fix_q : STD_LOGIC_VECTOR (33 downto 0);
    signal rndSignal_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (24 downto 0);
    signal expFracPostUpdate_uid38_block_rsrvd_fix_a : STD_LOGIC_VECTOR (35 downto 0);
    signal expFracPostUpdate_uid38_block_rsrvd_fix_b : STD_LOGIC_VECTOR (35 downto 0);
    signal expFracPostUpdate_uid38_block_rsrvd_fix_o : STD_LOGIC_VECTOR (35 downto 0);
    signal expFracPostUpdate_uid38_block_rsrvd_fix_q : STD_LOGIC_VECTOR (34 downto 0);
    signal expRPreExcExt_uid39_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal fracRPreExcExt_uid40_block_rsrvd_fix_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExcExt_uid40_block_rsrvd_fix_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expUdf_uid41_block_rsrvd_fix_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expUdf_uid41_block_rsrvd_fix_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expUdf_uid41_block_rsrvd_fix_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expUdf_uid41_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid43_block_rsrvd_fix_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expOvf_uid43_block_rsrvd_fix_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expOvf_uid43_block_rsrvd_fix_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expOvf_uid43_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal signX_uid44_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expRPreExc_uid45_block_rsrvd_fix_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expRPreExc_uid45_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal regInputAndOverflow_uid46_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal regInputAndOverflow_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid47_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regInputAndUnderflow_uid48_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal regInputAndUnderflow_uid48_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid49_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid50_block_rsrvd_fix_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid51_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal oneFracRPostExc2_uid52_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPostExc_uid55_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid55_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid59_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid59_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal invExcXN_uid60_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sRPostExc_uid61_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal constMultR_uid62_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal fxpFracProd_uid25_block_rsrvd_fix_shift0_q : STD_LOGIC_VECTOR (52 downto 0);
    signal fxpFracProd_uid25_block_rsrvd_fix_shift0_qint : STD_LOGIC_VECTOR (52 downto 0);
    signal sR_uid92_fxpFracProd_uid25_block_rsrvd_fix_in : STD_LOGIC_VECTOR (53 downto 0);
    signal sR_uid92_fxpFracProd_uid25_block_rsrvd_fix_b : STD_LOGIC_VECTOR (27 downto 0);
    signal redist0_expRPreExc_uid45_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist1_signX_uid44_block_rsrvd_fix_b_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_fracRPreExcExt_uid40_block_rsrvd_fix_b_2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist3_expRPreExcExt_uid39_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist4_fxpFracProdMSB_uid26_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_fracXIsZero_uid14_block_rsrvd_fix_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_expXIsMax_uid13_block_rsrvd_fix_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_excZ_x_uid12_block_rsrvd_fix_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_excZ_x_uid12_block_rsrvd_fix_q_3_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- frac_x_uid11_block_rsrvd_fix(BITSELECT,10)@0
    frac_x_uid11_block_rsrvd_fix_b <= in_0(22 downto 0);

    -- cstZeroWF_uid8_block_rsrvd_fix(CONSTANT,7)
    cstZeroWF_uid8_block_rsrvd_fix_q <= "00000000000000000000000";

    -- fracXIsZero_uid14_block_rsrvd_fix(LOGICAL,13)@0 + 1
    fracXIsZero_uid14_block_rsrvd_fix_qi <= "1" WHEN cstZeroWF_uid8_block_rsrvd_fix_q = frac_x_uid11_block_rsrvd_fix_b ELSE "0";
    fracXIsZero_uid14_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => fracXIsZero_uid14_block_rsrvd_fix_qi, xout => fracXIsZero_uid14_block_rsrvd_fix_q, clk => clock, aclr => resetn );

    -- redist5_fracXIsZero_uid14_block_rsrvd_fix_q_2(DELAY,98)
    redist5_fracXIsZero_uid14_block_rsrvd_fix_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => fracXIsZero_uid14_block_rsrvd_fix_q, xout => redist5_fracXIsZero_uid14_block_rsrvd_fix_q_2_q, clk => clock, aclr => resetn );

    -- fracXIsNotZero_uid15_block_rsrvd_fix(LOGICAL,14)@2
    fracXIsNotZero_uid15_block_rsrvd_fix_q <= not (redist5_fracXIsZero_uid14_block_rsrvd_fix_q_2_q);

    -- cstAllOWE_uid7_block_rsrvd_fix(CONSTANT,6)
    cstAllOWE_uid7_block_rsrvd_fix_q <= "11111111";

    -- expX_uid6_block_rsrvd_fix(BITSELECT,5)@0
    expX_uid6_block_rsrvd_fix_b <= in_0(30 downto 23);

    -- expXIsMax_uid13_block_rsrvd_fix(LOGICAL,12)@0 + 1
    expXIsMax_uid13_block_rsrvd_fix_qi <= "1" WHEN expX_uid6_block_rsrvd_fix_b = cstAllOWE_uid7_block_rsrvd_fix_q ELSE "0";
    expXIsMax_uid13_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => expXIsMax_uid13_block_rsrvd_fix_qi, xout => expXIsMax_uid13_block_rsrvd_fix_q, clk => clock, aclr => resetn );

    -- redist6_expXIsMax_uid13_block_rsrvd_fix_q_2(DELAY,99)
    redist6_expXIsMax_uid13_block_rsrvd_fix_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => expXIsMax_uid13_block_rsrvd_fix_q, xout => redist6_expXIsMax_uid13_block_rsrvd_fix_q_2_q, clk => clock, aclr => resetn );

    -- excN_x_uid17_block_rsrvd_fix(LOGICAL,16)@2 + 1
    excN_x_uid17_block_rsrvd_fix_qi <= redist6_expXIsMax_uid13_block_rsrvd_fix_q_2_q and fracXIsNotZero_uid15_block_rsrvd_fix_q;
    excN_x_uid17_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excN_x_uid17_block_rsrvd_fix_qi, xout => excN_x_uid17_block_rsrvd_fix_q, clk => clock, aclr => resetn );

    -- invExcXN_uid60_block_rsrvd_fix(LOGICAL,59)@3
    invExcXN_uid60_block_rsrvd_fix_q <= not (excN_x_uid17_block_rsrvd_fix_q);

    -- signX_uid44_block_rsrvd_fix(BITSELECT,43)@0
    signX_uid44_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(in_0(31 downto 31));

    -- redist1_signX_uid44_block_rsrvd_fix_b_3(DELAY,94)
    redist1_signX_uid44_block_rsrvd_fix_b_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => signX_uid44_block_rsrvd_fix_b, xout => redist1_signX_uid44_block_rsrvd_fix_b_3_q, clk => clock, aclr => resetn );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- sRPostExc_uid61_block_rsrvd_fix(LOGICAL,60)@3
    sRPostExc_uid61_block_rsrvd_fix_q <= redist1_signX_uid44_block_rsrvd_fix_b_3_q and invExcXN_uid60_block_rsrvd_fix_q;

    -- oFracX_uid23_block_rsrvd_fix(BITJOIN,22)@0
    oFracX_uid23_block_rsrvd_fix_q <= VCC_q & frac_x_uid11_block_rsrvd_fix_b;

    -- fxpFracProd_uid25_block_rsrvd_fix_shift0(BITSHIFT,90)@0
    fxpFracProd_uid25_block_rsrvd_fix_shift0_qint <= oFracX_uid23_block_rsrvd_fix_q & "00000000000000000000000000000";
    fxpFracProd_uid25_block_rsrvd_fix_shift0_q <= fxpFracProd_uid25_block_rsrvd_fix_shift0_qint(52 downto 0);

    -- sR_uid92_fxpFracProd_uid25_block_rsrvd_fix(BITSELECT,91)@0
    sR_uid92_fxpFracProd_uid25_block_rsrvd_fix_in <= STD_LOGIC_VECTOR("0" & fxpFracProd_uid25_block_rsrvd_fix_shift0_q);
    sR_uid92_fxpFracProd_uid25_block_rsrvd_fix_b <= sR_uid92_fxpFracProd_uid25_block_rsrvd_fix_in(53 downto 26);

    -- fxpFracProdMSB_uid26_block_rsrvd_fix(BITSELECT,25)@0
    fxpFracProdMSB_uid26_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(sR_uid92_fxpFracProd_uid25_block_rsrvd_fix_b(27 downto 27));

    -- redist4_fxpFracProdMSB_uid26_block_rsrvd_fix_b_1(DELAY,97)
    redist4_fxpFracProdMSB_uid26_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => fxpFracProdMSB_uid26_block_rsrvd_fix_b, xout => redist4_fxpFracProdMSB_uid26_block_rsrvd_fix_b_1_q, clk => clock, aclr => resetn );

    -- rndSignal_uid37_block_rsrvd_fix(BITJOIN,36)@1
    rndSignal_uid37_block_rsrvd_fix_q <= redist4_fxpFracProdMSB_uid26_block_rsrvd_fix_b_1_q & cstZeroWF_uid8_block_rsrvd_fix_q & VCC_q;

    -- cstExpSig_uid30_block_rsrvd_fix(CONSTANT,29)
    cstExpSig_uid30_block_rsrvd_fix_q <= "01";

    -- expUpdate_uid31_block_rsrvd_fix(ADD,30)@0 + 1
    expUpdate_uid31_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & expX_uid6_block_rsrvd_fix_b));
    expUpdate_uid31_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 2 => cstExpSig_uid30_block_rsrvd_fix_q(1)) & cstExpSig_uid30_block_rsrvd_fix_q));
    expUpdate_uid31_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            expUpdate_uid31_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            expUpdate_uid31_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(expUpdate_uid31_block_rsrvd_fix_a) + SIGNED(expUpdate_uid31_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    expUpdate_uid31_block_rsrvd_fix_q <= expUpdate_uid31_block_rsrvd_fix_o(9 downto 0);

    -- normFracHigh_uid27_block_rsrvd_fix(BITSELECT,26)@0
    normFracHigh_uid27_block_rsrvd_fix_in <= sR_uid92_fxpFracProd_uid25_block_rsrvd_fix_b(26 downto 0);
    normFracHigh_uid27_block_rsrvd_fix_b <= normFracHigh_uid27_block_rsrvd_fix_in(26 downto 3);

    -- normFracLow_uid28_block_rsrvd_fix(BITSELECT,27)@0
    normFracLow_uid28_block_rsrvd_fix_in <= sR_uid92_fxpFracProd_uid25_block_rsrvd_fix_b(25 downto 0);
    normFracLow_uid28_block_rsrvd_fix_b <= normFracLow_uid28_block_rsrvd_fix_in(25 downto 2);

    -- normFrac_uid29_block_rsrvd_fix(MUX,28)@0 + 1
    normFrac_uid29_block_rsrvd_fix_s <= fxpFracProdMSB_uid26_block_rsrvd_fix_b;
    normFrac_uid29_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            normFrac_uid29_block_rsrvd_fix_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (normFrac_uid29_block_rsrvd_fix_s) IS
                WHEN "0" => normFrac_uid29_block_rsrvd_fix_q <= normFracLow_uid28_block_rsrvd_fix_b;
                WHEN "1" => normFrac_uid29_block_rsrvd_fix_q <= normFracHigh_uid27_block_rsrvd_fix_b;
                WHEN OTHERS => normFrac_uid29_block_rsrvd_fix_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- expFrac_uid32_block_rsrvd_fix(BITJOIN,31)@1
    expFrac_uid32_block_rsrvd_fix_q <= expUpdate_uid31_block_rsrvd_fix_q & normFrac_uid29_block_rsrvd_fix_q;

    -- expFracPostUpdate_uid38_block_rsrvd_fix(ADD,37)@1
    expFracPostUpdate_uid38_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 34 => expFrac_uid32_block_rsrvd_fix_q(33)) & expFrac_uid32_block_rsrvd_fix_q));
    expFracPostUpdate_uid38_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000" & rndSignal_uid37_block_rsrvd_fix_q));
    expFracPostUpdate_uid38_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(expFracPostUpdate_uid38_block_rsrvd_fix_a) + SIGNED(expFracPostUpdate_uid38_block_rsrvd_fix_b));
    expFracPostUpdate_uid38_block_rsrvd_fix_q <= expFracPostUpdate_uid38_block_rsrvd_fix_o(34 downto 0);

    -- expRPreExcExt_uid39_block_rsrvd_fix(BITSELECT,38)@1
    expRPreExcExt_uid39_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(expFracPostUpdate_uid38_block_rsrvd_fix_q(34 downto 24));

    -- redist3_expRPreExcExt_uid39_block_rsrvd_fix_b_1(DELAY,96)
    redist3_expRPreExcExt_uid39_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => expRPreExcExt_uid39_block_rsrvd_fix_b, xout => redist3_expRPreExcExt_uid39_block_rsrvd_fix_b_1_q, clk => clock, aclr => resetn );

    -- expRPreExc_uid45_block_rsrvd_fix(BITSELECT,44)@2
    expRPreExc_uid45_block_rsrvd_fix_in <= redist3_expRPreExcExt_uid39_block_rsrvd_fix_b_1_q(7 downto 0);
    expRPreExc_uid45_block_rsrvd_fix_b <= expRPreExc_uid45_block_rsrvd_fix_in(7 downto 0);

    -- redist0_expRPreExc_uid45_block_rsrvd_fix_b_1(DELAY,93)
    redist0_expRPreExc_uid45_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => expRPreExc_uid45_block_rsrvd_fix_b, xout => redist0_expRPreExc_uid45_block_rsrvd_fix_b_1_q, clk => clock, aclr => resetn );

    -- cstAllZWE_uid9_block_rsrvd_fix(CONSTANT,8)
    cstAllZWE_uid9_block_rsrvd_fix_q <= "00000000";

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- expOvf_uid43_block_rsrvd_fix(COMPARE,42)@2
    expOvf_uid43_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => redist3_expRPreExcExt_uid39_block_rsrvd_fix_b_1_q(10)) & redist3_expRPreExcExt_uid39_block_rsrvd_fix_b_1_q));
    expOvf_uid43_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000" & cstAllOWE_uid7_block_rsrvd_fix_q));
    expOvf_uid43_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid43_block_rsrvd_fix_a) - SIGNED(expOvf_uid43_block_rsrvd_fix_b));
    expOvf_uid43_block_rsrvd_fix_n(0) <= not (expOvf_uid43_block_rsrvd_fix_o(12));

    -- invExpXIsMax_uid18_block_rsrvd_fix(LOGICAL,17)@2
    invExpXIsMax_uid18_block_rsrvd_fix_q <= not (redist6_expXIsMax_uid13_block_rsrvd_fix_q_2_q);

    -- excZ_x_uid12_block_rsrvd_fix(LOGICAL,11)@0 + 1
    excZ_x_uid12_block_rsrvd_fix_qi <= "1" WHEN expX_uid6_block_rsrvd_fix_b = cstAllZWE_uid9_block_rsrvd_fix_q ELSE "0";
    excZ_x_uid12_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excZ_x_uid12_block_rsrvd_fix_qi, xout => excZ_x_uid12_block_rsrvd_fix_q, clk => clock, aclr => resetn );

    -- redist7_excZ_x_uid12_block_rsrvd_fix_q_2(DELAY,100)
    redist7_excZ_x_uid12_block_rsrvd_fix_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excZ_x_uid12_block_rsrvd_fix_q, xout => redist7_excZ_x_uid12_block_rsrvd_fix_q_2_q, clk => clock, aclr => resetn );

    -- InvExpXIsZero_uid19_block_rsrvd_fix(LOGICAL,18)@2
    InvExpXIsZero_uid19_block_rsrvd_fix_q <= not (redist7_excZ_x_uid12_block_rsrvd_fix_q_2_q);

    -- excR_x_uid20_block_rsrvd_fix(LOGICAL,19)@2
    excR_x_uid20_block_rsrvd_fix_q <= InvExpXIsZero_uid19_block_rsrvd_fix_q and invExpXIsMax_uid18_block_rsrvd_fix_q;

    -- regInputAndOverflow_uid46_block_rsrvd_fix(LOGICAL,45)@2 + 1
    regInputAndOverflow_uid46_block_rsrvd_fix_qi <= excR_x_uid20_block_rsrvd_fix_q and expOvf_uid43_block_rsrvd_fix_n;
    regInputAndOverflow_uid46_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => regInputAndOverflow_uid46_block_rsrvd_fix_qi, xout => regInputAndOverflow_uid46_block_rsrvd_fix_q, clk => clock, aclr => resetn );

    -- excI_x_uid16_block_rsrvd_fix(LOGICAL,15)@2 + 1
    excI_x_uid16_block_rsrvd_fix_qi <= redist6_expXIsMax_uid13_block_rsrvd_fix_q_2_q and redist5_fracXIsZero_uid14_block_rsrvd_fix_q_2_q;
    excI_x_uid16_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excI_x_uid16_block_rsrvd_fix_qi, xout => excI_x_uid16_block_rsrvd_fix_q, clk => clock, aclr => resetn );

    -- excRInf_uid47_block_rsrvd_fix(LOGICAL,46)@3
    excRInf_uid47_block_rsrvd_fix_q <= excI_x_uid16_block_rsrvd_fix_q or regInputAndOverflow_uid46_block_rsrvd_fix_q;

    -- expUdf_uid41_block_rsrvd_fix(COMPARE,40)@2
    expUdf_uid41_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000000000" & GND_q));
    expUdf_uid41_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => redist3_expRPreExcExt_uid39_block_rsrvd_fix_b_1_q(10)) & redist3_expRPreExcExt_uid39_block_rsrvd_fix_b_1_q));
    expUdf_uid41_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid41_block_rsrvd_fix_a) - SIGNED(expUdf_uid41_block_rsrvd_fix_b));
    expUdf_uid41_block_rsrvd_fix_n(0) <= not (expUdf_uid41_block_rsrvd_fix_o(12));

    -- regInputAndUnderflow_uid48_block_rsrvd_fix(LOGICAL,47)@2 + 1
    regInputAndUnderflow_uid48_block_rsrvd_fix_qi <= excR_x_uid20_block_rsrvd_fix_q and expUdf_uid41_block_rsrvd_fix_n;
    regInputAndUnderflow_uid48_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => regInputAndUnderflow_uid48_block_rsrvd_fix_qi, xout => regInputAndUnderflow_uid48_block_rsrvd_fix_q, clk => clock, aclr => resetn );

    -- redist8_excZ_x_uid12_block_rsrvd_fix_q_3(DELAY,101)
    redist8_excZ_x_uid12_block_rsrvd_fix_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist7_excZ_x_uid12_block_rsrvd_fix_q_2_q, xout => redist8_excZ_x_uid12_block_rsrvd_fix_q_3_q, clk => clock, aclr => resetn );

    -- excRZero_uid49_block_rsrvd_fix(LOGICAL,48)@3
    excRZero_uid49_block_rsrvd_fix_q <= redist8_excZ_x_uid12_block_rsrvd_fix_q_3_q or regInputAndUnderflow_uid48_block_rsrvd_fix_q;

    -- concExc_uid50_block_rsrvd_fix(BITJOIN,49)@3
    concExc_uid50_block_rsrvd_fix_q <= excN_x_uid17_block_rsrvd_fix_q & excRInf_uid47_block_rsrvd_fix_q & excRZero_uid49_block_rsrvd_fix_q;

    -- excREnc_uid51_block_rsrvd_fix(LOOKUP,50)@3
    excREnc_uid51_block_rsrvd_fix_combproc: PROCESS (concExc_uid50_block_rsrvd_fix_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid50_block_rsrvd_fix_q) IS
            WHEN "000" => excREnc_uid51_block_rsrvd_fix_q <= "01";
            WHEN "001" => excREnc_uid51_block_rsrvd_fix_q <= "00";
            WHEN "010" => excREnc_uid51_block_rsrvd_fix_q <= "10";
            WHEN "011" => excREnc_uid51_block_rsrvd_fix_q <= "00";
            WHEN "100" => excREnc_uid51_block_rsrvd_fix_q <= "11";
            WHEN "101" => excREnc_uid51_block_rsrvd_fix_q <= "00";
            WHEN "110" => excREnc_uid51_block_rsrvd_fix_q <= "00";
            WHEN "111" => excREnc_uid51_block_rsrvd_fix_q <= "00";
            WHEN OTHERS => -- unreachable
                           excREnc_uid51_block_rsrvd_fix_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid59_block_rsrvd_fix(MUX,58)@3
    expRPostExc_uid59_block_rsrvd_fix_s <= excREnc_uid51_block_rsrvd_fix_q;
    expRPostExc_uid59_block_rsrvd_fix_combproc: PROCESS (expRPostExc_uid59_block_rsrvd_fix_s, cstAllZWE_uid9_block_rsrvd_fix_q, redist0_expRPreExc_uid45_block_rsrvd_fix_b_1_q, cstAllOWE_uid7_block_rsrvd_fix_q)
    BEGIN
        CASE (expRPostExc_uid59_block_rsrvd_fix_s) IS
            WHEN "00" => expRPostExc_uid59_block_rsrvd_fix_q <= cstAllZWE_uid9_block_rsrvd_fix_q;
            WHEN "01" => expRPostExc_uid59_block_rsrvd_fix_q <= redist0_expRPreExc_uid45_block_rsrvd_fix_b_1_q;
            WHEN "10" => expRPostExc_uid59_block_rsrvd_fix_q <= cstAllOWE_uid7_block_rsrvd_fix_q;
            WHEN "11" => expRPostExc_uid59_block_rsrvd_fix_q <= cstAllOWE_uid7_block_rsrvd_fix_q;
            WHEN OTHERS => expRPostExc_uid59_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid52_block_rsrvd_fix(CONSTANT,51)
    oneFracRPostExc2_uid52_block_rsrvd_fix_q <= "00000000000000000000001";

    -- fracRPreExcExt_uid40_block_rsrvd_fix(BITSELECT,39)@1
    fracRPreExcExt_uid40_block_rsrvd_fix_in <= expFracPostUpdate_uid38_block_rsrvd_fix_q(23 downto 0);
    fracRPreExcExt_uid40_block_rsrvd_fix_b <= fracRPreExcExt_uid40_block_rsrvd_fix_in(23 downto 1);

    -- redist2_fracRPreExcExt_uid40_block_rsrvd_fix_b_2(DELAY,95)
    redist2_fracRPreExcExt_uid40_block_rsrvd_fix_b_2 : dspba_delay
    GENERIC MAP ( width => 23, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => fracRPreExcExt_uid40_block_rsrvd_fix_b, xout => redist2_fracRPreExcExt_uid40_block_rsrvd_fix_b_2_q, clk => clock, aclr => resetn );

    -- fracRPostExc_uid55_block_rsrvd_fix(MUX,54)@3
    fracRPostExc_uid55_block_rsrvd_fix_s <= excREnc_uid51_block_rsrvd_fix_q;
    fracRPostExc_uid55_block_rsrvd_fix_combproc: PROCESS (fracRPostExc_uid55_block_rsrvd_fix_s, cstZeroWF_uid8_block_rsrvd_fix_q, redist2_fracRPreExcExt_uid40_block_rsrvd_fix_b_2_q, oneFracRPostExc2_uid52_block_rsrvd_fix_q)
    BEGIN
        CASE (fracRPostExc_uid55_block_rsrvd_fix_s) IS
            WHEN "00" => fracRPostExc_uid55_block_rsrvd_fix_q <= cstZeroWF_uid8_block_rsrvd_fix_q;
            WHEN "01" => fracRPostExc_uid55_block_rsrvd_fix_q <= redist2_fracRPreExcExt_uid40_block_rsrvd_fix_b_2_q;
            WHEN "10" => fracRPostExc_uid55_block_rsrvd_fix_q <= cstZeroWF_uid8_block_rsrvd_fix_q;
            WHEN "11" => fracRPostExc_uid55_block_rsrvd_fix_q <= oneFracRPostExc2_uid52_block_rsrvd_fix_q;
            WHEN OTHERS => fracRPostExc_uid55_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- constMultR_uid62_block_rsrvd_fix(BITJOIN,61)@3
    constMultR_uid62_block_rsrvd_fix_q <= sRPostExc_uid61_block_rsrvd_fix_q & expRPostExc_uid59_block_rsrvd_fix_q & fracRPostExc_uid55_block_rsrvd_fix_q;

    -- out_primWireOut(GPOUT,4)@3
    out_primWireOut <= constMultR_uid62_block_rsrvd_fix_q;

END normal;
