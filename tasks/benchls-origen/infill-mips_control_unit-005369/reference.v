module origen_005369(
    input [5:0] op,
    input [5:0] func,
    output reg [1:0] RegDst,
    output reg ALUSrc,
    output reg [1:0] MemtoReg,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg IfBeq,
    output reg [1:0] ExtOp,
    output reg [1:0] ALUOp,
    output reg jr,
    output reg jal
);

    always @(*) begin
        // Default values
        RegDst = 2'b00;
        ALUSrc = 1'b0;
        MemtoReg = 2'b00;
        RegWrite = 1'b0;
        MemRead = 1'b0;
        MemWrite = 1'b0;
        IfBeq = 1'b0;
        ExtOp = 2'b00;
        ALUOp = 2'b00;
        jr = 1'b0;
        jal = 1'b0;

        case(op)
            6'b000000: begin // R-type instructions
                RegDst = 2'b01;
                RegWrite = 1'b1;
                ALUOp = 2'b10;
                if (func == 6'b001000) begin // jr instruction
                    jr = 1'b1;
                    RegWrite = 1'b0;
                end
            end
            6'b100011: begin // lw
                ALUSrc = 1'b1;
                MemtoReg = 2'b01;
                RegWrite = 1'b1;
                MemRead = 1'b1;
                ExtOp = 2'b01;
            end
            6'b101011: begin // sw
                ALUSrc = 1'b1;
                MemWrite = 1'b1;
                ExtOp = 2'b01;
            end
            6'b000100: begin // beq
                IfBeq = 1'b1;
                ALUOp = 2'b01;
                ExtOp = 2'b01;
            end
            6'b001000: begin // addi
                ALUSrc = 1'b1;
                RegWrite = 1'b1;
                ExtOp = 2'b01;
            end
            6'b001100: begin // andi
                ALUSrc = 1'b1;
                RegWrite = 1'b1;
                ALUOp = 2'b11;
            end
            6'b001101: begin // ori
                ALUSrc = 1'b1;
                RegWrite = 1'b1;
                ALUOp = 2'b11;
            end
            6'b001010: begin // slti
                ALUSrc = 1'b1;
                RegWrite = 1'b1;
                ALUOp = 2'b11;
                ExtOp = 2'b01;
            end
            6'b000010: begin // j
                // No additional control signals needed
            end
            6'b000011: begin // jal
                RegDst = 2'b10;
                RegWrite = 1'b1;
                MemtoReg = 2'b10;
                jal = 1'b1;
            end
            default: begin
                // Invalid opcode, all signals remain at default values
            end
        endcase
    end

endmodule