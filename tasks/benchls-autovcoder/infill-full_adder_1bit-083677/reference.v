module autovcoder_083677 (
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
  wire net6787;
  wire n1;
  wire n2;
  wire n3;
  wire n4;

  assign Co = net6787;

  XOR2_X1 U3 (
      .A(Ci),
      .B(n1),
      .Z(S)
  );
  XOR2_X1 U1 (
      .A(A),
      .B(B),
      .Z(n1)
  );
  AND2_X1 U2 (
      .A1(A),
      .A2(B),
      .ZN(n2)
  );
  NOR2_X1 U4 (
      .A1(Ci),
      .A2(n2),
      .ZN(n4)
  );
  NOR2_X1 U5 (
      .A1(n4),
      .A2(n3),
      .ZN(net6787)
  );
  NOR2_X1 U6 (
      .A1(A),
      .A2(B),
      .ZN(n3)
  );
endmodule

