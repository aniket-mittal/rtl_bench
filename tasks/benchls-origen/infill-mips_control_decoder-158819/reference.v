module origen_158819(
    input [5:0] op,
    input [5:0] funct,
    output reg RegDst,
    output reg ALUSrc,
    output reg MemtoReg,
    output reg RegWrite,
    output reg MemWrite,
    output reg nPC_sel,
    output reg ExtOp,
    output reg jmp,
    output reg [1:0] ALUctr
);

always @(*) begin
    case (op)
        6'b000000: begin // R-type
            case (funct)
                6'b100001: begin // addu
                    RegDst = 1'b1;
                    ALUSrc = 1'b0;
                    MemtoReg = 1'b0;
                    RegWrite = 1'b1;
                    MemWrite = 1'b0;
                    nPC_sel = 1'b0;
                    ExtOp = 1'b0;
                    jmp = 1'b0;
                    ALUctr = 2'b00;
                end
                6'b100011: begin // subu
                    RegDst = 1'b1;
                    ALUSrc = 1'b0;
                    MemtoReg = 1'b0;
                    RegWrite = 1'b1;
                    MemWrite = 1'b0;
                    nPC_sel = 1'b0;
                    ExtOp = 1'b0;
                    jmp = 1'b0;
                    ALUctr = 2'b01;
                end
            endcase
        end
        6'b001101: begin // ori
            RegDst = 1'b0;
            ALUSrc = 1'b1;
            MemtoReg = 1'b0;
            RegWrite = 1'b1;
            MemWrite = 1'b0;
            nPC_sel = 1'b0;
            ExtOp = 1'b0;
            jmp = 1'b0;
            ALUctr = 2'b10;
        end
        6'b001111: begin // lui
            RegDst = 1'b0;
            ALUSrc = 1'b1;
            MemtoReg = 1'b0;
            RegWrite = 1'b1;
            MemWrite = 1'b0;
            nPC_sel = 1'b0;
            ExtOp = 1'b1;
            jmp = 1'b0;
            ALUctr = 2'b11;
        end
        6'b100011: begin // lw
            RegDst = 1'b0;
            ALUSrc = 1'b1;
            MemtoReg = 1'b1;
            RegWrite = 1'b1;
            MemWrite = 1'b0;
            nPC_sel = 1'b0;
            ExtOp = 1'b1;
            jmp = 1'b0;
            ALUctr = 2'b00;
        end
        6'b101011: begin // sw
            RegDst = 1'bx;
            ALUSrc = 1'b1;
            MemtoReg = 1'bx;
            RegWrite = 1'b0;
            MemWrite = 1'b1;
            nPC_sel = 1'b0;
            ExtOp = 1'b1;
            jmp = 1'b0;
            ALUctr = 2'b00;
        end
        6'b000100: begin // beq
            RegDst = 1'bx;
            ALUSrc = 1'b0;
            MemtoReg = 1'bx;
            RegWrite = 1'b0;
            MemWrite = 1'b0;
            nPC_sel = 1'b1;
            ExtOp = 1'b1;
            jmp = 1'b0;
            ALUctr = 2'b01;
        end
        6'b000010: begin // j
            RegDst = 1'bx;
            ALUSrc = 1'bx;
            MemtoReg = 1'bx;
            RegWrite = 1'b0;
            MemWrite = 1'b0;
            nPC_sel = 1'b0;
            ExtOp = 1'bx;
            jmp = 1'b1;
            ALUctr = 2'bxx;
        end
    endcase
end

endmodule