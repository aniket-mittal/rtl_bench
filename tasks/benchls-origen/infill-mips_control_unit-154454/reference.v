module origen_154454(
    input [5:0] opcode,
    output reg [2:0] ALUop,
    output reg Jump,
    output reg Branch,
    output reg MemtoReg,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite,
    output reg RegDst,
    output reg Extop
);

always @(*) begin
    case (opcode)
        6'b000000: // R-type
        begin
            ALUop = 3'b010; // ADD
            Jump = 1'b0;
            Branch = 1'b0;
            MemtoReg = 1'b0;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b1;
            RegDst = 1'b1;
            Extop = 1'b0;
        end
        6'b100011: // Load
        begin
            ALUop = 3'b010; // ADD
            Jump = 1'b0;
            Branch = 1'b0;
            MemtoReg = 1'b1;
            MemWrite = 1'b0;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
            RegDst = 1'b0;
            Extop = 1'b0;
        end
        6'b101011: // Store
        begin
            ALUop = 3'b010; // ADD
            Jump = 1'b0;
            Branch = 1'b0;
            MemtoReg = 1'b0;
            MemWrite = 1'b1;
            ALUSrc = 1'b1;
            RegWrite = 1'b0;
            RegDst = 1'bx;
            Extop = 1'b0;
        end
        6'b000100: // Branch
        begin
            ALUop = 3'b001; // SUB
            Jump = 1'b0;
            Branch = 1'b1;
            MemtoReg = 1'b0;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b0;
            RegDst = 1'bx;
            Extop = 1'b0;
        end
        6'b000010: // Jump
        begin
            ALUop = 3'bxxx;
            Jump = 1'b1;
            Branch = 1'b0;
            MemtoReg = 1'b0;
            MemWrite = 1'b0;
            ALUSrc = 1'bx;
            RegWrite = 1'b0;
            RegDst = 1'bx;
            Extop = 1'bx;
        end
        6'b001000: // addi
        begin
            ALUop = 3'b010; // ADD
            Jump = 1'b0;
            Branch = 1'b0;
            MemtoReg = 1'b0;
            MemWrite = 1'b0;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
            RegDst = 1'b0;
            Extop = 1'b0;
        end
        6'b001100: // andi
        begin
            ALUop = 3'b000; // AND
            Jump = 1'b0;
            Branch = 1'b0;
            MemtoReg = 1'b0;
            MemWrite = 1'b0;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
            RegDst = 1'b0;
            Extop = 1'b1;
        end
        default:
        begin
            ALUop = 3'bxxx;
            Jump = 1'bx;
            Branch = 1'bx;
            MemtoReg = 1'bx;
            MemWrite = 1'bx;
            ALUSrc = 1'bx;
            RegWrite = 1'bx;
            RegDst = 1'bx;
            Extop = 1'bx;
        end
    endcase
end

endmodule