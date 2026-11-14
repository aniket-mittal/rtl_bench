module autovcoder_083945 (
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
  wire net6506;
  wire n1;
  wire n2;
  wire n3;
  wire n4;

  assign Co = net6506;

  OAI22_X2 FE_RC_52_0 (
      .A1(n2),
      .A2(n1),
      .B1(n3),
      .B2(n4),
      .ZN(net6506)
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
  [MASKED]
  XNOR2_X1 U6 (
      .A (n1),
      .B (Ci),
      .ZN(S)
  );
endmodule

