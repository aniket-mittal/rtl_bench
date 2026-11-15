module mg_00025(clk,rst_n,pwm_angle);
input clk,rst_n; 
 output reg [15:0] pwm_angle; 
 reg [7:0] counter; 
 reg [3:0] state; 
 reg flag; 
 parameter S0=4'd0,S1=4'd1; 
 parameter STEP=20; 
 [MASKED] 
 endmodule