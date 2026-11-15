module mg_00204(value1, value2, shift_hex, value_out, EN);
input [31:0] value1, value2; 
  input [3:0] shift_hex; 
  output [31:0] value_out; 
  input EN; 
  wire or_unary = |value2[31:5]; 
  wire value2_shrink = value2[4:0]; 
  wire [4:0] shift_amt = (value2_shrink== 32'b0) ? 
  ( {1'b0, shift_hex} + 5'b1) : (value2_shrink + {1'b0, shift_hex}); 
 [MASKED] 
 endmodule