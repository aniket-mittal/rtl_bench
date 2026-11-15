module origen_194536(
    input clk,
    input reset,
    input [15:0] rd_d_in, rs1_d, rs2_d,
    input [3:0] ALU_Sel,
    output reg OpStart,
    input [6:0] count,
    input reg_write,
    input q0_var, q1_var,
    input [5:0] LENGTH,
    output reg [15:0] rd_d_out
);

reg [15:0] result;
reg [1:0] state;
reg carry_borrow;
reg NoOp;

[MASKED]

endmodule