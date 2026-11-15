module mg_00823(input clk,input [9:0] xpos,input [9:0] ypos,input [1:0] button,output [4:0] LED);
reg xPosLED[1:0]; 
  reg yPosLED[1:0]; 
  [MASKED] 
  assign LED[0] = button[0]|button[1]; 
  assign LED[1] = xPosLED[0]; 
  assign LED[3] = xPosLED[1]; 
  assign LED[4] = yPosLED[0]; 
  assign LED[2] = yPosLED[1]; 
 endmodule