module avg2(
	input [11:0] D0,
	input [11:0] D1,
	output [11:0] AVG
);


wire [12:0] sum;
assign sum = (D0+D1);
assign AVG = sum[12:1];

	
	
endmodule