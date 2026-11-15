module mg_08891(in, clk, rst, out);
input wire in, clk, rst; 
  output wire[3: 0] out; 
  reg[3: 0] _out; 
  initial 
  _out = 4'b0000; 
  [MASKED] 
  assign out = _out; 
 endmodule