module origen_011693(
    input pixel_clock,
    input rst,
    input sw0,
    input sw1,
    input [9:0] hPos,
    input [9:0] vPos,
    input videoOn,
    output reg [4:0] R,
    output reg [5:0] G,
    output reg [4:0] B
);

    parameter radius_sq = 400;
    parameter radius = 20;

    reg [9:0] x, y;
    reg [9:0] x0, x1;
    reg x_flag, y_flag;
    reg [19:0] counter;

    initial begin
        x = 10'd320;
        y = 10'd240;
        x0 = 10'd290;
        x1 = 10'd390;
        x_flag = 1'b0;
        y_flag = 1'b0;
        counter = 20'd0;
    end

    always @(posedge pixel_clock or posedge rst) begin
        if (rst) begin
            x <= 10'd320;
            y <= 10'd240;
            x0 <= 10'd290;
            x1 <= 10'd390;
            x_flag <= 1'b0;
            y_flag <= 1'b0;
            counter <= 20'd0;
        end else begin
            counter <= counter + 1;
            if (counter == 20'd961762) begin
                counter <= 20'd0;
                
                // Update ball position
                if (x_flag)
                    x <= (x > 5) ? x - 5 : 0;
                else
                    x <= (x < 635) ? x + 5 : 635;
                
                if (y_flag)
                    y <= (y > 5) ? y - 5 : 0;
                else
                    y <= (y < 475) ? y + 5 : 475;
                
                // Bounce off edges
                if (x <= 5 || x >= 635) x_flag <= ~x_flag;
                if (y <= 5 || y >= 475) y_flag <= ~y_flag;
                
                // Bounce off paddle
                if (y >= 440 && y <= 460 && x >= x0 && x <= x1)
                    y_flag <= 1'b1;
            end

            // Move paddle
            if (sw1) begin
                x0 <= (x0 > 5) ? x0 - 1 : 0;
                x1 <= (x1 > 105) ? x1 - 1 : 100;
            end else begin
                x0 <= (x0 < 535) ? x0 + 1 : 540;
                x1 <= (x1 < 635) ? x1 + 1 : 640;
            end
        end
    end

    always @(*) begin
        if (rst) begin
            R = 5'b00000;
            G = 6'b000000;
            B = 5'b00000;
        end else if (videoOn) begin
            if ((hPos - x) * (hPos - x) + (vPos - y) * (vPos - y) <= radius_sq) begin
                // Ball
                R = 5'b11111;
                G = 6'b000000;
                B = 5'b00000;
            end else if (vPos >= 450 && vPos <= 460 && hPos >= x0 && hPos <= x1) begin
                // Paddle
                R = 5'b00000;
                G = 6'b111111;
                B = 5'b11111;
            end else begin
                // Background
                R = sw0 ? 5'b11111 : 5'b00000;
                G = sw0 ? 6'b111111 : 6'b000000;
                B = sw0 ? 5'b11111 : 5'b00000;
            end
        end else begin
            R = 5'b00000;
            G = 6'b000000;
            B = 5'b00000;
        end
    end

endmodule