module fec_rot_7 (
    input [31:0] c,
    output [31:0] co
);

assign co[0] =
    c[25];

assign co[1] =
    c[26];

assign co[2] =
    c[25] ^ c[27];

assign co[3] =
    c[26] ^ c[28];

assign co[4] =
    c[27] ^ c[29];

assign co[5] =
    c[28] ^ c[30];

assign co[6] =
    c[29] ^ c[31];

assign co[7] =
    c[0] ^ c[30];

assign co[8] =
    c[1] ^ c[31];

assign co[9] =
    c[2];

assign co[10] =
    c[3];

assign co[11] =
    c[4] ^ c[25];

assign co[12] =
    c[5] ^ c[26];

assign co[13] =
    c[6] ^ c[27];

assign co[14] =
    c[7] ^ c[28];

assign co[15] =
    c[8] ^ c[29];

assign co[16] =
    c[9] ^ c[30];

assign co[17] =
    c[10] ^ c[31];

assign co[18] =
    c[11];

assign co[19] =
    c[12];

assign co[20] =
    c[13];

assign co[21] =
    c[14] ^ c[25];

assign co[22] =
    c[15] ^ c[26];

assign co[23] =
    c[16] ^ c[25] ^ c[27];

assign co[24] =
    c[17] ^ c[26] ^ c[28];

assign co[25] =
    c[18] ^ c[27] ^ c[29];

assign co[26] =
    c[19] ^ c[28] ^ c[30];

assign co[27] =
    c[20] ^ c[29] ^ c[31];

assign co[28] =
    c[21] ^ c[30];

assign co[29] =
    c[22] ^ c[31];

assign co[30] =
    c[23];

assign co[31] =
    c[24];

endmodule