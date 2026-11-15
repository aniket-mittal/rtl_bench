module autovcoder_083954 (
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
  wire net6495;
  wire n1;
  wire n2;
  wire n3;
  wire n5;

  assign Co = net6495;

  XNOR2_X1 U1 (
      .A (Ci),
      .B (n5),
      .ZN(S)
  );
  XNOR2_X1 U3 (
      .A (A),
      .B (B),
      .ZN(n5)
  );
  OAI22_X1 U4 (
      .A1(n1),
      .A2(n5),
      .B1(n2),
      .B2(n3),
      .ZN(net6495)
  );
  INV_X1 U5 (
      .A (Ci),
      .ZN(n1)
  );
  INV_X1 U6 (
      .A (A),
      .ZN(n2)
  );
  INV_X1 U7 (
      .A (B),
      .ZN(n3)
  );
endmodule

