module autovcoder_083904 (
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
  wire net6549;
  wire net27165;
  wire net10432;
  wire n1;
  wire n2;

  assign Co = net6549;
  assign net27165 = A;

  OAI21_X1 U1 (
      .A (n2),
      .B1(net10432),
      .B2(n1),
      .ZN(net6549)
  );
  NAND2_X1 U2 (
      .A1(A),
      .A2(B),
      .ZN(n2)
  );
  INV_X1 U4 (
      .A (Ci),
      .ZN(net10432)
  );
  XNOR2_X1 U5 (
      .A (net27165),
      .B (B),
      .ZN(n1)
  );
  XNOR2_X1 U6 (
      .A (Ci),
      .B (n1),
      .ZN(S)
  );
endmodule

