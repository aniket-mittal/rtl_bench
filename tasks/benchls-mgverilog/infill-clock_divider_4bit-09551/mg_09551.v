module mg_09551 (input clk_i,input reset_n_i,input clk_en,input [3:0] clk_div_i,output clk_o);
reg clk_y; 
  reg [3:0] clk_cnt_y; 
  [MASKED] 
  assign clk_o = (clk_div_i==0) ? clk_i : clk_y; 
 endmodule