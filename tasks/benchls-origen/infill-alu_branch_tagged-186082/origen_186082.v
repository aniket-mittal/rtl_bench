module origen_186082(
    Operand1,
    Operand2,
    ShfAmt,
    TAG_IN,
    ALU_OPCODE,
    RESULT,
    TAG_OUT,
    ALU_BRANCH,
    ALU_BRANCH_TAKEN
);

    input [31:0] Operand1;
    input [31:0] Operand2;
    input [4:0] ShfAmt;
    input [4:0] TAG_IN;
    input [3:0] ALU_OPCODE;

    output [31:0] RESULT;
    output [4:0] TAG_OUT;
    output ALU_BRANCH;
    output ALU_BRANCH_TAKEN;

    reg [31:0] RESULT;
    reg [4:0] TAG_OUT;
    reg ALU_BRANCH;
    reg ALU_BRANCH_TAKEN;

    [MASKED]

endmodule