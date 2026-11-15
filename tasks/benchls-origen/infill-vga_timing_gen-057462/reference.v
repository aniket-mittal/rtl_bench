module origen_057462 (
    input wire clk,
    input wire clr,
    output wire hsync,
    output wire vsync,
    output reg [9:0] hc,
    output reg [9:0] vc,
    output wire vidon
);

    // Parameters
    parameter hpixels = 800;
    parameter vlines = 521;
    parameter hbp = 144;
    parameter hfp = 784;
    parameter vbp = 31;
    parameter vfp = 511;

    // Internal signals
    reg vsenable;

    // Horizontal counter
    always @(posedge clk or posedge clr) begin
        if (clr)
            hc <= 10'd0;
        else if (hc == hpixels - 1) begin
            hc <= 10'd0;
            vsenable <= 1'b1;
        end
        else begin
            hc <= hc + 1;
            vsenable <= 1'b0;
        end
    end

    // Vertical counter
    always @(posedge clk or posedge clr) begin
        if (clr)
            vc <= 10'd0;
        else if (vsenable) begin
            if (vc == vlines - 1)
                vc <= 10'd0;
            else
                vc <= vc + 1;
        end
    end

    // Horizontal sync
    assign hsync = (hc < 96) ? 1'b0 : 1'b1;

    // Vertical sync
    assign vsync = (vc < 2) ? 1'b0 : 1'b1;

    // Video enable
    assign vidon = (hc >= hbp && hc < hfp && vc >= vbp && vc < vfp) ? 1'b1 : 1'b0;

endmodule