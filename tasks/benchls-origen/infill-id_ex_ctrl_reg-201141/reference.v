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

    always @(*) begin
        if (stall) begin
            RegWrite_OUT = 0;
            MemRead_OUT = 0;
            MemWrite_OUT = 0;
            JLFlag_OUT = 0;
            AluBSRC_OUT = 0;
            WriteDataSRC_OUT = 0;
            AluCtl_OUT = 0;
            IsBranch_OUT = 0;
            targetSRC_OUT = 0;
            bImm_OUT = 0;
        end else begin
            RegWrite_OUT = RegWrite_IN;
            MemRead_OUT = MemRead_IN;
            MemWrite_OUT = MemWrite_IN;
            JLFlag_OUT = JLFlag_IN;
            AluBSRC_OUT = AluBSRC_IN;
            WriteDataSRC_OUT = WriteDataSRC_IN;
            AluCtl_OUT = AluCtl_IN;
            IsBranch_OUT = IsBranch_IN;
            targetSRC_OUT = targetSRC_IN;
            bImm_OUT = bImm_IN;
        end
    end

endmodule