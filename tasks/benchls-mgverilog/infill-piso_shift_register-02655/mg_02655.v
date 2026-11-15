module mg_02655(clk, rstn, load, shift, parallelin, lsbout);
input clk; 
  input rstn; 
  input load; 
  input shift; 
  input [7:0] parallelin; 
  output lsbout; 
  reg [7:0] shiftreg; 
  assign lsbout = shiftreg[0]; 
  [MASKED] 
 endmodule