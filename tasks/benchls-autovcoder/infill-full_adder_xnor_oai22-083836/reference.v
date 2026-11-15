module autovcoder_083836 (
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
  wire net6620;
  wire net10777;
  wire n2;
  wire n3;
  wire n4;

  assign Co = net6620;

  XNOR2_X1 U2 (
      .A (A),
      .B (B),
      .ZN(n2)
  );
  OAI22_X1 U3 (
      .A1(net10777),
      .A2(n2),
      .B1(n3),
      .B2(n4),
      .ZN(net6620)
  );
  XNOR2_X1 U4 (
      .A (n2),
      .B (Ci),
      .ZN(S)
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
      .ZN(net10777)
  );
endmodule

