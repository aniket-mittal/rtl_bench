module autovcoder_083680 (
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
  wire net6784;
  wire net11553;
  wire net11552;
  wire n1;
  wire n2;

  assign Co = net6784;

  OAI22_X1 U1 (
      .A1(net11552),
      .A2(n1),
      .B1(net11553),
      .B2(n2),
      .ZN(net6784)
  );
  INV_X1 U2 (
      .A (B),
      .ZN(n2)
  );
  INV_X1 U3 (
      .A (A),
      .ZN(net11553)
  );
  INV_X1 U5 (
      .A (Ci),
      .ZN(net11552)
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

