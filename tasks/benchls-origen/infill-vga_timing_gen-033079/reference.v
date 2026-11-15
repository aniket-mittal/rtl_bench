module origen_033079 (
    input wire clk_pix,
    input wire rst_pix,
    output reg [9:0] sx,
    output reg [9:0] sy,
    output wire hsync,
    output wire vsync,
    output wire de
);

    // Horizontal timing parameters
    parameter HA_END = 639;
    parameter HS_STA = 655;
    parameter HS_END = 751;
    parameter LINE   = 799;

    // Vertical timing parameters
    parameter VA_END = 479;
    parameter VS_STA = 489;
    parameter VS_END = 491;
    parameter SCREEN = 524;

    // Horizontal counter
    always @(posedge clk_pix) begin
        if (rst_pix) begin
            sx <= 0;
        end else begin
            if (sx == LINE) begin
                sx <= 0;
            end else begin
                sx <= sx + 1;
            end
        end
    end

    // Vertical counter
    always @(posedge clk_pix) begin
        if (rst_pix) begin
            sy <= 0;
        end else if (sx == LINE) begin
            if (sy == SCREEN) begin
                sy <= 0;
            end else begin
                sy <= sy + 1;
            end
        end
    end

    // Horizontal sync
    assign hsync = ~((sx >= HS_STA) && (sx < HS_END));

    // Vertical sync
    assign vsync = ~((sy >= VS_STA) && (sy < VS_END));

    // Data enable
    assign de = (sx <= HA_END) && (sy <= VA_END);

endmodule