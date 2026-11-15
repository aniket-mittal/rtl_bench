module autovcoder_099592 (
    in1,
    in0,
    sel,
    ou1
);
  input [6:0] in1;
  input [6:0] in0;
  input sel;
  output [6:0] ou1;

  // Internal wires
  wire n9;
  wire n10;
  wire n11;
  wire n12;
  wire n13;
  wire n14;
  wire n15;
  wire n1;

  INV_X1 U1 (
      .ZN(n1),
      .A (sel)
  );
  INV_X1 U2 (
      .ZN(ou1[0]),
      .A (n15)
  );
  AOI22_X1 U3 (
      .ZN(n15),
      .B2(sel),
      .B1(in1[0]),
      .A2(n1),
      .A1(in0[0])
  );
  INV_X1 U4 (
      .ZN(ou1[6]),
      .A (n9)
  );
  AOI22_X1 U5 (
      .ZN(n9),
      .B2(in1[6]),
      .B1(sel),
      .A2(n1),
      .A1(in0[6])
  );
  INV_X1 U6 (
      .ZN(ou1[3]),
      .A (n12)
  );
  AOI22_X1 U7 (
      .ZN(n12),
      .B2(sel),
      .B1(in1[3]),
      .A2(n1),
      .A1(in0[3])
  );
  INV_X1 U8 (
      .ZN(ou1[4]),
      .A (n11)
  );
  AOI22_X1 U9 (
      .ZN(n11),
      .B2(sel),
      .B1(in1[4]),
      .A2(n1),
      .A1(in0[4])
  );
  INV_X1 U10 (
      .ZN(ou1[5]),
      .A (n10)
  );
  AOI22_X1 U11 (
      .ZN(n10),
      .B2(sel),
      .B1(in1[5]),
      .A2(n1),
      .A1(in0[5])
  );
  INV_X1 U12 (
      .ZN(ou1[2]),
      .A (n13)
  );
  AOI22_X1 U13 (
      .ZN(n13),
      .B2(sel),
      .B1(in1[2]),
      .A2(n1),
      .A1(in0[2])
  );
  INV_X1 U14 (
      .ZN(ou1[1]),
      .A (n14)
  );
  AOI22_X1 U15 (
      .ZN(n14),
      .B2(sel),
      .B1(in1[1]),
      .A2(n1),
      .A1(in0[1])
  );
endmodule

