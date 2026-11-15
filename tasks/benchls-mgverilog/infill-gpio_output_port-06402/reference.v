module mg_06402 (address,chipselect,clk,reset_n,write_n,writedata,out_port,readdata);
output [ 7: 0] out_port; 
  output [ 31: 0] readdata; 
  input [ 2: 0] address; 
  input chipselect; 
  input clk; 
  input reset_n; 
  input write_n; 
  input [ 31: 0] writedata; 
  wire clk_en; 
  reg [ 7: 0] data_out; 
  wire [ 7: 0] out_port; 
  wire [ 7: 0] read_mux_out; 
  wire [ 31: 0] readdata; 
  wire wr_strobe; 
  assign clk_en = 1; 
  assign read_mux_out = {8 {(address == 0)}} & data_out; 
  assign wr_strobe = chipselect && ~write_n; 
  always @(posedge clk or negedge reset_n) 
  begin 
  if (reset_n == 0) 
  data_out <= 0; 
  else if (clk_en) 
  if (wr_strobe) 
  data_out <= (address == 5)? data_out & ~writedata[7 : 0]: (address == 4)? data_out | writedata[7 : 0]: (address == 0)? writedata[7 : 0]: data_out; 
  end 
  assign readdata = {32'b0 | read_mux_out}; 
  assign out_port = data_out; 
 endmodule