module autovcoder_083768 (
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
  wire net6695;
  wire n1;
  wire n2;
  wire n3;
  wire n4;

  assign Co = net6695;

  OAI22_X1 U1 (
      .A1(n2),
      .A2(n1),
      .B1(n3),
      .B2(n4),
      .ZN(net6695)
  );
  INV_X1 U2 (
      .A (B),
      .ZN(n4)
  );
  INV_X1 U3 (
      .A (A),
      .ZN(n3)
  );
  INV_X1 U4 (
      .A (Ci),
      .ZN(n2)
  );
  XNOR2_X1 U5 (
      .A (A),
      .B (B),
      .ZN(n1)
  );
  XNOR2_X1 U6 (
      .A (n1),
      .B (Ci),
      .ZN(S)
  );
endmodule

