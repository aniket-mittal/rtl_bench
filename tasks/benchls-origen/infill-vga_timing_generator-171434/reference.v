module origen_171434(
    input pixel_clk,
    input rst,
    input left,
    input right,
    input [9:0] d_x,
    input [9:0] d_y,
    input [9:0] p1_vpos,
    input [9:0] p3_vpos,
    input [9:0] p1_hpos,
    input [9:0] p3_hpos,
    input terminated,
    output reg hsync,
    output reg vsync,
    output reg [7:0] red,
    output reg [7:0] green,
    output reg [7:0] blue
);

    // VGA display parameters
    parameter hpixels = 800;
    parameter vlines = 521;
    parameter hpulse = 96;
    parameter vpulse = 2;
    parameter hbp = 295;
    parameter hfp = 655;
    parameter vbp = 31;
    parameter vfp = 511;

    // Internal counters
    reg [9:0] hc;
    reg [9:0] vc;

    always @(posedge pixel_clk) begin
        if (rst) begin
            hc <= 0;
            vc <= 0;
        end else begin
            if (hc == hpixels - 1) begin
                hc <= 0;
                if (vc == vlines - 1) begin
                    vc <= 0;
                end else begin
                    vc <= vc + 1;
                end
            end else begin
                hc <= hc + 1;
            end
        end
    end

    // Generate sync signals
    always @(posedge pixel_clk) begin
        if (hc < hpulse) begin
            hsync <= 0;
        end else begin
            hsync <= 1;
        end

        if (vc < vpulse) begin
            vsync <= 0;
        end else begin
            vsync <= 1;
        end
    end

    // Generate color output
    always @(posedge pixel_clk) begin
        if (hc >= hbp && hc < hbp + 640 && vc >= vbp && vc < vbp + 480) begin
            // Background
            red <= 8'h80;
            green <= 8'h80;
            blue <= 8'h80;

            // Object 1
            if (hc >= p1_hpos && hc < p1_hpos + 50 && vc >= p1_vpos && vc < p1_vpos + 50) begin
                red <= 8'hff;
                green <= 8'h00;
                blue <= 8'h00;
            end

            // Object 2
            if (hc >= p3_hpos && hc < p3_hpos + 50 && vc >= p3_vpos && vc < p3_vpos + 50) begin
                red <= 8'h00;
                green <= 8'hff;
                blue <= 8'h00;
            end

            // Doodle
            if (terminated && hc >= d_x && hc < d_x + 20 && vc >= d_y && vc < d_y + 20) begin
                red <= 8'hff;
                green <= 8'hff;
                blue <= 8'h00;
            end
        end else begin
            // Outside the active display area
            red <= 8'h00;
            green <= 8'h00;
            blue <= 8'h00;
        end
    end

endmodule