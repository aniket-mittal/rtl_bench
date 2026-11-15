module autovcoder_083847 (
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
  wire net6608;
  wire net27489;
  wire n1;
  wire n2;
  wire n3;

  assign Co = net6608;

  OAI22_X1 U1 (
      .A1(n1),
      .A2(net27489),
      .B1(n2),
      .B2(n3),
      .ZN(net6608)
  );
  INV_X1 U2 (
      .A (B),
      .ZN(n3)
  );
  INV_X1 U3 (
      .A (A),
      .ZN(n2)
  );
  INV_X1 U4 (
      .A (Ci),
      .ZN(n1)
  );
  XNOR2_X1 U5 (
      .A (A),
      .B (B),
      .ZN(net27489)
  );
  XNOR2_X1 U7 (
      .A (Ci),
      .B (net27489),
      .ZN(S)
  );
endmodule

