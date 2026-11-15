module mg_07897(input clk,rst,input[1:0] stackCntrl, input[11:0] pushValue, output[11:0] popValue);
reg[2:0] stackPntr; 
  reg[11:0] data[0:7]; 
  [MASKED] 
  assign popValue = data[stackPntr]; 
 endmodule