module origen_050509(
    input [5:0] opcode,
    input zero,
    input sign,
    output reg RegWre,
    output reg PCWre,
    output reg ALUSrcA,
    output reg ALUSrcB,
    output reg [2:0] ALUOp,
    output reg InsMemRW,
    output reg DBDataSrc,
    output reg RegDst,
    output reg NRD,
    output reg NWR,
    output reg [1:0] PCSrc,
    output reg ExtSel
);

always @(*) begin
    // Default values
    RegWre = 1'b1;
    PCWre = 1'b1;
    ALUSrcA = 1'b0;
    ALUSrcB = 1'b0;
    ALUOp = 3'b000;
    InsMemRW = 1'b1;
    DBDataSrc = 1'b0;
    RegDst = 1'b0;
    NRD = 1'b1;
    NWR = 1'b1;
    PCSrc = 2'b00;
    ExtSel = 1'b0;

    case(opcode)
        6'b000000: begin // R-type instructions
            RegDst = 1'b1;
            ALUOp = 3'b010;
        end
        6'b001000: begin // ADDI
            ALUSrcB = 1'b1;
            ExtSel = 1'b1;
        end
        6'b001100: begin // ANDI
            ALUSrcB = 1'b1;
            ALUOp = 3'b000;
        end
        6'b001101: begin // ORI
            ALUSrcB = 1'b1;
            ALUOp = 3'b001;
        end
        6'b001110: begin // XORI
            ALUSrcB = 1'b1;
            ALUOp = 3'b011;
        end
        6'b100011: begin // LW
            ALUSrcB = 1'b1;
            ExtSel = 1'b1;
            DBDataSrc = 1'b1;
            NRD = 1'b0;
        end
        6'b101011: begin // SW
            ALUSrcB = 1'b1;
            ExtSel = 1'b1;
            RegWre = 1'b0;
            NWR = 1'b0;
        end
        6'b000100: begin // BEQ
            RegWre = 1'b0;
            ALUOp = 3'b110;
            PCSrc = zero ? 2'b01 : 2'b00;
        end
        6'b000101: begin // BNE
            RegWre = 1'b0;
            ALUOp = 3'b110;
            PCSrc = zero ? 2'b00 : 2'b01;
        end
        6'b000010: begin // J
            RegWre = 1'b0;
            PCSrc = 2'b10;
        end
        6'b000011: begin // JAL
            RegDst = 1'b1;
            PCSrc = 2'b10;
        end
        6'b011000: begin // MULT
            RegWre = 1'b0;
            ALUSrcA = 1'b1;
            ALUOp = 3'b100;
        end
        6'b011010: begin // DIV
            RegWre = 1'b0;
            ALUOp = 3'b101;
        end
        6'b111111: begin // HALT
            RegWre = 1'b0;
            PCWre = 1'b0;
        end
        default: begin
            // Default case (NOP)
            RegWre = 1'b0;
        end
    endcase
end

endmodule