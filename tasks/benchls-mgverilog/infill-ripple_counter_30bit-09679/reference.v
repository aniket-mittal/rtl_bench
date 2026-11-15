module mg_09679(clk, count);
input clk; 
  output [29:0] count; 
  reg [14:0] count_a; 
  reg [14:0] count_b; 
  initial count_a = 15'b0; 
  initial count_b = 15'b0; 
 always @(negedge clk) 
  count_a <= count_a + 1'b1; 
 always @(negedge count_a[14]) 
  count_b <= count_b + 1'b1; 
 assign count = {count_b, count_a}; 
 endmodule