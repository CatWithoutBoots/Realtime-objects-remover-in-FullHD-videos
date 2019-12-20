	gmm u0 (
		.rst_reset                      (<connected-to-rst_reset>),                      //                 rst.reset
		.mem_clk_clk                    (<connected-to-mem_clk_clk>),                    //             mem_clk.clk
		.mem_write_address              (<connected-to-mem_write_address>),              //           mem_write.address
		.mem_write_write                (<connected-to-mem_write_write>),                //                    .write
		.mem_write_byteenable           (<connected-to-mem_write_byteenable>),           //                    .byteenable
		.mem_write_writedata            (<connected-to-mem_write_writedata>),            //                    .writedata
		.mem_write_waitrequest          (<connected-to-mem_write_waitrequest>),          //                    .waitrequest
		.mem_write_burstcount           (<connected-to-mem_write_burstcount>),           //                    .burstcount
		.mem_read_address               (<connected-to-mem_read_address>),               //            mem_read.address
		.mem_read_read                  (<connected-to-mem_read_read>),                  //                    .read
		.mem_read_byteenable            (<connected-to-mem_read_byteenable>),            //                    .byteenable
		.mem_read_readdata              (<connected-to-mem_read_readdata>),              //                    .readdata
		.mem_read_waitrequest           (<connected-to-mem_read_waitrequest>),           //                    .waitrequest
		.mem_read_readdatavalid         (<connected-to-mem_read_readdatavalid>),         //                    .readdatavalid
		.mem_read_burstcount            (<connected-to-mem_read_burstcount>),            //                    .burstcount
		.gmm_fg_visor_sw_extern         (<connected-to-gmm_fg_visor_sw_extern>),         //     gmm_fg_visor_sw.extern
		.gmm_fg_detector_cpu_write      (<connected-to-gmm_fg_detector_cpu_write>),      // gmm_fg_detector_cpu.write
		.gmm_fg_detector_cpu_read       (<connected-to-gmm_fg_detector_cpu_read>),       //                    .read
		.gmm_fg_detector_cpu_writedata  (<connected-to-gmm_fg_detector_cpu_writedata>),  //                    .writedata
		.gmm_fg_detector_cpu_readdata   (<connected-to-gmm_fg_detector_cpu_readdata>),   //                    .readdata
		.gmm_fg_detector_cpu_address    (<connected-to-gmm_fg_detector_cpu_address>),    //                    .address
		.gmm_fg_detector_cpu_chipselect (<connected-to-gmm_fg_detector_cpu_chipselect>), //                    .chipselect
		.snk_video_data                 (<connected-to-snk_video_data>),                 //           snk_video.data
		.snk_video_endofpacket          (<connected-to-snk_video_endofpacket>),          //                    .endofpacket
		.snk_video_ready                (<connected-to-snk_video_ready>),                //                    .ready
		.snk_video_startofpacket        (<connected-to-snk_video_startofpacket>),        //                    .startofpacket
		.snk_video_valid                (<connected-to-snk_video_valid>),                //                    .valid
		.src_video_data                 (<connected-to-src_video_data>),                 //           src_video.data
		.src_video_endofpacket          (<connected-to-src_video_endofpacket>),          //                    .endofpacket
		.src_video_ready                (<connected-to-src_video_ready>),                //                    .ready
		.src_video_startofpacket        (<connected-to-src_video_startofpacket>),        //                    .startofpacket
		.src_video_valid                (<connected-to-src_video_valid>)                 //                    .valid
	);

