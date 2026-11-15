module autovcoder_083777 (
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
  wire net6686;
  wire net11098;
  wire net11097;
  wire n1;
  wire n2;

  assign Co = net6686;

  XNOR2_X1 U1 (
      .A (A),
      .B (B),
      .ZN(n1)
  );
  XOR2_X1 U2 (
      .A(net11097),
      .B(n1),
      .Z(S)
  );
  OAI22_X1 U3 (
      .A1(net11097),
      .A2(n1),
      .B1(net11098),
      .B2(n2),
      .ZN(net6686)
  );
  INV_X1 U5 (
      .A (B),
      .ZN(n2)
  );
  INV_X1 U6 (
      .A (A),
      .ZN(net11098)
  );
  INV_X1 U7 (
      .A (Ci),
      .ZN(net11097)
  );
endmodule

