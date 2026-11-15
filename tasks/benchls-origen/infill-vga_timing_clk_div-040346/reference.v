module origen_040346 (
    input wire clk,
    input wire rst,
    input wire [3:0] nvga_r,
    input wire [3:0] nvga_g,
    input wire [3:0] nvga_b,
    output reg hsync,
    output reg vsync,
    output reg valid,
    output reg [9:0] x_dis,
    output reg [9:0] y_dis,
    output wire [3:0] vga_r,
    output wire [3:0] vga_g,
    output wire [3:0] vga_b
);

    reg clk2;
    reg [9:0] x_cnt;
    reg [9:0] y_cnt;

    // Clock division
    always @(posedge clk or posedge rst) begin
        if (rst)
            clk2 <= 1'b0;
        else
            clk2 <= ~clk2;
    end

    // Horizontal counter
    always @(posedge clk2 or posedge rst) begin
        if (rst)
            x_cnt <= 10'd0;
        else if (x_cnt == 10'd799)
            x_cnt <= 10'd0;
        else
            x_cnt <= x_cnt + 1'b1;
    end

    // Vertical counter
    always @(posedge clk2 or posedge rst) begin
        if (rst)
            y_cnt <= 10'd0;
        else if (x_cnt == 10'd799) begin
            if (y_cnt == 10'd524)
                y_cnt <= 10'd0;
            else
                y_cnt <= y_cnt + 1'b1;
        end
    end

    // Horizontal sync
    always @(posedge clk2 or posedge rst) begin
        if (rst)
            hsync <= 1'b1;
        else if (x_cnt == 10'd0)
            hsync <= 1'b0;
        else if (x_cnt == 10'd96)
            hsync <= 1'b1;
    end

    // Vertical sync
    always @(posedge clk2 or posedge rst) begin
        if (rst)
            vsync <= 1'b1;
        else if (y_cnt == 10'd0)
            vsync <= 1'b0;
        else if (y_cnt == 10'd2)
            vsync <= 1'b1;
    end

    // Valid display area
    always @(posedge clk2 or posedge rst) begin
        if (rst)
            valid <= 1'b0;
        else if ((x_cnt >= 10'd142) && (x_cnt < 10'd782) && (y_cnt >= 10'd33) && (y_cnt < 10'd513))
            valid <= 1'b1;
        else
            valid <= 1'b0;
    end

    // Display coordinates
    always @(posedge clk2 or posedge rst) begin
        if (rst) begin
            x_dis <= 10'd0;
            y_dis <= 10'd0;
        end
        else if (valid) begin
            x_dis <= x_cnt - 10'd142;
            y_dis <= y_cnt - 10'd33;
        end
        else begin
            x_dis <= 10'd0;
            y_dis <= 10'd0;
        end
    end

    // Color output
    assign vga_r = nvga_r;
    assign vga_g = nvga_g;
    assign vga_b = nvga_b;

endmodule