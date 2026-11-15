module mg_08909 (clk, rst, en, a, b, p);
parameter M = 6; 
  parameter N = 3; 
  input wire clk, rst, en; 
  input wire [M-1:0] a; 
  input wire [N-1:0] b; 
  output reg [M+N-1:0] p; 
  reg [M-1:0] a_reg; 
  reg [N-1:0] b_reg; 
  [MASKED] 
 endmodule