module autovcoder_083831 (
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

  OAI22_X2 FE_RC_95_0 (
      .A1(n3),
      .A2(n4),
      .B1(n2),
      .B2(n1),
      .ZN(Co)
  );
  XNOR2_X1 U1 (
      .A (Ci),
      .B (n4),
      .ZN(S)
  );
  INV_X1 U2 (
      .A (A),
      .ZN(n2)
  );
  XOR2_X1 U3 (
      .A(n2),
      .B(B),
      .Z(n4)
  );
  INV_X1 U4 (
      .A (Ci),
      .ZN(n3)
  );
  INV_X1 U5 (
      .A (B),
      .ZN(n1)
  );
endmodule

