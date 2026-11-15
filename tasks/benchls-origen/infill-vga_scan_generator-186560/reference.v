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

    always @(posedge clk25 or posedge rst) begin
        if (rst) begin
            hsync <= 1'b1;
            hsync_n <= 1'b0;
            vsync <= 1'b1;
            vsync_n <= 1'b0;
            x <= 11'd0;
            x_n <= 11'd0;
            y <= 11'd0;
            y_n <= 11'd0;
            sx <= 11'd0;
            sx_n <= 11'd0;
            sy <= 11'd0;
            sy_n <= 11'd0;
            sx_counter <= 10'd0;
            sx_counter_n <= 10'd0;
            sy_counter <= 10'd0;
            sy_counter_n <= 10'd0;
            bit_num <= 8'd0;
            bit_num_n <= 8'd0;
            byte_num <= 16'd0;
            byte_num_n <= 16'd0;
            next_byte_num <= 16'd0;
            next_byte_num_n <= 16'd0;
            next_y <= 11'd0;
            next_y_n <= 11'd0;
            next_sy <= 11'd0;
            next_sy_n <= 11'd0;
            blank <= 1'b1;
            blank_n <= 1'b0;
        end else begin
            hsync <= hsync_n;
            hsync_n <= (x >= (MAX_X - 96)) && (x < (MAX_X - 16));
            vsync <= vsync_n;
            vsync_n <= (y >= (MAX_Y - 2)) && (y < (MAX_Y - 1));
            x <= x_n;
            x_n <= (x == (MAX_X - 1)) ? 11'd0 : x + 11'd1;
            y <= y_n;
            y_n <= (y == (MAX_Y - 1)) ? 11'd0 : next_y;
            sx <= sx_n;
            sx_n <= (sx_counter == (SCALE_X - 1)) ? x : sx;
            sy <= sy_n;
            sy_n <= (sy_counter == (SCALE_Y - 1)) ? y : next_sy;
            sx_counter <= sx_counter_n;
            sx_counter_n <= (sx_counter == (SCALE_X - 1)) ? 10'd0 : sx_counter + 10'd1;
            sy_counter <= sy_counter_n;
            sy_counter_n <= (sy_counter == (SCALE_Y - 1)) ? 10'd0 : sy_counter + 10'd1;
            bit_num <= bit_num_n;
            bit_num_n <= (bit_num == (BITS - 1)) ? 8'd0 : bit_num + 8'd1;
            byte_num <= byte_num_n;
            byte_num_n <= next_byte_num;
            next_byte_num <= next_byte_num_n;
            next_byte_num_n <= (x == (MAX_X - 1)) ? byte_num + 16'd1 : byte_num;
            next_y <= next_y_n;
            next_y_n <= (y == (MAX_Y - 1)) ? 11'd0 : y + 11'd1;
            next_sy <= next_sy_n;
            next_sy_n <= (sy_counter == (SCALE_Y - 1)) ? next_y : sy;
            blank <= blank_n;
            blank_n <= (x < MAX_X) && (y < MAX_Y);
        end
    end

endmodule