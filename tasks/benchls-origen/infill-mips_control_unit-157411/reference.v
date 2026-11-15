module origen_157411(
    input [5:0] op,
    output reg RegDst,
    output reg Branch,
    output reg MemtoReg,
    output reg Alusrc,
    output reg MemWrite,
    output reg RegWrite,
    output reg Jump,
    output reg Extop,
    output reg [2:0] Aluop,
    output reg r_type
);

always @(*) begin
    case (op)
        6'b000000: begin // R-type instruction
            RegDst = 1'b1;
            Branch = 1'b0;
            MemtoReg = 1'b0;
            Alusrc = 1'b0;
            MemWrite = 1'b0;
            RegWrite = 1'b1;
            Jump = 1'b0;
            Extop = 1'b0;
            Aluop = 3'b010;
            r_type = 1'b1;
        end
        6'b001101: begin // ORI
            RegDst = 1'b0;
            Branch = 1'b0;
            MemtoReg = 1'b0;
            Alusrc = 1'b1;
            MemWrite = 1'b0;
            RegWrite = 1'b1;
            Jump = 1'b0;
            Extop = 1'b1;
            Aluop = 3'b001;
            r_type = 1'b0;
        end
        6'b100011: begin // LW
            RegDst = 1'b0;
            Branch = 1'b0;
            MemtoReg = 1'b1;
            Alusrc = 1'b1;
            MemWrite = 1'b0;
            RegWrite = 1'b1;
            Jump = 1'b0;
            Extop = 1'b0;
            Aluop = 3'b000;
            r_type = 1'b0;
        end
        6'b101011: begin // SW
            RegDst = 1'bx;
            Branch = 1'b0;
            MemtoReg = 1'bx;
            Alusrc = 1'b1;
            MemWrite = 1'b1;
            RegWrite = 1'b0;
            Jump = 1'b0;
            Extop = 1'b0;
            Aluop = 3'b000;
            r_type = 1'b0;
        end
        6'b000100: begin // BEQ
            RegDst = 1'bx;
            Branch = 1'b1;
            MemtoReg = 1'bx;
            Alusrc = 1'b0;
            MemWrite = 1'b0;
            RegWrite = 1'b0;
            Jump = 1'b0;
            Extop = 1'b0;
            Aluop = 3'b011;
            r_type = 1'b0;
        end
        6'b000010: begin // J
            RegDst = 1'bx;
            Branch = 1'b0;
            MemtoReg = 1'bx;
            Alusrc = 1'bx;
            MemWrite = 1'b0;
            RegWrite = 1'b0;
            Jump = 1'b1;
            Extop = 1'bx;
            Aluop = 3'bx;
            r_type = 1'b0;
        end
        6'b001000: begin // ADDI
            RegDst = 1'b0;
            Branch = 1'b0;
            MemtoReg = 1'b0;
            Alusrc = 1'b1;
            MemWrite = 1'b0;
            RegWrite = 1'b1;
            Jump = 1'b0;
            Extop = 1'b0;
            Aluop = 3'b000;
            r_type = 1'b0;
        end
        6'b001001: begin // ADDIU
            RegDst = 1'b0;
            Branch = 1'b0;
            MemtoReg = 1'b0;
            Alusrc = 1'b1;
            MemWrite = 1'b0;
            RegWrite = 1'b1;
            Jump = 1'b0;
            Extop = 1'b0;
            Aluop = 3'b000;
            r_type = 1'b0;
        end
        6'b001010: begin // SLT
            RegDst = 1'b1;
            Branch = 1'b0;
            MemtoReg = 1'b0;
            Alusrc = 1'b0;
            MemWrite = 1'b0;
            RegWrite = 1'b1;
            Jump = 1'b0;
            Extop = 1'b0;
            Aluop = 3'b111;
            r_type = 1'b1;
        end
        default: begin
            RegDst = 1'b0;
            Branch = 1'b0;
            MemtoReg = 1'b0;
            Alusrc = 1'b0;
            MemWrite = 1'b0;
            RegWrite = 1'b0;
            Jump = 1'b0;
            Extop = 1'b0;
            Aluop = 3'b000;
            r_type = 1'b0;
        end
    endcase
end

endmodule