module MIPI_CAMERA_CONFIG  ( 
   input   RESET_N , 
	input   TR_IN , 	
   input   CLK_50 ,
	
   output  I2C_SCL, 
   inout   I2C_SDA,
   input   INT_n,
	
//----Test or ST-BUS --- 
   output reg [7:0] ID1  ,
   output reg [7:0] ID2  ,
//test
	output           CLK_400K ,
   output reg       I2C_LO0P,
   output reg [7:0]  ST ,
   output reg [7:0]  CNT,
	output reg [15:0] WCNT,
   output reg [7:0] SLAVE_ADDR,	 	
   output reg [15:0] WORD_DATA,
   output reg [15:0] POINTER,
	
	output           W_WORD_END ,
   output reg       W_WORD_GO ,
	
	output [7:0]     WORD_ST,
	output [7:0]     WORD_CNT,
	output [7:0]     WORD_BYTE	,
   output [15:0]    R_DATA,
	output           SDAI_W ,
	output           TR ,
	output           I2C_SCL_O ,
   output reg       MIPI_CAMERA_RELAESE  
	);

parameter WORD_NUM_MAX = 317 	 ; 
//-- I2C clock 400k generater 
CLOCKMEM c1(  .CLK ( CLK_50 ) , .CLK_FREQ ( 125 )  , .CK_1HZ (CLK_400K) ) ; 
  
//======== Main-ST =======
//==Pointer NUM==
parameter  MIPI_I2C_ADDR  =8'h6c;
parameter  P_ID1     = 16'h300b  ;  //8'h88
parameter  P_ID2     = 16'h300c  ;  //8'h65 
parameter TIME_LONG  = 100 ; 
parameter DELAY_TYPE = 8'hAA ; 

//----
reg [31:0] DELY ;
always @(negedge RESET_N or posedge CLK_400K )begin 
if (!RESET_N  ) begin 
   ST    <=0;
	W_POINTER_GO <=1;
   R_GO  <=1;		 
	W_WORD_GO <=1;
	WCNT  <=0;  
	CNT   <=0;
	DELY  <=0 ;	
	ID1   <=0; 
	MIPI_CAMERA_RELAESE <=0 ;  
end
else  begin  
case (ST)
0: begin 
    ST<=1; //Config Reg
	 W_POINTER_GO <=1;
    R_GO  <=1 ;		 
	 W_WORD_GO <=1;
	 WCNT <=0;  
	 CNT  <=0;
	 DELY <=0 ;	
   end
//<----------------READ -------	
1: begin 
   ST<=2;
	end	
2: begin 
	     if ( CNT==0 )   {  SLAVE_ADDR[7:0] , POINTER[15:0]} <= {   MIPI_I2C_ADDR[7:0] , P_ID1 [15:0] }   ;
   if ( W_POINTER_END ) begin  W_POINTER_GO  <=0; ST<=3 ; DELY<=0;  end
	end                // Write pointer
3: begin 
    DELY  <= DELY +1;
    if ( DELY ==2 ) begin 
     W_POINTER_GO  <=1;
     ST<=4 ; 
	 end
	end       
4: begin 
   if  ( W_POINTER_END ) ST<=5 ; 	
	end              
5: begin ST<=6 ; end //delay
//read DATA 		 
6: begin 
	if ( R_END ) begin  R_GO  <=0; ST<=7 ; DELY<=0; end
	end                
7: begin 
    DELY  <=DELY +1;
    if ( DELY ==2 ) begin 	 
    R_GO  <=1;
    ST<=8 ; 
	 end
	 
	end       
8: begin 
   ST<=9 ; 
	end       
	
9: begin 
   if  ( R_END ) begin 
	       if ( CNT==0 )  ID1    <= R_DATA[7:0] ; 
	  CNT<=CNT+1 ;
	  ST<=10 ; 	
	end 
  end	
