module origen_162738(
    input clock,
    input reset,
    input mem_m0_oper,
    input mem_m0_readmem,
    input mem_m0_writemem,
    input [31:0] mem_m0_rega,
    input [31:0] mem_m0_imedext,
    input [31:0] mem_m0_regb,
    input [4:0] mem_m0_regdest,
    input mem_m0_writereg,
    output reg m0_m1_oper,
    output reg m0_m1_readmem,
    output reg m0_m1_writemem,
    output reg [31:0] m0_m1_data_addr,
    output reg [31:0] m0_m1_regb,
    output reg [4:0] m0_m1_regdest,
    output reg m0_m1_writereg
);

    [MASKED]

endmodule