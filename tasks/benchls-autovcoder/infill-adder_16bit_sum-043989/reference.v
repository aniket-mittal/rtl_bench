module autovcoder_043989 (
    i_c0,
    i_pk,
    i_gk,
    i_p_addn,
    o_s,
    o_carry
);
  input [15:0] i_pk;
  input [15:0] i_gk;
  output [15:0] o_s;
  input i_c0, i_p_addn;
  output o_carry;
  wire n4;

  XOR2X1 U2 (
      .A(i_pk[9]),
      .B(i_gk[8]),
      .Y(o_s[9])
  );
  XOR2X1 U3 (
      .A(i_pk[8]),
      .B(i_gk[7]),
      .Y(o_s[8])
  );
  XOR2X1 U4 (
      .A(i_pk[7]),
      .B(i_gk[6]),
      .Y(o_s[7])
  );
  XOR2X1 U5 (
      .A(i_pk[6]),
      .B(i_gk[5]),
      .Y(o_s[6])
  );
  XOR2X1 U6 (
      .A(i_pk[5]),
      .B(i_gk[4]),
      .Y(o_s[5])
  );
  XOR2X1 U7 (
      .A(i_pk[4]),
      .B(i_gk[3]),
      .Y(o_s[4])
  );
  XOR2X1 U8 (
      .A(i_pk[3]),
      .B(i_gk[2]),
      .Y(o_s[3])
  );
  XOR2X1 U9 (
      .A(i_pk[2]),
      .B(i_gk[1]),
      .Y(o_s[2])
  );
  XOR2X1 U10 (
      .A(i_pk[1]),
      .B(i_gk[0]),
      .Y(o_s[1])
  );
  XOR2X1 U11 (
      .A(i_pk[15]),
      .B(i_gk[14]),
      .Y(o_s[15])
  );
  XOR2X1 U12 (
      .A(i_pk[14]),
      .B(i_gk[13]),
      .Y(o_s[14])
  );
  XOR2X1 U13 (
      .A(i_pk[13]),
      .B(i_gk[12]),
      .Y(o_s[13])
  );
  XOR2X1 U14 (
      .A(i_pk[12]),
      .B(i_gk[11]),
      .Y(o_s[12])
  );
  XOR2X1 U15 (
      .A(i_pk[11]),
      .B(i_gk[10]),
      .Y(o_s[11])
  );
  XOR2X1 U16 (
      .A(i_pk[10]),
      .B(i_gk[9]),
      .Y(o_s[10])
  );
  XOR2X1 U17 (
      .A(i_pk[0]),
      .B(i_c0),
      .Y(o_s[0])
  );
  AOI21X1 U18 (
      .A(i_p_addn),
      .B(i_c0),
      .C(i_gk[15]),
      .Y(n4)
  );
  INVX1 U1 (
      .A(n4),
      .Y(o_carry)
  );
endmodule

