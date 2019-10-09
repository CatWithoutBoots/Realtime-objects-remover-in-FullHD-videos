onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /gmm_fg_detector_tb/u0/clk
add wave -noupdate /gmm_fg_detector_tb/u0/rst
add wave -noupdate /gmm_fg_detector_tb/u0/cpu_write
add wave -noupdate /gmm_fg_detector_tb/u0/cpu_read
add wave -noupdate /gmm_fg_detector_tb/u0/cpu_cs
add wave -noupdate /gmm_fg_detector_tb/u0/cpu_addr
add wave -noupdate /gmm_fg_detector_tb/u0/cpu_writedata
add wave -noupdate /gmm_fg_detector_tb/u0/cpu_readdata
add wave -noupdate -divider READER_STATE
add wave -noupdate /gmm_fg_detector_tb/u0/reader_state
add wave -noupdate /gmm_fg_detector_tb/u0/reader_next
add wave -noupdate -divider INPUT
add wave -noupdate -expand /gmm_fg_detector_tb/u0/in_control
add wave -noupdate /gmm_fg_detector_tb/u0/in_mem
add wave -noupdate /gmm_fg_detector_tb/u0/in_cmd
add wave -noupdate -expand -subitemconfig {/gmm_fg_detector_tb/u0/in_gmm.data -expand /gmm_fg_detector_tb/u0/in_gmm.data.cluster -expand} /gmm_fg_detector_tb/u0/in_gmm
add wave -noupdate -expand /gmm_fg_detector_tb/u0/in_video
add wave -noupdate -divider SNK_VIDEO
add wave -noupdate /gmm_fg_detector_tb/u0/snk_video_ready
add wave -noupdate /gmm_fg_detector_tb/u0/snk_video_valid
add wave -noupdate /gmm_fg_detector_tb/u0/snk_video_sop
add wave -noupdate /gmm_fg_detector_tb/u0/snk_video_eop
add wave -noupdate /gmm_fg_detector_tb/u0/snk_video_data
add wave -noupdate -divider SNK_MEMORY
add wave -noupdate /gmm_fg_detector_tb/u0/snk_mem_ready
add wave -noupdate /gmm_fg_detector_tb/u0/snk_mem_valid
add wave -noupdate /gmm_fg_detector_tb/u0/snk_mem_sop
add wave -noupdate /gmm_fg_detector_tb/u0/snk_mem_eop
add wave -noupdate /gmm_fg_detector_tb/u0/snk_mem_data
add wave -noupdate /gmm_fg_detector_tb/u0/snk_mem_empty
add wave -noupdate -divider WRITER_STATE
add wave -noupdate /gmm_fg_detector_tb/u0/writer_state
add wave -noupdate /gmm_fg_detector_tb/u0/writer_next
add wave -noupdate -divider OUTPUT
add wave -noupdate /gmm_fg_detector_tb/u0/out_control
add wave -noupdate /gmm_fg_detector_tb/u0/out_cmd
add wave -noupdate -expand /gmm_fg_detector_tb/u0/out_gmm
add wave -noupdate /gmm_fg_detector_tb/u0/out_video_data
add wave -noupdate /gmm_fg_detector_tb/u0/out_mem_data
add wave -noupdate -divider SRC_VIDEO
add wave -noupdate /gmm_fg_detector_tb/u0/src_video_ready
add wave -noupdate /gmm_fg_detector_tb/u0/src_video_valid
add wave -noupdate /gmm_fg_detector_tb/u0/src_video_sop
add wave -noupdate /gmm_fg_detector_tb/u0/src_video_eop
add wave -noupdate /gmm_fg_detector_tb/u0/src_video_data
add wave -noupdate -divider SRC_MEMORY
add wave -noupdate /gmm_fg_detector_tb/u0/src_mem_ready
add wave -noupdate /gmm_fg_detector_tb/u0/src_mem_valid
add wave -noupdate /gmm_fg_detector_tb/u0/src_mem_sop
add wave -noupdate /gmm_fg_detector_tb/u0/src_mem_eop
add wave -noupdate /gmm_fg_detector_tb/u0/src_mem_data
add wave -noupdate /gmm_fg_detector_tb/u0/src_mem_empty
add wave -noupdate -divider OTHER
add wave -noupdate /gmm_fg_detector_tb/u0/CSR
add wave -noupdate /gmm_fg_detector_tb/u0/gmm_start
add wave -noupdate /gmm_fg_detector_tb/u0/gmm_busy
add wave -noupdate /gmm_fg_detector_tb/u0/writer_is_video_sop
add wave -noupdate /gmm_fg_detector_tb/u0/writer_width_save
add wave -noupdate /gmm_fg_detector_tb/u0/writer_width_cnt
add wave -noupdate /gmm_fg_detector_tb/u0/writer_height_cnt
add wave -noupdate /gmm_fg_detector_tb/u0/is_mem_control_gen
add wave -noupdate /gmm_fg_detector_tb/u0/mem_h
add wave -noupdate /gmm_fg_detector_tb/u0/mem_w
add wave -noupdate /gmm_fg_detector_tb/u0/is_first_packet
add wave -noupdate /gmm_fg_detector_tb/u0/width
add wave -noupdate /gmm_fg_detector_tb/u0/height
add wave -noupdate /gmm_fg_detector_tb/u0/control_cnt
add wave -noupdate /gmm_fg_detector_tb/u0/gmm_data_set/gmm_data_set
add wave -noupdate /gmm_fg_detector_tb/u0/gmm_data_set/rgb_new
add wave -noupdate /gmm_fg_detector_tb/u0/gmm_data_set/mem
add wave -noupdate /gmm_fg_detector_tb/u0/gmm_data_set/is_first_packet
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {27935 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 347
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 1
configure wave -gridperiod 2
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {113747 ps} {232979 ps}
