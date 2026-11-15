module autovcoder_083552 (
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
  wire n6;
  wire n8;
  wire n9;

  INV_X1 U1 (
      .A (A),
      .ZN(n6)
  );
  INV_X1 U2 (
      .A (Ci),
      .ZN(n1)
  );
  XNOR2_X1 U3 (
      .A (n9),
      .B (n1),
      .ZN(S)
  );
  XNOR2_X1 U6 (
      .A (B),
      .B (n6),
      .ZN(n9)
  );
  INV_X1 U7 (
      .A (n8),
      .ZN(Co)
  );
  AOI22_X1 U8 (
      .A1(B),
      .A2(A),
      .B1(n9),
      .B2(Ci),
      .ZN(n8)
  );
endmodule

