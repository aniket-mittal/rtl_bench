module mg_02553(OA, OB, OC,a, b, c, clk, shift);
input [31:0] a, b, c; 
  output [31:0] OA, OB, OC; 
  input clk; 
  input [4:0] shift; 
  [MASKED] 
  assign OC = c + b; 
  assign OB = b; 
 endmodule