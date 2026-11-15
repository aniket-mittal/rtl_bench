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

    always @(posedge game_clk or posedge rst) begin
        if (rst) begin
            x <= POS_X;
            y <= POS_Y;
            adder_x <= 1;
            adder_y <= 1;
            point_p1 <= 0;
            point_p2 <= 0;
        end else begin
            // Update ball position
            x <= (adder_x) ? x + 1 : x - 1;
            y <= (adder_y) ? y + 1 : y - 1;

            // Collision with player 1 (right side)
            if (x >= p1_x - 5 && x <= p1_x + 5 && y >= p1_y && y <= p1_y + 50)
                adder_x <= 0;

            // Collision with player 2 (left side)
            if (x >= p2_x - 5 && x <= p2_x + 5 && y >= p2_y && y <= p2_y + 50)
                adder_x <= 1;

            // Collision with top boundary
            if (y < 5)
                adder_y <= 1;

            // Collision with bottom boundary
            if (y > 470)
                adder_y <= 0;

            // Scoring for player 2
            if (x < 10) begin
                point_p2 <= 1;
                adder_x <= 1;
            end else
                point_p2 <= 0;

            // Scoring for player 1
            if (x > 629) begin
                point_p1 <= 1;
                adder_x <= 0;
            end else
                point_p1 <= 0;
        end
    end

endmodule