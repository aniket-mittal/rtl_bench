module mg_01856(n1, n1_inv, clk);
input clk; 
  (* init = 32'd1 *) 
  output n1; 
  reg n1 = 32'd1; 
  output n1_inv; 
  always @(posedge clk) 
  n1 <= n1_inv; 
  assign n1_inv = ~n1; 
 endmodule