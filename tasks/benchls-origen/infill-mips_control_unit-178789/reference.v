module origen_178789(
    input [5:0] opcode,
    input [5:0] funct,
    output reg RegDst,
    output reg Jump,
    output reg Branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg [3:0] aluo,
    output reg MemWrite,
    output reg AluSrc,
    output reg RegWrite,
    output reg bne
);

    always @(*) begin
        case (opcode)
            6'b000000: begin // R-type instructions
                RegDst = 1'b1;
                Jump = 1'b0;
                Branch = 1'b0;
                MemRead = 1'b0;
                MemtoReg = 1'b0;
                MemWrite = 1'b0;
                AluSrc = 1'b0;
                RegWrite = 1'b1;
                bne = 1'b0;

                case (funct)
                    6'b100000: aluo = 4'b0000; // ADD
                    6'b100010: aluo = 4'b0001; // SUB
                    6'b100100: aluo = 4'b0010; // AND
                    6'b100101: aluo = 4'b0011; // OR
                    6'b101010: aluo = 4'b0100; // SLT
                    default: aluo = 4'b0000;
                endcase
            end
            6'b001000: begin // ADDI
                RegDst = 1'b0;
                Jump = 1'b0;
                Branch = 1'b0;
                MemRead = 1'b0;
                MemtoReg = 1'b0;
                MemWrite = 1'b0;
                AluSrc = 1'b1;
                RegWrite = 1'b1;
                bne = 1'b0;
                aluo = 4'b0000;
            end
            6'b000100: begin // BEQ
                RegDst = 1'b0;
                Jump = 1'b0;
                Branch = 1'b1;
                MemRead = 1'b0;
                MemtoReg = 1'b0;
                MemWrite = 1'b0;
                AluSrc = 1'b0;
                RegWrite = 1'b0;
                bne = 1'b0;
                aluo = 4'b0001;
            end
            6'b000101: begin // BNE
                RegDst = 1'b0;
                Jump = 1'b0;
                Branch = 1'b1;
                MemRead = 1'b0;
                MemtoReg = 1'b0;
                MemWrite = 1'b0;
                AluSrc = 1'b0;
                RegWrite = 1'b0;
                bne = 1'b1;
                aluo = 4'b0001;
            end
            6'b100011: begin // LW
                RegDst = 1'b0;
                Jump = 1'b0;
                Branch = 1'b0;
                MemRead = 1'b1;
                MemtoReg = 1'b1;
                MemWrite = 1'b0;
                AluSrc = 1'b1;
                RegWrite = 1'b1;
                bne = 1'b0;
                aluo = 4'b0000;
            end
            6'b101011: begin // SW
                RegDst = 1'b0;
                Jump = 1'b0;
                Branch = 1'b0;
                MemRead = 1'b0;
                MemtoReg = 1'b0;
                MemWrite = 1'b1;
                AluSrc = 1'b1;
                RegWrite = 1'b0;
                bne = 1'b0;
                aluo = 4'b0000;
            end
            6'b000010: begin // J
                RegDst = 1'b0;
                Jump = 1'b1;
                Branch = 1'b0;
                MemRead = 1'b0;
                MemtoReg = 1'b0;
                MemWrite = 1'b0;
                AluSrc = 1'b0;
                RegWrite = 1'b0;
                bne = 1'b0;
                aluo = 4'b0000;
            end
            default: begin
                RegDst = 1'b0;
                Jump = 1'b0;
                Branch = 1'b0;
                MemRead = 1'b0;
                MemtoReg = 1'b0;
                MemWrite = 1'b0;
                AluSrc = 1'b0;
                RegWrite = 1'b0;
                bne = 1'b0;
                aluo = 4'b0000;
            end
        endcase
    end

endmodule