module origen_066921(
    input [5:0] ins_31_26,
    output reg RegDst,
    output reg Jump,
    output reg Branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg [1:0] ALUOp,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite
);

always @(*) begin
    case(ins_31_26)
        6'b000000: begin // R-type
            RegDst = 1'b1;
            Jump = 1'b0;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            ALUOp = 2'b10;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b1;
        end
        6'b100011: begin // Load word
            RegDst = 1'b0;
            Jump = 1'b0;
            Branch = 1'b0;
            MemRead = 1'b1;
            MemtoReg = 1'b1;
            ALUOp = 2'b00;
            MemWrite = 1'b0;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
        end
        6'b101011: begin // Store word
            RegDst = 1'bx;
            Jump = 1'b0;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemtoReg = 1'bx;
            ALUOp = 2'b00;
            MemWrite = 1'b1;
            ALUSrc = 1'b1;
            RegWrite = 1'b0;
        end
        6'b001000: begin // Immediate arithmetic
            RegDst = 1'b0;
            Jump = 1'b0;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            ALUOp = 2'b00;
            MemWrite = 1'b0;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
        end
        6'b000100: begin // Branch
            RegDst = 1'bx;
            Jump = 1'b0;
            Branch = 1'b1;
            MemRead = 1'b0;
            MemtoReg = 1'bx;
            ALUOp = 2'b01;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b0;
        end
        6'b000010: begin // Jump
            RegDst = 1'bx;
            Jump = 1'b1;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemtoReg = 1'bx;
            ALUOp = 2'bxx;
            MemWrite = 1'b0;
            ALUSrc = 1'bx;
            RegWrite = 1'b0;
        end
        default: begin
            RegDst = 1'bx;
            Jump = 1'bx;
            Branch = 1'bx;
            MemRead = 1'bx;
            MemtoReg = 1'bx;
            ALUOp = 2'bxx;
            MemWrite = 1'bx;
            ALUSrc = 1'bx;
            RegWrite = 1'bx;
        end
    endcase
end

endmodule