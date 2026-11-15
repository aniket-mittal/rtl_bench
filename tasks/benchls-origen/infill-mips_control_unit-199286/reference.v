module origen_199286(
    input [5:0] opcode,
    output reg RegDst,
    output reg Jump,
    output reg Branch,
    output reg Branch_ne,
    output reg MemRead,
    output reg MemWrite,
    output reg MemtoReg,
    output reg ALUSrc,
    output reg RegWrite
);

always @(*) begin
    case (opcode)
        6'b000000: begin // R-type instructions
            RegDst = 1'b1;
            Jump = 1'b0;
            Branch = 1'b0;
            Branch_ne = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            MemtoReg = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b1;
        end
        6'b000010: begin // Jump
            RegDst = 1'b0;
            Jump = 1'b1;
            Branch = 1'b0;
            Branch_ne = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            MemtoReg = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b0;
        end
        6'b000100: begin // Branch
            RegDst = 1'b0;
            Jump = 1'b0;
            Branch = 1'b1;
            Branch_ne = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            MemtoReg = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b0;
        end
        6'b000101: begin // Branch not equal
            RegDst = 1'b0;
            Jump = 1'b0;
            Branch = 1'b0;
            Branch_ne = 1'b1;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            MemtoReg = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b0;
        end
        6'b100011: begin // Load word
            RegDst = 1'b0;
            Jump = 1'b0;
            Branch = 1'b0;
            Branch_ne = 1'b0;
            MemRead = 1'b1;
            MemWrite = 1'b0;
            MemtoReg = 1'b1;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
        end
        6'b101011: begin // Store word
            RegDst = 1'b0;
            Jump = 1'b0;
            Branch = 1'b0;
            Branch_ne = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b1;
            MemtoReg = 1'b0;
            ALUSrc = 1'b1;
            RegWrite = 1'b0;
        end
        6'b001000: begin // ADDI
            RegDst = 1'b0;
            Jump = 1'b0;
            Branch = 1'b0;
            Branch_ne = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            MemtoReg = 1'b0;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
        end
        6'b001100: begin // ANDI
            RegDst = 1'b0;
            Jump = 1'b0;
            Branch = 1'b0;
            Branch_ne = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            MemtoReg = 1'b0;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
        end
        default: begin
            RegDst = 1'b0;
            Jump = 1'b0;
            Branch = 1'b0;
            Branch_ne = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            MemtoReg = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b0;
        end
    endcase
end

endmodule