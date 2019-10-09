// Example instance of the top level module for: 
//     gmm_substract
// To include this component in your design, include: 
//     gmm_substract.qsys
// in your Quartus project and follow the template 
// below to instantiate the IP.  Alternatively, the IP core 
// can be generated from a Qsys system.

gmm_substract gmm_substract_inst (
  // Interface: clock (clock end)
  .clock    ( ), // 1-bit clk input
  // Interface: reset (reset end)
  .resetn   ( ), // 1-bit reset_n input
  // Interface: snk (avalon_streaming sink)
  .snk_data ( ), // 176-bit data input
  .snk_ready( ), // 1-bit ready output
  .snk_valid( ), // 1-bit valid input
  // Interface: src (avalon_streaming source)
  .src_data ( ), // 176-bit data output
  .src_ready( ), // 1-bit ready input
  .src_valid( ), // 1-bit valid output
  // Interface: d (conduit sink)
  .d        ( ), // 8-bit data input
  // Interface: bg_th (conduit sink)
  .bg_th    ( ), // 8-bit data input
  // Interface: in_alpha (conduit sink)
  .in_alpha ( ), // 10-bit data input
  // Interface: s (conduit sink)
  .s        ( )  // 8-bit data input
);
