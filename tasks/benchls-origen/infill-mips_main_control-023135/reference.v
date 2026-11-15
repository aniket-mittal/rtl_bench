module origen_023135(
    input [5:0] Op,
    output reg RegDst,
    output reg ALUSrc,
    output reg MemtoReg,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg Branch,
    output reg ALUOp1,
    output reg ALUOp2
);

always @(*) begin
    case(Op)
        6'b000000: begin // R-format
            RegDst = 1'b1;
            ALUSrc = 1'b0;
            MemtoReg = 1'b0;
            RegWrite = 1'b1;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            Branch = 1'b0;
            ALUOp1 = 1'b1;
            ALUOp2 = 1'b0;
        end
        6'b100011: begin // lw
            RegDst = 1'b0;
            ALUSrc = 1'b1;
            MemtoReg = 1'b1;
            RegWrite = 1'b1;
            MemRead = 1'b1;
            MemWrite = 1'b0;
            Branch = 1'b0;
            ALUOp1 = 1'b0;
            ALUOp2 = 1'b0;
        end
        6'b101011: begin // sw
            RegDst = 1'b0;
            ALUSrc = 1'b1;
            MemtoReg = 1'b0;
            RegWrite = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b1;
            Branch = 1'b0;
            ALUOp1 = 1'b0;
            ALUOp2 = 1'b0;
        end
        6'b000100: begin // beq
            RegDst = 1'b0;
            ALUSrc = 1'b0;
            MemtoReg = 1'b0;
            RegWrite = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            Branch = 1'b1;
            ALUOp1 = 1'b0;
            ALUOp2 = 1'b1;
        end
        default: begin
            RegDst = 1'b0;
            ALUSrc = 1'b0;
            MemtoReg = 1'b0;
            RegWrite = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            Branch = 1'b0;
            ALUOp1 = 1'b0;
            ALUOp2 = 1'b0;
        end
    endcase
end

endmodule

