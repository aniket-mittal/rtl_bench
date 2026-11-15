module origen_167672(
    input [5:0] entrada,
    output reg [1:0] ALUop,
    output reg RegWrite,
    output reg Jump,
    output reg ALUsrc,
    output reg MemWrite,
    output reg MemToReg,
    output reg MemRead,
    output reg Branch,
    output reg RegDst
);

always @(*) begin
    case (entrada)
        6'b000000: begin // R-type instructions
            ALUop = 2'b10;
            RegWrite = 1'b1;
            Jump = 1'b0;
            ALUsrc = 1'b0;
            MemWrite = 1'b0;
            MemToReg = 1'b0;
            MemRead = 1'b0;
            Branch = 1'b0;
            RegDst = 1'b1;
        end
        6'b100011: begin // LW (Load Word)
            ALUop = 2'bxx;
            RegWrite = 1'b1;
            Jump = 1'b0;
            ALUsrc = 1'b1;
            MemWrite = 1'b0;
            MemToReg = 1'b1;
            MemRead = 1'b1;
            Branch = 1'b0;
            RegDst = 1'b0;
        end
        6'b101011: begin // SW (Store Word)
            ALUop = 2'bxx;
            RegWrite = 1'b0;
            Jump = 1'b0;
            ALUsrc = 1'b1;
            MemWrite = 1'b1;
            MemToReg = 1'bx;
            MemRead = 1'b0;
            Branch = 1'b0;
            RegDst = 1'bx;
        end
        6'b000100: begin // BEQ (Branch on Equal)
            ALUop = 2'bxx;
            RegWrite = 1'b0;
            Jump = 1'b0;
            ALUsrc = 1'b0;
            MemWrite = 1'b0;
            MemToReg = 1'b0;
            MemRead = 1'b0;
            Branch = 1'b1;
            RegDst = 1'bx;
        end
        6'b000010: begin // J (Jump)
            ALUop = 2'bxx;
            RegWrite = 1'b0;
            Jump = 1'b1;
            ALUsrc = 1'bx;
            MemWrite = 1'b0;
            MemToReg = 1'b0;
            MemRead = 1'b0;
            Branch = 1'b0;
            RegDst = 1'bx;
        end
        6'b001000: begin // ADDI (Add Immediate)
            ALUop = 2'b00;
            RegWrite = 1'b1;
            Jump = 1'b0;
            ALUsrc = 1'b1;
            MemWrite = 1'b0;
            MemToReg = 1'b0;
            MemRead = 1'b0;
            Branch = 1'b0;
            RegDst = 1'b0;
        end
        default: begin
            ALUop = 2'bxx;
            RegWrite = 1'bx;
            Jump = 1'bx;
            ALUsrc = 1'bx;
            MemWrite = 1'bx;
            MemToReg = 1'bx;
            MemRead = 1'bx;
            Branch = 1'bx;
            RegDst = 1'bx;
        end
    endcase
end

endmodule