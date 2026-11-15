module origen_041835(
    input wire game_clk,
    input wire rst,
    input wire [9:0] p1_x, p1_y, p2_x, p2_y,
    output reg [9:0] x, y,
    output reg point_p1, point_p2
);

    parameter POS_X = 310;
    parameter POS_Y = 265;

    reg adder_x, adder_y;

    [MASKED]

endmodule