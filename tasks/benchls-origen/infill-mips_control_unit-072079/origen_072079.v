module origen_072079 (
    input wire [5:0] Opcode,
    input wire [5:0] Function,
    input wire Rst,
    output reg MemRead,
    output reg RegWrite,
    output reg MemWrite,
    output reg ALUSrc,
    output reg Is_Br,
    output reg Is_Imm,
    output reg StoreOrBranch,
    output reg [2:0] ALUOprand,
    output reg [1:0] BranchCommand
);

    // Instruction type parameters
    parameter Load = 6'b100011;
    parameter Store = 6'b101011;
    parameter Jump = 6'b000010;
    parameter Branch_eq = 6'b000100;
    parameter Branch_ne = 6'b000101;
    parameter R_Type = 6'b000000;

    // ALU operation parameters
    parameter AND = 3'b000;
    parameter OR  = 3'b001;
    parameter ADD = 3'b010;
    parameter SUB = 3'b110;
    parameter SLT = 3'b111;

    // Branch type parameters
    parameter NO_BRANCH = 2'b00;
    parameter JUMP = 2'b01;
    parameter BRANCH_EQ = 2'b10;
    parameter BRANCH_NE = 2'b11;

    [MASKED]

endmodule