module origen_169004(
    input [5:0] Opcode,
    input [5:0] Funct,
    output reg [3:0] ALUop,
    output reg RegDst,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg ALUSrc,
    output reg MemtoReg,
    output reg Branch,
    output reg NotEqualBranch,
    output reg Jump
);

    always @(*) begin
        case (Opcode)
            6'b000000: begin // R-type instructions
                case (Funct)
                    6'b100000: begin // add
                        ALUop = 4'b0010;
                        RegDst = 1'b1;
                        RegWrite = 1'b1;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        ALUSrc = 1'b0;
                        MemtoReg = 1'b0;
                        Branch = 1'b0;
                        NotEqualBranch = 1'b0;
                        Jump = 1'b0;
                    end
                    6'b100010: begin // sub
                        ALUop = 4'b0110;
                        RegDst = 1'b1;
                        RegWrite = 1'b1;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        ALUSrc = 1'b0;
                        MemtoReg = 1'b0;
                        Branch = 1'b0;
                        NotEqualBranch = 1'b0;
                        Jump = 1'b0;
                    end
                    6'b100100: begin // and
                        ALUop = 4'b0000;
                        RegDst = 1'b1;
                        RegWrite = 1'b1;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        ALUSrc = 1'b0;
                        MemtoReg = 1'b0;
                        Branch = 1'b0;
                        NotEqualBranch = 1'b0;
                        Jump = 1'b0;
                    end
                    6'b100101: begin // or
                        ALUop = 4'b0001;
                        RegDst = 1'b1;
                        RegWrite = 1'b1;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        ALUSrc = 1'b0;
                        MemtoReg = 1'b0;
                        Branch = 1'b0;
                        NotEqualBranch = 1'b0;
                        Jump = 1'b0;
                    end
                    // Add more cases for other R-type instructions
                    default: begin
                        ALUop = 4'b0000;
                        RegDst = 1'b0;
                        RegWrite = 1'b0;
                        MemRead = 1'b0;
                        MemWrite = 1'b0;
                        ALUSrc = 1'b0;
                        MemtoReg = 1'b0;
                        Branch = 1'b0;
                        NotEqualBranch = 1'b0;
                        Jump = 1'b0;
                    end
                endcase
            end
            6'b100011: begin // lw (load word)
                ALUop = 4'b0010;
                RegDst = 1'b0;
                RegWrite = 1'b1;
                MemRead = 1'b1;
                MemWrite = 1'b0;
                ALUSrc = 1'b1;
                MemtoReg = 1'b1;
                Branch = 1'b0;
                NotEqualBranch = 1'b0;
                Jump = 1'b0;
            end
            6'b101011: begin // sw (store word)
                ALUop = 4'b0010;
                RegDst = 1'b0;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b1;
                ALUSrc = 1'b1;
                MemtoReg = 1'b0;
                Branch = 1'b0;
                NotEqualBranch = 1'b0;
                Jump = 1'b0;
            end
            6'b000100: begin // beq (branch on equal)
                ALUop = 4'b0110;
                RegDst = 1'b0;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                ALUSrc = 1'b0;
                MemtoReg = 1'b0;
                Branch = 1'b1;
                NotEqualBranch = 1'b0;
                Jump = 1'b0;
            end
            6'b000101: begin // bne (branch on not equal)
                ALUop = 4'b0110;
                RegDst = 1'b0;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                ALUSrc = 1'b0;
                MemtoReg = 1'b0;
                Branch = 1'b0;
                NotEqualBranch = 1'b1;
                Jump = 1'b0;
            end
            6'b000010: begin // j (jump)
                ALUop = 4'b0000;
                RegDst = 1'b0;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                ALUSrc = 1'b0;
                MemtoReg = 1'b0;
                Branch = 1'b0;
                NotEqualBranch = 1'b0;
                Jump = 1'b1;
            end
            default: begin
                ALUop = 4'b0000;
                RegDst = 1'b0;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                ALUSrc = 1'b0;
                MemtoReg = 1'b0;
                Branch = 1'b0;
                NotEqualBranch = 1'b0;
                Jump = 1'b0;
            end
        endcase
    end

endmodule