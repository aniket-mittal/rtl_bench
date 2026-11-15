module autovcoder_006093 (
    port_u_0_0,
    port_u_0_1,
    port_u_0_2,
    port_u_1_0,
    port_u_1_1,
    port_u_1_2,
    port_u_2_0,
    port_u_2_1,
    port_u_2_2,
    port_c_0,
    port_c_1,
    port_c_2
);
  input [2:0] port_u_0_0;
  input [2:0] port_u_0_1;
  input [2:0] port_u_0_2;
  input [2:0] port_u_1_0;
  input [2:0] port_u_1_1;
  input [2:0] port_u_1_2;
  input [2:0] port_u_2_0;
  input [2:0] port_u_2_1;
  input [2:0] port_u_2_2;
  output [2:0] port_c_0;
  output [2:0] port_c_1;
  output [2:0] port_c_2;
  wire n1, n2, n3, n4, n5, n6, n7, n8, n9;

  XNOR2_X1 U1 (
      .A (port_u_0_0[0]),
      .B (port_u_0_1[0]),
      .ZN(n1)
  );
  XNOR2_X1 U2 (
      .A (n1),
      .B (port_u_0_2[0]),
      .ZN(port_c_0[0])
  );
  XNOR2_X1 U3 (
      .A (port_u_0_0[1]),
      .B (port_u_0_1[1]),
      .ZN(n2)
  );
  XNOR2_X1 U4 (
      .A (n2),
      .B (port_u_0_2[1]),
      .ZN(port_c_0[1])
  );
  XNOR2_X1 U5 (
      .A (port_u_0_0[2]),
      .B (port_u_0_1[2]),
      .ZN(n3)
  );
  XNOR2_X1 U6 (
      .A (n3),
      .B (port_u_0_2[2]),
      .ZN(port_c_0[2])
  );
  XNOR2_X1 U7 (
      .A (port_u_1_0[0]),
      .B (port_u_1_1[0]),
      .ZN(n4)
  );
  XNOR2_X1 U8 (
      .A (n4),
      .B (port_u_1_2[0]),
      .ZN(port_c_1[0])
  );
  XNOR2_X1 U9 (
      .A (port_u_1_0[1]),
      .B (port_u_1_1[1]),
      .ZN(n5)
  );
  XNOR2_X1 U10 (
      .A (n5),
      .B (port_u_1_2[1]),
      .ZN(port_c_1[1])
  );
  XNOR2_X1 U11 (
      .A (port_u_1_0[2]),
      .B (port_u_1_1[2]),
      .ZN(n6)
  );
  XNOR2_X1 U12 (
      .A (n6),
      .B (port_u_1_2[2]),
      .ZN(port_c_1[2])
  );
  XNOR2_X1 U13 (
      .A (port_u_2_0[0]),
      .B (port_u_2_1[0]),
      .ZN(n7)
  );
  XNOR2_X1 U14 (
      .A (n7),
      .B (port_u_2_2[0]),
      .ZN(port_c_2[0])
  );
  XNOR2_X1 U15 (
      .A (port_u_2_0[1]),
      .B (port_u_2_1[1]),
      .ZN(n8)
  );
  XNOR2_X1 U16 (
      .A (n8),
      .B (port_u_2_2[1]),
      .ZN(port_c_2[1])
  );
  XNOR2_X1 U17 (
      .A (port_u_2_0[2]),
      .B (port_u_2_1[2]),
      .ZN(n9)
  );
  XNOR2_X1 U18 (
      .A (n9),
      .B (port_u_2_2[2]),
      .ZN(port_c_2[2])
  );
endmodule

