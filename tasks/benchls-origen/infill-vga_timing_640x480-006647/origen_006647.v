module origen_006647 (
    input wire pixel_clk,
    output reg vsync,
    output reg hsync,
    output reg in_video_region,
    output reg [11:0] xpos,
    output reg [11:0] ypos
);

    // VGA timing parameters for 640x480 resolution
    parameter HACTIVE      = 640;
    parameter HFRONT_PORCH = 16;
    parameter HSYNC_PULSE  = 96;
    parameter HBACK_PORCH  = 48;
    parameter HTOTAL       = HACTIVE + HFRONT_PORCH + HSYNC_PULSE + HBACK_PORCH;

    parameter VACTIVE      = 480;
    parameter VFRONT_PORCH = 10;
    parameter VSYNC_PULSE  = 2;
    parameter VBACK_PORCH  = 33;
    parameter VTOTAL       = VACTIVE + VFRONT_PORCH + VSYNC_PULSE + VBACK_PORCH;

    reg [11:0] pixel_count;
    reg [11:0] line_count;

    [MASKED]

endmodule