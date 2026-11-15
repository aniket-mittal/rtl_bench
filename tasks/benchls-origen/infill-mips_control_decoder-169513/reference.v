module origen_169513(
    input zero,
    input [5:0] op,
    output reg RegDst,
    output reg RegWrite,
    output reg ALUSrc,
    output reg Jump,
    output reg Branch,
    output reg [2:0] ALUOp,
    output reg MemWrite,
    output reg MemRead,
    output reg MemtoReg
);

always @(*) begin
    case (op)
        6'b000000: begin // R-type
            RegDst = 1;
            RegWrite = 1;
            ALUSrc = 0;
            Jump = 0;
            Branch = 0;
            ALUOp = 3'b010;
            MemWrite = 0;
            MemRead = 0;
            MemtoReg = 0;
        end
        6'b001000: begin // addi
            RegDst = 0;
            RegWrite = 1;
            ALUSrc = 1;
            Jump = 0;
            Branch = 0;
            ALUOp = 3'b000;
            MemWrite = 0;
            MemRead = 0;
            MemtoReg = 0;
        end
        6'b100011: begin // lw
            RegDst = 0;
            RegWrite = 1;
            ALUSrc = 1;
            Jump = 0;
            Branch = 0;
            ALUOp = 3'b000;
            MemWrite = 0;
            MemRead = 1;
            MemtoReg = 1;
        end
        6'b101011: begin // sw
            RegDst = 1'bx;
            RegWrite = 0;
            ALUSrc = 1;
            Jump = 0;
            Branch = 0;
            ALUOp = 3'b000;
            MemWrite = 1;
            MemRead = 0;
            MemtoReg = 1'bx;
        end
        6'b000100: begin // beq
            RegDst = 1'bx;
            RegWrite = 0;
            ALUSrc = 0;
            Jump = 0;
            Branch = 1;
            ALUOp = 3'b001;
            MemWrite = 0;
            MemRead = 0;
            MemtoReg = 1'bx;
        end
        6'b000010: begin // j
            RegDst = 1'bx;
            RegWrite = 0;
            ALUSrc = 1'bx;
            Jump = 1;
            Branch = 0;
            ALUOp = 3'bx;
            MemWrite = 0;
            MemRead = 0;
            MemtoReg = 1'bx;
        end
        default: begin
            RegDst = 0;
            RegWrite = 0;
            ALUSrc = 0;
            Jump = 0;
            Branch = 0;
            ALUOp = 3'b000;
            MemWrite = 0;
            MemRead = 0;
            MemtoReg = 0;
        end
    endcase
end

endmodule