module mg_03263(clk,clk_en,async_nrst_i,rst_o);
parameter active_state = 1'b0; 
 input clk; 
 input clk_en; 
 input async_nrst_i; 
 output reg rst_o = active_state; 
 reg rst_pre = active_state; 
 [MASKED] 
 endmodule