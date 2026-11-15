module origen_150505(
    input [31:0] IF_ID_Inst,
    input [4:0] Instruction,
    output reg Branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite,
    output reg JALR,
    output reg JAL,
    output reg AUIPC,
    output reg ECALL,
    output reg [1:0] ALUOp
);

always @(*) begin
    case (Instruction)
        5'b01100: // R-type
            begin
                Branch = 1'b0;
                MemRead = 1'b0;
                MemtoReg = 1'b0;
                MemWrite = 1'b0;
                ALUSrc = 1'b0;
                RegWrite = 1'b1;
                JALR = 1'b0;
                JAL = 1'b0;
                AUIPC = 1'b0;
                ECALL = 1'b0;
                ALUOp = 2'b10;
            end
        5'b00000: // Load (LW)
            begin
                Branch = 1'b0;
                MemRead = 1'b1;
                MemtoReg = 1'b1;
                MemWrite = 1'b0;
                ALUSrc = 1'b1;
                RegWrite = 1'b1;
                JALR = 1'b0;
                JAL = 1'b0;
                AUIPC = 1'b0;
                ECALL = 1'b0;
                ALUOp = 2'b00;
            end
        5'b01000: // Store (SW)
            begin
                Branch = 1'b0;
                MemRead = 1'b0;
                MemtoReg = 1'b0;
                MemWrite = 1'b1;
                ALUSrc = 1'b1;
                RegWrite = 1'b0;
                JALR = 1'b0;
                JAL = 1'b0;
                AUIPC = 1'b0;
                ECALL = 1'b0;
                ALUOp = 2'b00;
            end
        5'b11000: // Branch (BEQ, BNE)
            begin
                Branch = 1'b1;
                MemRead = 1'b0;
                MemtoReg = 1'b0;
                MemWrite = 1'b0;
                ALUSrc = 1'b0;
                RegWrite = 1'b0;
                JALR = 1'b0;
                JAL = 1'b0;
                AUIPC = 1'b0;
                ECALL = 1'b0;
                ALUOp = 2'b01;
            end
        5'b11011: // Jump-and-Link (JAL)
            begin
                Branch = 1'b0;
                MemRead = 1'b0;
                MemtoReg = 1'b1;
                MemWrite = 1'b0;
                ALUSrc = 1'b1;
                RegWrite = 1'b1;
                JALR = 1'b0;
                JAL = 1'b1;
                AUIPC = 1'b0;
                ECALL = 1'b0;
                ALUOp = 2'b00;
            end
        5'b11001: // Jump-and-Link-Register (JALR)
            begin
                Branch = 1'b0;
                MemRead = 1'b0;
                MemtoReg = 1'b1;
                MemWrite = 1'b0;
                ALUSrc = 1'b1;
                RegWrite = 1'b1;
                JALR = 1'b1;
                JAL = 1'b0;
                AUIPC = 1'b0;
                ECALL = 1'b0;
                ALUOp = 2'b00;
            end
        5'b00101: // Add Upper Immediate to PC (AUIPC)
            begin
                Branch = 1'b0;
                MemRead = 1'b0;
                MemtoReg = 1'b0;
                MemWrite = 1'b0;
                ALUSrc = 1'b1;
                RegWrite = 1'b1;
                JALR = 1'b0;
                JAL = 1'b0;
                AUIPC = 1'b1;
                ECALL = 1'b0;
                ALUOp = 2'b00;
            end
        5'b11100: // Environment Call (ECALL)
            begin
                Branch = 1'b0;
                MemRead = 1'b0;
                MemtoReg = 1'b0;
                MemWrite = 1'b0;
                ALUSrc = 1'b0;
                RegWrite = 1'b0;
                JALR = 1'b0;
                JAL = 1'b0;
                AUIPC = 1'b0;
                ECALL = 1'b1;
                ALUOp = 2'b00;
            end
        default:
            begin
                Branch = 1'b0;
                MemRead = 1'b0;
                MemtoReg = 1'b0;
                MemWrite = 1'b0;
                ALUSrc = 1'b0;
                RegWrite = 1'b0;
                JALR = 1'b0;
                JAL = 1'b0;
                AUIPC = 1'b0;
                ECALL = 1'b0;
                ALUOp = 2'b00;
            end
    endcase
end

endmodule