module autovcoder_083724 (
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
  wire net6740;
  wire net11347;
  wire n2;
  wire n3;
  wire n4;

  assign Co = net6740;

  XNOR2_X1 U2 (
      .A (A),
      .B (B),
      .ZN(n2)
  );
  XOR2_X1 U3 (
      .A(net11347),
      .B(n2),
      .Z(S)
  );
  OAI22_X1 U4 (
      .A1(net11347),
      .A2(n2),
      .B1(n3),
      .B2(n4),
      .ZN(net6740)
  );
  INV_X1 U5 (
      .A (A),
      .ZN(n3)
  );
  INV_X1 U6 (
      .A (B),
      .ZN(n4)
  );
  INV_X1 U7 (
      .A (Ci),
      .ZN(net11347)
  );
endmodule

