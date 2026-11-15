module mg_00371(input clk,input rst,input in,output rise_out,output fall_out);
reg in_reg; 
 [MASKED] 
 assign rise_out = ~in_reg & in; 
 assign fall_out = in_reg & ~in; 
 endmodule