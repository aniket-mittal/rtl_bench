module fec_rot_3 (
    input [31:0] c,
    output [31:0] co
);

assign co[0] =
    c[29];

assign co[1] =
    c[30];

assign co[2] =
    c[29] ^ c[31];

assign co[3] =
    c[0] ^ c[30];

assign co[4] =
    c[1] ^ c[31];

assign co[5] =
    c[2];

assign co[6] =
    c[3];

assign co[7] =
    c[4];

assign co[8] =
    c[5];

assign co[9] =
    c[6];

assign co[10] =
    c[7];

assign co[11] =
    c[8] ^ c[29];

assign co[12] =
    c[9] ^ c[30];

assign co[13] =
    c[10] ^ c[31];

assign co[14] =
    c[11];

assign co[15] =
    c[12];

assign co[16] =
    c[13];

assign co[17] =
    c[14];

assign co[18] =
    c[15];

assign co[19] =
    c[16];

assign co[20] =
    c[17];

assign co[21] =
    c[18] ^ c[29];

assign co[22] =
    c[19] ^ c[30];

assign co[23] =
    c[20] ^ c[29] ^ c[31];

assign co[24] =
    c[21] ^ c[30];

assign co[25] =
    c[22] ^ c[31];

assign co[26] =
    c[23];

assign co[27] =
    c[24];

assign co[28] =
    c[25];

assign co[29] =
    c[26];

assign co[30] =
    c[27];

assign co[31] =
    c[28];

endmodule