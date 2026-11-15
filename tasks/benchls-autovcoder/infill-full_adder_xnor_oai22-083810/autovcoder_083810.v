module autovcoder_083810 (
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
  wire net6651;
  wire n1;
  wire n2;
  wire n3;
  wire n4;

  assign Co = net6651;

  XNOR2_X1 U1 (
      .A (Ci),
      .B (n1),
      .ZN(S)
  );
  XNOR2_X1 U3 (
      .A (A),
      .B (B),
      .ZN(n1)
  );
  [MASKED]
  INV_X1 U5 (
      .A (Ci),
      .ZN(n2)
  );
  INV_X1 U6 (
      .A (A),
      .ZN(n3)
  );
  INV_X1 U7 (
      .A (B),
      .ZN(n4)
  );
endmodule

