module origen_186560 #(
    parameter MAX_X = 800,
    parameter MAX_Y = 600,
    parameter BITS = 8,
    parameter SCALE_X = 1,
    parameter SCALE_Y = 1
) (
    input clk25,
    input rst,

    output reg hsync,
    output reg hsync_n,
    output reg vsync,
    output reg vsync_n,

    output reg [10:0] x,
    output reg [10:0] x_n,
    output reg [10:0] y,
    output reg [10:0] y_n,

    output reg [10:0] sx,
    output reg [10:0] sx_n,
    output reg [10:0] sy,
    output reg [10:0] sy_n,

    output reg [9:0] sx_counter,
    output reg [9:0] sx_counter_n,
    output reg [9:0] sy_counter,
    output reg [9:0] sy_counter_n,
    output reg [7:0] bit_num,
    output reg [7:0] bit_num_n,
    output reg [15:0] byte_num,
    output reg [15:0] byte_num_n,
    output reg [15:0] next_byte_num,
    output reg [15:0] next_byte_num_n,
    output reg [10:0] next_y,
    output reg [10:0] next_y_n,
    output reg [10:0] next_sy,
    output reg [10:0] next_sy_n,

    output reg blank,
    output reg blank_n
);

    [MASKED]

endmodule