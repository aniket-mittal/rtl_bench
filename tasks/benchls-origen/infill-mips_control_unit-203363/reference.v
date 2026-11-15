module origen_203363(
    input [5:0] opcode,
    output reg MemtoReg, MemWrite, Branch, ALUSrc, RegDst, RegWrite, Jump,
    output reg [1:0] ALUOp
);

always @(*) begin
    case (opcode)
        6'b000000: begin // R-type
            MemtoReg = 1'b0;
            MemWrite = 1'b0;
            Branch = 1'b0;
            ALUSrc = 1'b0;
            RegDst = 1'b1;
            RegWrite = 1'b1;
            Jump = 1'b0;
            ALUOp = 2'b10;
        end
        6'b100011: begin // lw
            MemtoReg = 1'b1;
            MemWrite = 1'b0;
            Branch = 1'b0;
            ALUSrc = 1'b1;
            RegDst = 1'b0;
            RegWrite = 1'b1;
            Jump = 1'b0;
            ALUOp = 2'b00;
        end
        6'b101011: begin // sw
            MemtoReg = 1'bx;
            MemWrite = 1'b1;
            Branch = 1'b0;
            ALUSrc = 1'b1;
            RegDst = 1'bx;
            RegWrite = 1'b0;
            Jump = 1'b0;
            ALUOp = 2'b00;
        end
        6'b000100: begin // beq
            MemtoReg = 1'b0;
            MemWrite = 1'b0;
            Branch = 1'b1;
            ALUSrc = 1'b0;
            RegDst = 1'b0;
            RegWrite = 1'b0;
            Jump = 1'b0;
            ALUOp = 2'b01;
        end
        6'b000111: begin // bgtz
            MemtoReg = 1'b0;
            MemWrite = 1'b0;
            Branch = 1'b1;
            ALUSrc = 1'b0;
            RegDst = 1'b0;
            RegWrite = 1'b0;
            Jump = 1'b0;
            ALUOp = 2'b01;
        end
        6'b001000: begin // addi
            MemtoReg = 1'b0;
            MemWrite = 1'b0;
            Branch = 1'b0;
            ALUSrc = 1'b1;
            RegDst = 1'b0;
            RegWrite = 1'b1;
            Jump = 1'b0;
            ALUOp = 2'b00;
        end
        6'b000010: begin // j
            MemtoReg = 1'b0;
            MemWrite = 1'b0;
            Branch = 1'b0;
            ALUSrc = 1'b0;
            RegDst = 1'b0;
            RegWrite = 1'b0;
            Jump = 1'b1;
            ALUOp = 2'b00;
        end
        default: begin
            MemtoReg = 1'b0;
            MemWrite = 1'b0;
            Branch = 1'b0;
            ALUSrc = 1'b0;
            RegDst = 1'b0;
            RegWrite = 1'b0;
            Jump = 1'b0;
            ALUOp = 2'b00;
        end
    endcase
end

endmodule