module mg_01164 (clk, rst, x, sync_x);
input clk, rst, x; 
  output sync_x; 
  reg f1, f2; 
  assign sync_x = f2; 
  [MASKED] 
 endmodule