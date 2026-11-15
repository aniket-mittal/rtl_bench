module origen_157539(
    input [5:0] OP,
    input [5:0] FUNCT,
    output reg jrctrl,
    output reg Jctrl,
    output reg beq,
    output reg bne,
    output reg jl,
    output reg Rctrl,
    output reg Wren,
    output reg [2:0] ALUctrl,
    output reg Ictrl,
    output reg MemWren,
    output reg MemtoReg
);

always @(*) begin
    case ({OP, FUNCT})
        12'b100011_000000: begin // LW
            jrctrl = 0;
            Jctrl = 0;
            beq = 0;
            bne = 0;
            jl = 0;
            Rctrl = 1;
            Wren = 1;
            ALUctrl = 3'b010;
            Ictrl = 1;
            MemWren = 0;
            MemtoReg = 1;
        end
        12'b101011_000000: begin // SW
            jrctrl = 0;
            Jctrl = 0;
            beq = 0;
            bne = 0;
            jl = 0;
            Rctrl = 1;
            Wren = 0;
            ALUctrl = 3'b010;
            Ictrl = 1;
            MemWren = 1;
            MemtoReg = 0;
        end
        12'b000010_000000: begin // J
            jrctrl = 0;
            Jctrl = 1;
            beq = 0;
            bne = 0;
            jl = 0;
            Rctrl = 0;
            Wren = 0;
            ALUctrl = 3'b000;
            Ictrl = 0;
            MemWren = 0;
            MemtoReg = 0;
        end
        12'b000011_000000: begin // JaL
            jrctrl = 0;
            Jctrl = 1;
            beq = 0;
            bne = 0;
            jl = 1;
            Rctrl = 1;
            Wren = 1;
            ALUctrl = 3'b011;
            Ictrl = 0;
            MemWren = 0;
            MemtoReg = 0;
        end
        12'b000100_000000: begin // BEQ
            jrctrl = 0;
            Jctrl = 0;
            beq = 1;
            bne = 0;
            jl = 0;
            Rctrl = 0;
            Wren = 0;
            ALUctrl = 3'b110;
            Ictrl = 1;
            MemWren = 0;
            MemtoReg = 0;
        end
        12'b000101_000000: begin // BNE
            jrctrl = 0;
            Jctrl = 0;
            beq = 0;
            bne = 1;
            jl = 0;
            Rctrl = 0;
            Wren = 0;
            ALUctrl = 3'b110;
            Ictrl = 1;
            MemWren = 0;
            MemtoReg = 0;
        end
        12'b001110_000000: begin // XORI
            jrctrl = 0;
            Jctrl = 0;
            beq = 0;
            bne = 0;
            jl = 0;
            Rctrl = 1;
            Wren = 1;
            ALUctrl = 3'b100;
            Ictrl = 1;
            MemWren = 0;
            MemtoReg = 0;
        end
        12'b001000_000000: begin // ADDI
            jrctrl = 0;
            Jctrl = 0;
            beq = 0;
            bne = 0;
            jl = 0;
            Rctrl = 1;
            Wren = 1;
            ALUctrl = 3'b010;
            Ictrl = 1;
            MemWren = 0;
            MemtoReg = 0;
        end
        12'b000000_001000: begin // JR
            jrctrl = 1;
            Jctrl = 0;
            beq = 0;
            bne = 0;
            jl = 0;
            Rctrl = 0;
            Wren = 0;
            ALUctrl = 3'b000;
            Ictrl = 0;
            MemWren = 0;
            MemtoReg = 0;
        end
        12'b000000_100000: begin // ADD
            jrctrl = 0;
            Jctrl = 0;
            beq = 0;
            bne = 0;
            jl = 0;
            Rctrl = 1;
            Wren = 1;
            ALUctrl = 3'b010;
            Ictrl = 0;
            MemWren = 0;
            MemtoReg = 0;
        end
        12'b000000_100010: begin // SUB
            jrctrl = 0;
            Jctrl = 0;
            beq = 0;
            bne = 0;
            jl = 0;
            Rctrl = 1;
            Wren = 1;
            ALUctrl = 3'b110;
            Ictrl = 0;
            MemWren = 0;
            MemtoReg = 0;
        end
        12'b000000_101010: begin // SLT
            jrctrl = 0;
            Jctrl = 0;
            beq = 0;
            bne = 0;
            jl = 0;
            Rctrl = 1;
            Wren = 1;
            ALUctrl = 3'b111;
            Ictrl = 0;
            MemWren = 0;
            MemtoReg = 0;
        end
        default: begin
            jrctrl = 0;
            Jctrl = 0;
            beq = 0;
            bne = 0;
            jl = 0;
            Rctrl = 0;
            Wren = 0;
            ALUctrl = 3'b000;
            Ictrl = 0;
            MemWren = 0;
            MemtoReg = 0;
        end
    endcase
end

endmodule