module origen_202247(
    input [2:0] opcode,
    output reg RegDst,
    output reg ALUSrc,
    output reg MemToReg,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg [1:0] ALUOp,
    output reg Branch
);

always @(*) begin
    case (opcode)
        3'b111: begin // R-type
            RegDst = 1;
            ALUSrc = 0;
            MemToReg = 0;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            ALUOp = 2'b10;
            Branch = 0;
        end
        3'b100: begin // I-type (addi, lw)
            RegDst = 0;
            ALUSrc = 1;
            MemToReg = 0;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            ALUOp = 2'b10;
            Branch = 0;
        end
        3'b101: begin // I-type (sw)
            RegDst = 0;
            ALUSrc = 1;
            MemToReg = 0;
            RegWrite = 0;
            MemRead = 0;
            MemWrite = 1;
            ALUOp = 2'b10;
            Branch = 0;
        end
        3'b000: begin // Load (lw)
            RegDst = 0;
            ALUSrc = 1;
            MemToReg = 1;
            RegWrite = 1;
            MemRead = 1;
            MemWrite = 0;
            ALUOp = 2'b00;
            Branch = 0;
        end
        3'b001: begin // Store (sw)
            RegDst = 0;
            ALUSrc = 1;
            MemToReg = 0;
            RegWrite = 0;
            MemRead = 0;
            MemWrite = 1;
            ALUOp = 2'b00;
            Branch = 0;
        end
        3'b011: begin // Branch (beq)
            RegDst = 0;
            ALUSrc = 0;
            MemToReg = 0;
            RegWrite = 0;
            MemRead = 0;
            MemWrite = 0;
            ALUOp = 2'b01;
            Branch = 1;
        end
        default: begin
            RegDst = 0;
            ALUSrc = 0;
            MemToReg = 0;
            RegWrite = 0;
            MemRead = 0;
            MemWrite = 0;
            ALUOp = 2'b00;
            Branch = 0;
        end
    endcase
end

endmodule