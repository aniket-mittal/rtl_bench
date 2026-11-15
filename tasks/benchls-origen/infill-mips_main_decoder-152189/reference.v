module origen_152189(
    input [5:0] Opcode,
    input [5:0] Funct,
    output reg [1:0] RegDst,
    output reg Jump,
    output reg Branch,
    output reg MemRead,
    output reg [1:0] MemtoReg,
    output reg [5:0] ALUOp,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite,
    output reg JumpRegister
);

always @(*) begin
    case (Opcode)
        6'b000000: begin // R-type instruction
            RegDst = 2'b01;
            Jump = 1'b0;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemtoReg = 2'b00;
            ALUOp = 6'b100000;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b1;
            JumpRegister = (Funct == 6'b001000) ? 1'b1 : 1'b0; // jr instruction
        end
        6'b100011: begin // load instruction
            RegDst = 2'b00;
            Jump = 1'b0;
            Branch = 1'b0;
            MemRead = 1'b1;
            MemtoReg = 2'b01;
            ALUOp = 6'b100000;
            MemWrite = 1'b0;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
            JumpRegister = 1'b0;
        end
        6'b101011: begin // store instruction
            RegDst = 2'b00;
            Jump = 1'b0;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemtoReg = 2'b00;
            ALUOp = 6'b100000;
            MemWrite = 1'b1;
            ALUSrc = 1'b1;
            RegWrite = 1'b0;
            JumpRegister = 1'b0;
        end
        6'b001000: begin // immediate instruction
            RegDst = 2'b00;
            Jump = 1'b0;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemtoReg = 2'b00;
            ALUOp = 6'b100000;
            MemWrite = 1'b0;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
            JumpRegister = 1'b0;
        end
        6'b000100: begin // branch instruction
            RegDst = 2'b00;
            Jump = 1'b0;
            Branch = 1'b1;
            MemRead = 1'b0;
            MemtoReg = 2'b00;
            ALUOp = 6'b100010;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b0;
            JumpRegister = 1'b0;
        end
        6'b000010: begin // jump instruction
            RegDst = 2'b00;
            Jump = 1'b1;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemtoReg = 2'b10;
            ALUOp = 6'b000000;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b0;
            JumpRegister = 1'b0;
        end
        default: begin
            RegDst = 2'b00;
            Jump = 1'b0;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemtoReg = 2'b00;
            ALUOp = 6'b000000;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b0;
            JumpRegister = 1'b0;
        end
    endcase
end

endmodule