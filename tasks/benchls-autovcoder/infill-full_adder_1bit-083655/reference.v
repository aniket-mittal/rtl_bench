module autovcoder_083655 (
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
  wire n3;
  wire n4;
  wire n5;

  XNOR2_X1 U2 (
      .A (A),
      .B (B),
      .ZN(n1)
  );
  XNOR2_X1 U3 (
      .A (Ci),
      .B (n1),
      .ZN(S)
  );
  INV_X1 U4 (
      .A (A),
      .ZN(n4)
  );
  INV_X1 U5 (
      .A (Ci),
      .ZN(n5)
  );
  INV_X1 U6 (
      .A (B),
      .ZN(n3)
  );
  OAI22_X1 U7 (
      .A1(n5),
      .A2(n1),
      .B1(n4),
      .B2(n3),
      .ZN(Co)
  );
endmodule

