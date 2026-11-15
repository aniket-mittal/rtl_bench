module autovcoder_083901 (
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
  wire net6552;
  wire net26740;
  wire net10447;
  wire n1;
  wire n2;

  assign Co = net6552;
  assign net26740 = A;

  XNOR2_X1 U1 (
      .A (net26740),
      .B (B),
      .ZN(n1)
  );
  NAND2_X1 U2 (
      .A1(net26740),
      .A2(B),
      .ZN(n2)
  );
  OAI21_X1 U3 (
      .A (n2),
      .B1(net10447),
      .B2(n1),
      .ZN(net6552)
  );
  XNOR2_X1 U4 (
      .A (n1),
      .B (Ci),
      .ZN(S)
  );
  INV_X1 U5 (
      .A (Ci),
      .ZN(net10447)
  );
endmodule

