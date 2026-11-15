module mg_10546 (input wire clk,output wire [1:0] leds);
wire ena = 1'b1; 
 reg reg0; 
 always @(posedge clk) 
  reg0 <= 1'b1; 
 reg reg1; 
 always @(posedge clk) 
  reg1 <= 1'b1; 
 assign leds[0] = (ena) ? reg0 : 1'bz; 
 assign leds[1] = (ena) ? reg1 : 1'bz; 
 endmodule