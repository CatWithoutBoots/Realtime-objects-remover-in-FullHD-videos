	component soc_system is
		port (
			alt_vip_itc_0_clocked_video_vid_clk        : in    std_logic                     := 'X';             -- vid_clk
			alt_vip_itc_0_clocked_video_vid_data       : out   std_logic_vector(23 downto 0);                    -- vid_data
			alt_vip_itc_0_clocked_video_underflow      : out   std_logic;                                        -- underflow
			alt_vip_itc_0_clocked_video_vid_datavalid  : out   std_logic;                                        -- vid_datavalid
			alt_vip_itc_0_clocked_video_vid_v_sync     : out   std_logic;                                        -- vid_v_sync
			alt_vip_itc_0_clocked_video_vid_h_sync     : out   std_logic;                                        -- vid_h_sync
			alt_vip_itc_0_clocked_video_vid_f          : out   std_logic;                                        -- vid_f
			alt_vip_itc_0_clocked_video_vid_h          : out   std_logic;                                        -- vid_h
			alt_vip_itc_0_clocked_video_vid_v          : out   std_logic;                                        -- vid_v
			clk_clk                                    : in    std_logic                     := 'X';             -- clk
			clk_d8m_clk                                : out   std_logic;                                        -- clk
			clk_hdmi_clk                               : out   std_logic;                                        -- clk
			clk_hdmi_ref_clk                           : in    std_logic                     := 'X';             -- clk
			clk_hps_ref_clk                            : in    std_logic                     := 'X';             -- clk
			gmm_fg_visor_sw_extern                     : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- extern
			hps_0_hps_io_hps_io_sdio_inst_CMD          : inout std_logic                     := 'X';             -- hps_io_sdio_inst_CMD
			hps_0_hps_io_hps_io_sdio_inst_D0           : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D0
			hps_0_hps_io_hps_io_sdio_inst_D1           : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D1
			hps_0_hps_io_hps_io_sdio_inst_CLK          : out   std_logic;                                        -- hps_io_sdio_inst_CLK
			hps_0_hps_io_hps_io_sdio_inst_D2           : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D2
			hps_0_hps_io_hps_io_sdio_inst_D3           : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D3
			hps_0_hps_io_hps_io_uart0_inst_RX          : in    std_logic                     := 'X';             -- hps_io_uart0_inst_RX
			hps_0_hps_io_hps_io_uart0_inst_TX          : out   std_logic;                                        -- hps_io_uart0_inst_TX
			hps_0_hps_io_hps_io_gpio_inst_GPIO53       : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO53
			memory_mem_a                               : out   std_logic_vector(14 downto 0);                    -- mem_a
			memory_mem_ba                              : out   std_logic_vector(2 downto 0);                     -- mem_ba
			memory_mem_ck                              : out   std_logic;                                        -- mem_ck
			memory_mem_ck_n                            : out   std_logic;                                        -- mem_ck_n
			memory_mem_cke                             : out   std_logic;                                        -- mem_cke
			memory_mem_cs_n                            : out   std_logic;                                        -- mem_cs_n
			memory_mem_ras_n                           : out   std_logic;                                        -- mem_ras_n
			memory_mem_cas_n                           : out   std_logic;                                        -- mem_cas_n
			memory_mem_we_n                            : out   std_logic;                                        -- mem_we_n
			memory_mem_reset_n                         : out   std_logic;                                        -- mem_reset_n
			memory_mem_dq                              : inout std_logic_vector(31 downto 0) := (others => 'X'); -- mem_dq
			memory_mem_dqs                             : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs
			memory_mem_dqs_n                           : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs_n
			memory_mem_odt                             : out   std_logic;                                        -- mem_odt
			memory_mem_dm                              : out   std_logic_vector(3 downto 0);                     -- mem_dm
			memory_oct_rzqin                           : in    std_logic                     := 'X';             -- oct_rzqin
			reset_reset_n                              : in    std_logic                     := 'X';             -- reset_n
			terasic_camera_0_conduit_end_camera_d      : in    std_logic_vector(11 downto 0) := (others => 'X'); -- camera_d
			terasic_camera_0_conduit_end_camera_fval   : in    std_logic                     := 'X';             -- camera_fval
			terasic_camera_0_conduit_end_camera_lval   : in    std_logic                     := 'X';             -- camera_lval
			terasic_camera_0_conduit_end_camera_pixclk : in    std_logic                     := 'X'              -- camera_pixclk
		);
	end component soc_system;

	u0 : component soc_system
		port map (
			alt_vip_itc_0_clocked_video_vid_clk        => CONNECTED_TO_alt_vip_itc_0_clocked_video_vid_clk,        --  alt_vip_itc_0_clocked_video.vid_clk
			alt_vip_itc_0_clocked_video_vid_data       => CONNECTED_TO_alt_vip_itc_0_clocked_video_vid_data,       --                             .vid_data
			alt_vip_itc_0_clocked_video_underflow      => CONNECTED_TO_alt_vip_itc_0_clocked_video_underflow,      --                             .underflow
			alt_vip_itc_0_clocked_video_vid_datavalid  => CONNECTED_TO_alt_vip_itc_0_clocked_video_vid_datavalid,  --                             .vid_datavalid
			alt_vip_itc_0_clocked_video_vid_v_sync     => CONNECTED_TO_alt_vip_itc_0_clocked_video_vid_v_sync,     --                             .vid_v_sync
			alt_vip_itc_0_clocked_video_vid_h_sync     => CONNECTED_TO_alt_vip_itc_0_clocked_video_vid_h_sync,     --                             .vid_h_sync
			alt_vip_itc_0_clocked_video_vid_f          => CONNECTED_TO_alt_vip_itc_0_clocked_video_vid_f,          --                             .vid_f
			alt_vip_itc_0_clocked_video_vid_h          => CONNECTED_TO_alt_vip_itc_0_clocked_video_vid_h,          --                             .vid_h
			alt_vip_itc_0_clocked_video_vid_v          => CONNECTED_TO_alt_vip_itc_0_clocked_video_vid_v,          --                             .vid_v
			clk_clk                                    => CONNECTED_TO_clk_clk,                                    --                          clk.clk
			clk_d8m_clk                                => CONNECTED_TO_clk_d8m_clk,                                --                      clk_d8m.clk
			clk_hdmi_clk                               => CONNECTED_TO_clk_hdmi_clk,                               --                     clk_hdmi.clk
			clk_hdmi_ref_clk                           => CONNECTED_TO_clk_hdmi_ref_clk,                           --                 clk_hdmi_ref.clk
			clk_hps_ref_clk                            => CONNECTED_TO_clk_hps_ref_clk,                            --                  clk_hps_ref.clk
			gmm_fg_visor_sw_extern                     => CONNECTED_TO_gmm_fg_visor_sw_extern,                     --              gmm_fg_visor_sw.extern
			hps_0_hps_io_hps_io_sdio_inst_CMD          => CONNECTED_TO_hps_0_hps_io_hps_io_sdio_inst_CMD,          --                 hps_0_hps_io.hps_io_sdio_inst_CMD
			hps_0_hps_io_hps_io_sdio_inst_D0           => CONNECTED_TO_hps_0_hps_io_hps_io_sdio_inst_D0,           --                             .hps_io_sdio_inst_D0
			hps_0_hps_io_hps_io_sdio_inst_D1           => CONNECTED_TO_hps_0_hps_io_hps_io_sdio_inst_D1,           --                             .hps_io_sdio_inst_D1
			hps_0_hps_io_hps_io_sdio_inst_CLK          => CONNECTED_TO_hps_0_hps_io_hps_io_sdio_inst_CLK,          --                             .hps_io_sdio_inst_CLK
			hps_0_hps_io_hps_io_sdio_inst_D2           => CONNECTED_TO_hps_0_hps_io_hps_io_sdio_inst_D2,           --                             .hps_io_sdio_inst_D2
			hps_0_hps_io_hps_io_sdio_inst_D3           => CONNECTED_TO_hps_0_hps_io_hps_io_sdio_inst_D3,           --                             .hps_io_sdio_inst_D3
			hps_0_hps_io_hps_io_uart0_inst_RX          => CONNECTED_TO_hps_0_hps_io_hps_io_uart0_inst_RX,          --                             .hps_io_uart0_inst_RX
			hps_0_hps_io_hps_io_uart0_inst_TX          => CONNECTED_TO_hps_0_hps_io_hps_io_uart0_inst_TX,          --                             .hps_io_uart0_inst_TX
			hps_0_hps_io_hps_io_gpio_inst_GPIO53       => CONNECTED_TO_hps_0_hps_io_hps_io_gpio_inst_GPIO53,       --                             .hps_io_gpio_inst_GPIO53
			memory_mem_a                               => CONNECTED_TO_memory_mem_a,                               --                       memory.mem_a
			memory_mem_ba                              => CONNECTED_TO_memory_mem_ba,                              --                             .mem_ba
			memory_mem_ck                              => CONNECTED_TO_memory_mem_ck,                              --                             .mem_ck
			memory_mem_ck_n                            => CONNECTED_TO_memory_mem_ck_n,                            --                             .mem_ck_n
			memory_mem_cke                             => CONNECTED_TO_memory_mem_cke,                             --                             .mem_cke
			memory_mem_cs_n                            => CONNECTED_TO_memory_mem_cs_n,                            --                             .mem_cs_n
			memory_mem_ras_n                           => CONNECTED_TO_memory_mem_ras_n,                           --                             .mem_ras_n
			memory_mem_cas_n                           => CONNECTED_TO_memory_mem_cas_n,                           --                             .mem_cas_n
			memory_mem_we_n                            => CONNECTED_TO_memory_mem_we_n,                            --                             .mem_we_n
			memory_mem_reset_n                         => CONNECTED_TO_memory_mem_reset_n,                         --                             .mem_reset_n
			memory_mem_dq                              => CONNECTED_TO_memory_mem_dq,                              --                             .mem_dq
			memory_mem_dqs                             => CONNECTED_TO_memory_mem_dqs,                             --                             .mem_dqs
			memory_mem_dqs_n                           => CONNECTED_TO_memory_mem_dqs_n,                           --                             .mem_dqs_n
			memory_mem_odt                             => CONNECTED_TO_memory_mem_odt,                             --                             .mem_odt
			memory_mem_dm                              => CONNECTED_TO_memory_mem_dm,                              --                             .mem_dm
			memory_oct_rzqin                           => CONNECTED_TO_memory_oct_rzqin,                           --                             .oct_rzqin
			reset_reset_n                              => CONNECTED_TO_reset_reset_n,                              --                        reset.reset_n
			terasic_camera_0_conduit_end_camera_d      => CONNECTED_TO_terasic_camera_0_conduit_end_camera_d,      -- terasic_camera_0_conduit_end.camera_d
			terasic_camera_0_conduit_end_camera_fval   => CONNECTED_TO_terasic_camera_0_conduit_end_camera_fval,   --                             .camera_fval
			terasic_camera_0_conduit_end_camera_lval   => CONNECTED_TO_terasic_camera_0_conduit_end_camera_lval,   --                             .camera_lval
			terasic_camera_0_conduit_end_camera_pixclk => CONNECTED_TO_terasic_camera_0_conduit_end_camera_pixclk  --                             .camera_pixclk
		);

