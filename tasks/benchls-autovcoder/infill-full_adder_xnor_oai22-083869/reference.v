module autovcoder_083869 (
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
  wire net6586;
  wire net10612;
  wire n1;
  wire n2;
  wire n3;

  assign Co = net6586;

  XNOR2_X1 U1 (
      .A (A),
      .B (B),
      .ZN(n1)
  );
  OAI22_X1 U2 (
      .A1(net10612),
      .A2(n1),
      .B1(n2),
      .B2(n3),
      .ZN(net6586)
  );
  XNOR2_X1 U3 (
      .A (Ci),
      .B (n1),
      .ZN(S)
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
      .ZN(net10612)
  );
endmodule

