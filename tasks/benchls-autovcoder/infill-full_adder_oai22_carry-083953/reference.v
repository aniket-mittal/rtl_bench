module autovcoder_083953 (
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
  wire net6496;
  wire n1;
  wire n2;
  wire n3;
  wire n4;

  assign Co = net6496;

  OAI22_X2 FE_RC_32_0 (
      .A1(n2),
      .A2(n1),
      .B1(n3),
      .B2(n4),
      .ZN(net6496)
  );
  INV_X1 U2 (
      .A (B),
      .ZN(n4)
  );
  INV_X1 U3 (
      .A (A),
      .ZN(n3)
  );
  INV_X1 U4 (
      .A (Ci),
      .ZN(n2)
  );
  XNOR2_X1 U5 (
      .A (A),
      .B (B),
      .ZN(n1)
  );
  XNOR2_X1 U6 (
      .A (Ci),
      .B (n1),
      .ZN(S)
  );
endmodule

