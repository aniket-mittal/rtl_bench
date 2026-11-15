module mg_04793(input [11:0] imagPart,input [11:0] realPart,output reg [11:0] minimum);
always @ * begin 
  if(imagPart > realPart) 
  minimum = realPart; 
  else 
  minimum = imagPart; 
  end 
 endmodule