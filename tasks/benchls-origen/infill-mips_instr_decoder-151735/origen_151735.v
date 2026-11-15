module origen_151735(
    input [31:0] CODE,
    input shift,
    input syscall,
    input RegDst,
    input Jal,
    input Zero_extend,
    output reg [27:0] PC,
    output reg [5:0] OPCODE,
    output reg [5:0] FUNCT,
    output reg [4:0] RA,
    output reg [4:0] RB,
    output reg [4:0] RW,
    output reg [31:0] extend
);

    initial begin
        PC = 0;
        OPCODE = 0;
        FUNCT = 0;
        RA = 0;
        RB = 0;
        RW = 0;
        extend = 0;
    end

    [MASKED]

endmodule