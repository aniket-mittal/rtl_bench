module autovcoder_083885 (
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
  wire net6570;
  wire n1;
  wire n2;
  wire n3;
  wire n4;

  assign Co = net6570;

  [MASKED]
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

