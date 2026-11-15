module mg_01406( key_code, clk, slow_rate );
input[4:0] key_code; 
  input clk; 
  output [12:0] slow_rate; 
  reg [12:0] slow; 
  [MASKED] 
  assign slow_rate = slow; 
 endmodule