module origen_006969(
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
    output reg [3:0] ALUOp
);

    always @(*) begin
        // Default values
        PCSrc = 2'b00;
        Branch = 1'b0;
        RegWrite = 1'b1;
        RegDst = 2'b01;
        MemRead = 1'b0;
        MemWrite = 1'b0;
        MemtoReg = 2'b00;
        ALUSrc1 = 1'b0;
        ALUSrc2 = 1'b0;
        ExtOp = 1'b0;
        LuOp = 1'b0;
        ALUOp = 4'b0000;

        case(OpCode)
            6'h00: begin // R-type
                case(Funct)
                    6'h08, 6'h09: PCSrc = 2'b10; // jr, jalr
                    6'h09: begin // jalr
                        RegDst = 2'b10;
                        MemtoReg = 2'b10;
                    end
                    6'h00, 6'h02, 6'h03: ALUSrc1 = 1'b1; // Shift instructions
                endcase
                ALUOp = 4'b0010;
            end
            6'h02, 6'h03: begin // j, jal
                PCSrc = 2'b01;
                RegWrite = (OpCode == 6'h03); // Write only for jal
                RegDst = 2'b10;
                MemtoReg = 2'b10;
            end
            6'h04: begin // beq
                Branch = 1'b1;
                RegWrite = 1'b0;
                ALUOp = 4'b0001;
            end
            6'h0f: begin // lui
                RegDst = 2'b00;
                MemtoReg = 2'b01;
                ALUSrc2 = 1'b1;
                LuOp = 1'b1;
            end
            6'h23: begin // lw
                RegDst = 2'b00;
                MemRead = 1'b1;
                MemtoReg = 2'b01;
                ALUSrc2 = 1'b1;
                ExtOp = 1'b1;
            end
            6'h2b: begin // sw
                RegWrite = 1'b0;
                MemWrite = 1'b1;
                ALUSrc2 = 1'b1;
                ExtOp = 1'b1;
            end
            6'h0c: begin // andi
                RegDst = 2'b00;
                ALUSrc2 = 1'b1;
                ALUOp = 4'b0100;
            end
            6'h0a, 6'h0b: begin // slti, sltiu
                RegDst = 2'b00;
                ALUSrc2 = 1'b1;
                ExtOp = 1'b1;
                ALUOp = 4'b0101;
            end
            default: begin // Other I-type instructions
                RegDst = 2'b00;
                ALUSrc2 = 1'b1;
                ExtOp = 1'b1;
            end
        endcase

        // Set the highest bit of ALUOp to the least significant bit of OpCode
        ALUOp[3] = OpCode[0];
    end

endmodule