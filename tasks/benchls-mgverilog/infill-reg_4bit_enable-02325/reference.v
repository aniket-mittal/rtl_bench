module mg_02325(input [3:0] d, input en, output reg [3:0] q);
always @* 
  if (en) 
  q <= d; 
 endmodule