module mg_01814(input [31:0] a, input [31:0] b, input reset, input clk, output reg [31:0] gcd, output reg isDone);
reg [31:0] nextInputA; 
  reg [31:0] nextInputB; 
  reg [31:0] inputA; 
  reg [31:0] inputB; 
  reg [31:0] nextExponent; 
  reg [31:0] exponent; 
  reg [31:0] nextGcd; 
  reg nextIsDone; 
  initial begin 
  nextInputA = 0; 
  nextInputB = 0; 
  inputA = 0; 
  inputB = 0; 
  nextExponent = 0; 
  exponent = 0; 
  nextIsDone = 0; 
  isDone = 0; 
  nextGcd = 0; 
  gcd = 0; 
  end 
  always @(posedge clk) begin 
  inputA <= nextInputA; 
  inputB <= nextInputB; 
  exponent <= nextExponent; 
  isDone <= nextIsDone; 
  gcd <= nextGcd; 
  end 
  [MASKED] 
 endmodule