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

    [MASKED]

endmodule