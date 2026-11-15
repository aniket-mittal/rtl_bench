module mg_07382(mux_in0, mux_in1, mux_sel, mux_out);
parameter MuxLen = 63; 
  output [MuxLen:0] mux_out; 
  input [MuxLen:0] mux_in0; 
  input [MuxLen:0] mux_in1; 
  input mux_sel; 
  reg [MuxLen:0] mux_out; 
  [MASKED] 
 endmodule