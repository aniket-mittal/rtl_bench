module mg_01615(input clk, input reset, input in, output p);
reg [13-1:0] r; 
  [MASKED] 
  assign p = r == 5000; 
 endmodule