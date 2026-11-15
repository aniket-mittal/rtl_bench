module autovcoder_083584 (
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
  wire net6885;
  wire n2;
  wire n3;
  wire n4;
  wire n5;

  assign Co = net6885;

  AND2_X1 U2 (
      .A1(A),
      .A2(B),
      .ZN(n2)
  );
  AOI21_X1 U3 (
      .A (n2),
      .B1(Ci),
      .B2(n4),
      .ZN(n3)
  );
  INV_X1 U4 (
      .A (n3),
      .ZN(net6885)
  );
  XNOR2_X1 U5 (
      .A (Ci),
      .B (n5),
      .ZN(S)
  );
  XNOR2_X1 U6 (
      .A (A),
      .B (B),
      .ZN(n5)
  );
  INV_X1 U7 (
      .A (n5),
      .ZN(n4)
  );
endmodule

