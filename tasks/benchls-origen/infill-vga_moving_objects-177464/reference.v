module origen_177464(
    input pixel_clock,
    input rst,
    input sw0,
    input sw1,
    input [10:0] hPos,
    input [10:0] vPos,
    input videoOn,
    output reg [4:0] R,
    output reg [5:0] G,
    output reg [4:0] B
);

reg [10:0] x, y; // Circular object position
reg x_flag, y_flag; // Circular object movement flags
reg [10:0] x0, y0, x1, y1; // Rectangular object position
reg [31:0] counter; // Counter for resetting circular object

always @(posedge pixel_clock or posedge rst) begin
    if (rst) begin
        x <= 100;
        y <= 100;
        x_flag <= 1;
        y_flag <= 1;
        x0 <= 200;
        y0 <= 200;
        x1 <= 300;
        y1 <= 300;
        counter <= 0;
    end else begin
        // Update circular object position
        if (x_flag) begin
            x <= x + 1;
            if (x >= 640 - 20)
                x_flag <= 0;
        end else begin
            x <= x - 1;
            if (x <= 20)
                x_flag <= 1;
        end

        if (y_flag) begin
            y <= y + 1;
            if (y >= 480 - 20)
                y_flag <= 0;
        end else begin
            y <= y - 1;
            if (y <= 20)
                y_flag <= 1;
        end

        // Update rectangular object position
        if (sw1) begin
            x0 <= x0 - 1;
            x1 <= x1 - 1;
        end else begin
            x0 <= x0 + 1;
            x1 <= x1 + 1;
        end

        // Reset circular object after a certain number of cycles
        counter <= counter + 1;
        if (counter >= 32'h3FFFFFFF) begin
            x <= 100;
            y <= 100;
            x_flag <= 1;
            y_flag <= 1;
            counter <= 0;
        end
    end
end

always @(*) begin
    if (videoOn) begin
        // Check if current pixel is within circular object
        if ((hPos - x) * (hPos - x) + (vPos - y) * (vPos - y) <= 20 * 20) begin
            R = 5'h1F;
            G = 6'h00;
            B = 5'h00;
        // Check if current pixel is within rectangular object
        end else if (hPos >= x0 && hPos <= x1 && vPos >= y0 && vPos <= y1) begin
            R = 5'h00;
            G = 6'h3F;
            B = 5'h1F;
        // Set background color
        end else begin
            R = sw0 ? 5'h1F : 5'h00;
            G = sw0 ? 6'h3F : 5'h00;
            B = sw0 ? 5'h1F : 5'h00;
        end
    end else begin
        R = 5'h00;
        G = 6'h00;
        B = 5'h00;
    end
end

endmodule