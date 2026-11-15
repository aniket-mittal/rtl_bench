module autovcoder_083760 (
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
  wire net6703;
  wire n1;
  wire n2;
  wire n3;
  wire n4;

  assign Co = net6703;

  OAI22_X1 U2 (
      .A1(n2),
      .A2(n1),
      .B1(n3),
      .B2(n4),
      .ZN(net6703)
  );
  INV_X1 U3 (
      .A (B),
      .ZN(n4)
  );
  INV_X1 U4 (
      .A (A),
      .ZN(n3)
  );
  INV_X1 U5 (
      .A (Ci),
      .ZN(n2)
  );
  XNOR2_X1 U6 (
      .A (A),
      .B (B),
      .ZN(n1)
  );
  XNOR2_X1 U7 (
      .A (Ci),
      .B (n1),
      .ZN(S)
  );
endmodule

