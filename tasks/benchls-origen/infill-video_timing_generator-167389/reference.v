module origen_167389 #(
    parameter HSYNC_START = 16'd96,
    parameter HSYNC_END   = 16'd144,
    parameter HBLANK_START= 16'd0,
    parameter HBLANK_END  = 16'd144,
    parameter VSYNC_START = 16'd2,
    parameter VSYNC_END   = 16'd6,
    parameter VBLANK_START= 16'd0,
    parameter VBLANK_END  = 16'd35
) (
    input  wire        clk,
    input  wire        clk_pix_en,
    input  wire        reset,
    output reg  [7:0]  h,
    output reg  [7:0]  v,
    output reg         hx,
    output reg         hff,
    output reg         hsync,
    output reg         vsync,
    output reg         hbl,
    output reg         vbl,
    output reg         de
);

    // Horizontal and Vertical Counters
    reg [8:0] sx, sy;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            sx <= 9'd0;
            sy <= 9'd16;
        end else if (clk_pix_en) begin
            sx <= sx + 9'd1;
            if (sx == 9'd511) begin
                sx <= 9'd0;
                sy <= sy + 9'd1;
            end
        end
    end

    // Horizontal and Vertical Timing Signals
    always @* begin
        h = sx[7:0];
        v = sy[7:0];
        hx = sx[8];
        hff = (sx == 9'd255);

        hsync = (sx >= HSYNC_START && sx < HSYNC_END);
        vsync = (sy >= VSYNC_START && sy < VSYNC_END);
        hbl = (sx >= HBLANK_START && sx < HBLANK_END);
        vbl = (sy >= VBLANK_START && sy < VBLANK_END);
        de = 1'b1;
    end

endmodule