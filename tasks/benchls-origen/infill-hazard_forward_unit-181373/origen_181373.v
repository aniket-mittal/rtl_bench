module origen_181373(
    input [4:0] iID_NumRs,
    input [4:0] iID_NumRt,
    input [4:0] iEX_NumRt,
    input iEX_MemRead,
    input iEX_RegWrite,
    input iMEM_MemRead,
    input iMEM_RegWrite,
    input iCJr,
    input [4:0] iEX_RegDst,
    input [4:0] iMEM_RegDst,
    input iBranch,
    input iEX_MovN,
    input iEX_MovZ,
    input iMEM_MovN,
    input iMEM_MovZ,
    output reg oHazard,
    output reg oForwardJr,
    output reg oForwardPC4
);

    [MASKED]

endmodule