module origen_161476(
    input [5:0] OpCode,
    output reg RegDest,
    output reg Branch,
    output reg MemRead,
    output reg [1:0] MemToReg,
    output reg [2:0] ALUOp,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite,
    output reg Jump
);

always @(*) begin
    case (OpCode)
        6'b000000: begin // R-type
            RegDest = 1'b1;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemToReg = 2'b00;
            ALUOp = 3'b010;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b1;
            Jump = 1'b0;
        end
        6'b100011: begin // Load (lw)
            RegDest = 1'b0;
            Branch = 1'b0;
            MemRead = 1'b1;
            MemToReg = 2'b01;
            ALUOp = 3'b010;
            MemWrite = 1'b0;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
            Jump = 1'b0;
        end
        6'b101011: begin // Store (sw)
            RegDest = 1'bx;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemToReg = 2'bxx;
            ALUOp = 3'b010;
            MemWrite = 1'b1;
            ALUSrc = 1'b1;
            RegWrite = 1'b0;
            Jump = 1'b0;
        end
        6'b000100: begin // Branch (beq)
            RegDest = 1'bx;
            Branch = 1'b1;
            MemRead = 1'b0;
            MemToReg = 2'bxx;
            ALUOp = 3'b110;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b0;
            Jump = 1'b0;
        end
        6'b000010: begin // Jump (j)
            RegDest = 1'bx;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemToReg = 2'bxx;
            ALUOp = 3'bxxx;
            MemWrite = 1'b0;
            ALUSrc = 1'bx;
            RegWrite = 1'b0;
            Jump = 1'b1;
        end
        6'b000011: begin // Jump and Link (jal)
            RegDest = 1'b0;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemToReg = 2'b10;
            ALUOp = 3'bxxx;
            MemWrite = 1'b0;
            ALUSrc = 1'bx;
            RegWrite = 1'b1;
            Jump = 1'b1;
        end
        default: begin
            RegDest = 1'bx;
            Branch = 1'bx;
            MemRead = 1'bx;
            MemToReg = 2'bxx;
            ALUOp = 3'bxxx;
            MemWrite = 1'bx;
            ALUSrc = 1'bx;
            RegWrite = 1'bx;
            Jump = 1'bx;
        end
    endcase
end

endmodule