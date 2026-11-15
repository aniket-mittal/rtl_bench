module fec_rot_16 (
    input [31:0] c,
    output [31:0] co
);

assign co[0] =
    c[16] ^ c[25] ^ c[27];

assign co[1] =
    c[17] ^ c[26] ^ c[28];

assign co[2] =
    c[16] ^ c[18] ^ c[25] ^ c[29];

assign co[3] =
    c[17] ^ c[19] ^ c[26] ^ c[30];

assign co[4] =
    c[18] ^ c[20] ^ c[27] ^ c[31];

assign co[5] =
    c[19] ^ c[21] ^ c[28];

assign co[6] =
    c[20] ^ c[22] ^ c[29];

assign co[7] =
    c[21] ^ c[23] ^ c[30];

assign co[8] =
    c[22] ^ c[24] ^ c[31];

assign co[9] =
    c[23] ^ c[25];

assign co[10] =
    c[24] ^ c[26];

assign co[11] =
    c[16];

assign co[12] =
    c[17];

assign co[13] =
    c[18];

assign co[14] =
    c[19];

assign co[15] =
    c[20];

assign co[16] =
    c[0] ^ c[21];

assign co[17] =
    c[1] ^ c[22];

assign co[18] =
    c[2] ^ c[23];

assign co[19] =
    c[3] ^ c[24];

assign co[20] =
    c[4] ^ c[25];

assign co[21] =
    c[5] ^ c[16] ^ c[25] ^ c[26] ^ c[27];

assign co[22] =
    c[6] ^ c[17] ^ c[26] ^ c[27] ^ c[28];

assign co[23] =
    c[7] ^ c[16] ^ c[18] ^ c[25] ^ c[28] ^ c[29];

assign co[24] =
    c[8] ^ c[17] ^ c[19] ^ c[26] ^ c[29] ^ c[30];

assign co[25] =
    c[9] ^ c[18] ^ c[20] ^ c[27] ^ c[30] ^ c[31];

assign co[26] =
    c[10] ^ c[19] ^ c[21] ^ c[28] ^ c[31];

assign co[27] =
    c[11] ^ c[20] ^ c[22] ^ c[29];

assign co[28] =
    c[12] ^ c[21] ^ c[23] ^ c[30];

assign co[29] =
    c[13] ^ c[22] ^ c[24] ^ c[31];

assign co[30] =
    c[14] ^ c[23] ^ c[25];

assign co[31] =
    c[15] ^ c[24] ^ c[26];

endmodule