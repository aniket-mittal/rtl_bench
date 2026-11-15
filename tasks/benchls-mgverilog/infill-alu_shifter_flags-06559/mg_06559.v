module mg_06559(inputA, Bse,control,outputBS,N, Zero, C);
input [31:0] inputA, Bse; 
  input [3:0] control; 
  output reg N, Zero, C; 
  output reg [31:0] outputBS; 
  reg [31:0] aux1, aux3; 
  reg aux2; 
  wire zer; 
  assign zer = (outputBS == 0); 
  [MASKED] 
 endmodule