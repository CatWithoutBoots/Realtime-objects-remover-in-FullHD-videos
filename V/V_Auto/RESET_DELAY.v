module RESET_DELAY  (
  input       RESET_N,
  input       CLK , 
  output reg  READY0, 
  output reg  READY1
);

reg [31:0] DELAY   ;  

parameter   TIME = 50000000 ; 

always @( negedge RESET_N  or posedge CLK ) 
if ( !RESET_N ) begin 
   DELAY <= 0 ;  
	READY0 <= 0 ;  
	READY1 <= 0 ;  
end 
else  begin 
   if ( DELAY <  TIME )  DELAY <= DELAY+1 ;
	 if  ( DELAY ==  TIME/4 ) READY0 <=1 ; 
	 if  ( DELAY ==  TIME/2 ) READY1 <=1 ; 
end 	 
endmodule 
