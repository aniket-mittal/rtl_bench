module origen_035469(
    input wire clk,
    input wire rst,
    input wire pclk,
    input wire vga_clk,
    input wire HREF,
    input wire VS,
    input wire [15:0] rx,
    output reg VSYNC,
    output reg HSYNC,
    output reg [3:0] R,
    output reg [3:0] G,
    output reg [3:0] B
);

reg [15:0] data;

always @(posedge vga_clk or posedge rst) begin
    if (rst) begin
        data <= 16'h0000;
        VSYNC <= 1'b0;
        HSYNC <= 1'b0;
        R <= 4'b0000;
        G <= 4'b0000;
        B <= 4'b0000;
    end else begin
        data <= rx;
        
        if (HREF && !VS) begin
            // Active display area
            R <= rx[15:12];
            G <= rx[10:7];
            B <= rx[4:1];
            HSYNC <= 1'b1;
            VSYNC <= 1'b0;
        end else if (!HREF && VS) begin
            // Vertical blanking period
            R <= 4'b0000;
            G <= 4'b0000;
            B <= 4'b0000;
            HSYNC <= 1'b0;
            VSYNC <= 1'b1;
        end else begin
            // Horizontal blanking period
            R <= 4'bz;
            G <= 4'bz;
            B <= 4'bz;
            HSYNC <= 1'b0;
            VSYNC <= 1'b0;
        end
    end
end

endmodule