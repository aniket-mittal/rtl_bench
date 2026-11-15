module mg_06480(clk, ce, a, b, p);
input clk; 
 input ce; 
 input signed [32 - 1 : 0] a; 
 input signed [32 - 1 : 0] b; 
 output[32 - 1 : 0] p; 
 reg signed [32 - 1 : 0] p; 
 wire signed [32 - 1 : 0] tmp_product; 
 [MASKED] 
 always @ (posedge clk) begin 
  if (ce) begin 
  p <= tmp_product; 
  end 
 end 
 endmodule