module mg_00496(out,clk, in, reset);
input clk; 
  input in; 
  output out; 
  input reset; 
  reg out_reg; 
  [MASKED] 
  assign out = in ^ out_reg; 
 endmodule