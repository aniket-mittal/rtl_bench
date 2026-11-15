module origen_074147(
    input [2:0] Op,
    output reg RegWrite,
    output reg [1:0] RegDst,
    output reg ALUSrc,
    output reg Branch,
    output reg MemWrite,
    output reg MemToReg,
    output reg [1:0] ALUOp,
    output reg Jump,
    output reg JAL,
    output reg JumpReg,
    output reg RegRA
);

always @* begin
    case(Op)
        3'b000: begin // R-type arithmetic/logic instruction
            RegWrite = 1'b1;
            RegDst = 2'b01;
            ALUSrc = 1'b0;
            Branch = 1'b0;
            MemWrite = 1'b0;
            MemToReg = 1'b0;
            ALUOp = 2'b10;
            Jump = 1'b0;
            JAL = 1'b0;
            JumpReg = 1'b0;
            RegRA = 1'b0;
        end
        3'b001: begin // Load word instruction
            RegWrite = 1'b1;
            RegDst = 2'b00;
            ALUSrc = 1'b1;
            Branch = 1'b0;
            MemWrite = 1'b0;
            MemToReg = 1'b1;
            ALUOp = 2'b00;
            Jump = 1'b0;
            JAL = 1'b0;
            JumpReg = 1'b0;
            RegRA = 1'b0;
        end
        3'b010: begin // Store word instruction
            RegWrite = 1'b0;
            RegDst = 2'bxx;
            ALUSrc = 1'b1;
            Branch = 1'b0;
            MemWrite = 1'b1;
            MemToReg = 1'bx;
            ALUOp = 2'b00;
            Jump = 1'b0;
            JAL = 1'b0;
            JumpReg = 1'b0;
            RegRA = 1'b0;
        end
        3'b011: begin // Jump instruction
            RegWrite = 1'b0;
            RegDst = 2'bxx;
            ALUSrc = 1'bx;
            Branch = 1'b0;
            MemWrite = 1'b0;
            MemToReg = 1'bx;
            ALUOp = 2'bxx;
            Jump = 1'b1;
            JAL = 1'b0;
            JumpReg = 1'b0;
            RegRA = 1'b0;
        end
        3'b100: begin // Branch instruction
            RegWrite = 1'b0;
            RegDst = 2'bxx;
            ALUSrc = 1'b0;
            Branch = 1'b1;
            MemWrite = 1'b0;
            MemToReg = 1'bx;
            ALUOp = 2'b01;
            Jump = 1'b0;
            JAL = 1'b0;
            JumpReg = 1'b0;
            RegRA = 1'b0;
        end
        3'b101: begin // Immediate arithmetic instruction
            RegWrite = 1'b1;
            RegDst = 2'b00;
            ALUSrc = 1'b1;
            Branch = 1'b0;
            MemWrite = 1'b0;
            MemToReg = 1'b0;
            ALUOp = 2'b10;
            Jump = 1'b0;
            JAL = 1'b0;
            JumpReg = 1'b0;
            RegRA = 1'b0;
        end
        3'b110: begin // Jump-and-Link instruction
            RegWrite = 1'b1;
            RegDst = 2'b10;
            ALUSrc = 1'bx;
            Branch = 1'b0;
            MemWrite = 1'b0;
            MemToReg = 1'bx;
            ALUOp = 2'bxx;
            Jump = 1'b1;
            JAL = 1'b1;
            JumpReg = 1'b0;
            RegRA = 1'b1;
        end
        3'b111: begin // Jump-Register instruction
            RegWrite = 1'b0;
            RegDst = 2'bxx;
            ALUSrc = 1'bx;
            Branch = 1'b0;
            MemWrite = 1'b0;
            MemToReg = 1'bx;
            ALUOp = 2'bxx;
            Jump = 1'b1;
            JAL = 1'b0;
            JumpReg = 1'b1;
            RegRA = 1'b0;
        end
        default: begin // Invalid Op code
            RegWrite = 1'bx;
            RegDst = 2'bxx;
            ALUSrc = 1'bx;
            Branch = 1'bx;
            MemWrite = 1'bx;
            MemToReg = 1'bx;
            ALUOp = 2'bxx;
            Jump = 1'bx;
            JAL = 1'bx;
            JumpReg = 1'bx;
            RegRA = 1'bx;
        end
    endcase
end

endmodule