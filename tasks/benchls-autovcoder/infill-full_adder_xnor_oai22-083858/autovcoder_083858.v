module autovcoder_083858 (
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
  wire net6597;
  wire net10662;
  wire n1;
  wire n2;
  wire n3;

  assign Co = net6597;

  XNOR2_X1 U1 (
      .A (A),
      .B (B),
      .ZN(n1)
  );
  XNOR2_X1 U2 (
      .A (Ci),
      .B (n1),
      .ZN(S)
  );
  [MASKED]
  INV_X1 U4 (
      .A (A),
      .ZN(n2)
  );
  INV_X1 U5 (
      .A (B),
      .ZN(n3)
  );
  INV_X1 U6 (
      .A (Ci),
      .ZN(net10662)
  );
endmodule

