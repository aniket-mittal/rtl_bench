module mg_03263(clk,clk_en,async_nrst_i,rst_o);
parameter active_state = 1'b0; 
 input clk; 
 input clk_en; 
 input async_nrst_i; 
 output reg rst_o = active_state; 
 reg rst_pre = active_state; 
 always @(posedge clk or negedge async_nrst_i) begin 
  if (!async_nrst_i) begin 
  rst_o <= active_state; 
  rst_pre <= active_state; 
  end else if (clk_en) begin 
  rst_o <= rst_pre; 
  rst_pre <= ~active_state; 
  end 
 end 
 endmodule