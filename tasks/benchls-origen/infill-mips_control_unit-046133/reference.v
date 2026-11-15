module origen_046133(
    input [5:0] instruction,
    output reg [1:0] ALUOp,
    output reg MemRead,
    output reg MemtoReg,
    output reg RegDst,
    output reg Branch,
    output reg BNE,
    output reg ALUSrc,
    output reg MemWrite,
    output reg Jump,
    output reg RegWrite
);

always @(*) begin
    case(instruction)
        6'b000000: begin // R-type
            ALUOp = 2'b10;
            MemRead = 0;
            MemtoReg = 0;
            RegDst = 1;
            Branch = 0;
            BNE = 0;
            ALUSrc = 0;
            MemWrite = 0;
            Jump = 0;
            RegWrite = 1;
        end
        6'b000100: begin // beq
            ALUOp = 2'b01;
            MemRead = 0;
            MemtoReg = 0;
            RegDst = 0;
            Branch = 1;
            BNE = 0;
            ALUSrc = 0;
            MemWrite = 0;
            Jump = 0;
            RegWrite = 0;
        end
        6'b101011: begin // sw
            ALUOp = 2'b00;
            MemRead = 0;
            MemtoReg = 0;
            RegDst = 0;
            Branch = 0;
            BNE = 0;
            ALUSrc = 1;
            MemWrite = 1;
            Jump = 0;
            RegWrite = 0;
        end
        6'b100011: begin // lw
            ALUOp = 2'b00;
            MemRead = 1;
            MemtoReg = 1;
            RegDst = 0;
            Branch = 0;
            BNE = 0;
            ALUSrc = 1;
            MemWrite = 0;
            Jump = 0;
            RegWrite = 1;
        end
        6'b001000: begin // addi
            ALUOp = 2'b00;
            MemRead = 0;
            MemtoReg = 0;
            RegDst = 0;
            Branch = 0;
            BNE = 0;
            ALUSrc = 1;
            MemWrite = 0;
            Jump = 0;
            RegWrite = 1;
        end
        6'b000010: begin // j
            ALUOp = 2'b00;
            MemRead = 0;
            MemtoReg = 0;
            RegDst = 0;
            Branch = 0;
            BNE = 0;
            ALUSrc = 0;
            MemWrite = 0;
            Jump = 1;
            RegWrite = 0;
        end
        6'b000101: begin // bne
            ALUOp = 2'b01;
            MemRead = 0;
            MemtoReg = 0;
            RegDst = 0;
            Branch = 0;
            BNE = 1;
            ALUSrc = 0;
            MemWrite = 0;
            Jump = 0;
            RegWrite = 0;
        end
        6'b001111: begin // lui
            ALUOp = 2'b00;
            MemRead = 0;
            MemtoReg = 0;
            RegDst = 0;
            Branch = 0;
            BNE = 0;
            ALUSrc = 1;
            MemWrite = 0;
            Jump = 0;
            RegWrite = 1;
        end
        default: begin
            ALUOp = 2'b00;
            MemRead = 0;
            MemtoReg = 0;
            RegDst = 0;
            Branch = 0;
            BNE = 0;
            ALUSrc = 0;
            MemWrite = 0;
            Jump = 0;
            RegWrite = 0;
        end
    endcase
end

endmodule