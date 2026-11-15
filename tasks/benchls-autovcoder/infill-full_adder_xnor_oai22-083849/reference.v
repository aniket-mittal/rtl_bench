module autovcoder_083849 (
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
  wire net6606;
  wire net10708;
  wire n1;
  wire n2;
  wire n3;

  assign Co = net6606;

  XNOR2_X1 U1 (
      .A (Ci),
      .B (n1),
      .ZN(S)
  );
  XNOR2_X1 U3 (
      .A (A),
      .B (B),
      .ZN(n1)
  );
  OAI22_X1 U4 (
      .A1(n2),
      .A2(n1),
      .B1(net10708),
      .B2(n3),
      .ZN(net6606)
  );
  INV_X1 U5 (
      .A (Ci),
      .ZN(n2)
  );
  INV_X1 U6 (
      .A (A),
      .ZN(net10708)
  );
  INV_X1 U7 (
      .A (B),
      .ZN(n3)
  );
endmodule

