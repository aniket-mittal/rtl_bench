module origen_003833 #(
    parameter IP_BIT_WIDTH = 32
) (
    input wire clk,
    input wire rst,
    input wire [IP_BIT_WIDTH-1:0] rand_num,
    input wire rand_valid,
    output reg op_lt_1_out,
    output reg coord_valid_out
);

    reg coord_sel;
    reg [IP_BIT_WIDTH-1:0] x_coord, y_coord;
    reg [IP_BIT_WIDTH-1:0] calc_x_sq_p0, calc_y_sq_p0;
    reg [IP_BIT_WIDTH:0] sq_add_p1;
    reg valid_p0, valid_p1;

    [MASKED]

endmodule