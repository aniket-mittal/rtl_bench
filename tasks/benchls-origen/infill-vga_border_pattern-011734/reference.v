module origen_011734(
    input VGA_CLK,
    input disp_en,
    input [10:0] x,
    input [10:0] y,
    output reg [7:0] r,
    output reg [7:0] g,
    output reg [7:0] b
);

    parameter H = 1280;
    parameter V = 1024;
    parameter spessore = 21;

    always @(posedge VGA_CLK) begin
        if (disp_en) begin
            if (x < spessore && y < V - spessore) begin
                // Left border (white)
                r <= 8'd255;
                g <= 8'd255;
                b <= 8'd255;
            end else if (y < spessore) begin
                // Top border (cyan)
                r <= 8'd0;
                g <= 8'd255;
                b <= 8'd255;
            end else if (x >= H - spessore) begin
                // Right border (yellow)
                r <= 8'd255;
                g <= 8'd255;
                b <= 8'd0;
            end else if (y >= V - spessore) begin
                // Bottom border (magenta)
                r <= 8'd255;
                g <= 8'd0;
                b <= 8'd255;
            end else begin
                // Interior (blue gradient)
                r <= 8'd0;
                g <= 8'd0;
                b <= 8'd255 - y[10:2];
            end
        end else begin
            // Display disabled
            r <= 8'd0;
            g <= 8'd0;
            b <= 8'd0;
        end
    end

endmodule