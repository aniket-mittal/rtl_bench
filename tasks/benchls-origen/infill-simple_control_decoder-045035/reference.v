module origen_045035 (
    input [3:0] opcode,
    output reg RegDst,
    output reg Jump,
    output reg Branch,
    output reg MemRead,
    output reg MemToReg,
    output reg MemWrite,
    output reg ALUsrc,
    output reg RegWrite,
    output reg [2:0] ALUop
);

always @(*) begin
    case(opcode)
        4'h2: begin // Arithmetic/Logical operation
            RegDst = 1'b1;
            Jump = 1'b0;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemToReg = 1'b0;
            MemWrite = 1'b0;
            ALUsrc = 1'b0;
            RegWrite = 1'b1;
            ALUop = 3'b000;
        end
        4'h6: begin // Arithmetic/Logical operation
            RegDst = 1'b1;
            Jump = 1'b0;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemToReg = 1'b0;
            MemWrite = 1'b0;
            ALUsrc = 1'b0;
            RegWrite = 1'b1;
            ALUop = 3'b001;
        end
        4'h0: begin // Arithmetic/Logical operation
            RegDst = 1'b1;
            Jump = 1'b0;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemToReg = 1'b0;
            MemWrite = 1'b0;
            ALUsrc = 1'b0;
            RegWrite = 1'b1;
            ALUop = 3'b010;
        end
        4'h1: begin // Arithmetic/Logical operation
            RegDst = 1'b1;
            Jump = 1'b0;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemToReg = 1'b0;
            MemWrite = 1'b0;
            ALUsrc = 1'b0;
            RegWrite = 1'b1;
            ALUop = 3'b100;
        end
        4'h7: begin // Arithmetic/Logical operation
            RegDst = 1'b1;
            Jump = 1'b0;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemToReg = 1'b0;
            MemWrite = 1'b0;
            ALUsrc = 1'b0;
            RegWrite = 1'b1;
            ALUop = 3'b101;
        end
        4'h3: begin // Immediate arithmetic operation
            RegDst = 1'b0;
            Jump = 1'b0;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemToReg = 1'b0;
            MemWrite = 1'b0;
            ALUsrc = 1'b1;
            RegWrite = 1'b1;
            ALUop = 3'b011;
        end
        4'h8: begin // Load operation
            RegDst = 1'b0;
            Jump = 1'b0;
            Branch = 1'b0;
            MemRead = 1'b1;
            MemToReg = 1'b1;
            MemWrite = 1'b0;
            ALUsrc = 1'b1;
            RegWrite = 1'b1;
            ALUop = 3'b011;
        end
        4'hA: begin // Store operation
            RegDst = 1'b0;
            Jump = 1'b0;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemToReg = 1'b0;
            MemWrite = 1'b1;
            ALUsrc = 1'b1;
            RegWrite = 1'b0;
            ALUop = 3'b011;
        end
        4'hE: begin // Branch operation
            RegDst = 1'b0;
            Jump = 1'b0;
            Branch = 1'b1;
            MemRead = 1'b0;
            MemToReg = 1'b0;
            MemWrite = 1'b0;
            ALUsrc = 1'b0;
            RegWrite = 1'b0;
            ALUop = 3'b000;
        end
        4'hF: begin // Jump operation
            RegDst = 1'b0;
            Jump = 1'b1;
            Branch = 1'b0;
            MemRead = 1'b0;
            MemToReg = 1'b0;
            MemWrite = 1'b0;
            ALUsrc = 1'b0;
            RegWrite = 1'b0;
            ALUop = 3'b000;
        end
        default: begin // NOP or undefined opcode
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