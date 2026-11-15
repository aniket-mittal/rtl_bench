module origen_036074(
    input CLOCK_50,
    input [1:0] KEY,
    output reg [1:0] p_left,
    output reg [1:0] p_right
);

    initial begin
        p_right = 2'b00;
        p_left = 2'b01;
    end

    always @(posedge CLOCK_50) begin
        if (KEY[1] == 1'b0) begin
            p_left <= p_left;
        end
        if (KEY[0] == 1'b0) begin
            p_right <= p_right;
        end
    end

endmodule

module move_paddle(
    input rate_clk,
    input running,
    input game_start,
    input [1:0] paddle_direction,
    output reg [7:0] paddle_x,
    output reg [6:0] paddle_y
);

    initial begin
        paddle_x = 8'h50;  // 80 in decimal
        paddle_y = 7'h64;  // 100 in decimal
    end

    always @(posedge rate_clk) begin
        if (running && game_start) begin
            case (paddle_direction)
                2'b00: begin  // Left movement
                    if (paddle_x != 8'h9D)  // 157 in decimal
                        paddle_x <= paddle_x - 1;
                end
                2'b01: begin  // Right movement
                    if (paddle_x != 8'h01)  // 1 in decimal
                        paddle_x <= paddle_x + 1;
                end
                default: paddle_x <= paddle_x;
            endcase
        end
    end

endmodule