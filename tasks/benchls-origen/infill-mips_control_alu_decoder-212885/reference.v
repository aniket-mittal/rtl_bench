module origen_212885(
    input [5:0] OpCode,
    input [5:0] Funct,
    output reg RegDst,
    output reg ALUSrc,
    output reg RegWrite,
    output reg MemWrite,
    output reg MemRead,
    output reg MemtoReg,
    output reg Branch,
    output reg Jump,
    output reg [3:0] ALUControl
);

always @(*) begin
    case (OpCode)
        6'b000000: begin // R-type instructions
            RegDst = 1'b1;
            ALUSrc = 1'b0;
            RegWrite = 1'b1;
            MemWrite = 1'b0;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            Branch = 1'b0;
            Jump = 1'b0;
            case (Funct)
                6'b100000: ALUControl = 4'b0010; // ADD
                6'b100010: ALUControl = 4'b0110; // SUB
                6'b100100: ALUControl = 4'b0000; // AND
                6'b100101: ALUControl = 4'b0001; // OR
                default: ALUControl = 4'b1111; // Undefined
            endcase
        end
        6'b100011: begin // LW
            RegDst = 1'b0;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
            MemWrite = 1'b0;
            MemRead = 1'b1;
            MemtoReg = 1'b1;
            Branch = 1'b0;
            Jump = 1'b0;
            ALUControl = 4'b0010; // ADD
        end
        6'b101011: begin // SW
            RegDst = 1'bx;
            ALUSrc = 1'b1;
            RegWrite = 1'b0;
            MemWrite = 1'b1;
            MemRead = 1'b0;
            MemtoReg = 1'bx;
            Branch = 1'b0;
            Jump = 1'b0;
            ALUControl = 4'b0010; // ADD
        end
        6'b000100: begin // BEQ
            RegDst = 1'bx;
            ALUSrc = 1'b0;
            RegWrite = 1'b0;
            MemWrite = 1'b0;
            MemRead = 1'b0;
            MemtoReg = 1'bx;
            Branch = 1'b1;
            Jump = 1'b0;
            ALUControl = 4'b0110; // SUB
        end
        6'b000010: begin // J
            RegDst = 1'bx;
            ALUSrc = 1'bx;
            RegWrite = 1'b0;
            MemWrite = 1'b0;
            MemRead = 1'b0;
            MemtoReg = 1'bx;
            Branch = 1'b0;
            Jump = 1'b1;
            ALUControl = 4'bxxxx; // Irrelevant
        end
        default: begin // Undefined
            RegDst = 1'bx;
            ALUSrc = 1'bx;
            RegWrite = 1'b0;
            MemWrite = 1'b0;
            MemRead = 1'b0;
            MemtoReg = 1'bx;
            Branch = 1'b0;
            Jump = 1'b0;
            ALUControl = 4'b1111;
        end
    endcase
end

endmodule