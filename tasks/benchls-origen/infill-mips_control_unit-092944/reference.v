module origen_092944(
    input [5:0] op,
    input Zero,
    input Sign,
    output reg ExtSel,
    output reg PCWre,
    output reg InsMemRW,
    output reg RegDst,
    output reg RegWre,
    output reg [2:0] AluOp,
    output reg AluSrcA,
    output reg AluSrcB,
    output reg RD,
    output reg WR,
    output reg DBDataSrc,
    output reg [1:0] PCSrc
);

    always @(*) begin
        // Default values
        InsMemRW = 1'b1;  // Always read-only instruction memory
        PCWre = (op != 6'b111111);  // Enable PC write except for halt instruction
        ExtSel = 1'b0;
        RegDst = 1'b0;
        RegWre = 1'b0;
        AluOp = 3'b000;
        AluSrcA = 1'b0;
        AluSrcB = 1'b0;
        RD = 1'b0;
        WR = 1'b0;
        DBDataSrc = 1'b0;
        PCSrc = 2'b00;

        case(op)
            6'b000000: begin  // R-type instruction
                RegDst = 1'b1;
                RegWre = 1'b1;
                AluOp = 3'b010;
            end
            6'b001000: begin  // ADDI
                RegWre = 1'b1;
                AluOp = 3'b000;
                AluSrcB = 1'b1;
                ExtSel = 1'b1;
            end
            6'b001100: begin  // ANDI
                RegWre = 1'b1;
                AluOp = 3'b011;
                AluSrcB = 1'b1;
            end
            6'b001101: begin  // ORI
                RegWre = 1'b1;
                AluOp = 3'b100;
                AluSrcB = 1'b1;
            end
            6'b100011: begin  // LW
                RegWre = 1'b1;
                AluOp = 3'b000;
                AluSrcB = 1'b1;
                RD = 1'b1;
                DBDataSrc = 1'b1;
                ExtSel = 1'b1;
            end
            6'b101011: begin  // SW
                AluOp = 3'b000;
                AluSrcB = 1'b1;
                WR = 1'b1;
                ExtSel = 1'b1;
            end
            6'b000100: begin  // BEQ
                AluOp = 3'b001;
                PCSrc = Zero ? 2'b01 : 2'b00;
                ExtSel = 1'b1;
            end
            6'b000101: begin  // BNE
                AluOp = 3'b001;
                PCSrc = Zero ? 2'b00 : 2'b01;
                ExtSel = 1'b1;
            end
            6'b000010: begin  // J
                PCSrc = 2'b10;
            end
            6'b000111: begin  // BGTZ
                AluOp = 3'b001;
                PCSrc = (!Zero && !Sign) ? 2'b01 : 2'b00;
                ExtSel = 1'b1;
            end
            default: begin
                // Default case (NOP or unimplemented instruction)
            end
        endcase
    end

endmodule