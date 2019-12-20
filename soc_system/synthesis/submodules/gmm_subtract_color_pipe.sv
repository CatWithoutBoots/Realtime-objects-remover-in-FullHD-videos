`ifndef _GMM_SUBTRACT_COLOR_PIPE_SV_
`define _GMM_SUBTRACT_COLOR_PIPE_SV_

`include "gmm_structures.svh"

import gmm_structures::*;

/*
The precence of signal 
typedef struct packed {
	Type                 | Name        | In  | Out |
	---------------------|-------------|-----|-----|
	data_t               | in          | old | old |
	logic[2:0][15:0]     | mem_var     | x   | new |
	logic[2:0][7:0]      | mem_w       | x   | new |
	logic[2:0][2:0][7:0] | mem_color   | x   | new |
	logic[2:0][19:0]     | vars        | x   | x   |	
	logic[2:0][18:0]     | w_sum       | x   | x   |
	logic[2:0][18:0]     | c_sum       | x   | x   |
	logic[2:0][18:0]     | v_sum       | x   | x   |
	logic[2:0][18:0]     | w0          | x   | x   |
	logic[19:0]          | var_min     | x   | x   |
	logic[19:0]          | var_max     | x   | x   |
	logic[1:0]           | var_min_idx | x   | x   |
	logic[1:0]           | var_max_idx | x   | x   |
	logic                | is_matched  | x   | x   |
	logic[31:0]          | p_max_idx   | x   | x   |
	logic[31:0]          | B           | x   | x   |
} mega_data_t;
*/
module gmm_subtract_color_pipe #(
    DATA_WIDTH = 153
)(
    input clk, rst,

    input snk_valid,
    input mega_data_t snk_data,
    output logic snk_ready,

    input src_ready,
    output logic src_valid,
    output mega_data_t src_data
);
    assign snk_ready = src_ready | ~src_valid;

	// **************** Stage 1 ****************
    // Pipeline
	always_ff @(posedge clk or posedge rst)
		if (rst) begin
			src_valid <= '0;

			src_data.in <= '0;
			src_data.var_min <= '0;
			src_data.var_max <= '0;
			src_data.var_min_idx <= '0;
			src_data.var_max_idx <= '0;
			src_data.is_matched <= '0;
			src_data.p_max_idx <= '0;
			src_data.B <= '0;
		end
		else begin
			if (snk_valid)
				src_valid <= '1;
			else if (src_ready)
				src_valid <= '0;

			
			if (snk_valid && snk_ready)
				src_data.in <= snk_data.in;
		end
    
	// Calculation
	genvar k;
	generate 
		for (k = 0; k < 3; ++k) begin : k_idx	
			always_ff @(posedge clk or posedge rst) 
				if (rst) begin
					src_data.mem_var[k] <= '0;
					src_data.mem_w[k] <= '0;
					src_data.mem_color[k] <= '0;
					src_data.vars[k] <= '0;
				end
				else if (snk_valid && snk_ready) begin
					if (k < snk_data.in.clusters_num) begin
						src_data.mem_w[k] <= snk_data.in.cluster[k].w;
						src_data.mem_color[k] <= snk_data.in.cluster[k].rgb_mean.color;
					    src_data.mem_var[k] <= (snk_data.in.cluster[k].rgb_std != '0) ? (snk_data.in.cluster[k].rgb_std * snk_data.in.cluster[k].rgb_std) : 16'd1;
					end
					else begin
						src_data.mem_w[k] <= '0;
						src_data.mem_color[k] <= snk_data.in.rgb_new.color;
                        src_data.mem_var[k] <= 16'd1;
					end
				end
		end : k_idx
	endgenerate
endmodule : gmm_subtract_color_pipe

`endif