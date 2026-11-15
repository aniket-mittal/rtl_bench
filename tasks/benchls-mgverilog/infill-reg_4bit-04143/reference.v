module mg_04143 ( clk, iB, oB );
input clk ; 
  input [3:0] iB ; 
  output [3:0] oB ; 
  reg [3:0] r ; 
  assign oB = r ; 
  always @(posedge clk) r <= iB ; 
 endmodule