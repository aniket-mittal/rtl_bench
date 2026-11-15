module origen_166692 (
    input [5:0] Op,
    output reg MemToReg, MemWrite, Branch, AluSrc, RegDst, RegWrite, Jump,
    output reg [2:0] AluOp,
    output reg Bne, ExtOp, RType
);

    always @(*) begin
        case (Op)
            6'b000000: begin // R-type
                MemToReg = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                AluSrc = 1'b0;
                RegDst = 1'b1;
                RegWrite = 1'b1;
                Jump = 1'b0;
                AluOp = 3'b010;
                Bne = 1'b0;
                ExtOp = 1'b0;
                RType = 1'b1;
            end
            6'b100011: begin // Load Word (lw)
                MemToReg = 1'b1;
                MemWrite = 1'b0;
                Branch = 1'b0;
                AluSrc = 1'b1;
                RegDst = 1'b0;
                RegWrite = 1'b1;
                Jump = 1'b0;
                AluOp = 3'b000;
                Bne = 1'b0;
                ExtOp = 1'b1;
                RType = 1'b0;
            end
            6'b101011: begin // Store Word (sw)
                MemToReg = 1'b0;
                MemWrite = 1'b1;
                Branch = 1'b0;
                AluSrc = 1'b1;
                RegDst = 1'bX;
                RegWrite = 1'b0;
                Jump = 1'b0;
                AluOp = 3'b000;
                Bne = 1'b0;
                ExtOp = 1'b1;
                RType = 1'b0;
            end
            6'b000100: begin // Branch on Not Equal (bne)
                MemToReg = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b1;
                AluSrc = 1'b0;
                RegDst = 1'bX;
                RegWrite = 1'b0;
                Jump = 1'b0;
                AluOp = 3'b001;
                Bne = 1'b1;
                ExtOp = 1'b1;
                RType = 1'b0;
            end
            6'b000010: begin // Jump (j)
                MemToReg = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                AluSrc = 1'b0;
                RegDst = 1'bX;
                RegWrite = 1'b0;
                Jump = 1'b1;
                AluOp = 3'bXXX;
                Bne = 1'b0;
                ExtOp = 1'b0;
                RType = 1'b0;
            end
            default: begin
                MemToReg = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                AluSrc = 1'b0;
                RegDst = 1'b0;
                RegWrite = 1'b0;
                Jump = 1'b0;
                AluOp = 3'b000;
                Bne = 1'b0;
                ExtOp = 1'b0;
                RType = 1'b0;
            end
        endcase
    end

endmodule