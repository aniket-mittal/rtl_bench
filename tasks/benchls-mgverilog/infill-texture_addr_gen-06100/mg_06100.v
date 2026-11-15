module mg_06100 (u, v, start, addr, texelselect, factor, enable, clk);
input[6:0] u; 
  input[6:0] v; 
  input[17:0] start; 
  output[17:0] addr; 
  reg[17:0] addr; 
  output[1:0] texelselect; 
  wire[1:0] texelselect; 
  input[2:0] factor; 
  input enable; 
  input clk; 
  reg[6:0] ul; 
  reg[6:0] vl; 
  assign texelselect = ul[1:0] ; 
  [MASKED] 
  endmodule