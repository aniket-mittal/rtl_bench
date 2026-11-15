module origen_189043(
    input rst,
    input clk,
    input op,
    input start,
    input x_gt_y,
    input x_eq_y,
    input x_ls_y,
    output reg x_sel,
    output reg y_sel,
    output reg x_en,
    output reg y_en,
    output reg [1:0] x_op,
    output reg [1:0] y_op,
    output reg done_en
);

    reg [1:0] state;
    parameter STATE_INIT = 2'b00, STATE_EXEC = 2'b01, STATE_DONE = 2'b10;

    [MASKED]

endmodule