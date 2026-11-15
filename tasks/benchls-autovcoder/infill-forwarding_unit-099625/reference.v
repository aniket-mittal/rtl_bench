module autovcoder_099625 (
    regwrite_WB,
    wa_WB,
    ra1_EX,
    ra2_EX,
    forwardA,
    forwardB
);
  input regwrite_WB;
  input [4:0] wa_WB;
  input [4:0] ra1_EX;
  input [4:0] ra2_EX;
  output forwardA;
  output forwardB;

  // Internal wires
  wire n1;
  wire n2;
  wire n3;
  wire n4;
  wire n5;
  wire n6;
  wire n7;
  wire n8;
  wire n9;
  wire n10;
  wire n11;
  wire n12;
  wire n13;
  wire n14;

  XOR2_X1 U9 (
      .Z(n4),
      .B(ra2_EX[4]),
      .A(wa_WB[4])
  );
  XOR2_X1 U10 (
      .Z(n3),
      .B(ra2_EX[1]),
      .A(wa_WB[1])
  );
  XOR2_X1 U11 (
      .Z(n2),
      .B(ra2_EX[3]),
      .A(wa_WB[3])
  );
  NAND4_X1 U12 (
      .ZN(n1),
      .A4(n7),
      .A3(regwrite_WB),
      .A2(n6),
      .A1(n5)
  );
  XOR2_X1 U13 (
      .Z(n11),
      .B(ra1_EX[1]),
      .A(wa_WB[1])
  );
  XOR2_X1 U14 (
      .Z(n10),
      .B(ra1_EX[4]),
      .A(wa_WB[4])
  );
  XOR2_X1 U15 (
      .Z(n9),
      .B(ra1_EX[3]),
      .A(wa_WB[3])
  );
  NAND4_X1 U16 (
      .ZN(n8),
      .A4(n7),
      .A3(regwrite_WB),
      .A2(n13),
      .A1(n12)
  );
  NOR4_X1 U1 (
      .ZN(forwardB),
      .A4(n4),
      .A3(n3),
      .A2(n2),
      .A1(n1)
  );
  XNOR2_X1 U2 (
      .ZN(n6),
      .B (ra2_EX[0]),
      .A (wa_WB[0])
  );
  XNOR2_X1 U3 (
      .ZN(n5),
      .B (ra2_EX[2]),
      .A (wa_WB[2])
  );
  XNOR2_X1 U4 (
      .ZN(n13),
      .B (ra1_EX[0]),
      .A (wa_WB[0])
  );
  XNOR2_X1 U5 (
      .ZN(n12),
      .B (ra1_EX[2]),
      .A (wa_WB[2])
  );
  OR4_X1 U6 (
      .ZN(n7),
      .A4(n14),
      .A3(wa_WB[2]),
      .A2(wa_WB[4]),
      .A1(wa_WB[3])
  );
  OR2_X1 U7 (
      .ZN(n14),
      .A2(wa_WB[0]),
      .A1(wa_WB[1])
  );
  NOR4_X1 U8 (
      .ZN(forwardA),
      .A4(n11),
      .A3(n10),
      .A2(n9),
      .A1(n8)
  );
endmodule

