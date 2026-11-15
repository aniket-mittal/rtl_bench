module mg_00972(digit, real_segments);
input [3:0] digit; 
  output [7:0] real_segments; 
  reg [7:0] segments; 
  assign real_segments = ~segments; 
  [MASKED] 
 endmodule