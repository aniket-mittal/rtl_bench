module mg_10041 (reset, clk, clk_2, check, PossibleStart, WriteChar);
input clk; 
  input PossibleStart; 
  input WriteChar; 
  input reset; 
  output reg clk_2; 
  output reg check; 
  parameter period = 10416; 
  parameter n =14; 
  parameter halfPeriod = period/2; 
  reg [n:0] counter; 
  parameter period1 = 2; 
  parameter n1 =1; 
  parameter halfPeriod1 = period1/2; 
  reg [n1:0] counter1; 
  reg [1:0] current_state; 
  reg [1:0] next_state; 
  parameter IDLE = 2'b00; 
  parameter POSSIBLESTART = 2'b01; 
  parameter READ = 2'b10; 
  parameter PARITY = 2'b11; 
  [MASKED] 
  always @(negedge clk or posedge reset) begin 
  if (reset == 1'b1) 
  current_state<=IDLE; 
  else 
  current_state<=next_state; 
  end 
 endmodule