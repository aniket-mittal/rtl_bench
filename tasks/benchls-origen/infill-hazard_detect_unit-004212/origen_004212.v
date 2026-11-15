module origen_004212(
    input Load_signal,
    input [4:0] rs, rt, rd,
    input [1:0] how_many_ops,
    input [4:0] ID_EXE_rt,
    input [1:0] ID_EXE_MemRead,
    input [1:0] op1_selector, op2_selector,
    output reg PC_write,
    output reg IF_ID_write,
    output reg flush,
    output reg valid
);

    reg [4:0] OP1, OP2;

    [MASKED]

endmodule