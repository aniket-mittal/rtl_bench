module mg_08365 (input wire clk,input wire reset,output reg [30:0] pw_low,output reg [30:0] pw_high,output reg [31:0] pwm_per,input wire pwm);
reg [1:0] ps, ns; 
  parameter 
  init = 2'b00, 
  first = 2'b01, 
  low = 2'b10, 
  high = 2'b11; 
  reg pwm_prev; 
  reg [30:0] count_clk0, count_clk1; 
  initial begin 
  ps = init; 
  pwm_prev = 1'b1; 
  count_clk0 = 31'b0; 
  count_clk1 = 31'b0; 
  pw_high = 31'b0; 
  pw_low = 31'b0; 
  pwm_per = 32'b0; 
  end 
  always @ (*) begin 
  case (ps) 
  init: if (pwm_prev ^ pwm) ns = first; 
  else ns = init; 
  first: if (~pwm_prev & pwm) ns = high; 
  else if (pwm_prev & ~pwm) ns = low; 
  else ns = first; 
  low: if (pwm) ns = high; 
  else ns = low; 
  high: if (~pwm) ns = low; 
  else ns = high; 
  endcase 
  pwm_per = pw_low + pw_high; 
  end 
  [MASKED] 
  always @ (posedge clk) begin 
  if (reset) ps <= init; 
  else ps <= ns; 
  end 
 endmodule