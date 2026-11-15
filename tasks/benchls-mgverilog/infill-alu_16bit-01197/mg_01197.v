module mg_01197 ( output [15:0] Y,output [15:0] flags,input [15:0] A,input [15:0] B,input [3:0] sel);
reg [15:0] outreg; 
  reg [15:0] flagreg; 
  reg carry; 
  reg overflow; 
  [MASKED] 
  assign Y = outreg; 
  assign flags = flagreg; 
 endmodule