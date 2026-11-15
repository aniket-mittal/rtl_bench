module autovcoder_099551 (
    in1,
    in0,
    sel,
    ou1
);
  input [7:0] in1;
  input [7:0] in0;
  output [7:0] ou1;
  input sel;
  wire n1, n2, n3, n4, n5, n6, n7, n8, n9;

  INV_X1 U1 (
      .A (sel),
      .ZN(n1)
  );
  AOI22_X1 U2 (
      .A1(in0[0]),
      .A2(n1),
      .B1(in1[0]),
      .B2(sel),
      .ZN(n2)
  );
  INV_X1 U3 (
      .A (n9),
      .ZN(ou1[7])
  );
  AOI22_X1 U4 (
      .A1(in0[7]),
      .A2(n1),
      .B1(sel),
      .B2(in1[7]),
      .ZN(n9)
  );
  INV_X1 U5 (
      .A (n5),
      .ZN(ou1[3])
  );
  AOI22_X1 U6 (
      .A1(in0[3]),
      .A2(n1),
      .B1(in1[3]),
      .B2(sel),
      .ZN(n5)
  );
  INV_X1 U7 (
      .A (n6),
      .ZN(ou1[4])
  );
  AOI22_X1 U8 (
      .A1(in0[4]),
      .A2(n1),
      .B1(in1[4]),
      .B2(sel),
      .ZN(n6)
  );
  INV_X1 U9 (
      .A (n7),
      .ZN(ou1[5])
  );
  AOI22_X1 U10 (
      .A1(in0[5]),
      .A2(n1),
      .B1(in1[5]),
      .B2(sel),
      .ZN(n7)
  );
  INV_X1 U11 (
      .A (n8),
      .ZN(ou1[6])
  );
  AOI22_X1 U12 (
      .A1(in0[6]),
      .A2(n1),
      .B1(in1[6]),
      .B2(sel),
      .ZN(n8)
  );
  INV_X1 U13 (
      .A (n4),
      .ZN(ou1[2])
  );
  AOI22_X1 U14 (
      .A1(in0[2]),
      .A2(n1),
      .B1(in1[2]),
      .B2(sel),
      .ZN(n4)
  );
  INV_X1 U15 (
      .A (n2),
      .ZN(ou1[0])
  );
  INV_X1 U16 (
      .A (n3),
      .ZN(ou1[1])
  );
  AOI22_X1 U17 (
      .A1(in0[1]),
      .A2(n1),
      .B1(in1[1]),
      .B2(sel),
      .ZN(n3)
  );
endmodule

