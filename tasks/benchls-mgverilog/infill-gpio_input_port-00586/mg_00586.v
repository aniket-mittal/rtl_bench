module mg_00586 (address,clk,in_port,reset_n,readdata);
output [ 31: 0] readdata; 
  input [ 1: 0] address; 
  input clk; 
  input [ 7: 0] in_port; 
  input reset_n; 
 wire clk_en; 
 wire [ 7: 0] data_in; 
 wire [ 7: 0] read_mux_out; 
 reg [ 31: 0] readdata; 
  assign clk_en = 1; 
  assign read_mux_out = {8 {(address == 0)}} & data_in; 
  [MASKED] 
  assign data_in = in_port; 
 endmodule