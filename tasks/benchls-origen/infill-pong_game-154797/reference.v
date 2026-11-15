module origen_154797 #(
    parameter LCD_WIDTH = 800,
    parameter LCD_HEIGHT = 600,
    parameter BALL_SLOW = 10,
    parameter BALL_SIZE = 8,
    parameter RACKET_SIZE = 80,
    parameter RACKET_Y_SLOW = 5
)(
    input CLK,
    input RST_IN,
    output [7:0] R,
    output [7:0] G,
    output [7:0] B,
    output DEN,
    input [10:0] X,
    input [10:0] Y,
    output [31:0] SEG_HEX_ALL,
    input [7:0] BUTTONS
);

    reg [23:0] color;
    reg [9:0] cptTime;
    reg [10:0] ballX, ballY;
    reg [1:0] ballDirX, ballDirY;
    reg [10:0] racket1Y, racket2Y;
    reg [4:0] racket1YSlowCpt, racket2YSlowCpt;
    reg [15:0] score1, score2;

    always @(posedge CLK or negedge RST_IN) begin
        if (!RST_IN) begin
            ballX <= LCD_WIDTH / 2;
            ballY <= LCD_HEIGHT / 2;
            ballDirX <= 1;
            ballDirY <= 1;
            racket1Y <= LCD_HEIGHT / 2 - RACKET_SIZE / 2;
            racket2Y <= LCD_HEIGHT / 2 - RACKET_SIZE / 2;
            score1 <= 0;
            score2 <= 0;
        end else begin
            cptTime <= cptTime + 1;
            if (cptTime == BALL_SLOW - 1) begin
                cptTime <= 0;
                if (ballX <= BALL_SIZE + 1 && ballDirX == -1) begin
                    score2 <= score2 + 1;
                    ballX <= LCD_WIDTH / 2;
                    ballY <= LCD_HEIGHT / 2;
                    ballDirX <= 1;
                    ballDirY <= 1;
                end else if (ballX >= LCD_WIDTH - BALL_SIZE - 1 && ballDirX == 1) begin
                    score1 <= score1 + 1;
                    ballX <= LCD_WIDTH / 2;
                    ballY <= LCD_HEIGHT / 2;
                    ballDirX <= -1;
                    ballDirY <= 1;
                end else begin
                    ballX <= ballX + ballDirX;
                    ballY <= ballY + ballDirY;
                    if (ballY <= BALL_SIZE || ballY >= LCD_HEIGHT - BALL_SIZE - 1) begin
                        ballDirY <= -ballDirY;
                    end
                    if (ballX <= BALL_SIZE + RACKET_SIZE && ballY >= racket1Y && ballY <= racket1Y + RACKET_SIZE && ballDirX == -1) begin
                        ballDirX <= 1;
                    end else if (ballX >= LCD_WIDTH - BALL_SIZE - RACKET_SIZE - 1 && ballY >= racket2Y && ballY <= racket2Y + RACKET_SIZE && ballDirX == 1) begin
                        ballDirX <= -1;
                    end
                end
            end

            racket1YSlowCpt <= racket1YSlowCpt + 1;
            if (racket1YSlowCpt == RACKET_Y_SLOW - 1) begin
                racket1YSlowCpt <= 0;
                if (BUTTONS[1] && racket1Y > 0) begin
                    racket1Y <= racket1Y - 1;
                end else if (BUTTONS[0] && racket1Y < LCD_HEIGHT - RACKET_SIZE) begin
                    racket1Y <= racket1Y + 1;
                end
            end

            racket2YSlowCpt <= racket2YSlowCpt + 1;
            if (racket2YSlowCpt == RACKET_Y_SLOW - 1) begin
                racket2YSlowCpt <= 0;
                if (BUTTONS[3] && racket2Y > 0) begin
                    racket2Y <= racket2Y - 1;
                end else if (BUTTONS[2] && racket2Y < LCD_HEIGHT - RACKET_SIZE) begin
                    racket2Y <= racket2Y + 1;
                end
            end
        end
    end

    always @(*) begin
        if (ballX - BALL_SIZE <= X && X <= ballX + BALL_SIZE && ballY - BALL_SIZE <= Y && Y <= ballY + BALL_SIZE) begin
            color = 24'hFFFFFF;
        end else if (X <= RACKET_SIZE && racket1Y <= Y && Y <= racket1Y + RACKET_SIZE) begin
            color = 24'h00FF00;
        end else if (X >= LCD_WIDTH - RACKET_SIZE - 1 && racket2Y <= Y && Y <= racket2Y + RACKET_SIZE) begin
            color = 24'h00FF00;
        end else begin
            color = 24'h000000;
        end
    end

    assign R = color[23:16];
    assign G = color[15:8];
    assign B = color[7:0];
    assign DEN = 1'b1;
    assign SEG_HEX_ALL = {score2, score1};

endmodule