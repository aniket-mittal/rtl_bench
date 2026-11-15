module origen_068841 (
    input wire CLK,
    input wire clr,
    output reg hsync,
    output reg vsync,
    output reg [9:0] PixelX,
    output reg [9:0] PixelY,
    output reg vidon,
    output reg slw_clk
);

    // VGA timing parameters
    parameter TotalHorizontalPixels = 800;
    parameter TotalVerticalLines = 521;
    parameter HorizontalSyncWidth = 96;
    parameter VerticalSyncWidth = 2;
    parameter HorizontalBackPorch = 48;
    parameter VerticalBackPorch = 33;
    parameter HorizontalFrontPorch = 16;
    parameter VerticalFrontPorch = 10;
    parameter ActiveVideoHorizontal = 640;
    parameter ActiveVideoVertical = 480;

    reg [9:0] h_count;
    reg [9:0] v_count;
    reg v_sync_enable;

    // Clock division
    always @(posedge CLK or posedge clr) begin
        if (clr)
            slw_clk <= 1'b0;
        else
            slw_clk <= ~slw_clk;
    end

    // Horizontal counter
    always @(posedge slw_clk or posedge clr) begin
        if (clr)
            h_count <= 10'd0;
        else if (h_count == TotalHorizontalPixels - 1) begin
            h_count <= 10'd0;
            v_sync_enable <= 1'b1;
        end
        else begin
            h_count <= h_count + 1'b1;
            v_sync_enable <= 1'b0;
        end
    end

    // Vertical counter
    always @(posedge slw_clk or posedge clr) begin
        if (clr)
            v_count <= 10'd0;
        else if (v_sync_enable) begin
            if (v_count == TotalVerticalLines - 1)
                v_count <= 10'd0;
            else
                v_count <= v_count + 1'b1;
        end
    end

    // Sync signal generation
    always @(posedge slw_clk or posedge clr) begin
        if (clr) begin
            hsync <= 1'b1;
            vsync <= 1'b1;
        end
        else begin
            hsync <= (h_count < HorizontalSyncWidth) ? 1'b0 : 1'b1;
            vsync <= (v_count < VerticalSyncWidth) ? 1'b0 : 1'b1;
        end
    end

    // Pixel coordinate generation
    always @(posedge slw_clk or posedge clr) begin
        if (clr) begin
            PixelX <= 10'd0;
            PixelY <= 10'd0;
        end
        else begin
            PixelX <= (h_count - HorizontalBackPorch);
            PixelY <= (v_count - VerticalBackPorch);
        end
    end

    // Video on signal generation
    always @(posedge slw_clk or posedge clr) begin
        if (clr)
            vidon <= 1'b0;
        else
            vidon <= (h_count >= HorizontalBackPorch) &&
                     (h_count < HorizontalBackPorch + ActiveVideoHorizontal) &&
                     (v_count >= VerticalBackPorch) &&
                     (v_count < VerticalBackPorch + ActiveVideoVertical);
    end

endmodule