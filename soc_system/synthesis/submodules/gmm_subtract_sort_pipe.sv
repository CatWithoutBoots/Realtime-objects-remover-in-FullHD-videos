`ifndef _GMM_SUBTRACT_SORT_PIPE_SV_
`define _GMM_SUBTRACT_SORT_PIPE_SV_

`include "gmm_structures.svh"

import gmm_structures::*;

/*
The precence of signal 
typedef struct packed {
	Type                 | Name        | In  | Out |
	---------------------|-------------|-----|-----|
	data_t               | in          | old | old |
	logic[2:0][15:0]     | mem_var     | old | new |
	logic[2:0][7:0]      | mem_w       | old | new |
	logic[2:0][2:0][7:0] | mem_color   | old | new |
	logic[2:0][19:0]     | vars        | old | old |
	logic[19:0]          | var_min     | old | old |
	logic[19:0]          | var_max     | old | old |
	logic[1:0]           | var_min_idx | old | old |
	logic[1:0]           | var_max_idx | old | old |
	logic                | is_matched  | old | old |
	logic[1:0]           | p_max_idx   | x   | x   |
	logic[1:0]           | B           | x   | x   |
} mega_data_t;
*/
module gmm_subtract_sort_pipe #(
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
    logic[2:0][31:0] cluster_val;//[cluster_idx]
    logic[2:0] key;
	
	logic cluster_valid, cluster_ready;
	logic sort_valid, sort_ready;

	mega_data_t cluster_data, sort_data;
	logic[2:0][1:0] code;

	assign sort_ready = src_ready | ~src_valid;
	
	// Pipeline
	always_ff @(posedge clk or posedge rst)
		if (rst) begin
			src_valid <= '0;
			src_data.in <= '0;
			src_data.vars <= '0;

			src_data.var_min <= '0;
			src_data.var_max <= '0;
			src_data.var_min_idx <= '0;
			src_data.var_max_idx <= '0;
			src_data.is_matched <= '0;
			src_data.B <= '0;
			src_data.p_max_idx <= '0;
		end
		else begin
			if (sort_valid)
				src_valid <= '1;
			else if (src_ready)
				src_valid <= '0;
			
			if (sort_valid && sort_ready) begin
				src_data.in <= sort_data.in;
				src_data.vars <= sort_data.vars;
			end
		end

	// Sorting
	genvar k;
	generate
		for (k = 0; k < 3; ++k) begin : k_idx
			always_ff @(posedge clk or posedge rst) 					
				if (rst) begin
					src_data.mem_w[k] <= '0;
					src_data.mem_var[k] <= '0;
					src_data.mem_color[k] <= '0;
				end
				else begin
					if (sort_valid && sort_ready) begin
						if (k < sort_data.in.clusters_num) begin
							src_data.mem_w[k] <= sort_data.mem_w[code[k]];
							src_data.mem_var[k] <= sort_data.mem_var[code[k]];
							src_data.mem_color[k] <= sort_data.mem_color[code[k]];
						end
						else begin
							src_data.mem_w[k] <= sort_data.mem_w[k];
							src_data.mem_var[k] <= sort_data.mem_var[k];
							src_data.mem_color[k] <= sort_data.mem_color[k];
						end
					end
				end
		end : k_idx
	endgenerate
	
	// **************** Modules ****************
	// Calculate cluster_val
	generate 
		for (k = 0; k < 3; ++k) begin : div_idx
			lpm_div32_wrap div_0(
				.clk, .rst,

				.snk_valid,
				.snk_numer({snk_data.mem_w[k], 24'b0}),
				.snk_denom(snk_data.mem_var[k]),
				.snk_ready(),

				.src_ready(cluster_ready),
				.src_valid(),
				.src_data(cluster_val[k])
			);
		end : div_idx
	endgenerate

	backpressure_machine #(
        .LATENCY(32),
        .DATA_EN(1),
        .DATA_WIDTH($bits(snk_data))
	) bpm_cluster (
        .clk, .rst,

        .snk_valid, .snk_ready,
        .snk_data,

        .src_valid(cluster_valid), .src_ready(cluster_ready),
        .src_data(cluster_data)
    );

	// Sorting
	sort_base sort_0 (
		.clk, .rst,

		.snk_valid(cluster_valid),
		.snk_cluster(cluster_val),
		.snk_clusters_num(cluster_data.in.clusters_num),
		.snk_ready(),

		.src_ready(sort_ready),
		.src_valid(),
		.src_code(code)
	);

	backpressure_machine #(
        .LATENCY(3),
        .DATA_EN(1),
        .DATA_WIDTH($bits(cluster_data))
	) bpm_sort (
        .clk, .rst,

        .snk_valid(cluster_valid), .snk_ready(cluster_ready),
        .snk_data(cluster_data),

        .src_valid(sort_valid), .src_ready(sort_ready),
        .src_data(sort_data)
    );
endmodule : gmm_subtract_sort_pipe

module sort_base (
	input clk, rst,

	input snk_valid,
	input[2:0][31:0] snk_cluster,
	input[1:0] snk_clusters_num,
	output snk_ready,

	input src_ready,
	output logic src_valid,
	output logic[2:0][1:0] src_code
);
	typedef struct packed {
		logic valid;
		logic[2:0][31:0] cluster;
		logic[2:0][1:0] code;
		logic[1:0] clusters_num;
	} data_t;

	assign snk_ready = src_ready | ~src_valid;

	// **************** Stage 1 ****************
	data_t data1;

	always_ff @(posedge clk or posedge rst)
		if (rst)
			data1 <= '0;
		else if (snk_ready) begin
			data1.valid <= snk_valid;
			data1.cluster <= snk_cluster;
			data1.clusters_num <= snk_clusters_num;
			
			case (snk_clusters_num)
			2'd0, 2'd1: data1.code <= {2'd2, 2'd1, 2'd0};
			2'd2, 2'd3:
				if (snk_cluster[0] >= snk_cluster[1])
					data1.code <= {2'd2, 2'd1, 2'd0};
				else begin
					data1.code <= {2'd2, 2'd0, 2'd1};
					data1.cluster[0] <= snk_cluster[1];
					data1.cluster[1] <= snk_cluster[0];
				end
			endcase
		end
	
	// **************** Stage 2 ****************
	data_t data2;

	always_ff @(posedge clk or posedge rst)
		if (rst)
			data2 <= '0;
		else if (snk_ready) begin
			data2.valid <= data1.valid;
			data2.cluster <= data1.cluster;
			data2.clusters_num <= data1.clusters_num;
			
			case (data1.clusters_num)
			2'd0, 2'd1, 2'd2: data2.code <= data1.code;
			2'd3:
				if (data1.cluster[1] >= data1.cluster[2])
					data2.code <= data1.code;
				else begin
					data2.code <= {data1.code[1], data1.code[2], data1.code[0]};
					data2.cluster[1] <= data1.cluster[2];
					data2.cluster[2] <= data1.cluster[1];
				end
			endcase
		end

	// **************** Stage 3 ****************
	always_ff @(posedge clk or posedge rst)
		if (rst) begin
			src_valid <= '0;
			src_code <= '0;
		end
		else if (snk_ready) begin
			src_valid <= data2.valid;

			case (data2.clusters_num)
			2'd0, 2'd1: src_code <= data2.code;
			2'd2, 2'd3:
				if (data2.cluster[0] >= data2.cluster[1])
					src_code <= data2.code;
				else
					src_code <= {data2.code[2], data2.code[0], data2.code[1]};
			endcase
		end
endmodule : sort_base

`endif