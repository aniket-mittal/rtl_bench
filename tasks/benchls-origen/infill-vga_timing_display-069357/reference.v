module origen_069357 #(
    parameter H_RES = 800,
    parameter H_FP = 40,
    parameter H_SYNC = 128,
    parameter H_BP = 88,
    parameter V_RES = 480,
    parameter V_FP = 1,
    parameter V_SYNC = 3,
    parameter V_BP = 21,
    parameter H_POL = 1'b0,
    parameter V_POL = 1'b0
) (
    input wire pixelClock,
    input wire [1:0] sw,
    input wire [3:0] btn,
    input wire [15:0] ppuAddress,
    input wire [23:0] vd,
    output reg [7:0] red,
    output reg [7:0] green,
    output reg [7:0] blue,
    output reg hSync,
    output reg vSync,
    output reg blank,
    output reg [15:0] va
);

    localparam H_TOTAL = H_RES + H_FP + H_SYNC + H_BP;
    localparam V_TOTAL = V_RES + V_FP + V_SYNC + V_BP;

    reg [11:0] x;
    reg [11:0] line;
    reg [7:0] xOffset, yOffset;
    reg [3:0] btnLast, btnDebounced;
    reg [7:0] debounceCounter;

    wire displayEnable;
    wire [7:0] xValid, yValid;

    assign displayEnable = (x < H_RES) && (line < V_RES);
    assign xValid = (x - xOffset) & 8'hFF;
    assign yValid = (line - yOffset) & 8'hFF;

    always @(posedge pixelClock) begin
        // Horizontal counter
        if (x == H_TOTAL - 1) begin
            x <= 0;
            if (line == V_TOTAL - 1)
                line <= 0;
            else
                line <= line + 1;
        end else begin
            x <= x + 1;
        end

        // Sync signals
        hSync <= (x >= H_RES + H_FP) && (x < H_RES + H_FP + H_SYNC) ? H_POL : ~H_POL;
        vSync <= (line >= V_RES + V_FP) && (line < V_RES + V_FP + V_SYNC) ? V_POL : ~V_POL;
        blank <= ~displayEnable;

        // Button debouncing
        if (debounceCounter == 0) begin
            btnDebounced <= btn;
            debounceCounter <= 8'd255;
        end else begin
            debounceCounter <= debounceCounter - 1;
        end

        // Offset control
        if (btnDebounced != btnLast) begin
            if (btnDebounced[0] && xOffset > 0) xOffset <= xOffset - 1;
            if (btnDebounced[1] && xOffset < H_RES - 256) xOffset <= xOffset + 1;
            if (btnDebounced[2] && yOffset > 0) yOffset <= yOffset - 1;
            if (btnDebounced[3] && yOffset < V_RES - 256) yOffset <= yOffset + 1;
        end
        btnLast <= btnDebounced;

        // Video address generation
        if (xValid < 256 && yValid < 256)
            va <= {yValid[7:4], xValid[7:4], yValid[3:0], xValid[3:0]};
        else
            va <= 16'h0000;

        // Color generation based on display mode
        if (displayEnable) begin
            if (xValid < 256 && yValid < 256) begin
                case (sw)
                    2'b00: begin // Color gradient
                        red <= xValid;
                        green <= yValid;
                        blue <= xValid ^ yValid;
                    end
                    2'b01: begin // Framebuffer
                        {red, green, blue} <= vd;
                    end
                    2'b10: begin // Grid pattern (pixel coordinates)
                        red <= (xValid[3:0] == 4'h0 || yValid[3:0] == 4'h0) ? 8'hFF : 8'h00;
                        green <= (xValid[3:0] == 4'h0 || yValid[3:0] == 4'h0) ? 8'hFF : 8'h00;
                        blue <= (xValid[3:0] == 4'h0 || yValid[3:0] == 4'h0) ? 8'hFF : 8'h00;
                    end
                    2'b11: begin // Grid pattern (screen coordinates)
                        red <= (x[3:0] == 4'h0 || line[3:0] == 4'h0) ? 8'hFF : 8'h00;
                        green <= (x[3:0] == 4'h0 || line[3:0] == 4'h0) ? 8'hFF : 8'h00;
                        blue <= (x[3:0] == 4'h0 || line[3:0] == 4'h0) ? 8'hFF : 8'h00;
                    end
                endcase

                // Cursor highlighting
                if (va == ppuAddress)
                    red[7] <= ~red[7];
            end else begin
                // Checkerboard pattern outside valid area
                red <= ((x[4] ^ line[4]) ? 8'hAA : 8'h55);
                green <= ((x[4] ^ line[4]) ? 8'hAA : 8'h55);
                blue <= ((x[4] ^ line[4]) ? 8'hAA : 8'h55);
            end
        end else begin
            red <= 8'h00;
            green <= 8'h00;
            blue <= 8'h00;
        end
    end

endmodule