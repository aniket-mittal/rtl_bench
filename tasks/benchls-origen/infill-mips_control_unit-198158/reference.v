module origen_198158(
    input RT, addi, andi, lw, sw, j, jal, jr, beq, bne,
    output reg [1:0] RegDst,
    output reg RegWrite,
    output reg ALUSrc,
    output reg MemRead,
    output reg MemWrite,
    output reg MemToReg,
    output reg [1:0] ALUOp,
    output reg WDInp
);

    always @(RT, addi, andi, lw, sw, j, jal, jr, beq, bne) begin
        if (RT) begin
            RegDst = 2'b01;
            RegWrite = 1'b1;
            ALUSrc = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            MemToReg = 1'b0;
            ALUOp = 2'b10;
            WDInp = 1'b0;
        end
        else if (addi) begin
            RegDst = 2'b00;
            RegWrite = 1'b1;
            ALUSrc = 1'b1;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            MemToReg = 1'b0;
            ALUOp = 2'b00;
            WDInp = 1'b0;
        end
        else if (andi) begin
            RegDst = 2'b00;
            RegWrite = 1'b1;
            ALUSrc = 1'b1;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            MemToReg = 1'b0;
            ALUOp = 2'b11;
            WDInp = 1'b0;
        end
        else if (lw) begin
            RegDst = 2'b00;
            RegWrite = 1'b1;
            ALUSrc = 1'b1;
            MemRead = 1'b1;
            MemWrite = 1'b0;
            MemToReg = 1'b1;
            ALUOp = 2'b00;
            WDInp = 1'b0;
        end
        else if (sw) begin
            RegDst = 2'b00;
            RegWrite = 1'b0;
            ALUSrc = 1'b1;
            MemRead = 1'b0;
            MemWrite = 1'b1;
            MemToReg = 1'b0;
            ALUOp = 2'b00;
            WDInp = 1'b0;
        end
        else if (beq | bne) begin
            RegDst = 2'b00;
            RegWrite = 1'b0;
            ALUSrc = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            MemToReg = 1'b0;
            ALUOp = 2'b01;
            WDInp = 1'b0;
        end
        else if (jal) begin
            RegDst = 2'b10;
            RegWrite = 1'b1;
            ALUSrc = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            MemToReg = 1'b0;
            ALUOp = 2'b00;
            WDInp = 1'b1;
        end
        else begin
            RegDst = 2'b00;
            RegWrite = 1'b0;
            ALUSrc = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            MemToReg = 1'b0;
            ALUOp = 2'b00;
            WDInp = 1'b0;
        end
    end

endmodule