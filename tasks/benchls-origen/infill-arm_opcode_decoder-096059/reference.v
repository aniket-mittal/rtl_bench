module origen_096059 (
    input [31:0] Instruction,
    output reg [3:0] OPOut
);

    wire [10:0] OpCode;
    assign OpCode = Instruction[31:21];

    always @* begin
        casex (OpCode)
            11'b1001000100x: OPOut = 4'b0000; // ADDI-like
            11'b10101011000: OPOut = 4'b0001; // ADD
            11'b01010100xxx: OPOut = 4'b0010; // B.cond
            11'b000101xxxxx: OPOut = 4'b0011; // B
            11'b100101xxxxx: OPOut = 4'b0100; // BL
            11'b11010110000: OPOut = 4'b0101; // BR
            11'b10110100xxx: OPOut = 4'b0110; // CBZ
            11'b11111000010: OPOut = 4'b0111; // LDUR
            11'b11111000000: OPOut = 4'b1000; // STUR
            11'b11101011000: OPOut = 4'b1001; // SUBS
            default: OPOut = 4'bXXXX;
        endcase
    end

endmodule

