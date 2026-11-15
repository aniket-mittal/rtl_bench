module autovcoder_083604 (
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
  wire n1;
  wire n2;
  wire n4;
  wire n5;

  AOI22_X1 U2 (
      .A1(A),
      .A2(B),
      .B1(Ci),
      .B2(n1),
      .ZN(n2)
  );
  INV_X1 U3 (
      .A (n5),
      .ZN(n1)
  );
  INV_X1 U4 (
      .A (n2),
      .ZN(Co)
  );
  XNOR2_X1 U5 (
      .A (Ci),
      .B (n5),
      .ZN(S)
  );
  INV_X1 U6 (
      .A (A),
      .ZN(n4)
  );
  XOR2_X1 U7 (
      .A(n4),
      .B(B),
      .Z(n5)
  );
endmodule

