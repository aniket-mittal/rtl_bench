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
  always @(posedge clk or posedge reset) begin 
  if (reset == 1'b1) begin 
  counter = 0; 
  counter1 = 0; 
  clk_2=0; 
  check = 0; 
  next_state <= 2'b00; 
  end 
  else begin 
  case (current_state) 
  IDLE: begin 
  if (PossibleStart==0) 
  next_state<=IDLE; 
  else begin 
  next_state<=POSSIBLESTART; 
  clk_2=0; 
  end 
  if (WriteChar==1) 
  next_state<=READ; 
  check=0; 
  counter=0; 
  if (counter1 == period1-1) begin 
  counter1 = 0; 
  clk_2 = 1; 
  end 
  else counter1 = counter1 +1'b1; 
  if (counter1 == halfPeriod1) clk_2 =0; 
  end 
  POSSIBLESTART: begin 
  if (WriteChar==1) begin 
  next_state<=READ; 
  clk_2=1; 
  counter = 0; 
  end 
  if (WriteChar==0 && check==1) 
  next_state<=IDLE; 
  if (WriteChar==0 && check==0) 
  next_state<=POSSIBLESTART; 
  if (counter == halfPeriod-1) begin 
  counter=0; 
  check=1; 
  clk_2=1; 
  end 
  else 
  counter = counter +1'b1; 
  if (counter1 == period1-1) begin 
  counter1 = 0; 
  clk_2 = 1; 
  end 
  else counter1 = counter1 +1'b1; 
  if (counter1 == halfPeriod1) clk_2 =0; 
  end 
  READ: begin 
  if (WriteChar==1) 
  next_state<=READ; 
  else begin 
  next_state<=PARITY; 
  clk_2 = 0; 
  end 
  check=0; 
  if (counter == period-1) begin 
  counter = 0; 
  clk_2 = 1; 
  end 
  else counter = counter +1'b1; 
  if (counter == halfPeriod) clk_2 =0; 
  end 
  PARITY: begin 
  if (clk_2==1) 
  next_state<= IDLE; 
  else 
  next_state<=PARITY; 
  if (counter == period-1) begin 
  counter = 0; 
  clk_2 = 1; 
  end 
  else counter = counter +1'b1; 
  if (counter == halfPeriod) clk_2 =0; 
  end 
  default: begin 
  next_state<=IDLE; 
  check=0; 
  clk_2=0; 
  end 
  endcase 
  end 
  end 
  always @(negedge clk or posedge reset) begin 
  if (reset == 1'b1) 
  current_state<=IDLE; 
  else 
  current_state<=next_state; 
  end 
 endmodule