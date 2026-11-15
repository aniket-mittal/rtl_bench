module rtlpp_00351(
    input               nrst,
    input               clock,
    input               enable,
    input   [7 : 0]     din,
    output  [31 : 0]    crc_o
);
    wire    [31 : 0]    CrcNext;
    wire    [7 : 0]     Data;
    reg     [31 : 0]    Crc;

    // Generate block replaced with manual bit assignment
    assign Data[0] = din[7];
    assign Data[1] = din[6];
    assign Data[2] = din[5];
    assign Data[3] = din[4];
    assign Data[4] = din[3];
    assign Data[5] = din[2];
    assign Data[6] = din[1];
    assign Data[7] = din[0];

    assign CrcNext[0] = Crc[24] ^ Crc[30] ^ Data[0] ^ Data[6];
    assign CrcNext[1] = Crc[24] ^ Crc[25] ^ Crc[30] ^ Crc[31] ^ Data[0] ^ Data[1] ^ Data[6] ^ Data[7];
    assign CrcNext[2] = Crc[24] ^ Crc[25] ^ Crc[26] ^ Crc[30] ^ Crc[31] ^ Data[0] ^ Data[1] ^ Data[2] ^ Data[6] ^ Data[7];
    assign CrcNext[3] = Crc[25] ^ Crc[26] ^ Crc[27] ^ Crc[31] ^ Data[1] ^ Data[2] ^ Data[3] ^ Data[7];
    assign CrcNext[4] = Crc[24] ^ Crc[26] ^ Crc[27] ^ Crc[28] ^ Crc[30] ^ Data[0] ^ Data[2] ^ Data[3] ^ Data[4] ^ Data[6];
    assign CrcNext[5] = Crc[24] ^ Crc[25] ^ Crc[27] ^ Crc[28] ^ Crc[29] ^ Crc[30] ^ Crc[31] ^ Data[0] ^ Data[1] ^ Data[3] ^ Data[4] ^ Data[5] ^ Data[6] ^ Data[7];
    assign CrcNext[6] = Crc[25] ^ Crc[26] ^ Crc[28] ^ Crc[29] ^ Crc[30] ^ Crc[31] ^ Data[1] ^ Data[2] ^ Data[4] ^ Data[5] ^ Data[6] ^ Data[7];
    assign CrcNext[7] = Crc[24] ^ Crc[26] ^ Crc[27] ^ Crc[29] ^ Crc[31] ^ Data[0] ^ Data[2] ^ Data[3] ^ Data[5] ^ Data[7];
    assign CrcNext[8] = Crc[0] ^ Crc[24] ^ Crc[25] ^ Crc[27] ^ Crc[28] ^ Data[0] ^ Data[1] ^ Data[3] ^ Data[4];
    assign CrcNext[9] = Crc[1] ^ Crc[25] ^ Crc[26] ^ Crc[28] ^ Crc[29] ^ Data[1] ^ Data[2] ^ Data[4] ^ Data[5];
    assign CrcNext[10] = Crc[2] ^ Crc[24] ^ Crc[26] ^ Crc[27] ^ Crc[29] ^ Data[0] ^ Data[2] ^ Data[3] ^ Data[5];
    assign CrcNext[11] = Crc[3] ^ Crc[24] ^ Crc[25] ^ Crc[27] ^ Crc[28] ^ Data[0] ^ Data[1] ^ Data[3] ^ Data[4];
    assign CrcNext[12] = Crc[4] ^ Crc[24] ^ Crc[25] ^ Crc[26] ^ Crc[28] ^ Crc[29] ^ Crc[30] ^ Data[0] ^ Data[1] ^ Data[2] ^ Data[4] ^ Data[5] ^ Data[6];
    assign CrcNext[13] = Crc[5] ^ Crc[25] ^ Crc[26] ^ Crc[27] ^ Crc[29] ^ Crc[30] ^ Crc[31] ^ Data[1] ^ Data[2] ^ Data[3] ^ Data[5] ^ Data[6] ^ Data[7];
    assign CrcNext[14] = Crc[6] ^ Crc[26] ^ Crc[27] ^ Crc[28] ^ Crc[30] ^ Crc[31] ^ Data[2] ^ Data[3] ^ Data[4] ^ Data[6] ^ Data[7];
    assign CrcNext[15] =  Crc[7] ^ Crc[27] ^ Crc[28] ^ Crc[29] ^ Crc[31] ^ Data[3] ^ Data[4] ^ Data[5] ^ Data[7];
    assign CrcNext[16] = Crc[8] ^ Crc[24] ^ Crc[28] ^ Crc[29] ^ Data[0] ^ Data[4] ^ Data[5];
    assign CrcNext[17] = Crc[9] ^ Crc[25] ^ Crc[29] ^ Crc[30] ^ Data[1] ^ Data[5] ^ Data[6];
    assign CrcNext[18] = Crc[10] ^ Crc[26] ^ Crc[30] ^ Crc[31] ^ Data[2] ^ Data[6] ^ Data[7];
    assign CrcNext[19] = Crc[11] ^ Crc[27] ^ Crc[31] ^ Data[3] ^ Data[7];
    assign CrcNext[20] = Crc[12] ^ Crc[28] ^ Data[4];
    assign CrcNext[21] = Crc[13] ^ Crc[29] ^ Data[5];
    assign CrcNext[22] = Crc[14] ^ Crc[24] ^ Data[0];
    assign CrcNext[23] = Crc[15] ^ Crc[24] ^ Crc[25] ^ Crc[30] ^ Data[0] ^ Data[1] ^ Data[6];
    assign CrcNext[24] = Crc[16] ^ Crc[25] ^ Crc[26] ^ Crc[31] ^ Data[1] ^ Data[2] ^ Data[7];
    assign CrcNext[25] = Crc[17] ^ Crc[26] ^ Crc[27] ^ Data[2] ^ Data[3];
    assign CrcNext[26] = Crc[18] ^ Crc[24] ^ Crc[27] ^ Crc[28] ^ Crc[30] ^ Data[0] ^ Data[3] ^ Data[4] ^ Data[6];
    assign CrcNext[27] = Crc[19] ^ Crc[25] ^ Crc[28] ^ Crc[29] ^ Crc[31] ^ Data[1] ^ Data[4] ^ Data[5] ^ Data[7];
    assign CrcNext[28] = Crc[20] ^ Crc[26] ^ Crc[29] ^ Crc[30] ^ Data[2] ^ Data[5] ^ Data[6];
    assign CrcNext[29] = Crc[21] ^ Crc[27] ^ Crc[30] ^ Crc[31] ^ Data[3] ^ Data[6] ^ Data[7];
    assign CrcNext[30] = Crc[22] ^ Crc[28] ^ Crc[31] ^ Data[4] ^ Data[7];
    assign CrcNext[31] = Crc[23] ^ Crc[29] ^ Data[5];

    always @ (posedge clock)begin
        if (!nrst)
            Crc <= 32'hFFFFFFFF;
        else if (enable)
            Crc <= CrcNext;
    end

    // Generate block replaced with manual bit assignment
    assign crc_o[0] = ~Crc[31];
    assign crc_o[1] = ~Crc[30];
    assign crc_o[2] = ~Crc[29];
    assign crc_o[3] = ~Crc[28];
    assign crc_o[4] = ~Crc[27];
    assign crc_o[5] = ~Crc[26];
    assign crc_o[6] = ~Crc[25];
    assign crc_o[7] = ~Crc[24];
    assign crc_o[8] = ~Crc[23];
    assign crc_o[9] = ~Crc[22];
    assign crc_o[10] = ~Crc[21];
    assign crc_o[11] = ~Crc[20];
    assign crc_o[12] = ~Crc[19];
    assign crc_o[13] = ~Crc[18];
    assign crc_o[14] = ~Crc[17];
    assign crc_o[15] = ~Crc[16];
    assign crc_o[16] = ~Crc[15];
    assign crc_o[17] = ~Crc[14];
    assign crc_o[18] = ~Crc[13];
    assign crc_o[19] = ~Crc[12];
    assign crc_o[20] = ~Crc[11];
    assign crc_o[21] = ~Crc[10];
    assign crc_o[22] = ~Crc[9];
    assign crc_o[23] = ~Crc[8];
    assign crc_o[24] = ~Crc[7];
    assign crc_o[25] = ~Crc[6];
    assign crc_o[26] = ~Crc[5];
    assign crc_o[27] = ~Crc[4];
    assign crc_o[28] = ~Crc[3];
    assign crc_o[29] = ~Crc[2];
    assign crc_o[30] = ~Crc[1];
    assign crc_o[31] = ~Crc[0];

endmodule