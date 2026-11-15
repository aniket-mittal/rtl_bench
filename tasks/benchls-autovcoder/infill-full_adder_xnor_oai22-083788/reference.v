module autovcoder_083788 (
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
  wire net6675;
  wire net26914;
  wire n1;
  wire n2;
  wire n3;

  assign Co = net6675;

  OAI22_X1 U1 (
      .A1(n1),
      .A2(net26914),
      .B1(n2),
      .B2(n3),
      .ZN(net6675)
  );
  INV_X1 U2 (
      .A (B),
      .ZN(n3)
  );
  INV_X1 U3 (
      .A (A),
      .ZN(n2)
  );
  INV_X1 U5 (
      .A (Ci),
      .ZN(n1)
  );
  XNOR2_X1 U6 (
      .A (A),
      .B (B),
      .ZN(net26914)
  );
  XNOR2_X1 U8 (
      .A (Ci),
      .B (net26914),
      .ZN(S)
  );
endmodule

