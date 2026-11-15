module mg_10350(input clk_i,input reset_n,output reg [7:0] LEDs);
reg [1:0] state; 
  reg [1:0] state_n; 
  parameter S0 = 2'b00; 
  parameter S1 = 2'b01; 
  parameter S2 = 2'b10; 
  parameter S3 = 2'b11; 
  always @ (posedge clk_i, negedge reset_n) 
  begin 
  if(!reset_n) 
  state = S0; 
  else 
  state = state_n; 
  end 
  [MASKED] 
  always @ (*) 
  begin 
  if(state == S0) 
  LEDs = 8'h88; 
  else if(state == S1) 
  LEDs = 8'h44; 
  else if(state == S2) 
  LEDs = 8'h22; 
  else 
  LEDs = 8'h11; 
  end 
 endmodule