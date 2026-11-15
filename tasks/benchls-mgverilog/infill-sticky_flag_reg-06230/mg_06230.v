module mg_06230(clk, rst, clk_ena, d);
input clk, rst, clk_ena; 
  output d; 
  reg tmp; 
  [MASKED] 
  assign d = tmp; 
 endmodule