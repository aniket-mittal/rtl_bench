module mg_06219 (array_out, clock, reset);
output [15:0] array_out; 
  input clock, reset; 
  reg [3:0] readptr; 
  reg [15:0] body [15:0]; 
  wire [15:0] array_out; 
  assign array_out = body[readptr]; 
  [MASKED] 
 endmodule