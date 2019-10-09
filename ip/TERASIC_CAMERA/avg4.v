module avg4(
	input [11:0] D0,
	input [11:0] D1,
	input [11:0] D2,
	input [11:0] D3,
	output [11:0] AVG
);


wire [13:0] sum;
assign sum = (D0+D1+D2+D3);
assign AVG = sum[13:2];

	
	
endmodule

	