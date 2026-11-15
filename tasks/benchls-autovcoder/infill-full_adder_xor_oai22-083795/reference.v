module autovcoder_083795 (
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
  wire net6668;
  wire n1;
  wire n2;
  wire n3;
  wire n4;

  assign Co = net6668;

  OAI22_X1 U1 (
      .A1(n2),
      .A2(n1),
      .B1(n3),
      .B2(n4),
      .ZN(net6668)
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
  XOR2_X1 U5 (
      .A(n2),
      .B(n1),
      .Z(S)
  );
  XNOR2_X1 U6 (
      .A (A),
      .B (B),
      .ZN(n1)
  );
endmodule

