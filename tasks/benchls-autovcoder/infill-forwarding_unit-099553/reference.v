module autovcoder_099553 (
    regwrite_WB,
    wa_WB,
    ra1_EX,
    ra2_EX,
    forwardA,
    forwardB
);
  input [4:0] wa_WB;
  input [4:0] ra1_EX;
  input [4:0] ra2_EX;
  input regwrite_WB;
  output forwardA, forwardB;
  wire n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;

  XOR2_X1 U9 (
      .A(wa_WB[4]),
      .B(ra2_EX[4]),
      .Z(n4)
  );
  XOR2_X1 U10 (
      .A(wa_WB[1]),
      .B(ra2_EX[1]),
      .Z(n3)
  );
  XOR2_X1 U11 (
      .A(wa_WB[3]),
      .B(ra2_EX[3]),
      .Z(n2)
  );
  NAND4_X1 U12 (
      .A1(n5),
      .A2(n6),
      .A3(regwrite_WB),
      .A4(n7),
      .ZN(n1)
  );
  XOR2_X1 U13 (
      .A(wa_WB[1]),
      .B(ra1_EX[1]),
      .Z(n11)
  );
  XOR2_X1 U14 (
      .A(wa_WB[4]),
      .B(ra1_EX[4]),
      .Z(n10)
  );
  XOR2_X1 U15 (
      .A(wa_WB[3]),
      .B(ra1_EX[3]),
      .Z(n9)
  );
  NAND4_X1 U16 (
      .A1(n12),
      .A2(n13),
      .A3(regwrite_WB),
      .A4(n7),
      .ZN(n8)
  );
  NOR4_X1 U1 (
      .A1(n1),
      .A2(n2),
      .A3(n3),
      .A4(n4),
      .ZN(forwardB)
  );
  XNOR2_X1 U2 (
      .A (wa_WB[0]),
      .B (ra2_EX[0]),
      .ZN(n6)
  );
  XNOR2_X1 U3 (
      .A (wa_WB[2]),
      .B (ra2_EX[2]),
      .ZN(n5)
  );
  XNOR2_X1 U4 (
      .A (wa_WB[0]),
      .B (ra1_EX[0]),
      .ZN(n13)
  );
  XNOR2_X1 U5 (
      .A (wa_WB[2]),
      .B (ra1_EX[2]),
      .ZN(n12)
  );
  OR4_X1 U6 (
      .A1(wa_WB[3]),
      .A2(wa_WB[4]),
      .A3(wa_WB[2]),
      .A4(n14),
      .ZN(n7)
  );
  OR2_X1 U7 (
      .A1(wa_WB[1]),
      .A2(wa_WB[0]),
      .ZN(n14)
  );
  NOR4_X1 U8 (
      .A1(n8),
      .A2(n9),
      .A3(n10),
      .A4(n11),
      .ZN(forwardA)
  );
endmodule

