module origen_091258(
    input [5:0] instr_op_i,
    output reg [5:0] AluOp,
    output reg AluSrc,
    output reg RegDst,
    output reg MemRead,
    output reg MemWrite,
    output reg Branch,
    output reg RegWrite,
    output reg MemToReg
);

always @(*) begin
    case(instr_op_i)
        6'b000000: begin // R-type instructions
            AluOp = 6'b000000;
            AluSrc = 1'b0;
            RegDst = 1'b1;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            Branch = 1'b0;
            RegWrite = 1'b1;
            MemToReg = 1'b0;
        end
        6'b001000: begin // ADDI
            AluOp = 6'b000001;
            AluSrc = 1'b1;
            RegDst = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            Branch = 1'b0;
            RegWrite = 1'b1;
            MemToReg = 1'b0;
        end
        6'b001001: begin // ADDIU
            AluOp = 6'b000010;
            AluSrc = 1'b1;
            RegDst = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            Branch = 1'b0;
            RegWrite = 1'b1;
            MemToReg = 1'b0;
        end
        6'b001101: begin // ORI
            AluOp = 6'b000011;
            AluSrc = 1'b1;
            RegDst = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            Branch = 1'b0;
            RegWrite = 1'b1;
            MemToReg = 1'b0;
        end
        6'b100011: begin // LW
            AluOp = 6'b000100;
            AluSrc = 1'b1;
            RegDst = 1'b0;
            MemRead = 1'b1;
            MemWrite = 1'b0;
            Branch = 1'b0;
            RegWrite = 1'b1;
            MemToReg = 1'b1;
        end
        6'b101011: begin // SW
            AluOp = 6'b000101;
            AluSrc = 1'b1;
            RegDst = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b1;
            Branch = 1'b0;
            RegWrite = 1'b0;
            MemToReg = 1'b0;
        end
        6'b000100: begin // BEQ
            AluOp = 6'b000110;
            AluSrc = 1'b0;
            RegDst = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            Branch = 1'b1;
            RegWrite = 1'b0;
            MemToReg = 1'b0;
        end
        6'b000101: begin // BNE
            AluOp = 6'b000111;
            AluSrc = 1'b0;
            RegDst = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            Branch = 1'b1;
            RegWrite = 1'b0;
            MemToReg = 1'b0;
        end
        default: begin
            AluOp = 6'b000000;
            AluSrc = 1'b0;
            RegDst = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            Branch = 1'b0;
            RegWrite = 1'b0;
            MemToReg = 1'b0;
        end
    endcase
end

endmodule