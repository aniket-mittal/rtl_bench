module origen_119687 #(
    parameter GAMEBOARD_X_OFFSET = 100,
    parameter GAMEBOARD_Y_OFFSET = 50,
    parameter BLOCK_HEIGHT = 20,
    parameter BLOCK_WIDTH = 20,
    parameter GAMEBOARD_HEIGHT = 20,
    parameter GAMEBOARD_WIDTH = 10
)(
    input [GAMEBOARD_HEIGHT*GAMEBOARD_WIDTH-1:0] boardstate,
    input [9:0] x,
    input [8:0] y,
    output reg [7:0] r,
    output reg [7:0] g,
    output reg [7:0] b
);

    wire [9:0] rel_x = x - GAMEBOARD_X_OFFSET;
    wire [8:0] rel_y = y - GAMEBOARD_Y_OFFSET;
    wire [4:0] block_x = rel_x / BLOCK_WIDTH;
    wire [4:0] block_y = rel_y / BLOCK_HEIGHT;
    wire [4:0] pixel_x = rel_x % BLOCK_WIDTH;
    wire [4:0] pixel_y = rel_y % BLOCK_HEIGHT;

    [MASKED]

endmodule