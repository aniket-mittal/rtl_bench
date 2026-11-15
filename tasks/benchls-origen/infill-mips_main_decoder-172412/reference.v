module origen_172412(
    input [5:0] Opcode,
    input [5:0] Function_opcode,
    input [21:0] Alu_resultHigh,
    output reg Jrn,
    output reg RegDST,
    output reg ALUSrc,
    output reg MemorIOtoReg,
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
    MemorIOtoReg = 1'b0;
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
        6'b000000: begin // R-Format
            RegDST = 1'b1;
            RegWrite = 1'b1;
            Sftmd = 1'b1;
            case (Function_opcode)
                6'b001000: ALUOp = 2'b00; // Add
                6'b001001: ALUOp = 2'b01; // Sub
                6'b000010: ALUOp = 2'b10; // Sll
                6'b000011: ALUOp = 2'b10; // Srl
                6'b000100: ALUOp = 2'b10; // Sllv
                6'b000110: ALUOp = 2'b10; // Srlv
                6'b001101: ALUOp = 2'b11; // Or
                6'b001100: ALUOp = 2'b11; // And
                6'b100001: Jrn = 1'b1;
            endcase
        end
        6'b100011: begin // Lw
            ALUSrc = 1'b1;
            MemorIOtoReg = 1'b1;
            RegWrite = 1'b1;
            MemRead = 1'b1;
        end
        6'b101011: begin // Sw
            ALUSrc = 1'b1;
            MemWrite = 1'b1;
        end
        6'b100000: begin // Lb
            ALUSrc = 1'b1;
            MemorIOtoReg = 1'b1;
            RegWrite = 1'b1;
            IORead = 1'b1;
        end
        6'b100001: begin // Lh
            ALUSrc = 1'b1;
            MemorIOtoReg = 1'b1;
            RegWrite = 1'b1;
            IORead = 1'b1;
        end
        6'b101000: begin // Sb
            ALUSrc = 1'b1;
            IOWrite = 1'b1;
        end
        6'b101001: begin // Sh
            ALUSrc = 1'b1;
            IOWrite = 1'b1;
        end
        6'b000100: begin // Beq
            Branch = 1'b1;
            ALUOp = 2'b01;
        end
        6'b000101: begin // Bne
            nBranch = 1'b1;
            ALUOp = 2'b01;
        end
        6'b000010: begin // J
            Jmp = 1'b1;
        end
        6'b000011: begin // Jal
            Jal = 1'b1;
            RegWrite = 1'b1;
        end
        default: begin // I-Format
            I_format = 1'b1;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
            case (Opcode)
                6'b001000: ALUOp = 2'b00; // Addi
                6'b001100: ALUOp = 2'b11; // Andi
                6'b001101: ALUOp = 2'b11; // Ori
                6'b001010: ALUOp = 2'b01; // Slti
            endcase
        end
    endcase

    if (Alu_resultHigh != 22'b0) begin
        MemRead = 1'b0;
        MemWrite = 1'b0;
        IORead = 1'b0;
        IOWrite = 1'b0;
    end
end
endmodule