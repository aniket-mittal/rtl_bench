module origen_164210(
    input wire [10:0] xpos,
    input wire [10:0] ypos,
    input wire [10:0] hcount_in,
    input wire [10:0] vcount_in,
    input wire hsync_in,
    input wire vsync_in,
    input wire hblnk_in,
    input wire vblnk_in,
    input wire [23:0] rgb_in,
    input wire [23:0] rgb_pixel,
    input wire clk,
    input wire rst,
    output wire [10:0] hcount_out,
    output wire [10:0] vcount_out,
    output wire hsync_out,
    output wire vsync_out,
    output wire hblnk_out,
    output wire vblnk_out,
    output wire [23:0] rgb_out,
    output wire [18:0] pixel_addr
);

parameter X_WIDTH = 100;
parameter Y_WIDTH = 100;

reg [10:0] hcount_1, vcount_1, hcount_2, vcount_2;
reg hsync_1, vsync_1, hblnk_1, vblnk_1, hsync_2, vsync_2, hblnk_2, vblnk_2;
reg [10:0] xpos1, ypos1, xpos2, ypos2;
wire [10:0] addrx, addry;
reg [23:0] rgb_nxt;

always @(posedge clk) begin
    if (rst) begin
        hcount_1 <= 0;
        vcount_1 <= 0;
        hsync_1 <= 0;
        vsync_1 <= 0;
        hblnk_1 <= 0;
        vblnk_1 <= 0;
        xpos1 <= 0;
        ypos1 <= 0;
        hcount_2 <= 0;
        vcount_2 <= 0;
        hsync_2 <= 0;
        vsync_2 <= 0;
        hblnk_2 <= 0;
        vblnk_2 <= 0;
        xpos2 <= 0;
        ypos2 <= 0;
    end
    else begin
        hcount_1 <= hcount_in;
        vcount_1 <= vcount_in;
        hsync_1 <= hsync_in;
        vsync_1 <= vsync_in;
        hblnk_1 <= hblnk_in;
        vblnk_1 <= vblnk_in;
        xpos1 <= xpos;
        ypos1 <= ypos;
        hcount_2 <= hcount_1;
        vcount_2 <= vcount_1;
        hsync_2 <= hsync_1;
        vsync_2 <= vsync_1;
        hblnk_2 <= hblnk_1;
        vblnk_2 <= vblnk_1;
        xpos2 <= xpos1;
        ypos2 <= ypos1;
    end
end

always @(*) begin
    if (hcount_in >= xpos2 && hcount_in < xpos2 + X_WIDTH && vcount_in >= ypos2 && vcount_in < ypos2 + Y_WIDTH) begin
        rgb_nxt = rgb_pixel;
    end
    else begin
        rgb_nxt = rgb_in;
    end
end

assign hcount_out = hcount_2;
assign vcount_out = vcount_2;
assign hsync_out = hsync_2;
assign vsync_out = vsync_2;
assign hblnk_out = hblnk_2;
assign vblnk_out = vblnk_2;
assign rgb_out = rgb_nxt;
assign addrx = hcount_in - xpos2;
assign addry = vcount_in - ypos2;
assign pixel_addr = {addry, addrx};

endmodule