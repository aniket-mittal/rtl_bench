module mg_01211 (clk, reset, sel, adr, data, pwm_out);
parameter REG_WIDTH = 32; 
  parameter ADR_FREQ = 2'b00; 
  parameter ADR_ON = 2'b01; 
  parameter ADR_COUNTER = 2'b10; 
  input clk; 
  input reset; 
  input sel; 
  input [1:0] adr; 
  input [REG_WIDTH-1:0] data; 
  output pwm_out; 
  reg [REG_WIDTH-1:0] cycle; 
  reg [REG_WIDTH-1:0] on_time; 
  reg [REG_WIDTH-1:0] counter; 
  assign pwm_out = (counter < on_time); 
  [MASKED] 
 endmodule