10: begin  
     if ( ID1 != 8'h88   )  ST<=1;	
	  else  if (CNT ==1 ) 
	         ST<=  28;// 10;
	   else  ST<=1;	
		   DELY <=0;
	      W_POINTER_GO <=1;
         R_GO         <=1 ;		 
	      W_WORD_GO    <=1; 	 	  
	 end //delay
//<----------------------------------READ-----------------------
28: begin
    if (DELY < 5  ) DELY <=DELY+1; 
    else begin 
	    ST<=30;  
	 end  
end 
//<----------------------------------WRITE WORD-----------------
30: begin 
     ST<=31; 
	  WCNT<=0 ; 
    end	
31: begin 
      if  ( SLV8_REG16_DATA8[31:24] == DELAY_TYPE  )  ST <= 40 ;     
		else  begin 
	      { SLAVE_ADDR[7:0] , POINTER [15:0] ,WORD_DATA [7:0]} <=  SLV8_REG16_DATA8  ; 
	      if ( W_WORD_END ) begin  W_WORD_GO  <=0; ST<=32 ;  DELY<=0;  end
		end 	
		
	end                // Write ID pointer 
32: begin 
    if ( DELY ==3 ) begin 
       W_WORD_GO  <=1;
       ST<=33 ; 
	 end
	 else  DELY <=DELY +1;
	end       
33: begin 
    ST<=34 ; 
	end       	
34: begin 
     if  ( W_WORD_END )  begin 	
			 WCNT<=WCNT+1 ;			 
			 ST<=35 ; 
	  end
	end              
35: begin 
        if  (  WCNT == WORD_NUM_MAX )    //13
		  begin   
		       ST<= ST ; 	 
		       I2C_LO0P <= 1 ;  
				 MIPI_CAMERA_RELAESE <=1 ;  
			  end 
	     else   ST<=31 ; 	 
	 end 
	 
36: begin  //END 
		       WCNT <=0;  CNT <=0; DELY <= 0; 
	 end 
	 
	 
//-------DELAY PROCESS 
40:begin 
     DELY <=0;
     ST<=41 ; 	 
	end 
41: begin 
    if ( DELY == SLV8_REG16_DATA8[7:0] * 1   )   begin 
	  ST<=42; 
	  WCNT <=WCNT+1 ; 
	 end  
	 else  DELY <=DELY +1;	
end 	 
	 
42: begin 
    ST<=31; 
end 	 
	
	  
endcase 
end 
end


//------------------------------------------------------------------------------------
wire const_zero_sig/* synthesis keep */ ; 
assign const_zero_sig = 0 ;

//-----------------------------MAIN-ST END ------------------------------------------
//I2C-BUS
wire   SDAO; 
assign I2C_SCL_O = ( W_WORD_SCL  & W_POINTER_SCL & R_SCL ) || ( RESET_N==0 )  ;
assign SDAO      = ( W_POINTER_SDAO & R_SDAO  & W_WORD_SDAO ) ||  ( RESET_N==0 )  ;
assign I2C_SDA   = (  SDAO  )?1'bz :const_zero_sig;//1'b0 ; 
assign I2C_SCL   = (ST==0)?0: ( ( I2C_SCL_O )? 1'b1:1'b0 )  ;
//==== I2C WRITE WORD ===
wire   W_WORD_SCL ; 
wire   W_WORD_SDAO ;  

I2C_WRITE_WDATA wrd(
   .RESET_N      ( RESET_N_1),
	.PT_CK        ( CLK_400K),
	.GO           ( W_WORD_GO),
	.LIGHT_INT    ( ),
	.POINTER      ( POINTER [15:0] ),
   .WDATA	     ( { WORD_DATA[7:0] , 8'h0 }  ),  //8BIT 
	.SLAVE_ADDRESS( SLAVE_ADDR ),
	.SDAI         ( I2C_SDA),
	.SDAO         ( W_WORD_SDAO),
	.SCLO         ( W_WORD_SCL ),
	.END_OK       ( W_WORD_END),
	//--for test 
	.ST           ( WORD_ST ),
	.CNT          ( WORD_CNT),
	.BYTE         ( WORD_BYTE),
	.ACK_OK       (),
	.SDAI_W       ( SDAI_W ),
	.BYTE_NUM     (3 )  // 3byte
);

//==== I2C WRITE POINTER ===
wire   W_POINTER_SCL ; 
wire   W_POINTER_END ; 
reg    W_POINTER_GO ; 
wire   W_POINTER_SDAO ;  

I2C_WRITE_PTR   wpt(
   .RESET_N      (RESET_N_1  ),
	.PT_CK        (CLK_400K ),
	.GO           (W_POINTER_GO),
	.POINTER      (POINTER[15:0]),
	.SLAVE_ADDRESS(SLAVE_ADDR ),
	.SDAI         (I2C_SDA),
	.SDAO         (W_POINTER_SDAO),
	.SCLO         (W_POINTER_SCL ),
	.END_OK       (W_POINTER_END),
	//--for test 
	.ST (),
	.ACK_OK(),
	.CNT (),
	.BYTE()  ,	
   .BYTE_END (2) 	//2 BYTE POINTER 
);


//=====================I2C READ ===

wire R_SCL; 
wire R_END; 
reg  R_GO; 
wire R_SDAO;  

I2C_READ_DATA  rd( //
   .RESET_N      (RESET_N_1),
	.PT_CK        (CLK_400K),
	.GO           (R_GO),
	.SLAVE_ADDRESS(SLAVE_ADDR ),
	.SDAI  (I2C_SDA),
	.SDAO  (R_SDAO),
	.SCLO  (R_SCL),
	.END_OK(R_END),
	.DATA16  (R_DATA),
	
	//--for test 
	.ST    (),
	.ACK_OK(),
	.CNT   (),
	.BYTE  () ,
   .END_BYTE  (0) ,//read 2 byte  	 	
);
//-
//-------WRITE TABLE 


wire   RESET_N_1 ;

I2C_RESET_DELAY DY (
  .CLK     (CLK_50), 
  .READY   (RESET_N_1)
) ; 
reg [31:0] SLV8_REG16_DATA8;
wire [7:0] TIME_DELAY  ; 
assign TIME_DELAY   =  DELAY_TYPE ; 

always @( posedge CLK_400K ) begin 
case ( WCNT ) 
		 0 :SLV8_REG16_DATA8<= {8'h6c, 16'h0103, 8'h01}; // software reset                                             
	   1 :SLV8_REG16_DATA8<= { TIME_DELAY, 16'h0, 8'd10};                                                            
	   2 :SLV8_REG16_DATA8<= { 8'h6c,16'h0100, 8'h00}; // software standby                                           
	   3 :SLV8_REG16_DATA8<= { 8'h6c,16'h0100, 8'h00}; // software standby                                           
	   4 :SLV8_REG16_DATA8<= { 8'h6c,16'h0100, 8'h00}; // software standby                                           
	   5 :SLV8_REG16_DATA8<= { 8'h6c,16'h0100, 8'h00}; // software standby                                           
	  	6 :SLV8_REG16_DATA8<= { TIME_DELAY, 16'h0, 8'd10};                                                           
	   7 :SLV8_REG16_DATA8<= { 8'h6c,16'h3638, 8'hff}; // analog control // 25MHz MCLK input // PHY_CLK : 600 MHz (da
	   8 :SLV8_REG16_DATA8<= { 8'h6c,16'h0302, 8'd24}; // PLL pll1_multiplier                                        
	   9 :SLV8_REG16_DATA8<= { 8'h6c,16'h0303, 8'h00}; // PLL pll1_divm1+pll1_divm                                   
	   10 :SLV8_REG16_DATA8<= { 8'h6c,16'h0304, 8'd3}; // PLL pll1_div_mipi                                          
	   11 :SLV8_REG16_DATA8<= { 8'h6c,16'h030e, 8'h00}; // PLL pll2_r_divs : /1                                      
	   12 :SLV8_REG16_DATA8<= { 8'h6c,16'h030f, 8'h04}; // PLL  1 + pll2_r_divsp                                     
	   13 :SLV8_REG16_DATA8<= { 8'h6c,16'h0312, 8'h01}; // PLL pll2_pre_div0: /1,pll2_r_divdac1+pll2_r_divdac        
	   14 :SLV8_REG16_DATA8<= { 8'h6c,16'h031e, 8'h0c}; // PLL                                                       
	   15 :SLV8_REG16_DATA8<= { 8'h6c,16'h3015, 8'h01}; // clock Div                                                 
	   16 :SLV8_REG16_DATA8<= { 8'h6c,16'h3018, 8'h72}; // MIPI 4 lane                                               
	   17 :SLV8_REG16_DATA8<= { 8'h6c,16'h3020, 8'h93}; // clock normal, pclk/1                                      
	   18 :SLV8_REG16_DATA8<= { 8'h6c,16'h3022, 8'h01}; // pd_mini enable when rst_sync                              
	   19 :SLV8_REG16_DATA8<= { 8'h6c,16'h3031, 8'h0a}; // 10-bit                                                    
	   20 :SLV8_REG16_DATA8<= { 8'h6c,16'h3106, 8'h01}; // PLL                                                       
	   21 :SLV8_REG16_DATA8<= { 8'h6c,16'h3305, 8'hf1};                                                              
	   22 :SLV8_REG16_DATA8<= { 8'h6c,16'h3308, 8'h00};                                                              
	   23 :SLV8_REG16_DATA8<= { 8'h6c,16'h3309, 8'h28};                                                              
	   24 :SLV8_REG16_DATA8<= { 8'h6c,16'h330a, 8'h00};                                                              
	   25 :SLV8_REG16_DATA8<= { 8'h6c,16'h330b, 8'h20};                                                              
	   26 :SLV8_REG16_DATA8<= { 8'h6c,16'h330c, 8'h00};                                                              
	   27 :SLV8_REG16_DATA8<= { 8'h6c,16'h330d, 8'h00};                                                              
	   28 :SLV8_REG16_DATA8<= { 8'h6c,16'h330e, 8'h00};                                                              
	   29 :SLV8_REG16_DATA8<= { 8'h6c,16'h330f, 8'h40};                                                              
	   30 :SLV8_REG16_DATA8<= { 8'h6c,16'h3307, 8'h04};                                                              
		                                                                                                               
		 31 :SLV8_REG16_DATA8<= { 8'h6c,16'h3508, 8'h03};                                                              
		                                                                                                               
		                                                                                                               
	   32 :SLV8_REG16_DATA8<= { 8'h6c,16'h3604, 8'h04}; // analog control                                            
	   33 :SLV8_REG16_DATA8<= { 8'h6c,16'h3602, 8'h30};                                                              
	   34 :SLV8_REG16_DATA8<= { 8'h6c,16'h3605, 8'h00};                                                              
	   35 :SLV8_REG16_DATA8<= { 8'h6c,16'h3607, 8'h20};                                                              
	   36 :SLV8_REG16_DATA8<= { 8'h6c,16'h3608, 8'h11};                                                              
	   37 :SLV8_REG16_DATA8<= { 8'h6c,16'h3609, 8'h68};                                                              
	   38 :SLV8_REG16_DATA8<= { 8'h6c,16'h360a, 8'h40};                                                              
	   39 :SLV8_REG16_DATA8<= { 8'h6c,16'h360c, 8'hdd};                                                              
	   40 :SLV8_REG16_DATA8<= { 8'h6c,16'h360e, 8'h0c};                                                              
	   41 :SLV8_REG16_DATA8<= { 8'h6c,16'h3610, 8'h07};                                                              
	   42 :SLV8_REG16_DATA8<= { 8'h6c,16'h3612, 8'h86};                                                              
	   43 :SLV8_REG16_DATA8<= { 8'h6c,16'h3613, 8'h58};                                                              
	   44 :SLV8_REG16_DATA8<= { 8'h6c,16'h3614, 8'h28};                                                              
	   45 :SLV8_REG16_DATA8<= { 8'h6c,16'h3617, 8'h40};                                                              
	   46 :SLV8_REG16_DATA8<= { 8'h6c,16'h3618, 8'h5a};                                                              
	   47 :SLV8_REG16_DATA8<= { 8'h6c,16'h3619, 8'h9b};                                                              
	   48 :SLV8_REG16_DATA8<= { 8'h6c,16'h361c, 8'h00};                                                              
	   49 :SLV8_REG16_DATA8<= { 8'h6c,16'h361d, 8'h60};                                                              
	   50 :SLV8_REG16_DATA8<= { 8'h6c,16'h3631, 8'h60};                                                              
	   51 :SLV8_REG16_DATA8<= { 8'h6c,16'h3633, 8'h10};                                                              
	   52 :SLV8_REG16_DATA8<= { 8'h6c,16'h3634, 8'h10};                                                              
	   53 :SLV8_REG16_DATA8<= { 8'h6c,16'h3635, 8'h10};                                                              
	   54 :SLV8_REG16_DATA8<= { 8'h6c,16'h3636, 8'h10};                                                              
	   55 :SLV8_REG16_DATA8<= { 8'h6c,16'h3641, 8'h55}; // MIPI settings                                             
	   56 :SLV8_REG16_DATA8<= { 8'h6c,16'h3646, 8'h86}; // MIPI settings                                             
	   57 :SLV8_REG16_DATA8<= { 8'h6c,16'h3647, 8'h27}; // MIPI settings                                             
	   58 :SLV8_REG16_DATA8<= { 8'h6c,16'h364a, 8'h1b}; // MIPI settings                                             
		                                                                                                               
		// exposure                                                                                                    
//	   59 :SLV8_REG16_DATA8<= { 8'h6c,16'h3500, 8'h00}; // exposure HH                                             
//	   60 :SLV8_REG16_DATA8<= { 8'h6c,16'h3501, 8'h38}; // exposure H                                              
//	   61 :SLV8_REG16_DATA8<= { 8'h6c,16'h3502, 8'h60}; // exposure L                                              
                                                                                                                   
		// exposure                                                                                                    
	   59  :SLV8_REG16_DATA8<= { 8'h6c,16'h3500, 8'h00}; // exposure HH                                              
	   60  :SLV8_REG16_DATA8<= { 8'h6c,16'h3501, 8'h18}; // exposure H                                               
	   61  :SLV8_REG16_DATA8<= { 8'h6c,16'h3502, 8'h60}; // exposure L                                               
	   62  :SLV8_REG16_DATA8<= { 8'h6c,16'h3503, 8'h00}; // gain no delay, exposure no delay                         
	   63  :SLV8_REG16_DATA8<= { 8'h6c,16'h3508, 8'h02}; // gain H                                                   
	   64  :SLV8_REG16_DATA8<= { 8'h6c,16'h3509, 8'h00}; // gain L                                                   
	   65  :SLV8_REG16_DATA8<= { 8'h6c,16'h3700, 8'h48}; // sensor control  // TODO: to check                        
	   66  :SLV8_REG16_DATA8<= { 8'h6c,16'h3701, 8'h18};                                                             
	   67  :SLV8_REG16_DATA8<= { 8'h6c,16'h3702, 8'h50};                                                             
	   68  :SLV8_REG16_DATA8<= { 8'h6c,16'h3703, 8'h32};                                                             
	   69  :SLV8_REG16_DATA8<= { 8'h6c,16'h3704, 8'h28};                                                             
	   70  :SLV8_REG16_DATA8<= { 8'h6c,16'h3705, 8'h00};                                                             
	   71  :SLV8_REG16_DATA8<= { 8'h6c,16'h3706, 8'h70};                                                             
	   72  :SLV8_REG16_DATA8<= { 8'h6c,16'h3707, 8'h08};                                                             
	   73  :SLV8_REG16_DATA8<= { 8'h6c,16'h3708, 8'h48};                                                             
	   74  :SLV8_REG16_DATA8<= { 8'h6c,16'h3709, 8'h80};                                                             
	   75  :SLV8_REG16_DATA8<= { 8'h6c,16'h370a, 8'h01};                                                             
	   76  :SLV8_REG16_DATA8<= { 8'h6c,16'h370b, 8'h70};                                                             
	   77  :SLV8_REG16_DATA8<= { 8'h6c,16'h370c, 8'h07};                                                             
	   78  :SLV8_REG16_DATA8<= { 8'h6c,16'h3718, 8'h14};                                                             
	   79  :SLV8_REG16_DATA8<= { 8'h6c,16'h3719, 8'h31};                                                             
	   80  :SLV8_REG16_DATA8<= { 8'h6c,16'h3712, 8'h44};                                                             
	   81  :SLV8_REG16_DATA8<= { 8'h6c,16'h3714, 8'h12};                                                             
	   82  :SLV8_REG16_DATA8<= { 8'h6c,16'h371e, 8'h31};                                                             
	   83  :SLV8_REG16_DATA8<= { 8'h6c,16'h371f, 8'h7f};                                                             
	   84  :SLV8_REG16_DATA8<= { 8'h6c,16'h3720, 8'h0a};                                                             
	   85  :SLV8_REG16_DATA8<= { 8'h6c,16'h3721, 8'h0a};                                                             
	   86  :SLV8_REG16_DATA8<= { 8'h6c,16'h3724, 8'h04};                                                             
	   87  :SLV8_REG16_DATA8<= { 8'h6c,16'h3725, 8'h04};                                                             
	   88  :SLV8_REG16_DATA8<= { 8'h6c,16'h3726, 8'h0c};                                                             
	   89  :SLV8_REG16_DATA8<= { 8'h6c,16'h3728, 8'h0a};                                                             
	   90  :SLV8_REG16_DATA8<= { 8'h6c,16'h3729, 8'h03};                                                             
	   91  :SLV8_REG16_DATA8<= { 8'h6c,16'h372a, 8'h06};                                                             
	   92  :SLV8_REG16_DATA8<= { 8'h6c,16'h372b, 8'ha6};                                                             
	   93  :SLV8_REG16_DATA8<= { 8'h6c,16'h372c, 8'ha6};                                                             
	   94  :SLV8_REG16_DATA8<= { 8'h6c,16'h372d, 8'ha6};                                                             
	   95  :SLV8_REG16_DATA8<= { 8'h6c,16'h372e, 8'h0c};                                                             
	   96  :SLV8_REG16_DATA8<= { 8'h6c,16'h372f, 8'h20};                                                             
	   97  :SLV8_REG16_DATA8<= { 8'h6c,16'h3730, 8'h02};                                                             
	   98  :SLV8_REG16_DATA8<= { 8'h6c,16'h3731, 8'h0c};                                                             
	   99  :SLV8_REG16_DATA8<= { 8'h6c,16'h3732, 8'h28};                                                             
	   100 :SLV8_REG16_DATA8<= { 8'h6c,16'h3733, 8'h10};                                                             
	   101 :SLV8_REG16_DATA8<= { 8'h6c,16'h3734, 8'h40};                                                             
	   102 :SLV8_REG16_DATA8<= { 8'h6c,16'h3736, 8'h30};                                                             
	   103 :SLV8_REG16_DATA8<= { 8'h6c,16'h373a, 8'h04};                                                             
	   104 :SLV8_REG16_DATA8<= { 8'h6c,16'h373b, 8'h18};                                                             
	   105 :SLV8_REG16_DATA8<= { 8'h6c,16'h373c, 8'h14};                                                             
	   106 :SLV8_REG16_DATA8<= { 8'h6c,16'h373e, 8'h06};                                                             
	   107 :SLV8_REG16_DATA8<= { 8'h6c,16'h3755, 8'h40};                                                             
	   108 :SLV8_REG16_DATA8<= { 8'h6c,16'h3758, 8'h00};                                                             
	   119 :SLV8_REG16_DATA8<= { 8'h6c,16'h3759, 8'h4c};                                                             
	   110 :SLV8_REG16_DATA8<= { 8'h6c,16'h375a, 8'h0c};                                                             
	   111 :SLV8_REG16_DATA8<= { 8'h6c,16'h375b, 8'h26};                                                             
	   112 :SLV8_REG16_DATA8<= { 8'h6c,16'h375c, 8'h20};                                                             
	   113 :SLV8_REG16_DATA8<= { 8'h6c,16'h375d, 8'h04};                                                             
	   114 :SLV8_REG16_DATA8<= { 8'h6c,16'h375e, 8'h00};                                                             
	   115 :SLV8_REG16_DATA8<= { 8'h6c,16'h375f, 8'h28};                                                             
	   116 :SLV8_REG16_DATA8<= { 8'h6c,16'h3767, 8'h04};                                                             
	   117 :SLV8_REG16_DATA8<= { 8'h6c,16'h3768, 8'h04};                                                             
	   118 :SLV8_REG16_DATA8<= { 8'h6c,16'h3769, 8'h20};                                                             
	   119 :SLV8_REG16_DATA8<= { 8'h6c,16'h376c, 8'h00};                                                             
	   120 :SLV8_REG16_DATA8<= { 8'h6c,16'h376d, 8'h00};                                                             
	   121 :SLV8_REG16_DATA8<= { 8'h6c,16'h376a, 8'h08};                                                             
	   122 :SLV8_REG16_DATA8<= { 8'h6c,16'h3761, 8'h00};                                                             
	   123 :SLV8_REG16_DATA8<= { 8'h6c,16'h3762, 8'h00};                                                             
	   124 :SLV8_REG16_DATA8<= { 8'h6c,16'h3763, 8'h00};                                                             
	   125 :SLV8_REG16_DATA8<= { 8'h6c,16'h3766, 8'hff};                                                             
	   126 :SLV8_REG16_DATA8<= { 8'h6c,16'h376b, 8'h42};                                                             
	   127 :SLV8_REG16_DATA8<= { 8'h6c,16'h3772, 8'h46};                                                             
	   128 :SLV8_REG16_DATA8<= { 8'h6c,16'h3773, 8'h04};                                                             
	   129 :SLV8_REG16_DATA8<= { 8'h6c,16'h3774, 8'h2c};                                                             
	   130 :SLV8_REG16_DATA8<= { 8'h6c,16'h3775, 8'h13};                                                             
	   131 :SLV8_REG16_DATA8<= { 8'h6c,16'h3776, 8'h10};                                                             
	   132 :SLV8_REG16_DATA8<= { 8'h6c,16'h37a0, 8'h88};                                                             
	   133 :SLV8_REG16_DATA8<= { 8'h6c,16'h37a1, 8'h7a};                                                             
	   134 :SLV8_REG16_DATA8<= { 8'h6c,16'h37a2, 8'h7a};                                                             
	   135 :SLV8_REG16_DATA8<= { 8'h6c,16'h37a3, 8'h02};                                                             
	   136 :SLV8_REG16_DATA8<= { 8'h6c,16'h37a4, 8'h00};                                                             
	   137 :SLV8_REG16_DATA8<= { 8'h6c,16'h37a5, 8'h09};                                                             
	   138 :SLV8_REG16_DATA8<= { 8'h6c,16'h37a6, 8'h00};                                                             
	   139 :SLV8_REG16_DATA8<= { 8'h6c,16'h37a7, 8'h88};                                                             
	   140 :SLV8_REG16_DATA8<= { 8'h6c,16'h37a8, 8'hb0};                                                             
	   141 :SLV8_REG16_DATA8<= { 8'h6c,16'h37a9, 8'hb0};                                                             
	   142 :SLV8_REG16_DATA8<= { 8'h6c,16'h3760, 8'h00};                                                             
	   143 :SLV8_REG16_DATA8<= { 8'h6c,16'h376f, 8'h01};                                                             
	   144 :SLV8_REG16_DATA8<= { 8'h6c,16'h37aa, 8'h88};                                                             
	   145 :SLV8_REG16_DATA8<= { 8'h6c,16'h37ab, 8'h5c};                                                             
	   146 :SLV8_REG16_DATA8<= { 8'h6c,16'h37ac, 8'h5c};                                                             
	   147 :SLV8_REG16_DATA8<= { 8'h6c,16'h37ad, 8'h55};                                                             
	   148 :SLV8_REG16_DATA8<= { 8'h6c,16'h37ae, 8'h19};                                                             
	   149 :SLV8_REG16_DATA8<= { 8'h6c,16'h37af, 8'h19};                                                             
	   150 :SLV8_REG16_DATA8<= { 8'h6c,16'h37b0, 8'h00};                                                             
	   151 :SLV8_REG16_DATA8<= { 8'h6c,16'h37b1, 8'h00};                                                             
	   152 :SLV8_REG16_DATA8<= { 8'h6c,16'h37b2, 8'h00};                                                             
	   153 :SLV8_REG16_DATA8<= { 8'h6c,16'h37b3, 8'h84};                                                             
	   154 :SLV8_REG16_DATA8<= { 8'h6c,16'h37b4, 8'h84};                                                             
	   155 :SLV8_REG16_DATA8<= { 8'h6c,16'h37b5, 8'h66};                                                             
	   156 :SLV8_REG16_DATA8<= { 8'h6c,16'h37b6, 8'h00};                                                             
	   157 :SLV8_REG16_DATA8<= { 8'h6c,16'h37b7, 8'h00};                                                             
	   158 :SLV8_REG16_DATA8<= { 8'h6c,16'h37b8, 8'h00};                                                             
	   159 :SLV8_REG16_DATA8<= { 8'h6c,16'h37b9, 8'hff};                                                             
		                                                                                                               
//		 // sensor control // 800x480                                                                                
//	    160:SLV8_REG16_DATA8<= { 8'h6c,16'h3808, 8'h03}; // X output size H                                        
//	    161:SLV8_REG16_DATA8<= { 8'h6c,16'h3809, 8'h20}; // X output size L                                        
//	    162:SLV8_REG16_DATA8<= { 8'h6c,16'h380a, 8'h01}; // Y output size H                                        
//		 163:SLV8_REG16_DATA8<= { 8'h6c,16'h380b, 8'he0}; // Y output size L // 60 fps (combined with pll settings)  
//	                                                                                                               
//		 164:SLV8_REG16_DATA8<= { 8'h6c,16'h380c, 8'h12}; // HTS H                                                   
//	    165:SLV8_REG16_DATA8<= { 8'h6c,16'h380d, 8'h00}; // HTS L                                                  
//	    166:SLV8_REG16_DATA8<= { 8'h6c,16'h380e, 8'h02}; // VTS H                                                  
//	    167:SLV8_REG16_DATA8<= { 8'h6c,16'h380f, 8'h1E}; // VTS L                                                  
                                                                                                                   
//		 // sensor control // 1920x1080                                                                              
	    160:SLV8_REG16_DATA8<= { 8'h6c,16'h3808, 8'h07}; // X output size H                                          
	    161:SLV8_REG16_DATA8<= { 8'h6c,16'h3809, 8'h80}; // X output size L                                          
	    162:SLV8_REG16_DATA8<= { 8'h6c,16'h380a, 8'h04}; // Y output size H                                          
		  163:SLV8_REG16_DATA8<= { 8'h6c,16'h380b, 8'h38}; // Y output size L                                          
	                                                                                                                 
		                                                                                                               
		 // 15 fps                                                                                                     
		  164:SLV8_REG16_DATA8<= { 8'h6c,16'h380c, 8'h1C}; // HTS H                                                    
	    165:SLV8_REG16_DATA8<= { 8'h6c,16'h380d, 8'hB0}; // HTS L                                                    
	    166:SLV8_REG16_DATA8<= { 8'h6c,16'h380e, 8'h05}; // VTS H                                                    
	    167:SLV8_REG16_DATA8<= { 8'h6c,16'h380f, 8'h50}; // VTS L                                                    
		                                                                                                               
		 // 30 fps                                                                                                     
//		  164:SLV8_REG16_DATA8<= { 8'h6c,16'h380c, 8'h11}; // HTS H                                                  
//	    165:SLV8_REG16_DATA8<= { 8'h6c,16'h380d, 8'hA6}; // HTS L                                                  
//	    166:SLV8_REG16_DATA8<= { 8'h6c,16'h380e, 8'h04}; // VTS H                                                  
//	    167:SLV8_REG16_DATA8<= { 8'h6c,16'h380f, 8'h60}; // VTS L                                                  
		                                                                                                               
		                                                                                                               
	    168:SLV8_REG16_DATA8<= { 8'h6c,16'h3810, 8'h00}; // ISP X win H                                              
	    169:SLV8_REG16_DATA8<= { 8'h6c,16'h3811, 8'h04}; // ISP X win L                                              
	    170:SLV8_REG16_DATA8<= { 8'h6c,16'h3813, 8'h02}; // ISP Y win L                                              
		                                                                                                               
	    171:SLV8_REG16_DATA8<= { 8'h6c,16'h3814, 8'h01}; // X inc odd                                                
	    172:SLV8_REG16_DATA8<= { 8'h6c,16'h3815, 8'h01}; // X inc even                                               
                                                                                                                   
//	    171:SLV8_REG16_DATA8<= { 8'h6c,16'h3814, 8'h03}; // X inc odd                                              
//	    172:SLV8_REG16_DATA8<= { 8'h6c,16'h3815, 8'h01}; // X inc even                                             
                                                                                                                   
	    173:SLV8_REG16_DATA8<= { 8'h6c,16'h3820, 8'h06}; // flip on                                                  
		                                                                                                               
	    174:SLV8_REG16_DATA8<= { 8'h6c,16'h3821, 8'h00}; // hsync_en_o, fst_vbin, mirror on                          
//	    174:SLV8_REG16_DATA8<= { 8'h6c,16'h3821, 8'h76}; // hsync_en_o, fst_vbin, mirror on                        
                                                                                                                   
	    175:SLV8_REG16_DATA8<= { 8'h6c,16'h382a, 8'h01}; // Y inc odd                                                
	    176:SLV8_REG16_DATA8<= { 8'h6c,16'h382b, 8'h01}; // Y inc even                                               
		                                                                                                               
//	    175:SLV8_REG16_DATA8<= { 8'h6c,16'h382a, 8'h03}; // Y inc odd                                              
//	    176:SLV8_REG16_DATA8<= { 8'h6c,16'h382b, 8'h01}; // Y inc even                                             
		                                                                                                               
	    177:SLV8_REG16_DATA8<= { 8'h6c,16'h3830, 8'd8}; // ablc_use_num[5:1]                                         
	    178:SLV8_REG16_DATA8<= { 8'h6c,16'h3836, 8'd2}; // zline_use_num[5:1]                                        
	    179:SLV8_REG16_DATA8<= { 8'h6c,16'h3837, 8'h18}; // vts_add_dis, cexp_gt_vts_offs=8                          
	    180:SLV8_REG16_DATA8<= { 8'h6c,16'h3841, 8'hff}; // auto size                                                
	    181:SLV8_REG16_DATA8<= { 8'h6c,16'h3846, 8'h48}; // Y/X boundary pixel number for auto size mode             
	    182:SLV8_REG16_DATA8<= { 8'h6c,16'h3f08, 8'h16};                                                             
	    183:SLV8_REG16_DATA8<= { 8'h6c,16'h4000, 8'hf1}; // our range trig en, format chg en, gan chg en, exp chg en,
	    184:SLV8_REG16_DATA8<= { 8'h6c,16'h4001, 8'h04}; // left 32 column, final BLC offset limitation enable       
	    185:SLV8_REG16_DATA8<= { 8'h6c,16'h4005, 8'h10}; // BLC target                                               
	    186:SLV8_REG16_DATA8<= { 8'h6c,16'h400b, 8'h0c}; // start line =0, offset limitation en, cut range function e
	    187:SLV8_REG16_DATA8<= { 8'h6c,16'h400d, 8'h10}; // offset trigger threshold                                 
		  188:SLV8_REG16_DATA8<= { 8'h6c,16'h4011, 8'h30};                                                             
		  189:SLV8_REG16_DATA8<= { 8'h6c,16'h4013, 8'hcf};                                                             
		                                                                                                               
                                                                                                                   
	    190:SLV8_REG16_DATA8<= { 8'h6c,16'h401b, 8'h00};                                                             
	    191:SLV8_REG16_DATA8<= { 8'h6c,16'h401d, 8'h00};                                                             
	    192:SLV8_REG16_DATA8<= { 8'h6c,16'h4020, 8'h02}; // anchor left start H                                      
	    193:SLV8_REG16_DATA8<= { 8'h6c,16'h4021, 8'h40}; // anchor left start L                                      
	    194:SLV8_REG16_DATA8<= { 8'h6c,16'h4022, 8'h03}; // anchor left end H                                        
	    195:SLV8_REG16_DATA8<= { 8'h6c,16'h4023, 8'h3f}; // anchor left end L                                        
	    196:SLV8_REG16_DATA8<= { 8'h6c,16'h4024, 8'h07}; // anchor right start H                                     
	    197:SLV8_REG16_DATA8<= { 8'h6c,16'h4025, 8'hc0}; // anchor right start L                                     
	    198:SLV8_REG16_DATA8<= { 8'h6c,16'h4026, 8'h08}; // anchor right end H                                       
	    199:SLV8_REG16_DATA8<= { 8'h6c,16'h4027, 8'hbf}; // anchor right end L                                       
	    200:SLV8_REG16_DATA8<= { 8'h6c,16'h4028, 8'h00}; // top zero line start                                      
	    201:SLV8_REG16_DATA8<= { 8'h6c,16'h4029, 8'h02}; // top zero line number                                     
	    202:SLV8_REG16_DATA8<= { 8'h6c,16'h402a, 8'h04}; // top black line start                                     
	    203:SLV8_REG16_DATA8<= { 8'h6c,16'h402b, 8'h04}; // top black line number                                    
	    204:SLV8_REG16_DATA8<= { 8'h6c,16'h402c, 8'h02}; // bottom zero line start                                   
	    205:SLV8_REG16_DATA8<= { 8'h6c,16'h402d, 8'h02}; // bottom zero line number                                  
	    206:SLV8_REG16_DATA8<= { 8'h6c,16'h402e, 8'h08}; // bottom black line start                                  
	    207:SLV8_REG16_DATA8<= { 8'h6c,16'h402f, 8'h02}; // bottom black line number                                 
	    208:SLV8_REG16_DATA8<= { 8'h6c,16'h401f, 8'h00}; // anchor one disable                                       
	    209:SLV8_REG16_DATA8<= { 8'h6c,16'h4034, 8'h3f}; // limitation BLC offset                                    
	    210:SLV8_REG16_DATA8<= { 8'h6c,16'h4300, 8'hff}; // clip max H                                               
	    211:SLV8_REG16_DATA8<= { 8'h6c,16'h4301, 8'h00}; // clip min H                                               
	    212:SLV8_REG16_DATA8<= { 8'h6c,16'h4302, 8'h0f}; // clip min L/clip max L                                    
	    213:SLV8_REG16_DATA8<= { 8'h6c,16'h4500, 8'h68}; // ADC sync control                                         
	    214:SLV8_REG16_DATA8<= { 8'h6c,16'h4503, 8'h10};                                                             
	    215:SLV8_REG16_DATA8<= { 8'h6c,16'h4601, 8'h10}; // V FIFO control // cloc16'hprepare  50+ Tui*ui_clk_prepare
	    216:SLV8_REG16_DATA8<= { 8'h6c,16'h481f, 8'd70}; // clk_prepare_min                                          
	    217:SLV8_REG16_DATA8<= { 8'h6c,16'h4837, 8'h16}; // clock period                                             
	    218:SLV8_REG16_DATA8<= { 8'h6c,16'h4850, 8'h10}; // lane select                                              
	    219:SLV8_REG16_DATA8<= { 8'h6c,16'h4851, 8'h32}; // lane select                                              
	    220:SLV8_REG16_DATA8<= { 8'h6c,16'h4b00, 8'h2a}; // LVDS settings                                            
	    221:SLV8_REG16_DATA8<= { 8'h6c,16'h4b0d, 8'h00}; // LVDS settings                                            
	    222:SLV8_REG16_DATA8<= { 8'h6c,16'h4d00, 8'h04}; // temperature sensor                                       
	    223:SLV8_REG16_DATA8<= { 8'h6c,16'h4d01, 8'h18}; // temperature sensor                                       
	    224:SLV8_REG16_DATA8<= { 8'h6c,16'h4d02, 8'hc3}; // temperature sensor                                       
	    225:SLV8_REG16_DATA8<= { 8'h6c,16'h4d03, 8'hff}; // temperature sensor                                       
	    226:SLV8_REG16_DATA8<= { 8'h6c,16'h4d04, 8'hff}; // temperature sensor                                       
	    227:SLV8_REG16_DATA8<= { 8'h6c,16'h4d05, 8'hff}; // temperature sensor                                       
	    228:SLV8_REG16_DATA8<= { 8'h6c,16'h5000, 8'h16}; // LENC on, MWB on, BPC on, WPC on                          
	    229:SLV8_REG16_DATA8<= { 8'h6c,16'h5001, 8'h01}; // BLC on                                                   
	    230:SLV8_REG16_DATA8<= { 8'h6c,16'h5002, 8'h08}; // vario pixel off                                          
	    231:SLV8_REG16_DATA8<= { 8'h6c,16'h5901, 8'h00};                                                             
		  232:SLV8_REG16_DATA8<= { 8'h6c,16'h5e00, 8'h00}; // test pattern off                                         
		  233:SLV8_REG16_DATA8<= {8'h6c,16'h5018, 8'h15}; // Red MWB gain                                              
      234:SLV8_REG16_DATA8<= {8'h6c,16'h501a, 8'h10}; // Green MWB gain                                            
      235:SLV8_REG16_DATA8<= {8'h6c,16'h501c, 8'h15}; // Blue MWB gain                                             
                                                                                                                   
	    236:SLV8_REG16_DATA8<= { 8'h6c,16'h5e01, 8'h41}; // window cut enable                                        
	    237:SLV8_REG16_DATA8<= { TIME_DELAY, 16'h0, 8'd10};                                                          
	    238:SLV8_REG16_DATA8<= { 8'h6c,16'h5780, 8'hfc};                                                             
	    239:SLV8_REG16_DATA8<= { 8'h6c,16'h5781, 8'hdf};                                                             
	    240:SLV8_REG16_DATA8<= { 8'h6c,16'h5782, 8'h3f};                                                             
	    241:SLV8_REG16_DATA8<= { 8'h6c,16'h5783, 8'h08};                                                             
	    242:SLV8_REG16_DATA8<= { 8'h6c,16'h5784, 8'h0c};                                                             
	    243:SLV8_REG16_DATA8<= { 8'h6c,16'h5786, 8'h20};                                                             
	    244:SLV8_REG16_DATA8<= { 8'h6c,16'h5787, 8'h40};                                                             
	    245:SLV8_REG16_DATA8<= { 8'h6c,16'h5788, 8'h08};                                                             
	    246:SLV8_REG16_DATA8<= { 8'h6c,16'h5789, 8'h08};                                                             
	    247:SLV8_REG16_DATA8<= { 8'h6c,16'h578a, 8'h02};                                                             
	    248:SLV8_REG16_DATA8<= { 8'h6c,16'h578b, 8'h01};                                                             
	    249:SLV8_REG16_DATA8<= { 8'h6c,16'h578c, 8'h01};                                                             
	    250:SLV8_REG16_DATA8<= { 8'h6c,16'h578d, 8'h0c};                                                             
	    251:SLV8_REG16_DATA8<= { 8'h6c,16'h578e, 8'h02};                                                             
	    252:SLV8_REG16_DATA8<= { 8'h6c,16'h578f, 8'h01};                                                             
	    253:SLV8_REG16_DATA8<= { 8'h6c,16'h5790, 8'h01};                                                             
	    254:SLV8_REG16_DATA8<= { 8'h6c,16'h5800, 8'h1d}; // lens correction                                          
	    255:SLV8_REG16_DATA8<= { 8'h6c,16'h5801, 8'h0e};                                                             
	    256:SLV8_REG16_DATA8<= { 8'h6c,16'h5802, 8'h0c};                                                             
	    257:SLV8_REG16_DATA8<= { 8'h6c,16'h5803, 8'h0c};                                                             
	    258:SLV8_REG16_DATA8<= { 8'h6c,16'h5804, 8'h0f};                                                             
	    259:SLV8_REG16_DATA8<= { 8'h6c,16'h5805, 8'h22};                                                             
	    260:SLV8_REG16_DATA8<= { 8'h6c,16'h5806, 8'h0a};                                                             
	    261:SLV8_REG16_DATA8<= { 8'h6c,16'h5807, 8'h06};                                                             
	    262:SLV8_REG16_DATA8<= { 8'h6c,16'h5808, 8'h05};                                                             
	    263:SLV8_REG16_DATA8<= { 8'h6c,16'h5809, 8'h05};                                                             
	    264:SLV8_REG16_DATA8<= { 8'h6c,16'h580a, 8'h07};                                                             
	    265:SLV8_REG16_DATA8<= { 8'h6c,16'h580b, 8'h0a};                                                             
	    266:SLV8_REG16_DATA8<= { 8'h6c,16'h580c, 8'h06};                                                             
	    267:SLV8_REG16_DATA8<= { 8'h6c,16'h580d, 8'h02};                                                             
	    268:SLV8_REG16_DATA8<= { 8'h6c,16'h580e, 8'h00};                                                             
	    269:SLV8_REG16_DATA8<= { 8'h6c,16'h580f, 8'h00};                                                             
	    270:SLV8_REG16_DATA8<= { 8'h6c,16'h5810, 8'h03};                                                             
	    271:SLV8_REG16_DATA8<= { 8'h6c,16'h5811, 8'h07};                                                             
	    272:SLV8_REG16_DATA8<= { 8'h6c,16'h5812, 8'h06};                                                             
	    273:SLV8_REG16_DATA8<= { 8'h6c,16'h5813, 8'h02};                                                             
	    274:SLV8_REG16_DATA8<= { 8'h6c,16'h5814, 8'h00};                                                             
	    275:SLV8_REG16_DATA8<= { 8'h6c,16'h5815, 8'h00};                                                             
	    276:SLV8_REG16_DATA8<= { 8'h6c,16'h5816, 8'h03};                                                             
	    277:SLV8_REG16_DATA8<= { 8'h6c,16'h5817, 8'h07};                                                             
	    278:SLV8_REG16_DATA8<= { 8'h6c,16'h5818, 8'h09};                                                             
	    279:SLV8_REG16_DATA8<= { 8'h6c,16'h5819, 8'h06};                                                             
	    280:SLV8_REG16_DATA8<= { 8'h6c,16'h581a, 8'h04};                                                             
	    281:SLV8_REG16_DATA8<= { 8'h6c,16'h581b, 8'h04};                                                             
	    282:SLV8_REG16_DATA8<= { 8'h6c,16'h581c, 8'h06};                                                             
	    283:SLV8_REG16_DATA8<= { 8'h6c,16'h581d,  8'h0a};                                                            
	    284:SLV8_REG16_DATA8<= { 8'h6c,16'h581e, 8'h19};                                                             
	    285:SLV8_REG16_DATA8<= { 8'h6c,16'h581f, 8'h0d};                                                             
	    286:SLV8_REG16_DATA8<= { 8'h6c,16'h5820, 8'h0b};                                                             
	    287:SLV8_REG16_DATA8<= { 8'h6c,16'h5821, 8'h0b};                                                             
	    288:SLV8_REG16_DATA8<= { 8'h6c,16'h5822, 8'h0e};                                                             
	    289:SLV8_REG16_DATA8<= { 8'h6c,16'h5823, 8'h22};                                                             
	    290:SLV8_REG16_DATA8<= { 8'h6c,16'h5824, 8'h23};                                                             
	    291:SLV8_REG16_DATA8<= { 8'h6c,16'h5825, 8'h28};                                                             
	    292:SLV8_REG16_DATA8<= { 8'h6c,16'h5826, 8'h29};                                                             
	    293:SLV8_REG16_DATA8<= { 8'h6c,16'h5827, 8'h27};                                                             
	    294:SLV8_REG16_DATA8<= { 8'h6c,16'h5828, 8'h13};                                                             
	    295:SLV8_REG16_DATA8<= { 8'h6c,16'h5829, 8'h26};                                                             
	    296:SLV8_REG16_DATA8<= { 8'h6c,16'h582a, 8'h33};                                                             
	    297:SLV8_REG16_DATA8<= { 8'h6c,16'h582b, 8'h32};                                                             
	    298:SLV8_REG16_DATA8<= { 8'h6c,16'h582c, 8'h33};                                                             
	    299:SLV8_REG16_DATA8<= { 8'h6c,16'h582d, 8'h16};                                                             
	    300:SLV8_REG16_DATA8<= { 8'h6c,16'h582e, 8'h14};                                                             
	    301:SLV8_REG16_DATA8<= { 8'h6c,16'h582f, 8'h30};                                                             
	    302:SLV8_REG16_DATA8<= { 8'h6c,16'h5830, 8'h31};                                                             
	    303:SLV8_REG16_DATA8<= { 8'h6c,16'h5831, 8'h30};                                                             
	    304:SLV8_REG16_DATA8<= { 8'h6c,16'h5832, 8'h15};                                                             
	    305:SLV8_REG16_DATA8<= { 8'h6c,16'h5833, 8'h26};                                                             
	    306:SLV8_REG16_DATA8<= { 8'h6c,16'h5834, 8'h23};                                                             
	    307:SLV8_REG16_DATA8<= {8'h6c,16'h5835, 8'h21};                                                              
	    308:SLV8_REG16_DATA8<= {8'h6c,16'h5836, 8'h23};                                                              
	    309:SLV8_REG16_DATA8<= {8'h6c,16'h5837, 8'h05};                                                              
	    310:SLV8_REG16_DATA8<= {8'h6c,16'h5838, 8'h36};                                                              
	    311:SLV8_REG16_DATA8<= {8'h6c,16'h5839, 8'h27};                                                              
	    312:SLV8_REG16_DATA8<= {8'h6c,16'h583a, 8'h28};                                                              
	    313:SLV8_REG16_DATA8<= {8'h6c,16'h583b, 8'h26};                                                              
	    314:SLV8_REG16_DATA8<= {8'h6c,16'h583c, 8'h24};                                                              
	    315:SLV8_REG16_DATA8<= {8'h6c,16'h583d, 8'hdf}; // lens correction                                           
	    316:SLV8_REG16_DATA8<= {8'h6c,16'h0100, 8'h01}; //; wake up, streaming                                       


		 
 
	//     {END_OF_SCRIPT, 0, 0}
	
	
	
	
   endcase 
end 	


endmodule
	