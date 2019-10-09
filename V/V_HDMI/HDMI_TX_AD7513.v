

module HDMI_TX_AD7513(
      input              AUD_CTRL_CLK, 
      input              PLL_TEST_OK,
      input              RESET_N , 
      ///////// FPGA /////////
      input              CLK_50,

      ///////// HDMI /////////
      output             HDMI_I2C_SCL,
      inout              HDMI_I2C_SDA,
		
      inout       [3:0]  HDMI_I2S,
      inout              HDMI_LRCLK,
      inout              HDMI_MCLK,
      inout              HDMI_SCLK,
		
      input              HDMI_TX_INT,
		output             READY 
		

);


//=======================================================
//  REG/WIRE declarations
//=======================================================


//=======================================================
//  Structural coding
//=======================================================

//HDMI I2C	
I2C_HDMI_Config u_I2C_HDMI_Config (
	.iCLK       ( CLK_50      ),
	.iRST_N     ( RESET_N ),
	.I2C_SCLK   ( HDMI_I2C_SCL),
	.I2C_SDAT   ( HDMI_I2C_SDA),
	.HDMI_TX_INT( HDMI_TX_INT ),
	.READY      ( READY )
	 );

	//Audio
AUDIO_IF u_AVG(
	.clk     ( AUD_CTRL_CLK),
	.reset_n ( RESET_N    ),
	.sclk    ( HDMI_SCLK  ),
	.lrclk   ( HDMI_LRCLK ),
	.i2s     ( HDMI_I2S   )
);

endmodule
