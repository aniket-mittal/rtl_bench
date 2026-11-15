module autovcoder_083763 (
    A,
    B,
    Ci,
    S,
    Co
);
  input A;
  input B;
  input Ci;
  output S;
  output Co;

  // Internal wires
  wire net6700;
  wire n2;
  wire n3;
  wire n4;
  wire n5;

  assign Co = net6700;

  OAI22_X1 U3 (
      .A1(n3),
      .A2(n2),
      .B1(n4),
      .B2(n5),
      .ZN(net6700)
  );
  INV_X1 U4 (
      .A (B),
      .ZN(n5)
  );
  INV_X1 U5 (
      .A (A),
      .ZN(n4)
  );
  INV_X1 U6 (
      .A (Ci),
      .ZN(n3)
  );
  XNOR2_X1 U7 (
      .A (A),
      .B (B),
      .ZN(n2)
  );
  XNOR2_X1 U8 (
      .A (Ci),
      .B (n2),
      .ZN(S)
  );
endmodule

