module gf_mult_by_f5 (i,o);
input [7:0] i;
output [7:0] o;
wire [7:0] o;
  assign o[0] = i[0]^i[1]^i[2]^i[3]^i[4]^i[5]^i[6]^i[7];
  assign o[1] = i[1]^i[2]^i[3]^i[4]^i[5]^i[6]^i[7];
  assign o[2] = i[0]^i[1];
  assign o[3] = i[3]^i[4]^i[5]^i[6]^i[7];
  assign o[4] = i[0]^i[1]^i[2]^i[3];
  assign o[5] = i[0]^i[1]^i[2]^i[3]^i[4];
  assign o[6] = i[0]^i[1]^i[2]^i[3]^i[4]^i[5];
  assign o[7] = i[0]^i[1]^i[2]^i[3]^i[4]^i[5]^i[6];
endmodule