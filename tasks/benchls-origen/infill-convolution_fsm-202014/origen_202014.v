module origen_202014(
    input clk,
    input done_conv,
    input start,
    output reg shift_right,
    output reg start_conv,
    output reg [14:0] address,
    output reg done,
    output reg [3:0] state_reg,
    output reg [3:0] state_next
);

    reg signed [14:0] i, j, i_temp, j_temp;

    parameter IDLE = 4'b0000;
    parameter RP1 = 4'b0001;
    parameter RP2 = 4'b0010;
    parameter RP3 = 4'b0011;
    parameter RP4 = 4'b0100;
    parameter RP5 = 4'b0101;
    parameter RP6 = 4'b0110;
    parameter RP7 = 4'b0111;
    parameter RP8 = 4'b1000;
    parameter RP9 = 4'b1001;
    parameter CONV = 4'b1010;
    parameter INCREASE_J = 4'b1011;
    parameter INCREASE_I = 4'b1100;

    initial begin
        state_reg = IDLE;
        i = 0;
        j = 0;
        start_conv = 0;
        address = 0;
        shift_right = 0;
        done = 0;
    end

    [MASKED]
endmodule