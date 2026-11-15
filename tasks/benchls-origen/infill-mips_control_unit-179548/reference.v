module origen_179548(
    input [3:0] opcode,
    output reg RegDst, Jump, Branch, MemRead, MemToReg, MemWrite, ALUsrc, RegWrite,
    output reg [2:0] ALUop
);

always @(*) begin
    case (opcode)
        4'h0: begin // R-type
            RegDst = 1'b1;
            Jump = 1'b0;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemToReg = 1'b0;
            MemWrite = 1'b0;
            ALUsrc = 1'b0;
            RegWrite = 1'b1;
            ALUop = 3'b011;
        end
        4'h2: begin // Load Word
            RegDst = 1'b0;
            Jump = 1'b0;
            Branch = 1'b0;
            MemRead = 1'b1;
            MemToReg = 1'b1;
            MemWrite = 1'b0;
            ALUsrc = 1'b1;
            RegWrite = 1'b1;
            ALUop = 3'b000;
        end
        4'h3: begin // Store Word
            RegDst = 1'bx;
            Jump = 1'b0;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemToReg = 1'bx;
            MemWrite = 1'b1;
            ALUsrc = 1'b1;
            RegWrite = 1'b0;
            ALUop = 3'b000;
        end
        4'h4: begin // Branch Equal
            RegDst = 1'bx;
            Jump = 1'b0;
            Branch = 1'b1;
            MemRead = 1'b0;
            MemToReg = 1'bx;
            MemWrite = 1'b0;
            ALUsrc = 1'b0;
            RegWrite = 1'b0;
            ALUop = 3'b001;
        end
        4'h8: begin // Addi
            RegDst = 1'b0;
            Jump = 1'b0;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemToReg = 1'b0;
            MemWrite = 1'b0;
            ALUsrc = 1'b1;
            RegWrite = 1'b1;
            ALUop = 3'b000;
        end
        4'hc: begin // Jump
            RegDst = 1'bx;
            Jump = 1'b1;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemToReg = 1'bx;
            MemWrite = 1'b0;
            ALUsrc = 1'bx;
            RegWrite = 1'b0;
            ALUop = 3'bx;
        end
        default: begin
            RegDst = 1'b0;
            Jump = 1'b0;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemToReg = 1'b0;
            MemWrite = 1'b0;
            ALUsrc = 1'b0;
            RegWrite = 1'b0;
            ALUop = 3'b000;
        end
    endcase
end

endmodule