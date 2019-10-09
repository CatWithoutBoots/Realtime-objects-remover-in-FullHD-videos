#**************************************************************
# This .sdc file is created by Terasic Tool.
# Users are recommended to modify this file to match users logic.
#**************************************************************

#**************************************************************
# Create Clock
#**************************************************************
create_clock -period "50.0 MHz" [get_ports FPGA_CLK1_50]
create_clock -period "50.0 MHz" [get_ports FPGA_CLK2_50]
create_clock -period "50.0 MHz" [get_ports FPGA_CLK3_50]


# for enhancing USB BlasterII to be reliable, 25MHz
create_clock -name {altera_reserved_tck} -period 40 {altera_reserved_tck}
set_input_delay -clock altera_reserved_tck -clock_fall 3 [get_ports altera_reserved_tdi]
set_input_delay -clock altera_reserved_tck -clock_fall 3 [get_ports altera_reserved_tms]
set_output_delay -clock altera_reserved_tck 3 [get_ports altera_reserved_tdo]



create_clock -period "100.0 MHz" -name MIPI_PIXEL_CLK [get_ports MIPI_PIXEL_CLK]
create_clock -period "100.0 MHz" -name MIPI_PIXEL_CLK_ext

# HDMI_TX_CLK
create_generated_clock -source [get_pins { u0|pll_1|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk }] \
                      -name HDMI_TX_CLK_ext [get_ports {HDMI_TX_CLK}] -invert

#**************************************************************
# Create Generated Clock
#**************************************************************
derive_pll_clocks



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************
derive_clock_uncertainty



#**************************************************************
# Set Input Delay
#**************************************************************
# tpd  min 1ns ,max 6ns
# suppose 0.1 skew
#set_input_delay -max 6.1 -clock  MIPI_PIXEL_CLK_ext  [get_ports {MIPI_PIXEL_VS MIPI_PIXEL_HS MIPI_PIXEL_D[*]}]
#set_input_delay -min 0.9 -clock  MIPI_PIXEL_CLK_ext  [get_ports {MIPI_PIXEL_VS MIPI_PIXEL_HS MIPI_PIXEL_D[*]}]


#**************************************************************
# Set Output Delay
#**************************************************************
# tsu 1ns , th 0.7ns
# tsu(tVSU in datasheet)   th(tVHLD in datasheet)
# suppose 0.1 skew
set_output_delay -max  1.1 -clock  HDMI_TX_CLK_ext  [get_ports {HDMI_TX_DE HDMI_TX_VS HDMI_TX_HS HDMI_TX_D[*]}]
set_output_delay -min -0.8 -clock  HDMI_TX_CLK_ext  [get_ports {HDMI_TX_DE HDMI_TX_VS HDMI_TX_HS HDMI_TX_D[*]}]



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************
set_false_path -from {soc_system:u0|altera_reset_controller:rst_controller|altera_reset_synchronizer:alt_rst_sync_uq1|altera_reset_synchronizer_int_chain_out} -to *
set_false_path -from [get_clocks {FPGA_CLK3_50}] -to [get_clocks {u0|pll_1|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]

#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************



#**************************************************************
# Set Load
#**************************************************************



