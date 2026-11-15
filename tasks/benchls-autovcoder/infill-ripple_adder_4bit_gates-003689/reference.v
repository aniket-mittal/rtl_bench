module autovcoder_003689 (
    X,
    Y,
    Cin,
    S,
    Cout
);
  input [3:0] X;
  input [3:0] Y;
  input Cin;
  output [3:0] S;
  output Cout;

  and get_0_0_0 (tmp_0_0_0, X[0], Y[0]);
  or get_0_0_1 (tmp_0_0_1, X[0], Y[0]);

  and get_0_1_0 (tmp_0_1_0, X[1], Y[1]);
  or get_0_1_1 (tmp_0_1_1, X[1], Y[1]);

  and get_0_2_0 (tmp_0_2_0, X[2], Y[2]);
  or get_0_2_1 (tmp_0_2_1, X[2], Y[2]);

  and get_0_3_0 (tmp_0_3_0, X[3], Y[3]);
  or get_0_3_1 (tmp_0_3_1, X[3], Y[3]);

  and get_1_0_0 (tmp_1_0_0, ~tmp_0_0_0, tmp_0_0_1);
  xor getS0 (S0, tmp_1_0_0, Cin);

  and get_1_1_0 (tmp_1_1_0, ~tmp_0_1_0, tmp_0_1_1);
  not get_1_1_1 (tmp_1_1_1, tmp_0_0_0);
  nand get_1_1_2 (tmp_1_1_2, Cin, tmp_0_0_1);
  nand get_2_0_0 (tmp_2_0_0, tmp_1_1_1, tmp_1_1_2);
  xor getS1 (S1, tmp_1_1_0, tmp_2_0_0);

  and get_1_2_0 (tmp_1_2_0, ~tmp_0_2_0, tmp_0_2_1);
  not get_1_2_1 (tmp_1_2_1, tmp_0_1_0);
  nand get_1_2_2 (tmp_1_2_2, tmp_0_1_1, tmp_0_0_0);
  nand get_1_2_3 (tmp_1_2_3, tmp_0_1_1, tmp_0_0_1, Cin);
  nand get_2_1_0 (tmp_2_1_0, tmp_1_2_1, tmp_1_2_2, tmp_1_2_3);
  xor getS2 (S2, tmp_1_2_0, tmp_2_1_0);

  and get_1_3_0 (tmp_1_3_0, ~tmp_0_3_0, tmp_0_3_1);
  not get_1_3_1 (tmp_1_3_1, tmp_0_2_0);
  nand get_1_3_2 (tmp_1_3_2, tmp_0_2_1, tmp_0_1_0);
  nand get_1_3_3 (tmp_1_3_3, tmp_0_2_1, tmp_0_1_1, tmp_0_0_0);
  nand get_1_3_4 (tmp_1_3_4, tmp_0_2_1, tmp_0_1_1, tmp_0_0_1, Cin);
  nand get_2_2_0 (tmp_2_2_0, tmp_1_3_1, tmp_1_3_2, tmp_1_3_3, tmp_1_3_4);
  xor getS3 (S3, tmp_1_3_0, tmp_2_2_0);

  not get_1_4_0 (tmp_1_4_0, tmp_0_3_0);
  nand get_1_4_1 (tmp_1_4_1, tmp_0_3_1, tmp_0_2_0);
  nand get_1_4_2 (tmp_1_4_2, tmp_0_3_1, tmp_0_2_1, tmp_0_1_0);
  nand get_1_4_3 (tmp_1_4_3, tmp_0_3_1, tmp_0_2_1, tmp_0_1_1, tmp_0_0_0);
  nand get_1_4_4 (tmp_1_4_4, tmp_0_3_1, tmp_0_2_1, tmp_0_1_1, tmp_0_0_1, Cin);
  nand getCout (Cout, tmp_1_4_0, tmp_1_4_1, tmp_1_4_2, tmp_1_4_3, tmp_1_4_4);

  assign S = {S3, S2, S1, S0};

endmodule

