module origen_097917(
    input Clk,
    input Reset,
    output reg hs,
    output reg vs,
    output reg pixel_clk,
    output reg blank,
    output sync,
    output reg [9:0] DrawX,
    output reg [9:0] DrawY
);

    parameter [9:0] hpixels = 10'd524;
    parameter [9:0] vlines = 10'd350;
    parameter [9:0] hbp = 10'd43;
    parameter [9:0] hfp = 10'd524;
    parameter [9:0] vbp = 10'd12;
    parameter [9:0] vfp = 10'd284;

    reg [2:0] state;
    reg [9:0] hc, vc;
    reg clkdiv;

    assign sync = 1'b0;

    // Clock divider
    always @(posedge Clk or posedge Reset) begin
        if (Reset)
            state <= 3'd0;
        else if (state == 3'd6)
            state <= 3'd0;
        else
            state <= state + 1'b1;
    end

    always @(posedge Clk) begin
        clkdiv <= (state < 3'd3);
    end

    always @(posedge Clk) begin
        pixel_clk <= clkdiv;
    end

    // Horizontal counter
    always @(posedge pixel_clk or posedge Reset) begin
        if (Reset)
            hc <= 10'd0;
        else if (hc == hpixels - 1)
            hc <= 10'd0;
        else
            hc <= hc + 1'b1;
    end

    // Vertical counter
    always @(posedge pixel_clk or posedge Reset) begin
        if (Reset)
            vc <= 10'd0;
        else if (hc == hpixels - 1) begin
            if (vc == vlines - 1)
                vc <= 10'd0;
            else
                vc <= vc + 1'b1;
        end
    end

    // Horizontal sync
    always @(posedge pixel_clk or posedge Reset) begin
        if (Reset)
            hs <= 1'b1;
        else if (hc == 10'd520)
            hs <= 1'b0;
        else if (hc == 10'd522)
            hs <= 1'b1;
    end

    // Vertical sync
    always @(posedge pixel_clk or posedge Reset) begin
        if (Reset)
            vs <= 1'b1;
        else if (vc == 10'd280)
            vs <= 1'b0;
        else if (vc == 10'd281)
            vs <= 1'b1;
    end

    // Blank signal
    always @(posedge pixel_clk or posedge Reset) begin
        if (Reset)
            blank <= 1'b0;
        else
            blank <= (hc >= hbp) && (hc < hfp) && (vc >= vbp) && (vc < vfp);
    end

    // Drawing coordinates
    always @(posedge pixel_clk) begin
        DrawX <= hc;
        DrawY <= vc;
    end

endmodule