module origen_008430(
    input wire clk,
    input wire rst_n,
    input wire [1:0] switch,
    output reg hsync,
    output reg vsync,
    output reg [2:0] disp_RGB
);

    // Parameters
    parameter hpixel_end = 799;
    parameter hdat_begin = 143;
    parameter hdat_end = 783;
    parameter hsync_end = 95;
    parameter vline_end = 524;
    parameter vdat_begin = 34;
    parameter vdat_end = 514;
    parameter vsync_end = 1;

    // Internal signals
    reg vga_clk;
    reg [9:0] hcount, vcount;
    wire dat_act;
    reg [2:0] h_dat, v_dat, data;

    // Clock division
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            vga_clk <= 1'b0;
        else
            vga_clk <= ~vga_clk;
    end

    // Horizontal counter
    always @(posedge vga_clk or negedge rst_n) begin
        if (!rst_n)
            hcount <= 10'd0;
        else if (hcount == hpixel_end)
            hcount <= 10'd0;
        else
            hcount <= hcount + 1'b1;
    end

    // Vertical counter
    always @(posedge vga_clk or negedge rst_n) begin
        if (!rst_n)
            vcount <= 10'd0;
        else if (hcount == hpixel_end) begin
            if (vcount == vline_end)
                vcount <= 10'd0;
            else
                vcount <= vcount + 1'b1;
        end
    end

    // Sync signals
    always @(posedge vga_clk or negedge rst_n) begin
        if (!rst_n) begin
            hsync <= 1'b1;
            vsync <= 1'b1;
        end else begin
            hsync <= (hcount > hsync_end);
            vsync <= (vcount > vsync_end);
        end
    end

    // Active display area
    assign dat_act = (hcount >= hdat_begin) && (hcount < hdat_end) &&
                     (vcount >= vdat_begin) && (vcount < vdat_end);

    // Color generation
    always @(*) begin
        h_dat = (hcount - hdat_begin) / 80;
        v_dat = (vcount - vdat_begin) / 60;
    end

    // Display mode selection
    always @(*) begin
        case (switch)
            2'b00: data = h_dat;
            2'b01: data = v_dat;
            2'b10: data = h_dat ^ v_dat;
            2'b11: data = ~(h_dat ^ v_dat);
        endcase
    end

    // RGB output
    always @(posedge vga_clk or negedge rst_n) begin
        if (!rst_n)
            disp_RGB <= 3'b000;
        else if (dat_act)
            disp_RGB <= data;
        else
            disp_RGB <= 3'b000;
    end

endmodule