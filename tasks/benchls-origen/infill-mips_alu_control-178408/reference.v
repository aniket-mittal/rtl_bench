module origen_178408(
    input [5:0] OpCode,
    input [5:0] FuncCode,
    output reg RegDst,
    output reg RegWrite,
    output reg AluSrc,
    output reg MemRead,
    output reg MemWrite,
    output reg MemToReg,
    output reg [2:0] ALUOperation
);

    always @(*) begin
        // Initialize control signals to 0
        RegDst = 0;
        RegWrite = 0;
        AluSrc = 0;
        MemRead = 0;
        MemWrite = 0;
        MemToReg = 0;
        ALUOperation = 0;

        case (OpCode)
            6'b000000: begin // R-type instructions
                case (FuncCode)
                    6'b100000: begin // ADD
                        ALUOperation = 3'b010;
                        RegWrite = 1;
                    end
                    6'b100010: begin // SUB
                        ALUOperation = 3'b110;
                        RegWrite = 1;
                    end
                    6'b100100: begin // AND
                        ALUOperation = 3'b000;
                        RegWrite = 1;
                    end
                    6'b100101: begin // OR
                        ALUOperation = 3'b001;
                        RegWrite = 1;
                    end
                    6'b101010: begin // SLT
                        ALUOperation = 3'b111;
                        RegWrite = 1;
                    end
                    default: begin
                        ALUOperation = 3'b000;
                        RegWrite = 0;
                    end
                endcase
                RegDst = 1;
                AluSrc = 0;
            end

            6'b001000: begin // ADDI
                ALUOperation = 3'b010;
                RegDst = 0;
                RegWrite = 1;
                AluSrc = 1;
            end

            6'b001100: begin // ANDI
                ALUOperation = 3'b000;
                RegDst = 0;
                RegWrite = 1;
                AluSrc = 1;
            end

            6'b101011: begin // SW
                ALUOperation = 3'b010;
                RegWrite = 0;
                AluSrc = 1;
                MemRead = 0;
                MemWrite = 1;
            end

            6'b100011: begin // LW
                RegDst = 0;
                ALUOperation = 3'b010;
                RegWrite = 1;
                AluSrc = 1;
                MemRead = 1;
                MemToReg = 1;
            end

            // Add the logic for jump and branch instructions here
            /*
            6'b000010: // J
                // Implement the logic for the jump instruction
            6'b000100: // BEQ
                // Implement the logic for the branch-on-equal instruction
            6'b000101: // BNE
                // Implement the logic for the branch-on-not-equal instruction
            */

            default: begin
                // Implement the logic for other instructions or set the control signals to a default state
            end
        endcase
    end

endmodule