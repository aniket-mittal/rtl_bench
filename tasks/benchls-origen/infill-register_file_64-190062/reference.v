module origen_190062 (
    input iCLK,
    input iReset,
    input [4:0] iAddressRm,
    input [4:0] iAddressRn,
    input [4:0] iAddressRt,
    input [63:0] iWriteData,
    input iRegControlWrite,
    input [4:0] iRegisterShow,
    output [63:0] oRead1,
    output [63:0] oRead2,
    output [63:0] oRegisterShow
);

    reg [63:0] registers [0:31];

    initial begin
        registers[0] = 64'h0;
        registers[1] = 64'h0;
        registers[2] = 64'h0;
        registers[3] = 64'h0;
        registers[4] = 64'h0;
        registers[5] = 64'h0;
        registers[6] = 64'h0;
        registers[7] = 64'h0;
        registers[8] = 64'h0;
        registers[9] = 64'h0;
        registers[10] = 64'h0;
        registers[11] = 64'h0;
        registers[12] = 64'h0;
        registers[13] = 64'h0;
        registers[14] = 64'h0;
        registers[15] = 64'h0;
        registers[16] = 64'h0;
        registers[17] = 64'h0;
        registers[18] = 64'h0;
        registers[19] = 64'h0;
        registers[20] = 64'h0;
        registers[21] = 64'h0;
        registers[22] = 64'h0;
        registers[23] = 64'h0;
        registers[24] = 64'h0;
        registers[25] = 64'h0;
        registers[26] = 64'h0;
        registers[27] = 64'h0;
        registers[28] = 64'h7fffeffc;
        registers[29] = 64'h0;
        registers[30] = 64'h0;
        registers[31] = 64'h0;
    end

    always @(posedge iCLK) begin
        if (iReset) begin
            registers[0] <= 64'h0;
            registers[1] <= 64'h0;
            registers[2] <= 64'h0;
            registers[3] <= 64'h0;
            registers[4] <= 64'h0;
            registers[5] <= 64'h0;
            registers[6] <= 64'h0;
            registers[7] <= 64'h0;
            registers[8] <= 64'h0;
            registers[9] <= 64'h0;
            registers[10] <= 64'h0;
            registers[11] <= 64'h0;
            registers[12] <= 64'h0;
            registers[13] <= 64'h0;
            registers[14] <= 64'h0;
            registers[15] <= 64'h0;
            registers[16] <= 64'h0;
            registers[17] <= 64'h0;
            registers[18] <= 64'h0;
            registers[19] <= 64'h0;
            registers[20] <= 64'h0;
            registers[21] <= 64'h0;
            registers[22] <= 64'h0;
            registers[23] <= 64'h0;
            registers[24] <= 64'h0;
            registers[25] <= 64'h0;
            registers[26] <= 64'h0;
            registers[27] <= 64'h0;
            registers[29] <= 64'h0;
            registers[30] <= 64'h0;
            registers[31] <= 64'h0;
        end else if (iRegControlWrite && iAddressRt != 5'b11111) begin
            registers[iAddressRt] <= iWriteData;
        end
    end

    assign oRead1 = registers[iAddressRm];
    assign oRead2 = registers[iAddressRn];
    assign oRegisterShow = registers[iRegisterShow];

endmodule