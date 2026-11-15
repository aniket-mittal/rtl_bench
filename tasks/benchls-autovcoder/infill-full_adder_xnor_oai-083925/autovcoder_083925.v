module autovcoder_083925 (
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
  wire n1;
  wire n2;
  wire n3;
  wire n4;

  [MASKED]
  XNOR2_X1 U2 (
      .A (Ci),
      .B (n4),
      .ZN(S)
  );
  INV_X1 U3 (
      .A (A),
      .ZN(n2)
  );
  INV_X1 U4 (
      .A (Ci),
      .ZN(n3)
  );
  INV_X1 U5 (
      .A (B),
      .ZN(n1)
  );
  OAI22_X1 U6 (
      .A1(n3),
      .A2(n4),
      .B1(n2),
      .B2(n1),
      .ZN(Co)
  );
endmodule

