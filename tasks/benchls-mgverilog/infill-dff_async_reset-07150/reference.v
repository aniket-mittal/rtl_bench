module mg_07150 (input wire d,input wire clk,input wire reset_b,output reg q);
always@(posedge clk or negedge reset_b) 
  if (~reset_b) q <= 1'b0; 
  else q <= d; 
 endmodule