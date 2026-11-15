module autovcoder_083654 (
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

  OAI22_X2 FE_RC_43_0 (
      .A1(n4),
      .A2(n5),
      .B1(n3),
      .B2(n2),
      .ZN(Co)
  );
  [MASKED]
  XNOR2_X1 U3 (
      .A (A),
      .B (B),
      .ZN(n5)
  );
  INV_X1 U4 (
      .A (A),
      .ZN(n3)
  );
  INV_X1 U5 (
      .A (Ci),
      .ZN(n4)
  );
  INV_X1 U6 (
      .A (B),
      .ZN(n2)
  );
endmodule

