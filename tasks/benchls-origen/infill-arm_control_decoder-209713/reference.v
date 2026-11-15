module origen_209713(
    input [10:0] Opcode,
    output reg Reg2Loc,
    output reg Branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg [1:0] ALUOp,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite
);

always @(*) begin
    if (Opcode == 11'b10001011000 || Opcode == 11'b11001011000 || Opcode == 11'b10001010000 || Opcode == 11'b10101010000) begin
        Reg2Loc = 0;
        ALUSrc = 0;
        MemtoReg = 0;
        RegWrite = 1;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        ALUOp = 2'b10;
    end
    else if (Opcode == 11'b10001000000 || Opcode == 11'b10101000000) begin
        Reg2Loc = 0;
        ALUSrc = 0;
        MemtoReg = 0;
        RegWrite = 1;
        MemRead = 1;
        MemWrite = 0;
        Branch = 0;
        ALUOp = 2'b00;
    end
    else if (Opcode == 11'b10001001000 || Opcode == 11'b10101001000) begin
        Reg2Loc = 0;
        ALUSrc = 0;
        MemtoReg = 1;
        RegWrite = 1;
        MemRead = 1;
        MemWrite = 0;
        Branch = 0;
        ALUOp = 2'b00;
    end
    else if (Opcode == 11'b10000010000) begin
        Reg2Loc = 1;
        ALUSrc = 1;
        MemtoReg = 0;
        RegWrite = 1;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        ALUOp = 2'b00;
    end
    else if (Opcode == 11'b11000010000) begin
        Reg2Loc = 1;
        ALUSrc = 1;
        MemtoReg = 0;
        RegWrite = 1;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        ALUOp = 2'b10;
    end
    else if (Opcode == 11'b10000011000) begin
        Reg2Loc = 0;
        ALUSrc = 0;
        MemtoReg = 0;
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 1;
        Branch = 0;
        ALUOp = 2'b00;
    end
    else if (Opcode == 11'b11000000000) begin
        Reg2Loc = 0;
        ALUSrc = 0;
        MemtoReg = 0;
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 1;
        ALUOp = 2'b01;
    end
    else begin
        Reg2Loc = 0;
        ALUSrc = 0;
        MemtoReg = 0;
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        ALUOp = 2'b00;
    end
end

endmodule