module mg_02314(dclk,rst,control);
input dclk; 
  input rst; 
  output [1:0] control; 
  reg [1:0] count; 
  [MASKED] 
  assign control = count; 
 endmodule