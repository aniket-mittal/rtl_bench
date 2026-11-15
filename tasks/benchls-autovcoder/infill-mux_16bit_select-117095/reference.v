module autovcoder_117095 (
    A_0,
    B_1,
    Select,
    Out
);
  input [31:0] A_0;
  input [31:0] B_1;
  input Select;
  output [15:0] Out;

  // Internal wires
  wire n_0;
  wire n_3;
  wire n_4;
  wire n_5;
  wire n_17;

  NAND2_X2 g184 (
      .A1(n_5),
      .A2(n_17),
      .ZN(Out[1])
  );
  MUX2_X2 g194 (
      .A(B_1[3]),
      .B(A_0[3]),
      .S(n_3),
      .Z(Out[3])
  );
  OAI21_X2 g185 (
      .A (n_4),
      .B1(Select),
      .B2(n_0),
      .ZN(Out[0])
  );
  MUX2_X2 g193 (
      .A(B_1[4]),
      .B(A_0[4]),
      .S(n_3),
      .Z(Out[4])
  );
  MUX2_X2 g182 (
      .A(A_0[2]),
      .B(B_1[2]),
      .S(Select),
      .Z(Out[2])
  );
  NAND2_X2 g195 (
      .A1(n_3),
      .A2(A_0[1]),
      .ZN(n_17)
  );
  MUX2_X2 g179 (
      .A(A_0[15]),
      .B(B_1[15]),
      .S(Select),
      .Z(Out[15])
  );
  MUX2_X2 g189 (
      .A(A_0[14]),
      .B(B_1[14]),
      .S(Select),
      .Z(Out[14])
  );
  MUX2_X2 g190 (
      .A(A_0[13]),
      .B(B_1[13]),
      .S(Select),
      .Z(Out[13])
  );
  MUX2_X2 g180 (
      .A(A_0[12]),
      .B(B_1[12]),
      .S(Select),
      .Z(Out[12])
  );
  MUX2_X2 g186 (
      .A(A_0[11]),
      .B(B_1[11]),
      .S(Select),
      .Z(Out[11])
  );
  MUX2_X2 g191 (
      .A(A_0[10]),
      .B(B_1[10]),
      .S(Select),
      .Z(Out[10])
  );
  MUX2_X2 g183 (
      .A(A_0[8]),
      .B(B_1[8]),
      .S(Select),
      .Z(Out[8])
  );
  MUX2_X2 g187 (
      .A(A_0[7]),
      .B(B_1[7]),
      .S(Select),
      .Z(Out[7])
  );
  MUX2_X2 g181 (
      .A(A_0[9]),
      .B(B_1[9]),
      .S(Select),
      .Z(Out[9])
  );
  MUX2_X2 g188 (
      .A(A_0[6]),
      .B(B_1[6]),
      .S(Select),
      .Z(Out[6])
  );
  MUX2_X2 g192 (
      .A(A_0[5]),
      .B(B_1[5]),
      .S(Select),
      .Z(Out[5])
  );
  NAND2_X2 g196 (
      .A1(B_1[1]),
      .A2(Select),
      .ZN(n_5)
  );
  NAND2_X2 g197 (
      .A1(B_1[0]),
      .A2(Select),
      .ZN(n_4)
  );
  INV_X2 g198 (
      .A (Select),
      .ZN(n_3)
  );
  INV_X2 g201 (
      .A (A_0[0]),
      .ZN(n_0)
  );
endmodule

