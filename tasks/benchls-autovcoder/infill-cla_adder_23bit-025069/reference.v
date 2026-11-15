module autovcoder_025069 (
    output [22:0] sum,
    output cout,
    input [22:0] in1,
    input [22:0] in2
);

  wire [22:0] G;
  wire [22:0] C;
  wire [22:0] P;

  assign G[0]  = in1[22] & in2[22];
  assign P[0]  = in1[22] ^ in2[22];
  assign G[1]  = in1[21] & in2[21];
  assign P[1]  = in1[21] ^ in2[21];
  assign G[2]  = in1[20] & in2[20];
  assign P[2]  = in1[20] ^ in2[20];
  assign G[3]  = in1[19] & in2[19];
  assign P[3]  = in1[19] ^ in2[19];
  assign G[4]  = in1[18] & in2[18];
  assign P[4]  = in1[18] ^ in2[18];
  assign G[5]  = in1[17] & in2[17];
  assign P[5]  = in1[17] ^ in2[17];
  assign G[6]  = in1[16] & in2[16];
  assign P[6]  = in1[16] ^ in2[16];
  assign G[7]  = in1[15] & in2[15];
  assign P[7]  = in1[15] ^ in2[15];
  assign G[8]  = in1[14] & in2[14];
  assign P[8]  = in1[14] ^ in2[14];
  assign G[9]  = in1[13] & in2[13];
  assign P[9]  = in1[13] ^ in2[13];
  assign G[10] = in1[12] & in2[12];
  assign P[10] = in1[12] ^ in2[12];
  assign G[11] = in1[11] & in2[11];
  assign P[11] = in1[11] ^ in2[11];
  assign G[12] = in1[10] & in2[10];
  assign P[12] = in1[10] ^ in2[10];
  assign G[13] = in1[9] & in2[9];
  assign P[13] = in1[9] ^ in2[9];
  assign G[14] = in1[8] & in2[8];
  assign P[14] = in1[8] ^ in2[8];
  assign G[15] = in1[7] & in2[7];
  assign P[15] = in1[7] ^ in2[7];
  assign G[16] = in1[6] & in2[6];
  assign P[16] = in1[6] ^ in2[6];
  assign G[17] = in1[5] & in2[5];
  assign P[17] = in1[5] ^ in2[5];
  assign G[18] = in1[4] & in2[4];
  assign P[18] = in1[4] ^ in2[4];
  assign G[19] = in1[3] & in2[3];
  assign P[19] = in1[3] ^ in2[3];
  assign G[20] = in1[2] & in2[2];
  assign P[20] = in1[2] ^ in2[2];
  assign G[21] = in1[1] & in2[1];
  assign P[21] = in1[1] ^ in2[1];
  assign G[22] = in1[0] & in2[0];
  assign P[22] = in1[0] ^ in2[0];


  assign C[0]  = 0;  /* Carry_out = Ci+1 = Gi + Pi*Ci */
  ;
  assign C[1]  = G[0] | (P[0] & C[0]);
  assign C[2]  = G[1] | (P[1] & C[1]);
  assign C[3]  = G[2] | (P[2] & C[2]);
  assign C[4]  = G[3] | (P[3] & C[3]);
  assign C[5]  = G[4] | (P[4] & C[4]);
  assign C[6]  = G[5] | (P[5] & C[5]);
  assign C[7]  = G[6] | (P[6] & C[6]);
  assign C[8]  = G[7] | (P[7] & C[7]);
  assign C[9]  = G[8] | (P[8] & C[8]);
  assign C[10] = G[9] | (P[9] & C[9]);
  assign C[11] = G[10] | (P[10] & C[10]);
  assign C[12] = G[11] | (P[11] & C[11]);
  assign C[13] = G[12] | (P[12] & C[12]);
  assign C[14] = G[13] | (P[13] & C[13]);
  assign C[15] = G[14] | (P[14] & C[14]);
  assign C[16] = G[15] | (P[15] & C[15]);
  assign C[17] = G[16] | (P[16] & C[16]);
  assign C[18] = G[17] | (P[17] & C[17]);
  assign C[19] = G[18] | (P[18] & C[18]);
  assign C[20] = G[19] | (P[19] & C[19]);
  assign C[21] = G[20] | (P[20] & C[20]);
  assign C[22] = G[21] | (P[21] & C[21]);
  assign cout  = G[22] | (P[22] & C[22]);
  assign sum   = P ^ C;
endmodule

