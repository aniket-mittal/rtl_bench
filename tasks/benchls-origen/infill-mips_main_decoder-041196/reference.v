module origen_041196(
    input [5:0] op,
    output reg RegDst,
    output reg Branch,
    output reg MemtoReg,
    output reg Alusrc,
    output reg MemWrite,
    output reg RegWrite,
    output reg Jump,
    output reg Extop,
    output reg [1:0] Aluop,
    output reg r_type
);

always @(*) begin
    case(op)
        6'b000000: begin // R-type
            RegDst = 1'b1;
            Branch = 1'b0;
            MemtoReg = 1'b0;
            Alusrc = 1'b0;
            MemWrite = 1'b0;
            RegWrite = 1'b1;
            Jump = 1'b0;
            Extop = 1'b0;
            Aluop = 2'b01;
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
            Extop = 1'b0;
            Aluop = 2'b10;
            r_type = 1'b0;
        end
        6'b100011: begin // Load Word
            RegDst = 1'b0;
            Branch = 1'b0;
            MemtoReg = 1'b1;
            Alusrc = 1'b1;
            MemWrite = 1'b0;
            RegWrite = 1'b1;
            Jump = 1'b0;
            Extop = 1'b1;
            Aluop = 2'b00;
            r_type = 1'b0;
        end
        6'b101011: begin // Store Word
            RegDst = 1'b0;
            Branch = 1'b0;
            MemtoReg = 1'b0;
            Alusrc = 1'b1;
            MemWrite = 1'b1;
            RegWrite = 1'b0;
            Jump = 1'b0;
            Extop = 1'b1;
            Aluop = 2'b00;
            r_type = 1'b0;
        end
        6'b000100: begin // Branch on Equal
            RegDst = 1'b0;
            Branch = 1'b1;
            MemtoReg = 1'b0;
            Alusrc = 1'b0;
            MemWrite = 1'b0;
            RegWrite = 1'b0;
            Jump = 1'b0;
            Extop = 1'b0;
            Aluop = 2'b01;
            r_type = 1'b0;
        end
        6'b000010: begin // Jump
            RegDst = 1'b0;
            Branch = 1'b0;
            MemtoReg = 1'b0;
            Alusrc = 1'b0;
            MemWrite = 1'b0;
            RegWrite = 1'b0;
            Jump = 1'b1;
            Extop = 1'b0;
            Aluop = 2'b01;
            r_type = 1'b0;
        end
        6'b001000, 6'b001001: begin // ADDI, ADDIU
            RegDst = 1'b0;
            Branch = 1'b0;
            MemtoReg = 1'b0;
            Alusrc = 1'b1;
            MemWrite = 1'b0;
            RegWrite = 1'b1;
            Jump = 1'b0;
            Extop = 1'b1;
            Aluop = 2'b00;
            r_type = 1'b0;
        end
        6'b001010: begin // SLTI
            RegDst = 1'b1;
            Branch = 1'b0;
            MemtoReg = 1'b0;
            Alusrc = 1'b0;
            MemWrite = 1'b0;
            RegWrite = 1'b1;
            Jump = 1'b0;
            Extop = 1'b0;
            Aluop = 2'b00;
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
            Aluop = 2'b00;
            r_type = 1'b0;
        end
    endcase
end

endmodule