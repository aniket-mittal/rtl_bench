module mg_00551(clk, en, ar, dig1, dig2, dig3);
input clk, ar, en; 
  output reg [3:0] dig1, dig2, dig3; 
  wire dig1_carry, dig2_carry, dig3_carry; 
  assign dig1_carry = (dig1 == 4'd9); 
  assign dig2_carry = dig1_carry&(dig2 == 4'd9); 
  assign dig3_carry = dig2_carry&(dig3 == 4'd9); 
  [MASKED] 
  endmodule