module autovcoder_057300 (
    i_c0,
    i_pk,
    i_gk,
    i_p_addn,
    o_s,
    o_carry
);
  input i_c0;
  input [15:0] i_pk;
  input [15:0] i_gk;
  input i_p_addn;
  output [15:0] o_s;
  output o_carry;

  // Internal wires
  wire FE_RN_4671_0;
  wire FE_OFN13011_bit_adj_out_15;
  wire FE_OFN9555_n4;
  wire FE_OFN6491_n4;
  wire FE_OFN5501_n4;
  wire FE_OFN2964_n4;
  wire n4;

  NAND2X1 FE_RC_22337_0 (
      .A(i_gk[11]),
      .B(i_pk[12]),
      .Y(FE_RN_4671_0)
  );
  OAI21X1 FE_RC_22336_0 (
      .A(i_gk[11]),
      .B(i_pk[12]),
      .C(FE_RN_4671_0),
      .Y(o_s[12])
  );
  XOR2X1 FE_RC_16438_0 (
      .A(i_gk[9]),
      .B(i_pk[10]),
      .Y(o_s[10])
  );
  XOR2X1 FE_RC_16039_0 (
      .A(FE_OFN2964_n4),
      .B(i_pk[11]),
      .Y(o_s[11])
  );
  INVX2 FE_OFC14230_bit_adj_out_15 (
      .A(i_pk[15]),
      .Y(FE_OFN13011_bit_adj_out_15)
  );
  INVX2 FE_OFC10000_n4 (
      .A(i_gk[14]),
      .Y(FE_OFN9555_n4)
  );
  INVX2 FE_OFC6780_n4 (
      .A(i_gk[13]),
      .Y(FE_OFN6491_n4)
  );
  INVX2 FE_OFC5779_n4 (
      .A(i_gk[8]),
      .Y(FE_OFN5501_n4)
  );
  INVX2 FE_OFC3179_n4 (
      .A(i_gk[10]),
      .Y(FE_OFN2964_n4)
  );
  XOR2X1 U2 (
      .A(i_pk[9]),
      .B(FE_OFN5501_n4),
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
      .A(FE_OFN13011_bit_adj_out_15),
      .B(FE_OFN9555_n4),
      .Y(o_s[15])
  );
  XOR2X1 U12 (
      .A(i_pk[14]),
      .B(FE_OFN6491_n4),
      .Y(o_s[14])
  );
  XOR2X1 U13 (
      .A(i_pk[13]),
      .B(i_gk[12]),
      .Y(o_s[13])
  );
endmodule

