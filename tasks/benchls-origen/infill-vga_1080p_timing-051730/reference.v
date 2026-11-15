module origen_051730 (
    input wire sclk,
    input wire vga_clk,
    input wire rst_n,
    input wire [23:0] rgb_data,
    output reg h_sync,
    output reg v_sync,
    output reg pixel_start_flag,
    output reg pixel_de,
    output reg [7:0] r,
    output reg [7:0] g,
    output reg [7:0] b
);

    // Timing parameters for 1920x1080@60Hz
    parameter H_ACTIVE = 1920;
    parameter H_FP = 88;
    parameter H_SYNC = 44;
    parameter H_BP = 148;
    parameter H_TOTAL = 2200;

    parameter V_ACTIVE = 1080;
    parameter V_FP = 4;
    parameter V_SYNC = 5;
    parameter V_BP = 36;
    parameter V_TOTAL = 1125;

    reg [11:0] h_cnt;
    reg [11:0] v_cnt;

    // Horizontal counter
    always @(posedge vga_clk or negedge rst_n) begin
        if (!rst_n)
            h_cnt <= 12'd0;
        else if (h_cnt == H_TOTAL - 1)
            h_cnt <= 12'd0;
        else
            h_cnt <= h_cnt + 1'b1;
    end

    // Vertical counter
    always @(posedge vga_clk or negedge rst_n) begin
        if (!rst_n)
            v_cnt <= 12'd0;
        else if (h_cnt == H_TOTAL - 1) begin
            if (v_cnt == V_TOTAL - 1)
                v_cnt <= 12'd0;
            else
                v_cnt <= v_cnt + 1'b1;
        end
    end

    // Horizontal sync
    always @(posedge vga_clk or negedge rst_n) begin
        if (!rst_n)
            h_sync <= 1'b1;
        else
            h_sync <= (h_cnt >= (H_ACTIVE + H_FP) && h_cnt < (H_ACTIVE + H_FP + H_SYNC)) ? 1'b0 : 1'b1;
    end

    // Vertical sync
    always @(posedge vga_clk or negedge rst_n) begin
        if (!rst_n)
            v_sync <= 1'b1;
        else
            v_sync <= (v_cnt >= (V_ACTIVE + V_FP) && v_cnt < (V_ACTIVE + V_FP + V_SYNC)) ? 1'b0 : 1'b1;
    end

    // Data enable
    always @(posedge vga_clk or negedge rst_n) begin
        if (!rst_n)
            pixel_de <= 1'b0;
        else
            pixel_de <= (h_cnt < H_ACTIVE) && (v_cnt < V_ACTIVE);
    end

    // RGB output
    always @(posedge vga_clk or negedge rst_n) begin
        if (!rst_n) begin
            r <= 8'd0;
            g <= 8'd0;
            b <= 8'd0;
        end else if (pixel_de) begin
            r <= rgb_data[23:16];
            g <= rgb_data[15:8];
            b <= rgb_data[7:0];
        end else begin
            r <= 8'd0;
            g <= 8'd0;
            b <= 8'd0;
        end
    end

    // Pixel start flag
    always @(posedge vga_clk or negedge rst_n) begin
        if (!rst_n)
            pixel_start_flag <= 1'b0;
        else
            pixel_start_flag <= (h_cnt == H_ACTIVE - 1) && (v_cnt == V_ACTIVE - 1);
    end

endmodule