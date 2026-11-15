module autovcoder_083809 (
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
  wire net6652;
  wire net10932;
  wire n1;
  wire n2;
  wire n3;

  assign Co = net6652;

  XNOR2_X1 U2 (
      .A (A),
      .B (B),
      .ZN(n1)
  );
  XNOR2_X1 U3 (
      .A (n1),
      .B (Ci),
      .ZN(S)
  );
  OAI22_X1 U4 (
      .A1(net10932),
      .A2(n1),
      .B1(n2),
      .B2(n3),
      .ZN(net6652)
  );
  INV_X1 U5 (
      .A (A),
      .ZN(n2)
  );
  INV_X1 U6 (
      .A (B),
      .ZN(n3)
  );
  INV_X1 U7 (
      .A (Ci),
      .ZN(net10932)
  );
endmodule

