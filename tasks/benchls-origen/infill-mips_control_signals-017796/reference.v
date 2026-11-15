module origen_017796 (
    input [5:0] opcode,
    input [5:0] funct,
    output reg RegRead,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg RegDst,
    output reg Branch
);

always @(*) begin
    // Initialize all control signals to 0
    RegRead = 0;
    RegWrite = 0;
    MemRead = 0;
    MemWrite = 0;
    RegDst = 0;
    Branch = 0;

    // R-type instructions
    if (opcode == 6'b000000) begin
        RegDst = 1;
        RegRead = 1;
        RegWrite = (funct != 6'b001000); // RegWrite = 1 for all except JR
    end

    // Set RegRead for all instructions except LUI
    if (opcode != 6'b001111) begin
        RegRead = 1;
    end

    // I-type and J-type instructions (excluding branches, loads, and stores)
    if (opcode != 6'b000000 && opcode != 6'b000100 && opcode != 6'b000101 &&
        opcode != 6'b100011 && opcode != 6'b101000 && opcode != 6'b101001 && opcode != 6'b101011) begin
        RegWrite = 1;
        RegDst = 0;
    end

    // Branch instructions (BEQ and BNE)
    if (opcode == 6'b000100 || opcode == 6'b000101) begin
        Branch = 1;
    end

    // Store instructions (SB, SH, SW)
    if (opcode == 6'b101000 || opcode == 6'b101001 || opcode == 6'b101011) begin
        MemWrite = 1;
        RegRead = 1;
    end

    // Load instruction (LW)
    if (opcode == 6'b100011) begin
        MemRead = 1;
    end
end

endmodule