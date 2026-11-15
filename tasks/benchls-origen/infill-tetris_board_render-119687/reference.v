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

    always @(*) begin
        if (x >= GAMEBOARD_X_OFFSET && x < GAMEBOARD_X_OFFSET + GAMEBOARD_WIDTH * BLOCK_WIDTH &&
            y >= GAMEBOARD_Y_OFFSET && y < GAMEBOARD_Y_OFFSET + GAMEBOARD_HEIGHT * BLOCK_HEIGHT) begin
            
            if (boardstate[block_y*GAMEBOARD_WIDTH + block_x]) begin
                if (pixel_x == 0 || pixel_x == BLOCK_WIDTH-1 || pixel_y == 0 || pixel_y == BLOCK_HEIGHT-1) begin
                    // Block border
                    r = 8'd0;
                    g = 8'd0;
                    b = 8'd0;
                end else begin
                    // Block interior with gradient
                    r = 8'd255;
                    g = {3'b0, block_x};
                    b = {3'b0, block_y};
                end
            end else begin
                // Inactive block
                r = 8'd0;
                g = 8'd0;
                b = 8'd0;
            end
        end else begin
            // Outside game board
            r = 8'd0;
            g = 8'd0;
            b = 8'd0;
        end
    end

endmodule