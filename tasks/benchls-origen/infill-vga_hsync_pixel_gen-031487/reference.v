module origen_031487 (
    input wire clk,
    input wire reset,
    output reg [6:0] HPIXEL,
    output reg VGA_HSYNC,
    output reg RGB
);

reg [10:0] HSYNC_cnt;
reg [2:0] cnt;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        HSYNC_cnt <= 11'd0;
        HPIXEL <= 7'd0;
        VGA_HSYNC <= 1'b1;
        RGB <= 1'b0;
        cnt <= 3'd0;
    end else begin
        if (HSYNC_cnt == 11'd1599) begin
            HSYNC_cnt <= 11'd0;
            RGB <= 1'b1;
        end else begin
            HSYNC_cnt <= HSYNC_cnt + 11'd1;
            RGB <= 1'b0;
        end

        if (HSYNC_cnt < 11'd192) begin
            VGA_HSYNC <= 1'b0;
        end else begin
            VGA_HSYNC <= 1'b1;
        end

        if (HSYNC_cnt >= 11'd288 && HSYNC_cnt < 11'd1568) begin
            if (cnt == 3'd4) begin
                cnt <= 3'd0;
                if (HPIXEL == 7'd127) begin
                    HPIXEL <= 7'd0;
                end else begin
                    HPIXEL <= HPIXEL + 7'd1;
                end
            end else begin
                cnt <= cnt + 3'd1;
            end
        end else begin
            HPIXEL <= 7'd0;
            cnt <= 3'd0;
        end
    end
end

endmodule