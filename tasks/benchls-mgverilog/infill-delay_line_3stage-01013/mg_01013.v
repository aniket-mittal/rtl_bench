module mg_01013 (clk, wen, din, dout);
parameter WIDTH = 4'b1000; 
  input clk; 
  input wen; 
  input[WIDTH - 1:0] din; 
  output[WIDTH - 1:0] dout; 
  reg[WIDTH - 1:0] dout; 
  reg[WIDTH-1:0]buff1; 
  reg[WIDTH-1:0]buff2; 
  [MASKED] 
 endmodule