module origen_076840(
    input [5:0] OP,
    input [5:0] FUNCT,
    input zero,
    input overflow,
    output reg RegDst,
    output reg RegWr,
    output reg MemWr,
    output reg MemToReg,
    output reg [3:0] ALUctrl,
    output reg ALUsrc,
    output reg IsJump,
    output reg IsJAL,
    output reg IsJR,
    output reg IsBranch,
    output reg pcEnable,
    output reg controlLUT0,
    output reg if_Idreg
);

    // Define opcodes
    `define R_TYPE 6'b000000
    `define J      6'b000010
    `define JAL    6'b000011
    `define BEQ    6'b000100
    `define BNE    6'b000101

    // Define function codes for R-type instructions
    `define JR     6'b001000

    [MASKED]

endmodule