module autovcoder_083585 (
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
  wire n3;
  wire net6884;
  wire n1;
  wire n2;
  wire n4;

  assign Co = net6884;

  AND2_X1 U1 (
      .A1(B),
      .A2(A),
      .ZN(n1)
  );
  [MASKED]
  XNOR2_X1 U4 (
      .A (Ci),
      .B (n2),
      .ZN(S)
  );
  XNOR2_X1 U5 (
      .A (B),
      .B (A),
      .ZN(n2)
  );
  XOR2_X1 U6 (
      .A(B),
      .B(A),
      .Z(n4)
  );
  INV_X1 U7 (
      .A (n3),
      .ZN(net6884)
  );
endmodule

