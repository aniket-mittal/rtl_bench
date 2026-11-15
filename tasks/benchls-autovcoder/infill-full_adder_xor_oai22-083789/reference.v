module autovcoder_083789 (
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
  wire net6674;
  wire net11038;
  wire n2;
  wire n3;
  wire n4;

  assign Co = net6674;

  XOR2_X1 U2 (
      .A(n3),
      .B(n2),
      .Z(S)
  );
  INV_X1 U3 (
      .A (Ci),
      .ZN(n3)
  );
  OAI22_X1 U4 (
      .A1(n3),
      .A2(n2),
      .B1(net11038),
      .B2(n4),
      .ZN(net6674)
  );
  XNOR2_X1 U5 (
      .A (A),
      .B (B),
      .ZN(n2)
  );
  INV_X1 U6 (
      .A (A),
      .ZN(net11038)
  );
  INV_X1 U7 (
      .A (B),
      .ZN(n4)
  );
endmodule

