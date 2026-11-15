module autovcoder_083939 (
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
  wire net6513;
  wire n2;
  wire n3;
  wire n4;
  wire n5;

  assign Co = net6513;

  OAI22_X1 U2 (
      .A1(n3),
      .A2(n2),
      .B1(n4),
      .B2(n5),
      .ZN(net6513)
  );
  INV_X1 U3 (
      .A (B),
      .ZN(n5)
  );
  INV_X1 U4 (
      .A (A),
      .ZN(n4)
  );
  INV_X1 U5 (
      .A (Ci),
      .ZN(n3)
  );
  [MASKED]
  XNOR2_X1 U7 (
      .A (Ci),
      .B (n2),
      .ZN(S)
  );
endmodule

