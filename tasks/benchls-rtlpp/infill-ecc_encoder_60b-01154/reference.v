module rtlpp_01154 (din, dout);

input  [59:0] din;
output [67:0] dout;

reg [7:0] chk;

always @(*) begin
    chk[7] = din[57] ^ din[54] ^ din[52] ^ din[49] ^ din[47] ^ din[44] ^ din[41] ^ din[38] ^ din[35] ^ din[33] ^ din[31] ^ din[27] ^ din[25] ^ din[23] ^ din[19] ^ din[18] ^ din[14] ^ din[11] ^ din[10] ^ din[6] ^ din[5] ^ din[2] ^ din[0];
    chk[6] = din[57] ^ din[55] ^ din[52] ^ din[49] ^ din[46] ^ din[44] ^ din[42] ^ din[39] ^ din[36] ^ din[34] ^ din[30] ^ din[28] ^ din[26] ^ din[22] ^ din[20] ^ din[17] ^ din[14] ^ din[13] ^ din[9] ^ din[6] ^ din[4] ^ din[2] ^ din[1];
    chk[5] = din[58] ^ din[55] ^ din[52] ^ din[50] ^ din[47] ^ din[45] ^ din[41] ^ din[39] ^ din[36] ^ din[33] ^ din[31] ^ din[29] ^ din[25] ^ din[24] ^ din[21] ^ din[17] ^ din[16] ^ din[12] ^ din[9] ^ din[8] ^ din[7] ^ din[2] ^ din[1];
    chk[4] = din[58] ^ din[55] ^ din[53] ^ din[50] ^ din[47] ^ din[44] ^ din[43] ^ din[40] ^ din[37] ^ din[34] ^ din[32] ^ din[28] ^ din[26] ^ din[23] ^ din[20] ^ din[18] ^ din[15] ^ din[12] ^ din[11] ^ din[7] ^ din[5] ^ din[3] ^ din[1];
    chk[3] = din[58] ^ din[56] ^ din[53] ^ din[51] ^ din[48] ^ din[45] ^ din[42] ^ din[39] ^ din[37] ^ din[34] ^ din[31] ^ din[29] ^ din[27] ^ din[23] ^ din[22] ^ din[19] ^ din[15] ^ din[13] ^ din[10] ^ din[8] ^ din[6] ^ din[3] ^ din[1] ^ din[0];
    chk[2] = din[59] ^ din[56] ^ din[53] ^ din[50] ^ din[48] ^ din[45] ^ din[42] ^ din[40] ^ din[38] ^ din[35] ^ din[32] ^ din[30] ^ din[26] ^ din[25] ^ din[21] ^ din[18] ^ din[16] ^ din[14] ^ din[10] ^ din[9] ^ din[4] ^ din[3] ^ din[1] ^ din[0];
    chk[1] = din[59] ^ din[56] ^ din[54] ^ din[51] ^ din[49] ^ din[46] ^ din[43] ^ din[40] ^ din[37] ^ din[35] ^ din[33] ^ din[29] ^ din[27] ^ din[24] ^ din[21] ^ din[20] ^ din[17] ^ din[13] ^ din[11] ^ din[7] ^ din[4] ^ din[3] ^ din[2] ^ din[0];
    chk[0] = din[59] ^ din[57] ^ din[54] ^ din[51] ^ din[48] ^ din[46] ^ din[43] ^ din[41] ^ din[38] ^ din[36] ^ din[32] ^ din[30] ^ din[28] ^ din[24] ^ din[22] ^ din[19] ^ din[16] ^ din[15] ^ din[12] ^ din[8] ^ din[5] ^ din[3] ^ din[2] ^ din[0];
end

assign dout = {chk, din};

endmodule