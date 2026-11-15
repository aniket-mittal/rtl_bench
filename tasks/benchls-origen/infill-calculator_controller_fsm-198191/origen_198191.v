module origen_198191(
    input clk,
    input reset,
    input [2:0] opCodeIn,
    output reg ld_number,
    output reg clr_number,
    output reg ld_opcode,
    output reg ld_result,
    output reg clr_result,
    output reg sel_muxAlu,
    output reg sel_muxDisplay,
    output reg clr_opCode,
    output reg [2:0] opCodeOut,
    output reg E0,
    output reg E1,
    output reg E2,
    output reg E3
);

    reg [1:0] state;
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

    [MASKED]

endmodule