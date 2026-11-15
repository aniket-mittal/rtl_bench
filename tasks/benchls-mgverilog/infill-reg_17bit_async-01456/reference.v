module mg_01456 (q, d, clk, reset);
output [16:0] q; 
  input [16:0] d; 
  input clk, reset; 
  reg [16:0] q; 
  always @ (posedge clk or negedge reset) 
  if (reset == 0) 
  q <= 0; 
  else 
  q <= d; 
 endmodule