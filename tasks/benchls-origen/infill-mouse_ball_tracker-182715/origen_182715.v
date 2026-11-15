module origen_182715 (
    input pclk,
    input rst,
    input button,
    input transfer,
    input [10:0] mouse_xpos,
    input [10:0] mouse_ypos,
    input [10:0] column_in,
    input [10:0] row_in,
    output [10:0] x_out,
    output [10:0] y_out
);

parameter FREQ_DIV = 10'd1000;
parameter SQUARE_SIZE = 10'd50;
parameter BALL_SIZE = 10'd40;
parameter START_DRAW = (SQUARE_SIZE - BALL_SIZE) / 2;
parameter LEFT = 10'd50;
parameter UP = 10'd50;

reg [2:0] state;
reg [9:0] x_pos, y_pos;
reg [9:0] clk_div;

localparam IDLE = 3'b000;
localparam MOVE_COL = 3'b001;
localparam MOVE_RO = 3'b010;
localparam END = 3'b011;

[MASKED]

assign x_out = x_pos;
assign y_out = y_pos;

endmodule