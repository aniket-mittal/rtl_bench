module mg_06750(input clk, d, output reg [1:0] q);
[MASKED] 
 always @(negedge clk) q[1] <= q[0]; 
 endmodule