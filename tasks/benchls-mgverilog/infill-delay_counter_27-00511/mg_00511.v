module mg_00511(input clk, input reset, input in, output p);
reg [5-1:0] r; 
  [MASKED] 
  assign p = r == 27; 
 endmodule