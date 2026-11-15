module origen_091746 (
    input wire pclk,
    input wire reset,
    input wire [11:0] vga_data,
    output reg [9:0] h_addr,
    output reg [9:0] v_addr,
    output reg hsync,
    output reg vsync,
    output reg valid,
    output reg [7:0] vga_r,
    output reg [7:0] vga_g,
    output reg [7:0] vga_b
);

    // Timing parameters
    parameter h_frontporch = 16;
    parameter h_active = 640;
    parameter h_backporch = 48;
    parameter h_total = 800;

    parameter v_frontporch = 10;
    parameter v_active = 480;
    parameter v_backporch = 33;
    parameter v_total = 525;

    // Internal signals
    reg [9:0] x_cnt;
    reg [9:0] y_cnt;
    wire h_valid;
    wire v_valid;

    // Horizontal counter
    always @(posedge pclk or posedge reset) begin
        if (reset)
            x_cnt <= 10'd0;
        else if (x_cnt == h_total - 1)
            x_cnt <= 10'd0;
        else
            x_cnt <= x_cnt + 10'd1;
    end

    // Vertical counter
    always @(posedge pclk or posedge reset) begin
        if (reset)
            y_cnt <= 10'd0;
        else if (x_cnt == h_total - 1) begin
            if (y_cnt == v_total - 1)
                y_cnt <= 10'd0;
            else
                y_cnt <= y_cnt + 10'd1;
        end
    end

    // Generate sync signals
    always @(posedge pclk or posedge reset) begin
        if (reset) begin
            hsync <= 1'b1;
            vsync <= 1'b1;
        end else begin
            hsync <= (x_cnt > h_frontporch);
            vsync <= (y_cnt > v_frontporch);
        end
    end

    // Generate valid signals
    assign h_valid = (x_cnt > h_active) && (x_cnt <= h_backporch);
    assign v_valid = (y_cnt > v_active) && (y_cnt <= v_backporch);
    always @(posedge pclk or posedge reset) begin
        if (reset)
            valid <= 1'b0;
        else
            valid <= h_valid && v_valid;
    end

    // Generate address outputs
    always @(posedge pclk or posedge reset) begin
        if (reset) begin
            h_addr <= 10'd0;
            v_addr <= 10'd0;
        end else begin
            h_addr <= h_valid ? (x_cnt - 10'd144) : 10'd0;
            v_addr <= v_valid ? (y_cnt - 10'd35) : 10'd0;
        end
    end

    // Process color data
    always @(posedge pclk or posedge reset) begin
        if (reset) begin
            vga_r <= 8'd0;
            vga_g <= 8'd0;
            vga_b <= 8'd0;
        end else begin
            vga_r <= {vga_data[11:8], 4'b0000};
            vga_g <= {vga_data[7:4], 4'b0000};
            vga_b <= {vga_data[3:0], 4'b0000};
        end
    end

endmodule