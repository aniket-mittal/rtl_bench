module rtlpp_06877(
  input         clk, reset,
  input  [7:0] n_in,
  input  [5:0] d_in,
  output reg [5:0] r_out,
  output reg [7:0] q_out);

  parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11; 

  reg [3:0] count;
  reg [1:0] s;          
  reg [13:0] d;        
  reg signed [13:0] r; 
  reg [7:0] q;

  [MASKED]

endmodule