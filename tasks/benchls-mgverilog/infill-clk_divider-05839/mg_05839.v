module mg_05839(input clk_i,output clk_o);
parameter div = 2; 
  reg r_clk_o; 
  reg [31:0] count; 
  initial begin 
  r_clk_o = 0; 
  count = 0; 
  end 
  [MASKED] 
  assign clk_o = r_clk_o; 
 endmodule