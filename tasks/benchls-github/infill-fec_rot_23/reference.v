module fec_rot_23 (
    input [31:0] c,
    output [31:0] co
);

assign co[0] =
    c[9] ^ c[18] ^ c[20] ^ c[27] ^ c[30] ^ c[31];

assign co[1] =
    c[10] ^ c[19] ^ c[21] ^ c[28] ^ c[31];

assign co[2] =
    c[9] ^ c[11] ^ c[18] ^ c[22] ^ c[27] ^ c[29] ^ 
    c[30] ^ c[31];

assign co[3] =
    c[10] ^ c[12] ^ c[19] ^ c[23] ^ c[28] ^ c[30] ^ 
    c[31];

assign co[4] =
    c[11] ^ c[13] ^ c[20] ^ c[24] ^ c[29] ^ c[31];

assign co[5] =
    c[12] ^ c[14] ^ c[21] ^ c[25] ^ c[30];

assign co[6] =
    c[13] ^ c[15] ^ c[22] ^ c[26] ^ c[31];

assign co[7] =
    c[14] ^ c[16] ^ c[23] ^ c[27];

assign co[8] =
    c[15] ^ c[17] ^ c[24] ^ c[28];

assign co[9] =
    c[16] ^ c[18] ^ c[25] ^ c[29];

assign co[10] =
    c[17] ^ c[19] ^ c[26] ^ c[30];

assign co[11] =
    c[9] ^ c[30];

assign co[12] =
    c[10] ^ c[31];

assign co[13] =
    c[11];

assign co[14] =
    c[12];

assign co[15] =
    c[13];

assign co[16] =
    c[14];

assign co[17] =
    c[15];

assign co[18] =
    c[16];

assign co[19] =
    c[17];

assign co[20] =
    c[18];

assign co[21] =
    c[9] ^ c[18] ^ c[19] ^ c[20] ^ c[27] ^ c[30] ^ 
    c[31];

assign co[22] =
    c[10] ^ c[19] ^ c[20] ^ c[21] ^ c[28] ^ c[31];

assign co[23] =
    c[0] ^ c[9] ^ c[11] ^ c[18] ^ c[21] ^ c[22] ^ 
    c[27] ^ c[29] ^ c[30] ^ c[31];

assign co[24] =
    c[1] ^ c[10] ^ c[12] ^ c[19] ^ c[22] ^ c[23] ^ 
    c[28] ^ c[30] ^ c[31];

assign co[25] =
    c[2] ^ c[11] ^ c[13] ^ c[20] ^ c[23] ^ c[24] ^ 
    c[29] ^ c[31];

assign co[26] =
    c[3] ^ c[12] ^ c[14] ^ c[21] ^ c[24] ^ c[25] ^ 
    c[30];

assign co[27] =
    c[4] ^ c[13] ^ c[15] ^ c[22] ^ c[25] ^ c[26] ^ 
    c[31];

assign co[28] =
    c[5] ^ c[14] ^ c[16] ^ c[23] ^ c[26] ^ c[27];

assign co[29] =
    c[6] ^ c[15] ^ c[17] ^ c[24] ^ c[27] ^ c[28];

assign co[30] =
    c[7] ^ c[16] ^ c[18] ^ c[25] ^ c[28] ^ c[29];

assign co[31] =
    c[8] ^ c[17] ^ c[19] ^ c[26] ^ c[29] ^ c[30];

endmodule