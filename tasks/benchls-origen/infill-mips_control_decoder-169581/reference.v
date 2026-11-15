module origen_169581(
    input  [5:0] Instruction,
    output reg RegDst,
    output reg Branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg [1:0] ALUOp,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite
);

always @(*) begin
    case (Instruction)
        6'h00: begin // R-type instruction
            RegDst = 1;
            ALUOp = 2'b10;
            RegWrite = 1;
            Branch = 0;
            MemRead = 0;
            MemtoReg = 0;
            MemWrite = 0;
            ALUSrc = 0;
        end
        6'h04: begin // Branch instruction
            RegDst = 0;
            ALUOp = 2'b01;
            RegWrite = 0;
            Branch = 1;
            MemRead = 0;
            MemtoReg = 0;
            MemWrite = 0;
            ALUSrc = 0;
        end
        6'h08: begin // Add immediate instruction
            RegDst = 0;
            ALUOp = 2'b00;
            RegWrite = 1;
            Branch = 0;
            MemRead = 0;
            MemtoReg = 0;
            MemWrite = 0;
            ALUSrc = 1;
        end
        6'h23: begin // Load word instruction
            RegDst = 0;
            ALUOp = 2'b00;
            RegWrite = 1;
            Branch = 0;
            MemRead = 1;
            MemtoReg = 0;
            MemWrite = 0;
            ALUSrc = 1;
        end
        6'h2B: begin // Store word instruction
            RegDst = 0;
            ALUOp = 2'b00;
            RegWrite = 0;
            Branch = 0;
            MemRead = 0;
            MemtoReg = 0;
            MemWrite = 1;
            ALUSrc = 1;
        end
        6'h21: begin // Add instruction
            RegDst = 0;
            ALUOp = 2'b00;
            RegWrite = 1;
            Branch = 0;
            MemRead = 0;
            MemtoReg = 0;
            MemWrite = 0;
            ALUSrc = 0;
        end
        6'h25: begin // Or instruction
            RegDst = 0;
            ALUOp = 2'b00;
            RegWrite = 1;
            Branch = 0;
            MemRead = 0;
            MemtoReg = 0;
            MemWrite = 0;
            ALUSrc = 0;
        end
        default: begin // Default case
            RegDst = 0;
            Branch = 0;
            MemRead = 0;
            MemtoReg = 0;
            ALUOp = 2'b00;
            MemWrite = 0;
            ALUSrc = 0;
            RegWrite = 0;
        end
    endcase
end

endmodule