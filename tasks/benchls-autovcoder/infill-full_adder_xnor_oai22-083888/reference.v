module autovcoder_083888 (
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
  wire net6567;
  wire n1;
  wire n2;
  wire n3;
  wire n4;

  assign Co = net6567;

  OAI22_X1 U1 (
      .A1(n2),
      .A2(n1),
      .B1(n3),
      .B2(n4),
      .ZN(net6567)
  );
  INV_X1 U2 (
      .A (B),
      .ZN(n4)
  );
  INV_X1 U3 (
      .A (A),
      .ZN(n3)
  );
  XNOR2_X1 U4 (
      .A (A),
      .B (B),
      .ZN(n1)
  );
  INV_X1 U5 (
      .A (Ci),
      .ZN(n2)
  );
  XNOR2_X1 U7 (
      .A (Ci),
      .B (n1),
      .ZN(S)
  );
endmodule

