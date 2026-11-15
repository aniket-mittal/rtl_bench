module mg_01532(input clk, input reset, input in, output p);
reg [8-1:0] r; 
  [MASKED] 
  assign p = r == 140; 
 endmodule