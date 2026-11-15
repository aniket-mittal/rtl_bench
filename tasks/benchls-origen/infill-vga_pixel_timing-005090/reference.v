module origen_005090 (
    input pclk,
    input reset,
    input [23:0] vga_data,
    output reg [4:0] row,
    output reg [6:0] col,
    output reg [3:0] height,
    output reg [3:0] width,
    output reg hsync,
    output reg vsync,
    output reg valid,
    output [7:0] vga_r,
    output [7:0] vga_g,
    output [7:0] vga_b
);

    // VGA timing parameters
    parameter h_frontporch = 96;
    parameter h_active = 144;
    parameter h_backporch = 784;
    parameter h_total = 800;

    parameter v_frontporch = 2;
    parameter v_active = 35;
    parameter v_backporch = 515;
    parameter v_total = 525;

    // Internal counters
    reg [9:0] x_cnt;
    reg [9:0] y_cnt;
    reg h_valid;
    reg v_valid;

    // Horizontal counter
    always @(posedge pclk or posedge reset) begin
        if (reset) begin
            x_cnt <= 10'd1;
        end else if (x_cnt == h_total) begin
            x_cnt <= 10'd1;
        end else begin
            x_cnt <= x_cnt + 1'b1;
        end
    end

    // Vertical counter
    always @(posedge pclk or posedge reset) begin
        if (reset) begin
            y_cnt <= 10'd1;
        end else if (y_cnt == v_total && x_cnt == h_total) begin
            y_cnt <= 10'd1;
        end else if (x_cnt == h_total) begin
            y_cnt <= y_cnt + 1'b1;
        end
    end

    // Horizontal valid signal
    always @(posedge pclk or posedge reset) begin
        if (reset) begin
            h_valid <= 1'b0;
        end else if (x_cnt == h_active) begin
            h_valid <= 1'b1;
        end else if (x_cnt == h_backporch) begin
            h_valid <= 1'b0;
        end
    end

    // Vertical valid signal
    always @(posedge pclk or posedge reset) begin
        if (reset) begin
            v_valid <= 1'b0;
        end else if (y_cnt == v_active) begin
            v_valid <= 1'b1;
        end else if (y_cnt == v_backporch) begin
            v_valid <= 1'b0;
        end
    end

    // Generate hsync and vsync
    always @(posedge pclk or posedge reset) begin
        if (reset) begin
            hsync <= 1'b1;
            vsync <= 1'b1;
        end else begin
            hsync <= (x_cnt > h_frontporch);
            vsync <= (y_cnt > v_frontporch);
        end
    end

    // Generate row, col, height, and width
    always @(posedge pclk or posedge reset) begin
        if (reset) begin
            row <= 5'd0;
            col <= 7'd0;
            height <= 4'd0;
            width <= 4'd0;
        end else if (h_valid && v_valid) begin
            if (width == 4'd8) begin
                width <= 4'd0;
                if (col == 7'd127) begin
                    col <= 7'd0;
                end else begin
                    col <= col + 1'b1;
                end
            end else begin
                width <= width + 1'b1;
            end

            if (x_cnt == h_backporch) begin
                if (height == 4'd15) begin
                    height <= 4'd0;
                    if (row == 5'd31) begin
                        row <= 5'd0;
                    end else begin
                        row <= row + 1'b1;
                    end
                end else begin
                    height <= height + 1'b1;
                end
            end
        end
    end

    // Generate valid signal
    always @(posedge pclk or posedge reset) begin
        if (reset) begin
            valid <= 1'b0;
        end else begin
            valid <= h_valid && v_valid;
        end
    end

    // Assign color outputs
    assign vga_r = vga_data[23:16];
    assign vga_g = vga_data[15:8];
    assign vga_b = vga_data[7:0];

endmodule