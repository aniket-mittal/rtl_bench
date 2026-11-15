module origen_193794(
    input clk,
    input reset,
    input cancle_flag,
    input [9:0] coin_val,
    input get_ind,
    input buy_flag,
    output reg op_start,
    output reg light,
    output reg light_one,
    output reg light_two,
    output reg hold_ind,
    output reg not_enough
);

    reg [1:0] state;
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

    [MASKED]

endmodule