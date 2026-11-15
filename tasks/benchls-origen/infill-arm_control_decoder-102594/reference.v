module origen_102594 (
    input  logic [31:0] instr,
    input  logic zero,
    output logic [2:0] ALUOp,
    output logic Reg2Loc, MemtoReg, RegWri, MemWri, BrTaken, UncondBr, Readmem,
    output logic [1:0] ALUsrc
);

    always_comb begin
        casez(instr[31:21])
            11'b10101011000: begin // ADD
                ALUOp = 3'b010;
                Reg2Loc = 1'b0;
                MemtoReg = 1'b0;
                RegWri = 1'b1;
                MemWri = 1'b0;
                BrTaken = 1'b0;
                UncondBr = 1'b0;
                Readmem = 1'b0;
                ALUsrc = 2'b00;
            end
            11'b1001000100?: begin // ADDI
                ALUOp = 3'b010;
                Reg2Loc = 1'b0;
                MemtoReg = 1'b0;
                RegWri = 1'b1;
                MemWri = 1'b0;
                BrTaken = 1'b0;
                UncondBr = 1'b0;
                Readmem = 1'b0;
                ALUsrc = 2'b10;
            end
            11'b1101000100?: begin // AND
                ALUOp = 3'b011;
                Reg2Loc = 1'b0;
                MemtoReg = 1'b0;
                RegWri = 1'b1;
                MemWri = 1'b0;
                BrTaken = 1'b0;
                UncondBr = 1'b0;
                Readmem = 1'b0;
                ALUsrc = 2'b00;
            end
            11'b11101011000: begin // ORR
                ALUOp = 3'b011;
                Reg2Loc = 1'b0;
                MemtoReg = 1'b0;
                RegWri = 1'b1;
                MemWri = 1'b0;
                BrTaken = 1'b0;
                UncondBr = 1'b0;
                Readmem = 1'b0;
                ALUsrc = 2'b00;
            end
            11'b11111000010: begin // LDUR
                ALUOp = 3'b010;
                Reg2Loc = 1'b0;
                MemtoReg = 1'b1;
                RegWri = 1'b1;
                MemWri = 1'b0;
                BrTaken = 1'b0;
                UncondBr = 1'b0;
                Readmem = 1'b1;
                ALUsrc = 2'b01;
            end
            11'b11111000000: begin // STUR
                ALUOp = 3'b010;
                Reg2Loc = 1'b1;
                MemtoReg = 1'b0;
                RegWri = 1'b0;
                MemWri = 1'b1;
                BrTaken = 1'b0;
                UncondBr = 1'b0;
                Readmem = 1'b0;
                ALUsrc = 2'b01;
            end
            11'b000101?????: begin // B
                ALUOp = 3'b000;
                Reg2Loc = 1'b0;
                MemtoReg = 1'b0;
                RegWri = 1'b0;
                MemWri = 1'b0;
                BrTaken = 1'b1;
                UncondBr = 1'b1;
                Readmem = 1'b0;
                ALUsrc = 2'b00;
            end
            11'b10110100???: begin // CBZ
                ALUOp = 3'b000;
                Reg2Loc = 1'b1;
                MemtoReg = 1'b0;
                RegWri = 1'b0;
                MemWri = 1'b0;
                BrTaken = zero;
                UncondBr = 1'b0;
                Readmem = 1'b0;
                ALUsrc = 2'b00;
            end
            default: begin
                ALUOp = 3'b000;
                Reg2Loc = 1'b0;
                MemtoReg = 1'b0;
                RegWri = 1'b0;
                MemWri = 1'b0;
                BrTaken = 1'b0;
                UncondBr = 1'b0;
                Readmem = 1'b0;
                ALUsrc = 2'b00;
            end
        endcase
    end

endmodule