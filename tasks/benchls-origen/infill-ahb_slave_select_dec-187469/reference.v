module origen_187469(
    HSEL,
    HADDR,
    SSEL
);

input HSEL;
input [16:7] HADDR;
output reg [31:0] SSEL;

reg [31:0] SELI;

always @(*) begin
    SELI = 32'b0;
    case (HADDR[16:7])
        10'h000: SELI[0] = 1'b1;
        10'h001: SELI[1] = 1'b1;
        10'h002: SELI[2] = 1'b1;
        10'h003: SELI[3] = 1'b1;
        10'h004: SELI[4] = 1'b1;
        10'h005: SELI[5] = 1'b1;
        10'h006: SELI[6] = 1'b1;
        10'h007: SELI[7] = 1'b1;
        10'h008: SELI[8] = 1'b1;
        10'h009: SELI[9] = 1'b1;
        10'h00A: SELI[10] = 1'b1;
        10'h00B: SELI[11] = 1'b1;
        10'h00C: SELI[12] = 1'b1;
        10'h00D: SELI[13] = 1'b1;
        10'h00E: SELI[14] = 1'b1;
        10'h00F: SELI[15] = 1'b1;
        10'h010: SELI[16] = 1'b1;
        10'h011: SELI[17] = 1'b1;
        10'h012: SELI[18] = 1'b1;
        10'h013: SELI[19] = 1'b1;
        10'h014: SELI[20] = 1'b1;
        10'h015: SELI[21] = 1'b1;
        10'h016: SELI[22] = 1'b1;
        10'h017: SELI[23] = 1'b1;
        10'h018: SELI[24] = 1'b1;
        10'h019: SELI[25] = 1'b1;
        10'h01A: SELI[26] = 1'b1;
        10'h01B: SELI[27] = 1'b1;
        10'h01C: SELI[28] = 1'b1;
        10'h01D: SELI[29] = 1'b1;
        10'h01E: SELI[30] = 1'b1;
        10'h01F: SELI[31] = 1'b1;
    endcase
end

always @(*) begin
    SSEL = SELI & {32{HSEL}};
end

endmodule