module mg_09257(clk, ar, sr, q);
input clk, ar; 
  output q; 
  output reg [7:0] sr; 
  wire polynomial; 
  assign polynomial = sr[7]^sr[5]^sr[4]^sr[3]; 
  assign q = sr[7]; 
  [MASKED] 
 endmodule