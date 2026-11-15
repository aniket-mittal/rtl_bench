module mg_06553(clk, reset, in, out);
input clk, reset, in; 
  output out; 
  reg reg1, reg2; 
  [MASKED] 
  assign out = {reg2,reg1}==2'b01 ? 1 : 0; 
 endmodule