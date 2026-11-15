module origen_161307(
    input [5:0] opcode,
    input [5:0] func,
    output reg RegDest,
    output reg Branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite,
    output reg [2:0] aluc
);

    always @(*) begin
        case (opcode)
            6'b000000: begin // R-type instructions
                case (func)
                    6'b100000: begin // add
                        RegDest = 1;
                        Branch = 0;
                        MemRead = 0;
                        MemtoReg = 0;
                        MemWrite = 0;
                        ALUSrc = 0;
                        RegWrite = 1;
                        aluc = 3'b000;
                    end
                    6'b100010: begin // sub
                        RegDest = 1;
                        Branch = 0;
                        MemRead = 0;
                        MemtoReg = 0;
                        MemWrite = 0;
                        ALUSrc = 0;
                        RegWrite = 1;
                        aluc = 3'b001;
                    end
                    6'b100100: begin // and
                        RegDest = 1;
                        Branch = 0;
                        MemRead = 0;
                        MemtoReg = 0;
                        MemWrite = 0;
                        ALUSrc = 0;
                        RegWrite = 1;
                        aluc = 3'b010;
                    end
                    6'b100101: begin // or
                        RegDest = 1;
                        Branch = 0;
                        MemRead = 0;
                        MemtoReg = 0;
                        MemWrite = 0;
                        ALUSrc = 0;
                        RegWrite = 1;
                        aluc = 3'b011;
                    end
                    6'b101010: begin // slt
                        RegDest = 1;
                        Branch = 0;
                        MemRead = 0;
                        MemtoReg = 0;
                        MemWrite = 0;
                        ALUSrc = 0;
                        RegWrite = 1;
                        aluc = 3'b100;
                    end
                    default: begin
                        // Unimplemented instructions
                        RegDest = 0;
                        Branch = 0;
                        MemRead = 0;
                        MemtoReg = 0;
                        MemWrite = 0;
                        ALUSrc = 0;
                        RegWrite = 0;
                        aluc = 3'b000;
                    end
                endcase
            end
            6'b001000: begin // addi
                RegDest = 0;
                Branch = 0;
                MemRead = 0;
                MemtoReg = 0;
                MemWrite = 0;
                ALUSrc = 1;
                RegWrite = 1;
                aluc = 3'b000;
            end
            6'b001100: begin // andi
                RegDest = 0;
                Branch = 0;
                MemRead = 0;
                MemtoReg = 0;
                MemWrite = 0;
                ALUSrc = 1;
                RegWrite = 1;
                aluc = 3'b010;
            end
            6'b100011: begin // lw
                RegDest = 0;
                Branch = 0;
                MemRead = 1;
                MemtoReg = 1;
                MemWrite = 0;
                ALUSrc = 1;
                RegWrite = 1;
                aluc = 3'b000;
            end
            6'b101011: begin // sw
                RegDest = 0;
                Branch = 0;
                MemRead = 0;
                MemtoReg = 0;
                MemWrite = 1;
                ALUSrc = 1;
                RegWrite = 0;
                aluc = 3'b000;
            end
            6'b000100: begin // beq
                RegDest = 0;
                Branch = 1;
                MemRead = 0;
                MemtoReg = 0;
                MemWrite = 0;
                ALUSrc = 0;
                RegWrite = 0;
                aluc = 3'b001;
            end
            default: begin
                // Unimplemented instructions
                RegDest = 0;
                Branch = 0;
                MemRead = 0;
                MemtoReg = 0;
                MemWrite = 0;
                ALUSrc = 0;
                RegWrite = 0;
                aluc = 3'b000;
            end
        endcase
    end

endmodule