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

    always @(*) begin
        oHazard = 1'b0;
        oForwardJr = 1'b0;
        oForwardPC4 = 1'b0;

        // Data Hazard Detection
        if ((iID_NumRs == iEX_RegDst && iEX_RegWrite) ||
            (iID_NumRt == iEX_RegDst && iEX_RegWrite) ||
            (iID_NumRs == iMEM_RegDst && iMEM_RegWrite) ||
            (iID_NumRt == iMEM_RegDst && iMEM_RegWrite)) begin
            oHazard = 1'b1;
        end

        // Control Hazard Detection
        if (iBranch && (iEX_MemRead || iEX_RegWrite || iEX_MovN || iEX_MovZ)) begin
            oHazard = 1'b1;
            oForwardJr = 1'b1;
        end
        if (iBranch && (iMEM_MemRead || iMEM_RegWrite || iMEM_MovN || iMEM_MovZ)) begin
            oHazard = 1'b1;
            oForwardPC4 = 1'b1;
        end

        // Control Hazard Detection for Jump-Register (Jr) Instruction
        if (iCJr) begin
            oHazard = 1'b1;
            oForwardJr = 1'b1;
            oForwardPC4 = 1'b1;
        end
    end

endmodule