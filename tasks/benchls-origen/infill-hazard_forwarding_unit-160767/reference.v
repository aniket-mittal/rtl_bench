module origen_160767(
    input ID_branch,
    input IDEX_regWrite,
    input EXMEM_regWrite,
    input EXMEM_memRead,
    input clk,
    input [4:0] EX_regDst,
    input [4:0] EXMEM_regRd,
    input [4:0] ID_regRt,
    input [4:0] ID_regRs,
    output reg forward1,
    output reg forward2,
    output reg PCWrite,
    output reg IFID_write,
    output reg ID_flush
);

    always @(negedge clk) begin
        // Initialize output signals
        forward1 = 0;
        forward2 = 0;
        PCWrite = 1;
        IFID_write = 1;
        ID_flush = 0;

        // Check for branch hazards
        if (ID_branch && IDEX_regWrite) begin
            if (EX_regDst == ID_regRs || EX_regDst == ID_regRt) begin
                PCWrite = 0;
                IFID_write = 0;
                ID_flush = 1;
            end
        end

        if (ID_branch && EXMEM_regWrite && !EXMEM_memRead) begin
            if (EXMEM_regRd == ID_regRs) begin
                forward1 = 1;
            end
            if (EXMEM_regRd == ID_regRt) begin
                forward2 = 1;
            end
        end

        if (ID_branch && EXMEM_memRead) begin
            if (EXMEM_regRd == ID_regRs || EXMEM_regRd == ID_regRt) begin
                PCWrite = 0;
                IFID_write = 0;
                ID_flush = 1;
            end
        end
    end

endmodule