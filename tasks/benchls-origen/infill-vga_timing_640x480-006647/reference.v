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

    always @(posedge pixel_clk) begin
        // Horizontal counter
        if (pixel_count == HTOTAL - 1) begin
            pixel_count <= 0;
            // Vertical counter
            if (line_count == VTOTAL - 1)
                line_count <= 0;
            else
                line_count <= line_count + 1;
        end else begin
            pixel_count <= pixel_count + 1;
        end

        // Generate hsync
        hsync <= ~((pixel_count >= (HACTIVE + HFRONT_PORCH)) && (pixel_count < (HACTIVE + HFRONT_PORCH + HSYNC_PULSE)));

        // Generate vsync
        vsync <= ~((line_count >= (VACTIVE + VFRONT_PORCH)) && (line_count < (VACTIVE + VFRONT_PORCH + VSYNC_PULSE)));

        // Generate in_video_region
        in_video_region <= (pixel_count < HACTIVE) && (line_count < VACTIVE);

        // Generate xpos and ypos
        if (in_video_region) begin
            xpos <= pixel_count;
            ypos <= line_count;
        end else begin
            xpos <= 0;
            ypos <= 0;
        end
    end

endmodule