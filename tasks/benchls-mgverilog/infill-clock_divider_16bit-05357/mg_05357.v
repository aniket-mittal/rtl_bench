module mg_05357(input rst,input clk_i,input [15:0] div,output clk_o);
reg r_clk_o = 1'b0; 
  reg [15:0] count = 16'h0; 
  [MASKED] 
  assign clk_o = r_clk_o; 
 endmodule