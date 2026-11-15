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

always @(*) begin
    // Data Hazard Detection
    if (ID_EX_MemRead && (ID_EX_RegisterRt == IF_ID_RegisterRs || ID_EX_RegisterRt == IF_ID_RegisterRt)) begin
        PCWrite_Disable = 1'b1;
        IF_ID_Write_Disable = 1'b1;
        ID_EX_Flush = 1'b1;
        IF_ID_Flush = 1'b0;
        recoverySel = 2'b00;
    end
    // Branch Misprediction Handling
    else if (Branch && ((branchPredict[1] && !BranchGate) || (!branchPredict[1] && BranchGate))) begin
        PCWrite_Disable = 1'b0;
        IF_ID_Write_Disable = 1'b0;
        ID_EX_Flush = 1'b0;
        IF_ID_Flush = 1'b1;
        recoverySel = 2'b01;
    end
    // Jump Handling
    else if (Jump || (BranchGate && !branchPredict[1])) begin
        PCWrite_Disable = 1'b0;
        IF_ID_Write_Disable = 1'b0;
        ID_EX_Flush = 1'b0;
        IF_ID_Flush = 1'b1;
        recoverySel = 2'b10;
    end
    else begin
        PCWrite_Disable = 1'b0;
        IF_ID_Write_Disable = 1'b0;
        ID_EX_Flush = 1'b0;
        IF_ID_Flush = 1'b0;
        recoverySel = 2'b00;
    end
end

endmodule