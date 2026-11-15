module autovcoder_083597 (
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
  wire n2;
  wire n3;
  wire n4;
  wire n5;

  XNOR2_X1 U2 (
      .A (Ci),
      .B (n5),
      .ZN(S)
  );
  INV_X1 U3 (
      .A (A),
      .ZN(n3)
  );
  XOR2_X1 U4 (
      .A(n3),
      .B(B),
      .Z(n5)
  );
  INV_X1 U5 (
      .A (Ci),
      .ZN(n4)
  );
  INV_X1 U6 (
      .A (B),
      .ZN(n2)
  );
  [MASKED]
endmodule

