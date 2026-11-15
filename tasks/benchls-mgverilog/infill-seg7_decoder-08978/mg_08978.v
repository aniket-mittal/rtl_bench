module mg_08978(input clk,input rst,input [3:0] BCD,output reg[7:0] DISPLAY);
initial begin 
  DISPLAY = 8'b11111111; 
  #10 DISPLAY = 8'b00000000; 
 end 
  [MASKED] 
 endmodule