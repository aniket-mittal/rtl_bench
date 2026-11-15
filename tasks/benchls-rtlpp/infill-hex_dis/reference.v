module hex_dis(hex, in);
  input [3:0] in;
  output [6:0] hex;

  assign hex[0] = ((~in[3] & ~in[2] & ~in[1] & in[0]) | (~in[3] & in[2] & ~in[1] & ~in[0]) | (in[3] & in[2] & ~in[1] & in[0]) | (in[3] & ~in[2] & in[1] & in[0]));
  assign hex[1] = ((in[3] & in[1] & in[0]) | (in[2] & in[1] & ~in[0]) | (in[3] & in[2] & ~in[0]) | (~in[3] & in[2] & ~in[1] & in[0]));
  assign hex[2] = ((~in[3] & ~in[2] & in[1] & ~in[0]) | (in[3] & in[2] & ~in[0]) | (in[3] & in[2] & in[1]));
  assign hex[3] = ((~in[2] & ~in[1] & in[0]) | (~in[3] & in[2] & ~in[1] & ~in[0]) | (in[2] & in[1] & in[0]) | (in[3] & ~in[2] & in[1] & ~in[0]));
  assign hex[4] = ((~in[3] & in[0]) | (~in[3] & in[2] & ~in[1]) | (~in[2] & ~in[1] & in[0]));
  assign hex[5] = ((~in[3] & ~in[2] & in[0]) | (~in[3] & in[1] & in[0]) | (~in[3] & ~in[2] & in[1]) | (in[3] & in[2] & ~in[1] & in[0]));
  assign hex[6] = ((~in[3] & ~in[2] & ~in[1]) | (~in[3] & in[2] & in[1] & in[0]) | (in[3] & in[2] & ~in[1] & ~in[0]));
endmodule