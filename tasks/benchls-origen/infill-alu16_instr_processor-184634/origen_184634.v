module origen_184634(
    input [15:0] instr,
    input [15:0] inreg1,
    input [15:0] inreg2,
    input carrystatus,
    input exec1,
    output reg [15:0] aluout,
    output reg [1:0] regM,
    output reg sel_mux_mem_alu,
    output reg sel_mux_inp,
    output reg output_en,
    output reg carryout,
    output reg carryen,
    output reg wenout,
    output reg [1:0] RegN,
    output reg [1:0] RegD,
    output reg sel_mux_regD
);

    reg [15:0] mul0, mul1, mul2, mul3, mul4, mul5, mul6, mul7, mul8, mul9, mul10, mul11, mul12, mul13, mul14, mul15;
    reg [15:0] mul;

    [MASKED]

endmodule