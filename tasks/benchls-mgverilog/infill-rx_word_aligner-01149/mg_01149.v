module mg_01149 (rx_clk,rx_sof,rx_eof,rx_ferr,rx_fdata,rx_err,rx_data);
input rx_clk; 
  input [ 3:0] rx_sof; 
  input [ 3:0] rx_eof; 
  input [ 3:0] rx_ferr; 
  input [31:0] rx_fdata; 
  output rx_err; 
  output [31:0] rx_data; 
  reg [ 7:0] rx_fdata_d = 'd0; 
  reg rx_err = 'd0; 
  reg [31:0] rx_data = 'd0; 
  wire [ 3:0] rx_eof_s; 
  wire rx_err_s; 
  assign rx_eof_s = ~rx_eof; 
  assign rx_err_s = ((rx_sof == rx_eof_s) && (rx_ferr == 4'd0)) ? 1'b0 : 1'b1; 
  [MASKED] 
 endmodule