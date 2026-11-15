module origen_201141(
    input RegWrite_IN,
    input MemRead_IN,
    input MemWrite_IN,
    input JLFlag_IN,
    input [1:0] AluBSRC_IN,
    input [1:0] WriteDataSRC_IN,
    input [2:0] AluCtl_IN,
    input IsBranch_IN,
    input targetSRC_IN,
    input stall,
    input bImm_IN,
    
    output reg RegWrite_OUT,
    output reg MemRead_OUT,
    output reg MemWrite_OUT,
    output reg JLFlag_OUT,
    output reg [1:0] AluBSRC_OUT,
    output reg [1:0] WriteDataSRC_OUT,
    output reg [2:0] AluCtl_OUT,
    output reg IsBranch_OUT,
    output reg targetSRC_OUT,
    output reg bImm_OUT
);

    [MASKED]

endmodule