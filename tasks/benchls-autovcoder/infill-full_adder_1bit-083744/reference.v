module autovcoder_083744 (
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
  wire net6720;
  wire n3;
  wire n4;
  wire n5;
  wire n6;

  assign Co = net6720;

  OAI22_X2 U4 (
      .A1(n4),
      .A2(n3),
      .B1(n6),
      .B2(n5),
      .ZN(net6720)
  );
  INV_X1 U5 (
      .A (B),
      .ZN(n5)
  );
  INV_X1 U6 (
      .A (A),
      .ZN(n6)
  );
  INV_X1 U7 (
      .A (Ci),
      .ZN(n4)
  );
  XNOR2_X1 U8 (
      .A (A),
      .B (B),
      .ZN(n3)
  );
  XNOR2_X1 U9 (
      .A (n3),
      .B (Ci),
      .ZN(S)
  );
endmodule

