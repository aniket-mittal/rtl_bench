module origen_034451(
    input [5:0] opcode,
    input [5:0] func,
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
        if (func != 6'b001000) // Not JR
            RegWrite = 1;
    end

    // All instructions except NOP
    if (opcode != 6'b001111)
        RegRead = 1;

    // I-type instructions (excluding branch, load, and store)
    if (opcode[5:3] == 3'b001) begin
        RegWrite = 1;
        RegDst = 0;
    end

    // Branch instructions
    if (opcode == 6'b000100 || opcode == 6'b000101)
        Branch = 1;

    // Store instructions
    if (opcode == 6'b101000 || opcode == 6'b101001 || opcode == 6'b101011) begin
        MemWrite = 1;
        RegRead = 1;
    end

    // Load instructions
    if (opcode == 6'b100000 || opcode == 6'b100001 || opcode == 6'b100010 ||
        opcode == 6'b100100 || opcode == 6'b100101) begin
        MemRead = 1;
        RegWrite = 1;
        RegDst = 0;
    end
end

endmodule