module mg_00925(input clk, input reset, input in, output p);
reg [2:0] r; 
  [MASKED] 
  assign p = r == 2 || r == 3 || r == 4 || r == 5; 
 endmodule