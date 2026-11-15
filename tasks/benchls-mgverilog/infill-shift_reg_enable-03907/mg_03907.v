module mg_03907(clk, en, in,out);
parameter integer LEN = 16; 
  input clk, en, in; 
  output out; 
  reg [LEN:1] store; 
  assign out = store & 1; 
  [MASKED] 
 endmodule