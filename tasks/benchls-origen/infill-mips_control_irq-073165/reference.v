module origen_073165(
    input [5:0] OpCode,
    input [5:0] Funct,
    output reg [1:0] PCSrc,
    output reg Branch,
    output reg RegWrite,
    output reg [1:0] RegDst,
    output reg MemRead,
    output reg MemWrite,
    output reg [1:0] MemtoReg,
    output reg ALUSrc1,
    output reg ALUSrc2,
    output reg ExtOp,
    output reg LuOp,
    output reg [3:0] ALUOp,
    output reg irq
);

    always @(*) begin
        // Default values
        PCSrc = 2'b00;
        Branch = 1'b0;
        RegWrite = 1'b0;
        RegDst = 2'b00;
        MemRead = 1'b0;
        MemWrite = 1'b0;
        MemtoReg = 2'b00;
        ALUSrc1 = 1'b0;
        ALUSrc2 = 1'b0;
        ExtOp = 1'b1;
        LuOp = 1'b0;
        ALUOp = 4'b0000;
        irq = 1'b0;

        case(OpCode)
            6'b000000: begin // R-type instructions
                RegWrite = 1'b1;
                RegDst = 2'b01;
                ALUOp = {1'b0, Funct[2:0]};
                if (Funct == 6'b001000) begin // JR
                    PCSrc = 2'b10;
                    RegWrite = 1'b0;
                end
            end
            6'b000010: begin // J
                PCSrc = 2'b01;
            end
            6'b000011: begin // JAL
                PCSrc = 2'b01;
                RegWrite = 1'b1;
                RegDst = 2'b10;
                MemtoReg = 2'b10;
            end
            6'b000100: begin // BEQ
                Branch = 1'b1;
                ALUOp = 4'b0001;
            end
            6'b001000, 6'b001001: begin // ADDI, ADDIU
                RegWrite = 1'b1;
                ALUSrc2 = 1'b1;
                ALUOp = 4'b0000;
            end
            6'b001100: begin // ANDI
                RegWrite = 1'b1;
                ALUSrc2 = 1'b1;
                ExtOp = 1'b0;
                ALUOp = 4'b0010;
            end
            6'b001101: begin // ORI
                RegWrite = 1'b1;
                ALUSrc2 = 1'b1;
                ExtOp = 1'b0;
                ALUOp = 4'b0011;
            end
            6'b001111: begin // LUI
                RegWrite = 1'b1;
                ALUSrc2 = 1'b1;
                LuOp = 1'b1;
                ALUOp = 4'b0000;
            end
            6'b100011: begin // LW
                RegWrite = 1'b1;
                ALUSrc2 = 1'b1;
                MemRead = 1'b1;
                MemtoReg = 2'b01;
                ALUOp = 4'b0000;
            end
            6'b101011: begin // SW
                ALUSrc2 = 1'b1;
                MemWrite = 1'b1;
                ALUOp = 4'b0000;
            end
            default: begin
                irq = 1'b1;
            end
        endcase

        // Set ALUOp MSB based on OpCode LSB
        ALUOp[3] = OpCode[0];
    end

endmodule