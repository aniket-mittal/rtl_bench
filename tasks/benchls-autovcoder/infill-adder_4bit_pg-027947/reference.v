module autovcoder_027947 (
    x,
    y,
    cO,
    s,
    p,
    g
);
  input [3:0] x;
  input [3:0] y;
  input cO;
  output [3:0] s;
  output p;
  output g;

  wire n_0_0;
  wire n_0_1;
  wire n_0_2;
  wire n_0_3;
  wire n_0_4;
  wire n_0_5;
  wire n_0_6;
  wire n_0_7;

  FA_X1 i_0_0 (
      .A (cO),
      .B (x[0]),
      .CI(y[0]),
      .CO(n_0_0),
      .S (s[0])
  );
  FA_X1 i_0_1 (
      .A (y[1]),
      .B (x[1]),
      .CI(n_0_0),
      .CO(n_0_1),
      .S (s[1])
  );
  FA_X1 i_0_2 (
      .A (y[2]),
      .B (x[2]),
      .CI(n_0_1),
      .CO(n_0_2),
      .S (s[2])
  );
  OAI21_X1 i_0_3 (
      .A (n_0_4),
      .B1(n_0_3),
      .B2(n_0_6),
      .ZN(g)
  );
  AOI22_X1 i_0_4 (
      .A1(y[2]),
      .A2(x[2]),
      .B1(x[0]),
      .B2(y[0]),
      .ZN(n_0_3)
  );
  NAND2_X1 i_0_5 (
      .A1(y[3]),
      .A2(x[3]),
      .ZN(n_0_4)
  );
  NOR2_X1 i_0_6 (
      .A1(n_0_6),
      .A2(n_0_5),
      .ZN(p)
  );
  OAI22_X1 i_0_7 (
      .A1(y[1]),
      .A2(x[1]),
      .B1(x[0]),
      .B2(y[0]),
      .ZN(n_0_5)
  );
  OAI22_X1 i_0_8 (
      .A1(y[3]),
      .A2(x[3]),
      .B1(x[2]),
      .B2(y[2]),
      .ZN(n_0_6)
  );
  XNOR2_X1 i_0_9 (
      .A (y[3]),
      .B (n_0_7),
      .ZN(s[3])
  );
  XNOR2_X1 i_0_10 (
      .A (x[3]),
      .B (n_0_2),
      .ZN(n_0_7)
  );
endmodule

