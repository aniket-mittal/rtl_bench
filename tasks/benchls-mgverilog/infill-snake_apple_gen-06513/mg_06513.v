module mg_06513(input clk,input rst,input signal,output reg[7:0] apple_x,output reg[7:0] apple_y);
reg [31:0]clk_cnt; 
  reg [10:0]random_num; 
  always@(posedge clk) 
  random_num <= random_num + 999; 
  [MASKED] 
  endmodule