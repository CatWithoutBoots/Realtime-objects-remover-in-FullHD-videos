module VCM_TEST   ( 
   input   RESET_N     ,
   input   CLK_50      ,
   output  I2C_SCL     , 
   inout   I2C_SDA     ,
	output  VCM_RELAESE ,
	output  READY       ,
	output [15:0]VCM_DATA ,
	output [9:0] STEP ,
	output I2C_LO0P       
	
);

//--RESET_DELAY -- 
RESET_DELAY  del(
   .RESET_N    (RESET_N),
   .CLK        (CLK_50),
   .READY      (READY)
);

 
//--VCM --STEPPING --- 
VCM_STEP  stp( 
   .CLK        (I2C_LO0P),
   .RESET_N    (READY ),
   .VCM_DATA   (VCM_DATA),
   .STEP       (STEP ) ,
   .OK         (VCM_RELAESE ) 
);  


//-VCM_SETTING 
VCM_I2C i2c2( 
   .TR_IN      ( 1 ) , 
   .RESET_N    ( ~VCM_RELAESE ),
	.RESET_SUB_N( RESET_N ),
   .CLK_50     ( CLK_50),
   .I2C_SCL    ( I2C_SCL  ) ,
   .I2C_SDA    ( I2C_SDA  ),

   .R_VCM_DATA ( ),
   .VCM_DATA   ( VCM_DATA  ),  
	.TEST_MODE  (1 )  ,  // TEST  
//----Test or ST-BUS --- 
	.CLK_400K   ( ),
	.I2C_LO0P   ( I2C_LO0P)
	);


endmodule 