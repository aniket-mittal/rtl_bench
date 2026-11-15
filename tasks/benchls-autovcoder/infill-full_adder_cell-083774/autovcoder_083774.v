module autovcoder_083774 (
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
  wire net6689;
  wire net26593;
  wire n1;
  wire n2;
  wire n3;

  assign Co = net6689;
  assign net26593 = Ci;

  [MASKED]
  NOR2_X1 U1 (
      .A1(A),
      .A2(B),
      .ZN(n2)
  );
  XOR2_X1 U2 (
      .A(A),
      .B(B),
      .Z(n1)
  );
  AOI21_X1 U4 (
      .A (net26593),
      .B1(A),
      .B2(B),
      .ZN(n3)
  );
  NOR2_X1 U5 (
      .A1(n2),
      .A2(n3),
      .ZN(net6689)
  );
endmodule

