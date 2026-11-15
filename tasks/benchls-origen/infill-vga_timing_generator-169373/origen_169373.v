module origen_169373(
    input clk,
    input reset,
    output reg vga_clk,
    output reg hsync,
    output reg vsync,
    output [9:0] pixel_x,
    output [9:0] pixel_y,
    output video_on
);

    reg [9:0] h_count;
    reg [9:0] v_count;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            vga_clk <= 0;
        end else begin
            vga_clk <= ~vga_clk;
        end
    end

    always @(posedge vga_clk or posedge reset) begin
        if (reset) begin
            h_count <= 0;
            v_count <= 0;
        end else begin
            if (h_count == 799) begin
                h_count <= 0;
                if (v_count == 524)
                    v_count <= 0;
                else
                    v_count <= v_count + 1;
            end else begin
                h_count <= h_count + 1;
            end
        end
    end

    [MASKED]

    assign pixel_x = h_count - 143;
    assign pixel_y = v_count - 35;

    assign video_on = (h_count >= 143 && h_count <= 782 && v_count >= 35 && v_count <= 514);

endmodule