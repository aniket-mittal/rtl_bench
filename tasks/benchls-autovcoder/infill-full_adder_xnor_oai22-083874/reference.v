module autovcoder_083874 (
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
  wire net6581;
  wire net10587;
  wire n1;
  wire n2;
  wire n3;

  assign Co = net6581;

  XNOR2_X1 U1 (
      .A (A),
      .B (B),
      .ZN(n1)
  );
  XNOR2_X1 U2 (
      .A (n1),
      .B (Ci),
      .ZN(S)
  );
  OAI22_X1 U3 (
      .A1(net10587),
      .A2(n1),
      .B1(n2),
      .B2(n3),
      .ZN(net6581)
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
      .ZN(net10587)
  );
endmodule

