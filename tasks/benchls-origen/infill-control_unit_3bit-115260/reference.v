module origen_115260(
    input [2:0] Opcode,
    output reg RegWrite,
    output reg MemWrite,
    output reg MemToReg,
    output reg Branch_en,
    output reg ALUSrc,
    output reg [2:0] ALUOp
);

always @(*) begin
    case(Opcode)
        3'b000: begin // Memory read
            RegWrite = 1'b1;
            MemWrite = 1'b0;
            MemToReg = 1'b1;
            Branch_en = 1'b0;
            ALUSrc = 1'b0;
            ALUOp = 3'b000;
        end
        3'b001: begin // Memory write
            RegWrite = 1'b0;
            MemWrite = 1'b1;
            MemToReg = 1'b0;
            Branch_en = 1'b0;
            ALUSrc = 1'b0;
            ALUOp = 3'b000;
        end
        3'b010: begin // ALU operation with immediate
            RegWrite = 1'b1;
            MemWrite = 1'b0;
            MemToReg = 1'b0;
            Branch_en = 1'b0;
            ALUSrc = 1'b1;
            ALUOp = 3'b010;
        end
        3'b011: begin // ALU operation
            RegWrite = 1'b1;
            MemWrite = 1'b0;
            MemToReg = 1'b0;
            Branch_en = 1'b0;
            ALUSrc = 1'b0;
            ALUOp = 3'b011;
        end
        3'b100: begin // ALU operation
            RegWrite = 1'b1;
            MemWrite = 1'b0;
            MemToReg = 1'b0;
            Branch_en = 1'b0;
            ALUSrc = 1'b0;
            ALUOp = 3'b100;
        end
        3'b101: begin // ALU operation
            RegWrite = 1'b1;
            MemWrite = 1'b0;
            MemToReg = 1'b0;
            Branch_en = 1'b0;
            ALUSrc = 1'b0;
            ALUOp = 3'b101;
        end
        3'b110: begin // Branch operation
            RegWrite = 1'b0;
            MemWrite = 1'b0;
            MemToReg = 1'b0;
            Branch_en = 1'b1;
            ALUSrc = 1'b0;
            ALUOp = 3'b110;
        end
        3'b111: begin // ALU operation with immediate
            RegWrite = 1'b1;
            MemWrite = 1'b0;
            MemToReg = 1'b0;
            Branch_en = 1'b0;
            ALUSrc = 1'b1;
            ALUOp = 3'b111;
        end
        default: begin // Default case
            RegWrite = 1'b0;
            MemWrite = 1'b0;
            MemToReg = 1'b0;
            Branch_en = 1'b0;
            ALUSrc = 1'b0;
            ALUOp = 3'b000;
        end
    endcase
end

endmodule