module snk_video_adapter(
	input clk, rst,
	
	input snk_valid, snk_sop, snk_eop,
	input[23:0] snk_data,
	input[1:0] snk_empty,
	output logic snk_ready,
	
	input src_ready,
	output logic src_valid, src_sop, src_eop,
	output logic[23:0] src_data
);
	assign snk_ready = src_ready | ~src_valid;
	
	always_ff @(posedge clk or posedge rst)
		if (rst) begin
			src_valid <= '0;
			src_sop <= '0;
			src_eop <= '0;
			src_data <= '0;
		end
		else begin
			if (snk_valid)
				src_valid <= '1;
			else if (src_ready)
				src_valid <= '0;
			
			if (snk_valid && snk_ready) begin
				src_sop <= snk_sop;
				src_eop <= snk_eop;
				src_data <= snk_data;
			end
		end
		
endmodule : snk_video_adapter