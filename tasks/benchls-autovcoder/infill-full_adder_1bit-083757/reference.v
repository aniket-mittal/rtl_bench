module autovcoder_083757 (
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
  wire net6707;
  wire net11192;
  wire n1;
  wire n2;
  wire n3;

  assign Co = net6707;

  XNOR2_X1 U1 (
      .A (A),
      .B (B),
      .ZN(n1)
  );
  XOR2_X1 U2 (
      .A(net11192),
      .B(n1),
      .Z(S)
  );
  OAI22_X1 U3 (
      .A1(net11192),
      .A2(n1),
      .B1(n2),
      .B2(n3),
      .ZN(net6707)
  );
  INV_X1 U4 (
      .A (A),
      .ZN(n2)
  );
  INV_X1 U5 (
      .A (B),
      .ZN(n3)
  );
  INV_X1 U6 (
      .A (Ci),
      .ZN(net11192)
  );
endmodule

