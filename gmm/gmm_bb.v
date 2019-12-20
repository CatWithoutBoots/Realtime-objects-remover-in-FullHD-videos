
module gmm (
	rst_reset,
	mem_clk_clk,
	mem_write_address,
	mem_write_write,
	mem_write_byteenable,
	mem_write_writedata,
	mem_write_waitrequest,
	mem_write_burstcount,
	mem_read_address,
	mem_read_read,
	mem_read_byteenable,
	mem_read_readdata,
	mem_read_waitrequest,
	mem_read_readdatavalid,
	mem_read_burstcount,
	gmm_fg_visor_sw_extern,
	gmm_fg_detector_cpu_write,
	gmm_fg_detector_cpu_read,
	gmm_fg_detector_cpu_writedata,
	gmm_fg_detector_cpu_readdata,
	gmm_fg_detector_cpu_address,
	gmm_fg_detector_cpu_chipselect,
	snk_video_data,
	snk_video_endofpacket,
	snk_video_ready,
	snk_video_startofpacket,
	snk_video_valid,
	src_video_data,
	src_video_endofpacket,
	src_video_ready,
	src_video_startofpacket,
	src_video_valid);	

	input		rst_reset;
	input		mem_clk_clk;
	output	[31:0]	mem_write_address;
	output		mem_write_write;
	output	[15:0]	mem_write_byteenable;
	output	[127:0]	mem_write_writedata;
	input		mem_write_waitrequest;
	output	[6:0]	mem_write_burstcount;
	output	[31:0]	mem_read_address;
	output		mem_read_read;
	output	[15:0]	mem_read_byteenable;
	input	[127:0]	mem_read_readdata;
	input		mem_read_waitrequest;
	input		mem_read_readdatavalid;
	output	[6:0]	mem_read_burstcount;
	input	[1:0]	gmm_fg_visor_sw_extern;
	input		gmm_fg_detector_cpu_write;
	input		gmm_fg_detector_cpu_read;
	input	[31:0]	gmm_fg_detector_cpu_writedata;
	output	[31:0]	gmm_fg_detector_cpu_readdata;
	input	[3:0]	gmm_fg_detector_cpu_address;
	input		gmm_fg_detector_cpu_chipselect;
	input	[23:0]	snk_video_data;
	input		snk_video_endofpacket;
	output		snk_video_ready;
	input		snk_video_startofpacket;
	input		snk_video_valid;
	output	[23:0]	src_video_data;
	output		src_video_endofpacket;
	input		src_video_ready;
	output		src_video_startofpacket;
	output		src_video_valid;
endmodule
