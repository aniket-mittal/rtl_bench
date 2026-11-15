module mg_09108 (cos_z0,sin_z0,done,z0,start,clock,reset);
output signed [19:0] cos_z0; 
 reg signed [19:0] cos_z0; 
 output signed [19:0] sin_z0; 
 reg signed [19:0] sin_z0; 
 output done; 
 reg done; 
 input signed [19:0] z0; 
 input start; 
 input clock; 
 input reset; 
 (* gentb_constant = 1'b0 *) 
 wire reset; 
 [MASKED] 
 endmodule