module autovcoder_083785 (
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
  wire n3;
  wire n4;
  wire n5;
  wire n6;

  XNOR2_X1 U3 (
      .A (A),
      .B (B),
      .ZN(n6)
  );
  XNOR2_X1 U4 (
      .A (Ci),
      .B (n6),
      .ZN(S)
  );
  INV_X1 U5 (
      .A (A),
      .ZN(n4)
  );
  INV_X1 U6 (
      .A (Ci),
      .ZN(n5)
  );
  INV_X1 U7 (
      .A (B),
      .ZN(n3)
  );
  OAI22_X1 U8 (
      .A1(n5),
      .A2(n6),
      .B1(n4),
      .B2(n3),
      .ZN(Co)
  );
endmodule

