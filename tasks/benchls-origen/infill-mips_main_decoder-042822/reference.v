module origen_042822(
    input [5:0] opcode,
    output reg RegDst,
    output reg ALUSrc,
    output reg MemtoReg,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg Branch,
    output reg Jump,
    output reg [1:0] ALUOp,
    output reg BneDst,
    output reg ExtndDst
);

always @(*) begin
    case(opcode)
        6'b000000: begin // R-Format
            RegDst = 1'b1;
            ALUSrc = 1'b0;
            MemtoReg = 1'b0;
            RegWrite = 1'b1;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            Branch = 1'b0;
            Jump = 1'b0;
            ALUOp = 2'b10;
            BneDst = 1'b0;
            ExtndDst = 1'b0;
        end
        6'b100011: begin // LW
            RegDst = 1'b0;
            ALUSrc = 1'b1;
            MemtoReg = 1'b1;
            RegWrite = 1'b1;
            MemRead = 1'b1;
            MemWrite = 1'b0;
            Branch = 1'b0;
            Jump = 1'b0;
            ALUOp = 2'b00;
            BneDst = 1'b0;
            ExtndDst = 1'b1;
        end
        6'b101011: begin // SW
            RegDst = 1'bx;
            ALUSrc = 1'b1;
            MemtoReg = 1'bx;
            RegWrite = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b1;
            Branch = 1'b0;
            Jump = 1'b0;
            ALUOp = 2'b00;
            BneDst = 1'b0;
            ExtndDst = 1'b1;
        end
        6'b000100: begin // BEQ
            RegDst = 1'bx;
            ALUSrc = 1'b0;
            MemtoReg = 1'bx;
            RegWrite = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            Branch = 1'b1;
            Jump = 1'b0;
            ALUOp = 2'b01;
            BneDst = 1'b0;
            ExtndDst = 1'b1;
        end
        6'b000010: begin // J
            RegDst = 1'bx;
            ALUSrc = 1'bx;
            MemtoReg = 1'bx;
            RegWrite = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            Branch = 1'b0;
            Jump = 1'b1;
            ALUOp = 2'bxx;
            BneDst = 1'b0;
            ExtndDst = 1'b0;
        end
        6'b000101: begin // BNE
            RegDst = 1'bx;
            ALUSrc = 1'b0;
            MemtoReg = 1'bx;
            RegWrite = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            Branch = 1'b1;
            Jump = 1'b0;
            ALUOp = 2'b01;
            BneDst = 1'b1;
            ExtndDst = 1'b1;
        end
        6'b001101: begin // ORI
            RegDst = 1'b0;
            ALUSrc = 1'b1;
            MemtoReg = 1'b0;
            RegWrite = 1'b1;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            Branch = 1'b0;
            Jump = 1'b0;
            ALUOp = 2'b11;
            BneDst = 1'b0;
            ExtndDst = 1'b0;
        end
        default: begin
            RegDst = 1'bx;
            ALUSrc = 1'bx;
            MemtoReg = 1'bx;
            RegWrite = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            Branch = 1'b0;
            Jump = 1'b0;
            ALUOp = 2'bxx;
            BneDst = 1'b0;
            ExtndDst = 1'b0;
            ;
        end
    endcase
end

endmodule