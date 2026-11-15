module mg_06449(input clk,input rst,input in,output one_shot_out);
reg in_reg; 
 [MASKED] 
 assign one_shot_out = ~in_reg & in; 
 endmodule