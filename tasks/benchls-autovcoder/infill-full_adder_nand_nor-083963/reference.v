module autovcoder_083963 (
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
  wire net6400;
  wire net27749;
  wire net9707;
  wire n1;
  wire n2;

  assign Co = net6400;

  XOR2_X1 U1 (
      .A(net9707),
      .B(net27749),
      .Z(S)
  );
  NAND2_X1 U3 (
      .A1(B),
      .A2(A),
      .ZN(n1)
  );
  XNOR2_X1 U4 (
      .A (B),
      .B (A),
      .ZN(net27749)
  );
  NOR2_X1 U5 (
      .A1(B),
      .A2(A),
      .ZN(n2)
  );
  AOI21_X1 U6 (
      .A (n2),
      .B1(net9707),
      .B2(n1),
      .ZN(net6400)
  );
  INV_X1 U7 (
      .A (Ci),
      .ZN(net9707)
  );
endmodule

