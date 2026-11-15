module autovcoder_019533 (
    a,
    b,
    cin,
    sum,
    cout
);
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout;
  wire n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;

  AND2X1 U1 (
      .A(a[3]),
      .B(b[3]),
      .Y(n12)
  );
  INVX1 U2 (
      .A(n12),
      .Y(n1)
  );
  AND2X1 U3 (
      .A(a[1]),
      .B(b[1]),
      .Y(n14)
  );
  INVX1 U4 (
      .A(n14),
      .Y(n2)
  );
  BUFX2 U5 (
      .A(n6),
      .Y(n3)
  );
  BUFX2 U6 (
      .A(n10),
      .Y(n4)
  );
  XOR2X1 U7 (
      .A(n5),
      .B(n3),
      .Y(sum[3])
  );
  XOR2X1 U8 (
      .A(n7),
      .B(n8),
      .Y(sum[2])
  );
  XOR2X1 U9 (
      .A(n9),
      .B(n4),
      .Y(sum[1])
  );
  XOR2X1 U10 (
      .A(cin),
      .B(n11),
      .Y(sum[0])
  );
  OAI21X1 U11 (
      .A(n3),
      .B(n5),
      .C(n1),
      .Y(cout)
  );
  XNOR2X1 U12 (
      .A(a[3]),
      .B(b[3]),
      .Y(n5)
  );
  AOI21X1 U13 (
      .A(b[2]),
      .B(a[2]),
      .C(n13),
      .Y(n6)
  );
  AND2X1 U14 (
      .A(n8),
      .B(n7),
      .Y(n13)
  );
  OAI21X1 U15 (
      .A(n4),
      .B(n9),
      .C(n2),
      .Y(n7)
  );
  XNOR2X1 U16 (
      .A(a[1]),
      .B(b[1]),
      .Y(n9)
  );
  AOI21X1 U17 (
      .A(n11),
      .B(cin),
      .C(n15),
      .Y(n10)
  );
  AND2X1 U18 (
      .A(b[0]),
      .B(a[0]),
      .Y(n15)
  );
  XOR2X1 U19 (
      .A(a[0]),
      .B(b[0]),
      .Y(n11)
  );
  XOR2X1 U20 (
      .A(a[2]),
      .B(b[2]),
      .Y(n8)
  );
endmodule

