module autovcoder_099481 (
    instr,
    imm_out
);
  input [31:0] instr;
  output [31:0] imm_out;
  wire   n24, n25, n26, n27, n28, n29, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n47;

  NAND3_X1 U50 (
      .A1(instr[12]),
      .A2(n43),
      .A3(instr[14]),
      .ZN(n29)
  );
  NAND2_X1 U2 (
      .A1(n27),
      .A2(n28),
      .ZN(n25)
  );
  NAND2_X1 U3 (
      .A1(n45),
      .A2(n29),
      .ZN(n24)
  );
  INV_X1 U4 (
      .A (n25),
      .ZN(n45)
  );
  OAI22_X1 U5 (
      .A1(n16),
      .A2(n43),
      .B1(n25),
      .B2(n35),
      .ZN(imm_out[1])
  );
  OAI22_X1 U6 (
      .A1(n14),
      .A2(n36),
      .B1(n24),
      .B2(n20),
      .ZN(imm_out[8])
  );
  OAI22_X1 U7 (
      .A1(n15),
      .A2(n35),
      .B1(n24),
      .B2(n19),
      .ZN(imm_out[9])
  );
  OAI22_X1 U8 (
      .A1(n14),
      .A2(n34),
      .B1(n24),
      .B2(n18),
      .ZN(imm_out[10])
  );
  INV_X1 U9 (
      .A (n26),
      .ZN(imm_out[21])
  );
  OAI21_X1 U10 (
      .B1(n16),
      .B2(n33),
      .A (n26),
      .ZN(imm_out[11])
  );
  OAI21_X1 U11 (
      .B1(n14),
      .B2(n32),
      .A (n26),
      .ZN(imm_out[12])
  );
  OAI21_X1 U12 (
      .B1(n14),
      .B2(n31),
      .A (n26),
      .ZN(imm_out[13])
  );
  OAI21_X1 U13 (
      .B1(n15),
      .B2(n22),
      .A (n26),
      .ZN(imm_out[14])
  );
  OAI21_X1 U14 (
      .B1(n16),
      .B2(n21),
      .A (n26),
      .ZN(imm_out[15])
  );
  OAI21_X1 U15 (
      .B1(n15),
      .B2(n20),
      .A (n26),
      .ZN(imm_out[16])
  );
  OAI21_X1 U16 (
      .B1(n19),
      .B2(n16),
      .A (n26),
      .ZN(imm_out[17])
  );
  OAI21_X1 U17 (
      .B1(n14),
      .B2(n18),
      .A (n26),
      .ZN(imm_out[18])
  );
  NAND4_X1 U18 (
      .A1(instr[31]),
      .A2(n27),
      .A3(n28),
      .A4(n29),
      .ZN(n26)
  );
  NOR2_X1 U19 (
      .A1(instr[2]),
      .A2(instr[5]),
      .ZN(n27)
  );
  OAI22_X1 U20 (
      .A1(n44),
      .A2(n14),
      .B1(n25),
      .B2(n36),
      .ZN(imm_out[0])
  );
  INV_X1 U21 (
      .A (instr[12]),
      .ZN(n44)
  );
  OAI22_X1 U22 (
      .A1(n42),
      .A2(n15),
      .B1(n25),
      .B2(n34),
      .ZN(imm_out[2])
  );
  INV_X1 U23 (
      .A (instr[14]),
      .ZN(n42)
  );
  OAI22_X1 U24 (
      .A1(n14),
      .A2(n41),
      .B1(n25),
      .B2(n33),
      .ZN(imm_out[3])
  );
  INV_X1 U25 (
      .A (instr[15]),
      .ZN(n41)
  );
  OAI22_X1 U26 (
      .A1(n15),
      .A2(n40),
      .B1(n25),
      .B2(n32),
      .ZN(imm_out[4])
  );
  INV_X1 U27 (
      .A (instr[16]),
      .ZN(n40)
  );
  OAI22_X1 U28 (
      .A1(n15),
      .A2(n39),
      .B1(n25),
      .B2(n31),
      .ZN(imm_out[5])
  );
  INV_X1 U29 (
      .A (instr[17]),
      .ZN(n39)
  );
  OAI22_X1 U30 (
      .A1(n16),
      .A2(n38),
      .B1(n24),
      .B2(n22),
      .ZN(imm_out[6])
  );
  INV_X1 U31 (
      .A (instr[18]),
      .ZN(n38)
  );
  OAI22_X1 U32 (
      .A1(n16),
      .A2(n37),
      .B1(n24),
      .B2(n21),
      .ZN(imm_out[7])
  );
  INV_X1 U33 (
      .A (instr[19]),
      .ZN(n37)
  );
  OAI21_X1 U39 (
      .B1(n15),
      .B2(n17),
      .A (n26),
      .ZN(imm_out[19])
  );
  INV_X1 U40 (
      .A (instr[31]),
      .ZN(n17)
  );
  INV_X1 U41 (
      .A (instr[13]),
      .ZN(n43)
  );
  INV_X1 U42 (
      .A (instr[21]),
      .ZN(n35)
  );
  INV_X1 U43 (
      .A (instr[22]),
      .ZN(n34)
  );
  INV_X1 U44 (
      .A (instr[23]),
      .ZN(n33)
  );
  INV_X1 U45 (
      .A (instr[24]),
      .ZN(n32)
  );
  INV_X1 U46 (
      .A (instr[20]),
      .ZN(n36)
  );
  INV_X1 U47 (
      .A (instr[30]),
      .ZN(n18)
  );
  INV_X1 U48 (
      .A (instr[25]),
      .ZN(n31)
  );
  INV_X1 U49 (
      .A (instr[26]),
      .ZN(n22)
  );
  INV_X1 U52 (
      .A (instr[27]),
      .ZN(n21)
  );
  INV_X1 U53 (
      .A (instr[28]),
      .ZN(n20)
  );
  INV_X1 U54 (
      .A (instr[29]),
      .ZN(n19)
  );
  INV_X1 U55 (
      .A (n26),
      .ZN(imm_out[22])
  );
  INV_X1 U56 (
      .A (n26),
      .ZN(imm_out[23])
  );
  INV_X1 U57 (
      .A (n26),
      .ZN(imm_out[24])
  );
  INV_X1 U58 (
      .A (n26),
      .ZN(imm_out[25])
  );
  INV_X1 U59 (
      .A (n26),
      .ZN(imm_out[26])
  );
  INV_X1 U60 (
      .A (n26),
      .ZN(imm_out[27])
  );
  INV_X1 U61 (
      .A (n26),
      .ZN(imm_out[28])
  );
  INV_X1 U62 (
      .A (n26),
      .ZN(imm_out[29])
  );
  INV_X1 U63 (
      .A (n26),
      .ZN(imm_out[30])
  );
  INV_X1 U64 (
      .A (n26),
      .ZN(imm_out[31])
  );
  INV_X1 U65 (
      .A (n26),
      .ZN(imm_out[20])
  );
  NAND3_X1 U34 (
      .A1(n28),
      .A2(instr[5]),
      .A3(instr[2]),
      .ZN(n15)
  );
  NAND3_X1 U35 (
      .A1(n28),
      .A2(instr[5]),
      .A3(instr[2]),
      .ZN(n14)
  );
  NAND3_X1 U36 (
      .A1(n28),
      .A2(instr[5]),
      .A3(instr[2]),
      .ZN(n16)
  );
  NOR3_X1 U37 (
      .A1(instr[6]),
      .A2(instr[3]),
      .A3(n47),
      .ZN(n28)
  );
  NAND3_X1 U38 (
      .A1(instr[0]),
      .A2(instr[1]),
      .A3(instr[4]),
      .ZN(n47)
  );
endmodule

