module origen_063174(
    input [5:0] Op,
    output reg RegDst,
    output reg MemRead,
    output reg MemtoReg,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite,
    output reg Jump,
    output reg Branch,
    output reg [2:0] ALUOp
);

always @(*) begin
    case(Op)
        6'd54: begin // R-type arithmetic instruction
            RegDst = 1'b1;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b1;
            Jump = 1'b0;
            Branch = 1'b0;
            ALUOp = 3'b010;
        end
        6'd39: begin // Store Word instruction
            RegDst = 1'b0;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            MemWrite = 1'b1;
            ALUSrc = 1'b1;
            RegWrite = 1'b0;
            Jump = 1'b0;
            Branch = 1'b0;
            ALUOp = 3'b000;
        end
        6'd40: begin // Load Word instruction
            RegDst = 1'b0;
            MemRead = 1'b1;
            MemtoReg = 1'b1;
            MemWrite = 1'b0;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
            Jump = 1'b0;
            Branch = 1'b0;
            ALUOp = 3'b000;
        end
        6'd41, 6'd42: begin // Immediate arithmetic instructions
            RegDst = 1'b0;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            MemWrite = 1'b0;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
            Jump = 1'b0;
            Branch = 1'b0;
            ALUOp = (Op == 6'd41) ? 3'b000 : 3'b001;
        end
        6'd31: begin // Branch instruction
            RegDst = 1'b0;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b0;
            Jump = 1'b0;
            Branch = 1'b1;
            ALUOp = 3'b101;
        end
        6'd32: begin // Jump instruction
            RegDst = 1'b0;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b0;
            Jump = 1'b1;
            Branch = 1'b0;
            ALUOp = 3'b000;
        end
        default: begin // Undefined operations
            RegDst = 1'bz;
            MemRead = 1'bz;
            MemtoReg = 1'bz;
            MemWrite = 1'bz;
            ALUSrc = 1'bz;
            RegWrite = 1'bz;
            Jump = 1'bz;
            Branch = 1'bz;
            ALUOp = 3'bzzz;
        end
    endcase
end

endmodule