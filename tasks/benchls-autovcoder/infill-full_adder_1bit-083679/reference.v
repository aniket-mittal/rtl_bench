module autovcoder_083679 (
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
  wire net6785;
  wire net25996;
  wire n1;
  wire n2;
  wire n3;

  assign Co = net6785;
  assign net25996 = A;

  OAI21_X1 U1 (
      .A (n3),
      .B1(n2),
      .B2(n1),
      .ZN(net6785)
  );
  NAND2_X1 U2 (
      .A1(A),
      .A2(B),
      .ZN(n3)
  );
  INV_X1 U4 (
      .A (Ci),
      .ZN(n2)
  );
  XNOR2_X1 U5 (
      .A (net25996),
      .B (B),
      .ZN(n1)
  );
  XNOR2_X1 U6 (
      .A (n1),
      .B (Ci),
      .ZN(S)
  );
endmodule

