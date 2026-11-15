module origen_004261(
    input [5:0] op,
    output reg reg_dst,
    output reg reg_write,
    output reg alu_src,
    output reg mem_to_reg,
    output reg mem_read,
    output reg mem_write,
    output reg branch,
    output reg jump,
    output reg [1:0] alu_op
);

`define R_TYPE 6'd0
`define I_BEQ 6'd4
`define I_LW 6'd35
`define I_SW 6'd43
`define J_J 6'd2

[MASKED]

endmodule