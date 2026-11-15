module mg_02793 (input clk,output out);
reg [1:0] cnt = 0; 
  wire clk_int; 
  assign clk_int = clk; 
  [MASKED] 
  assign out = cnt[0]; 
 endmodule