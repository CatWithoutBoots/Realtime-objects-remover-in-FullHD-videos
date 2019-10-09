module VCM_STEP  ( 
input CLK , 
input RESET_N , 
output  [15:0] VCM_DATA , 
output  reg [9:0] STEP ,
output  reg OK
);  


 
assign VCM_DATA  = {2'b00, STEP [9:0]   ,4'b0000 }; // 



always @ (negedge RESET_N or posedge CLK )  begin 
if     (!RESET_N) begin STEP <=0;  OK <=0; end 
else if ( STEP < 10'h3ff )  STEP<=STEP+1 ;
else OK<=1; 
end


endmodule 