module autovcoder_083838 (
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
  wire net6618;
  wire net10768;
  wire net10767;
  wire n1;
  wire n2;

  assign Co = net6618;

  OAI22_X1 U1 (
      .A1(net10767),
      .A2(n1),
      .B1(net10768),
      .B2(n2),
      .ZN(net6618)
  );
  INV_X1 U2 (
      .A (B),
      .ZN(n2)
  );
  INV_X1 U3 (
      .A (A),
      .ZN(net10768)
  );
  INV_X1 U4 (
      .A (Ci),
      .ZN(net10767)
  );
  XNOR2_X1 U5 (
      .A (A),
      .B (B),
      .ZN(n1)
  );
  XNOR2_X1 U6 (
      .A (Ci),
      .B (n1),
      .ZN(S)
  );
endmodule

