module origen_218252(
    input  [5:0] opCode,
    output       regDst,
    output       aluSrc,
    output       memToReg,
    output       regWrite,
    output       memRead,
    output       memWrite,
    output       branch,
    output [1:0] aluOp,
    output       jump
);

    reg regDst_r, aluSrc_r, memToReg_r, regWrite_r, memRead_r, memWrite_r, branch_r, jump_r;
    reg [1:0] aluOp_r;

    [MASKED]

    assign regDst   = regDst_r;
    assign aluSrc   = aluSrc_r;
    assign memToReg = memToReg_r;
    assign regWrite = regWrite_r;
    assign memRead  = memRead_r;
    assign memWrite = memWrite_r;
    assign branch   = branch_r;
    assign aluOp    = aluOp_r;
    assign jump     = jump_r;

endmodule