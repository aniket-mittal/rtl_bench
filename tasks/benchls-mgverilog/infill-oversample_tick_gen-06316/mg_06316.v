module mg_06316(input clk,input tick_8x,input rst,output go);
parameter RESET_TYPE = 0; 
  reg [2:0] clk_div = 0; 
  [MASKED] 
  assign go = !rst & tick_8x & clk_div == 3'b111; 
 endmodule