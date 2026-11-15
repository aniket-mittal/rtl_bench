module origen_214664(
    input clk,
    input rst,
    input [1:0] snake,
    input [5:0] apple_x,
    input [4:0] apple_y,
    output reg [9:0] x_pos,
    output reg [9:0] y_pos,
    output reg hsync,
    output reg vsync,
    output reg [11:0] color_out
);

    parameter HACTIVE = 640;
    parameter HFRONT  = 16;
    parameter HSYNC   = 96;
    parameter HBACK   = 48;
    parameter VACTIVE = 480;
    parameter VFRONT  = 10;
    parameter VSYNC   = 2;
    parameter VBACK   = 29;

    reg [10:0] clk_cnt;
    reg [10:0] line_cnt;
    wire clk_25M;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            clk_cnt <= 0;
        end else begin
            clk_cnt <= clk_cnt + 1;
        end
    end

    assign clk_25M = clk_cnt[0];

    always @(posedge clk_25M or negedge rst) begin
        if (!rst) begin
            line_cnt <= 0;
            hsync <= 1;
            vsync <= 1;
            x_pos <= 0;
            y_pos <= 0;
        end else begin
            if (line_cnt == (HACTIVE + HFRONT + HSYNC + HBACK - 1)) begin
                line_cnt <= 0;
                if (y_pos == (VACTIVE + VFRONT + VSYNC + VBACK - 1)) begin
                    y_pos <= 0;
                end else begin
                    y_pos <= y_pos + 1;
                end
            end else begin
                line_cnt <= line_cnt + 1;
            end

            if (line_cnt < HACTIVE) begin
                x_pos <= line_cnt - 144;
            end else begin
                x_pos <= 0;
            end

            if (line_cnt >= HACTIVE && line_cnt < (HACTIVE + HFRONT)) begin
                hsync <= 0;
            end else begin
                hsync <= 1;
            end

            if (y_pos >= VACTIVE && y_pos < (VACTIVE + VFRONT)) begin
                vsync <= 0;
            end else begin
                vsync <= 1;
            end
        end
    end

    always @(posedge clk_25M or negedge rst) begin
        if (!rst) begin
            color_out <= 12'b0000_0000_0000;
        end else begin
            if (x_pos >= 0 && x_pos < HACTIVE && y_pos >= 0 && y_pos < VACTIVE) begin
                if (x_pos == apple_x && y_pos == apple_y) begin
                    color_out <= 12'b0000_0000_1111;
                end else if (snake == 2'b00) begin
                    color_out <= 12'b0000_0000_0000;
                end else if (snake == 2'b11) begin
                    color_out <= 12'b0000_0000_0101;
                end else if (snake == 2'b01) begin
                    color_out <= 12'b0000_1111_0000;
                end else begin
                    color_out <= 12'b0000_1111_1111;
                end
            end else begin
                color_out <= 12'b0000_0000_0000;
            end
        end
    end

endmodule