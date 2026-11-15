module mg_06428 (input clock, reset,input [1:0] op,input [15:0] writeData,output [15:0] data);
reg [15:0] stackPointer; 
  [MASKED] 
  assign data = stackPointer; 
 endmodule