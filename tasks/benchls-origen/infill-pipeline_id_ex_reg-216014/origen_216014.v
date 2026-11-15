module origen_216014 (
    input clk,
    input [2:0] aluSig_in,
    input WB_in,
    input extendForMem_in,
    input WMEM_in,
    input load_in,
    input [31:0] R1_in, R2_in, wdMem_in,
    input [4:0] rd_in, rs_in, rt_in,
    input flush,

    output reg [2:0] aluSig_out,
    output reg WB_out,
    output reg extendForMem_out,
    output reg WMEM_out,
    output reg load_out,
    output reg [31:0] R1_out, R2_out, wdMem_out,
    output reg [4:0] rd_out, rs_out, rt_out
);

    initial begin
        aluSig_out = 0;
        WB_out = 0;
        extendForMem_out = 0;
        WMEM_out = 0;
        load_out = 0;
        R1_out = 0;
        R2_out = 0;
        wdMem_out = 0;
        rd_out = 0;
        rs_out = 0;
        rt_out = 0;
    end

    [MASKED]

endmodule