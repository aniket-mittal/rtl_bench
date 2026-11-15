module origen_204275(
    input [4:0] IF_ID_RegisterRs,
    input [4:0] IF_ID_RegisterRt,
    input [4:0] ID_EX_RegisterRt,
    input ID_EX_MemRead,
    input BranchGate,
    input Jump,
    input [1:0] branchPredict,
    input Branch,
    output reg PCWrite_Disable,
    output reg IF_ID_Write_Disable,
    output reg IF_ID_Flush,
    output reg ID_EX_Flush,
    output reg [1:0] recoverySel
);

[MASKED]

endmodule