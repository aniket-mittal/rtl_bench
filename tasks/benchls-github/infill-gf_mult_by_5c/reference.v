module gf_mult_by_5c (i,o);
input [7:0] i;
output [7:0] o;
wire [7:0] o;
  assign o[0] = i[2]^i[4]^i[5]^i[7];
  assign o[1] = i[3]^i[5]^i[6];
  assign o[2] = i[0]^i[2]^i[5]^i[6];
  assign o[3] = i[0]^i[1]^i[2]^i[3]^i[4]^i[5]^i[6];
  assign o[4] = i[0]^i[1]^i[3]^i[6];
  assign o[5] = i[1]^i[2]^i[4]^i[7];
  assign o[6] = i[0]^i[2]^i[3]^i[5];
  assign o[7] = i[1]^i[3]^i[4]^i[6];
endmodule