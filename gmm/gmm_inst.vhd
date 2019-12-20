	component gmm is
		port (
			rst_reset                      : in  std_logic                      := 'X';             -- reset
			mem_clk_clk                    : in  std_logic                      := 'X';             -- clk
			mem_write_address              : out std_logic_vector(31 downto 0);                     -- address
			mem_write_write                : out std_logic;                                         -- write
			mem_write_byteenable           : out std_logic_vector(15 downto 0);                     -- byteenable
			mem_write_writedata            : out std_logic_vector(127 downto 0);                    -- writedata
			mem_write_waitrequest          : in  std_logic                      := 'X';             -- waitrequest
			mem_write_burstcount           : out std_logic_vector(6 downto 0);                      -- burstcount
			mem_read_address               : out std_logic_vector(31 downto 0);                     -- address
			mem_read_read                  : out std_logic;                                         -- read
			mem_read_byteenable            : out std_logic_vector(15 downto 0);                     -- byteenable
			mem_read_readdata              : in  std_logic_vector(127 downto 0) := (others => 'X'); -- readdata
			mem_read_waitrequest           : in  std_logic                      := 'X';             -- waitrequest
			mem_read_readdatavalid         : in  std_logic                      := 'X';             -- readdatavalid
			mem_read_burstcount            : out std_logic_vector(6 downto 0);                      -- burstcount
			gmm_fg_visor_sw_extern         : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- extern
			gmm_fg_detector_cpu_write      : in  std_logic                      := 'X';             -- write
			gmm_fg_detector_cpu_read       : in  std_logic                      := 'X';             -- read
			gmm_fg_detector_cpu_writedata  : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			gmm_fg_detector_cpu_readdata   : out std_logic_vector(31 downto 0);                     -- readdata
			gmm_fg_detector_cpu_address    : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- address
			gmm_fg_detector_cpu_chipselect : in  std_logic                      := 'X';             -- chipselect
			snk_video_data                 : in  std_logic_vector(23 downto 0)  := (others => 'X'); -- data
			snk_video_endofpacket          : in  std_logic                      := 'X';             -- endofpacket
			snk_video_ready                : out std_logic;                                         -- ready
			snk_video_startofpacket        : in  std_logic                      := 'X';             -- startofpacket
			snk_video_valid                : in  std_logic                      := 'X';             -- valid
			src_video_data                 : out std_logic_vector(23 downto 0);                     -- data
			src_video_endofpacket          : out std_logic;                                         -- endofpacket
			src_video_ready                : in  std_logic                      := 'X';             -- ready
			src_video_startofpacket        : out std_logic;                                         -- startofpacket
			src_video_valid                : out std_logic                                          -- valid
		);
	end component gmm;

	u0 : component gmm
		port map (
			rst_reset                      => CONNECTED_TO_rst_reset,                      --                 rst.reset
			mem_clk_clk                    => CONNECTED_TO_mem_clk_clk,                    --             mem_clk.clk
			mem_write_address              => CONNECTED_TO_mem_write_address,              --           mem_write.address
			mem_write_write                => CONNECTED_TO_mem_write_write,                --                    .write
			mem_write_byteenable           => CONNECTED_TO_mem_write_byteenable,           --                    .byteenable
			mem_write_writedata            => CONNECTED_TO_mem_write_writedata,            --                    .writedata
			mem_write_waitrequest          => CONNECTED_TO_mem_write_waitrequest,          --                    .waitrequest
			mem_write_burstcount           => CONNECTED_TO_mem_write_burstcount,           --                    .burstcount
			mem_read_address               => CONNECTED_TO_mem_read_address,               --            mem_read.address
			mem_read_read                  => CONNECTED_TO_mem_read_read,                  --                    .read
			mem_read_byteenable            => CONNECTED_TO_mem_read_byteenable,            --                    .byteenable
			mem_read_readdata              => CONNECTED_TO_mem_read_readdata,              --                    .readdata
			mem_read_waitrequest           => CONNECTED_TO_mem_read_waitrequest,           --                    .waitrequest
			mem_read_readdatavalid         => CONNECTED_TO_mem_read_readdatavalid,         --                    .readdatavalid
			mem_read_burstcount            => CONNECTED_TO_mem_read_burstcount,            --                    .burstcount
			gmm_fg_visor_sw_extern         => CONNECTED_TO_gmm_fg_visor_sw_extern,         --     gmm_fg_visor_sw.extern
			gmm_fg_detector_cpu_write      => CONNECTED_TO_gmm_fg_detector_cpu_write,      -- gmm_fg_detector_cpu.write
			gmm_fg_detector_cpu_read       => CONNECTED_TO_gmm_fg_detector_cpu_read,       --                    .read
			gmm_fg_detector_cpu_writedata  => CONNECTED_TO_gmm_fg_detector_cpu_writedata,  --                    .writedata
			gmm_fg_detector_cpu_readdata   => CONNECTED_TO_gmm_fg_detector_cpu_readdata,   --                    .readdata
			gmm_fg_detector_cpu_address    => CONNECTED_TO_gmm_fg_detector_cpu_address,    --                    .address
			gmm_fg_detector_cpu_chipselect => CONNECTED_TO_gmm_fg_detector_cpu_chipselect, --                    .chipselect
			snk_video_data                 => CONNECTED_TO_snk_video_data,                 --           snk_video.data
			snk_video_endofpacket          => CONNECTED_TO_snk_video_endofpacket,          --                    .endofpacket
			snk_video_ready                => CONNECTED_TO_snk_video_ready,                --                    .ready
			snk_video_startofpacket        => CONNECTED_TO_snk_video_startofpacket,        --                    .startofpacket
			snk_video_valid                => CONNECTED_TO_snk_video_valid,                --                    .valid
			src_video_data                 => CONNECTED_TO_src_video_data,                 --           src_video.data
			src_video_endofpacket          => CONNECTED_TO_src_video_endofpacket,          --                    .endofpacket
			src_video_ready                => CONNECTED_TO_src_video_ready,                --                    .ready
			src_video_startofpacket        => CONNECTED_TO_src_video_startofpacket,        --                    .startofpacket
			src_video_valid                => CONNECTED_TO_src_video_valid                 --                    .valid
		);

