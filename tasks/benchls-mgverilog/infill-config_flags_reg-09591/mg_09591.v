module mg_09591(clock, wrFlags, config_data,finish_now,flags_reg);
input clock; 
 input wrFlags; 
 input [31:0] config_data; 
 input finish_now; 
 output [31:0] flags_reg; 
 reg [31:0] flags_reg, next_flags_reg; 
 initial flags_reg = 0; 
 always @(posedge clock) 
 begin 
  flags_reg = next_flags_reg; 
 end 
 [MASKED] 
 endmodule