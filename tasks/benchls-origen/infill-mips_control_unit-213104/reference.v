module origen_213104(
    input [5:0] Opcode,
    input [5:0] Function_opcode,
    input [21:0] Alu_resultHigh,
    output reg Jrn,
    output reg RegDST,
    output reg ALUSrc,
    output reg MemIOtoReg,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg IORead,
    output reg IOWrite,
    output reg Branch,
    output reg nBranch,
    output reg Jmp,
    output reg Jal,
    output reg I_format,
    output reg Sftmd,
    output reg [1:0] ALUOp
);

always @(*) begin
    Jrn = 1'b0;
    RegDST = 1'b0;
    ALUSrc = 1'b0;
    MemIOtoReg = 1'b0;
    RegWrite = 1'b0;
    MemRead = 1'b0;
    MemWrite = 1'b0;
    IORead = 1'b0;
    IOWrite = 1'b0;
    Branch = 1'b0;
    nBranch = 1'b0;
    Jmp = 1'b0;
    Jal = 1'b0;
    I_format = 1'b0;
    Sftmd = 1'b0;
    ALUOp = 2'b00;

    case (Opcode)
        6'b000000: begin // R-format
            RegDST = 1'b1;
            RegWrite = 1'b1;
            Sftmd = (Function_opcode[5:0] == 6'b000000) | (Function_opcode[5:0] == 6'b000010) | (Function_opcode[5:0] == 6'b000011) | (Function_opcode[5:0] == 6'b000100) | (Function_opcode[5:0] == 6'b000110);
            ALUOp = 2'b10;
            if (Function_opcode[5:0] == 6'b001000) begin // jr
                Jrn = 1'b1;
            end
        end
        6'b100011: begin // Lw
            ALUSrc = 1'b1;
            MemIOtoReg = 1'b1;
            RegWrite = 1'b1;
            MemRead = 1'b1;
            ALUOp = 2'b00;
        end
        6'b101011: begin // Sw
            ALUSrc = 1'b1;
            MemWrite = 1'b1;
            ALUOp = 2'b00;
        end
        6'b000100: begin // beq
            Branch = 1'b1;
            ALUOp = 2'b01;
        end
        6'b000101: begin // bne
            nBranch = 1'b1;
            ALUOp = 2'b01;
        end
        6'b000010: begin // j
            Jmp = 1'b1;
        end
        6'b000011: begin // jal
            Jal = 1'b1;
            RegWrite = 1'b1;
        end
        default: begin // I-format
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
            I_format = 1'b1;
            ALUOp = 2'b00;
        end
    endcase

    if (Alu_resultHigh[21:16] == 6'b111111) begin
        IORead = MemRead;
        IOWrite = MemWrite;
        MemRead = 1'b0;
        MemWrite = 1'b0;
    end
end
endmodule