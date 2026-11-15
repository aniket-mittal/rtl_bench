module mg_04801 (clk, n, start, fibn, done);
parameter w = 32; 
  input [w-1:0] n; 
  input clk, start; 
  output [w-1:0] fibn; 
  output done; 
  parameter s0 = 3'b000; 
  parameter s1 = 3'b001; 
  parameter s2 = 3'b010; 
  parameter s3 = 3'b011; 
  parameter s4 = 3'b100; 
  reg [2:0] state, nextstate; 
  reg [w-1:0] n_reg; 
  reg [31:0] b, h, d, f; 
  assign fibn = b; 
  assign done = (state == s0); 
  initial begin 
  state = s0; 
  nextstate = s0; 
  end 
  always @ (posedge clk) begin 
  state = nextstate; 
  end 
  [MASKED] 
 endmodule