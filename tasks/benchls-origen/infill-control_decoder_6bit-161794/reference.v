module origen_161794 (
    input [5:0] opcode,
    output reg [3:0] EXE_CMD,
    output reg MEM_R_EN,
    output reg MEM_W_EN,
    output reg WB_EN,
    output reg IS_IMM,
    output reg [1:0] BR_Type
);

always @(*) begin
    case (opcode)
        6'b000000: begin // NOP
            EXE_CMD = 4'bx;
            MEM_R_EN = 1'b0;
            MEM_W_EN = 1'b0;
            WB_EN = 1'b0;
            IS_IMM = 1'b0;
            BR_Type = 2'b00;
        end
        6'b000001: begin // ADD
            EXE_CMD = 4'b0000;
            MEM_R_EN = 1'b0;
            MEM_W_EN = 1'b0;
            WB_EN = 1'b1;
            IS_IMM = 1'b0;
            BR_Type = 2'b00;
        end
        6'b000011: begin // SUB
            EXE_CMD = 4'b0010;
            MEM_R_EN = 1'b0;
            MEM_W_EN = 1'b0;
            WB_EN = 1'b1;
            IS_IMM = 1'b0;
            BR_Type = 2'b00;
        end
        6'b000101: begin // AND
            EXE_CMD = 4'b0100;
            MEM_R_EN = 1'b0;
            MEM_W_EN = 1'b0;
            WB_EN = 1'b1;
            IS_IMM = 1'b0;
            BR_Type = 2'b00;
        end
        6'b000110: begin // OR
            EXE_CMD = 4'b0101;
            MEM_R_EN = 1'b0;
            MEM_W_EN = 1'b0;
            WB_EN = 1'b1;
            IS_IMM = 1'b0;
            BR_Type = 2'b00;
        end
        6'b000111: begin // NOR
            EXE_CMD = 4'b0110;
            MEM_R_EN = 1'b0;
            MEM_W_EN = 1'b0;
            WB_EN = 1'b1;
            IS_IMM = 1'b0;
            BR_Type = 2'b00;
        end
        6'b001000: begin // XOR
            EXE_CMD = 4'b0111;
            MEM_R_EN = 1'b0;
            MEM_W_EN = 1'b0;
            WB_EN = 1'b1;
            IS_IMM = 1'b0;
            BR_Type = 2'b00;
        end
        6'b001001: begin // SAL
            EXE_CMD = 4'b1000;
            MEM_R_EN = 1'b0;
            MEM_W_EN = 1'b0;
            WB_EN = 1'b1;
            IS_IMM = 1'b0;
            BR_Type = 2'b00;
        end
        6'b001010: begin // SLL
            EXE_CMD = 4'b1000;
            MEM_R_EN = 1'b0;
            MEM_W_EN = 1'b0;
            WB_EN = 1'b1;
            IS_IMM = 1'b0;
            BR_Type = 2'b00;
        end
        6'b001011: begin // SRA
            EXE_CMD = 4'b1001;
            MEM_R_EN = 1'b0;
            MEM_W_EN = 1'b0;
            WB_EN = 1'b1;
            IS_IMM = 1'b0;
            BR_Type = 2'b00;
        end
        6'b001100: begin // SRL
            EXE_CMD = 4'b1010;
            MEM_R_EN = 1'b0;
            MEM_W_EN = 1'b0;
            WB_EN = 1'b1;
            IS_IMM = 1'b0;
            BR_Type = 2'b00;
        end
        6'b100000: begin // ADDI
            EXE_CMD = 4'b0000;
            MEM_R_EN = 1'b0;
            MEM_W_EN = 1'b0;
            WB_EN = 1'b1;
            IS_IMM = 1'b1;
            BR_Type = 2'b00;
        end
        6'b100001: begin // SUBI
            EXE_CMD = 4'b0010;
            MEM_R_EN = 1'b0;
            MEM_W_EN = 1'b0;
            WB_EN = 1'b1;
            IS_IMM = 1'b1;
            BR_Type = 2'b00;
        end
        6'b100100: begin // LD
            EXE_CMD = 4'b0000;
            MEM_R_EN = 1'b1;
            MEM_W_EN = 1'b0;
            WB_EN = 1'b1;
            IS_IMM = 1'b1;
            BR_Type = 2'b00;
        end
        6'b100101: begin // ST
            EXE_CMD = 4'b0000;
            MEM_R_EN = 1'b0;
            MEM_W_EN = 1'b1;
            WB_EN = 1'b0;
            IS_IMM = 1'b1;
            BR_Type = 2'b00;
        end
        6'b101000: begin // BEZ
            EXE_CMD = 4'bx;
            MEM_R_EN = 1'b0;
            MEM_W_EN = 1'b0;
            WB_EN = 1'b0;
            IS_IMM = 1'b0;
            BR_Type = 2'b01;
        end
        6'b101001: begin // BNE
            EXE_CMD = 4'bx;
            MEM_R_EN = 1'b0;
            MEM_W_EN = 1'b0;
            WB_EN = 1'b0;
            IS_IMM = 1'b0;
            BR_Type = 2'b10;
        end
        6'b101010: begin // JMP
            EXE_CMD = 4'bx;
            MEM_R_EN = 1'b0;
            MEM_W_EN = 1'b0;
            WB_EN = 1'b0;
            IS_IMM = 1'b0;
            BR_Type = 2'b11;
        end
        default: begin
            EXE_CMD = 4'bz;
            MEM_R_EN = 1'b0;
            MEM_W_EN = 1'b0;
            WB_EN = 1'b0;
            IS_IMM = 1'b0;
            BR_Type = 2'b00;
        end
    endcase
end

endmodule