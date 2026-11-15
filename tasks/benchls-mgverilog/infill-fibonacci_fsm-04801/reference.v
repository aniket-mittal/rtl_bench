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
  always @ (posedge clk) begin 
  case (state) 
  s0: begin 
  if (start) begin 
  n_reg = n; 
  b = 0; 
  h = 0; 
  d = 1; 
  f = 1; 
  nextstate = s1; 
  end else begin 
  nextstate = s0; 
  end 
  end 
  s1: begin 
  if (n_reg > 0) begin 
  nextstate = s2; 
  end else begin 
  nextstate = s0; 
  end 
  end 
  s2: begin 
  if (n_reg[0] == 1'b1) begin 
  nextstate = s3; 
  end else begin 
  nextstate = s4; 
  end 
  end 
  s3: begin 
  b <= (b * f) + (d * f) + (b * h); 
  d <= (b * f) + (d * h); 
  nextstate = s4; 
  end 
  s4: begin 
  f <= (f * f) + (2 * f * h); 
  h <= (f * f) + (h * h); 
  n_reg <= n_reg >> 1; 
  nextstate = s1; 
  end 
  default: begin 
  ; 
  ; 
  end 
  endcase 
  end 
 endmodule