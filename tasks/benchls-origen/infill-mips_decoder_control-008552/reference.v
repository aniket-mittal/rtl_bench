module origen_008552(
    input [31:0] Instr,
    output reg RegDst, AluSrc, RegWrite, MemWrite, MemToReg, Jump, Link, LinkReg, Return, Byte, Half, Sign,
    output reg [1:0] ExtCtrl,
    output reg [2:0] Branch,
    output reg [3:0] AluCtrl
);

    wire [5:0] opcode = Instr[31:26];
    wire [5:0] funct = Instr[5:0];

    always @(*) begin
        // Default values
        RegDst = 0; AluSrc = 0; RegWrite = 0; MemWrite = 0; MemToReg = 0;
        Jump = 0; Link = 0; LinkReg = 0; Return = 0; Byte = 0; Half = 0; Sign = 0;
        ExtCtrl = 2'b00; Branch = 3'b000; AluCtrl = 4'b0000;

        case(opcode)
            6'b000000: begin // R-type instructions
                RegDst = 1;
                RegWrite = 1;
                case(funct)
                    6'b100001: AluCtrl = 4'b0010; // addu
                    6'b100011: AluCtrl = 4'b0110; // subu
                    6'b001000: begin // jr
                        Jump = 1;
                        Return = 1;
                        RegWrite = 0;
                    end
                    6'b000000: AluCtrl = 4'b0011; // sll
                    6'b000010: AluCtrl = 4'b0100; // srl
                    6'b000011: AluCtrl = 4'b0101; // sra
                    6'b001001: begin // jalr
                        Jump = 1;
                        Link = 1;
                        LinkReg = 1;
                        AluCtrl = 4'b0010;
                    end
                endcase
            end
            6'b001101: begin // ori
                AluSrc = 1;
                RegWrite = 1;
                ExtCtrl = 2'b00;
                AluCtrl = 4'b0001;
            end
            6'b100011: begin // lw
                AluSrc = 1;
                RegWrite = 1;
                MemToReg = 1;
                ExtCtrl = 2'b01;
                AluCtrl = 4'b0010;
            end
            6'b101011: begin // sw
                AluSrc = 1;
                MemWrite = 1;
                ExtCtrl = 2'b01;
                AluCtrl = 4'b0010;
            end
            6'b000100: begin // beq
                Branch = 3'b001;
                ExtCtrl = 2'b01;
                AluCtrl = 4'b0110;
            end
            6'b001111: begin // lui
                AluSrc = 1;
                RegWrite = 1;
                ExtCtrl = 2'b10;
                AluCtrl = 4'b0111;
            end
            6'b000011: begin // jal
                Jump = 1;
                Link = 1;
                RegWrite = 1;
                ExtCtrl = 2'b11;
            end
            6'b100000: begin // lb
                AluSrc = 1;
                RegWrite = 1;
                MemToReg = 1;
                Byte = 1;
                Sign = 1;
                ExtCtrl = 2'b01;
                AluCtrl = 4'b0010;
            end
            6'b100001: begin // lh
                AluSrc = 1;
                RegWrite = 1;
                MemToReg = 1;
                Half = 1;
                Sign = 1;
                ExtCtrl = 2'b01;
                AluCtrl = 4'b0010;
            end
            6'b101000: begin // sb
                AluSrc = 1;
                MemWrite = 1;
                Byte = 1;
                ExtCtrl = 2'b01;
                AluCtrl = 4'b0010;
            end
            6'b101001: begin // sh
                AluSrc = 1;
                MemWrite = 1;
                Half = 1;
                ExtCtrl = 2'b01;
                AluCtrl = 4'b0010;
            end
        endcase
    end

endmodule