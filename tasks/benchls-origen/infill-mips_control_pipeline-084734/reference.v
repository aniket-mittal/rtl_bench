module origen_084734(
    input [5:0] Opcode,
    output reg [1:0] EX,
    output reg [2:0] M,
    output reg [2:0] WB,
    output reg [3:0] ALUop
);

always @(*) begin
    case(Opcode)
        6'b000010: begin // Jump
            EX = 2'b00;
            M = 3'b000;
            WB = 3'b100;
            ALUop = 4'b0000;
        end
        6'b000000: begin // R-type
            EX = 2'b10;
            M = 3'b000;
            WB = 3'b110;
            ALUop = 4'b0010;
        end
        6'b001000: begin // ADDI
            EX = 2'b11;
            M = 3'b000;
            WB = 3'b110;
            ALUop = 4'b0000;
        end
        6'b001100: begin // ANDI
            EX = 2'b11;
            M = 3'b000;
            WB = 3'b110;
            ALUop = 4'b0011;
        end
        6'b001101: begin // ORI
            EX = 2'b11;
            M = 3'b000;
            WB = 3'b110;
            ALUop = 4'b0100;
        end
        6'b001010: begin // SLTI
            EX = 2'b11;
            M = 3'b000;
            WB = 3'b110;
            ALUop = 4'b0101;
        end
        6'b001110: begin // XORI
            EX = 2'b11;
            M = 3'b000;
            WB = 3'b110;
            ALUop = 4'b0110;
        end
        6'b101010: begin // SLT
            EX = 2'b11;
            M = 3'b000;
            WB = 3'b110;
            ALUop = 4'b0101;
        end
        6'b101111: begin // SLTU
            EX = 2'b11;
            M = 3'b000;
            WB = 3'b110;
            ALUop = 4'b1000;
        end
        6'b110001: begin // Load
            EX = 2'b11;
            M = 3'b010;
            WB = 3'b111;
            ALUop = 4'b0000;
        end
        6'b101011: begin // Store
            EX = 2'b11;
            M = 3'b001;
            WB = 3'b000;
            ALUop = 4'b0000;
        end
        6'b000100: begin // Branch
            EX = 2'b01;
            M = 3'b000;
            WB = 3'b000;
            ALUop = 4'b0001;
        end
        default: begin
            EX = 2'b00;
            M = 3'b000;
            WB = 3'b000;
            ALUop = 4'b0000;
        end
    endcase
end

endmodule