module origen_056421 (
    input wire clk160M,
    input wire rst0,
    input wire hsync,
    input wire vsync,
    input wire [9:0] cnt_r,
    input wire [31:0] p_sum0, p_sum1,
    input wire [31:0] x_sum0, x_sum1,
    input wire [31:0] y_sum0, y_sum1,
    input wire [10:0] xmin0, xmin1,
    input wire [10:0] ymin0, ymin1,
    input wire [10:0] xmax0, xmax1,
    input wire [10:0] ymax0, ymax1,
    input wire en0, en1,
    input wire done0, done1,
    output reg ap_start0, ap_start1,
    output reg ap_rst_n0, ap_rst_n1,
    output reg [31:0] p_sum,
    output reg [31:0] x_sum,
    output reg [31:0] y_sum,
    output reg [10:0] xmin,
    output reg [10:0] ymin,
    output reg [10:0] xmax,
    output reg [10:0] ymax,
    output reg en
);

    // Processing Unit Control
    always @(posedge clk160M or posedge rst0) begin
        if (rst0) begin
            ap_start0 <= 1'b0;
            ap_start1 <= 1'b0;
            ap_rst_n0 <= 1'b0;
            ap_rst_n1 <= 1'b0;
        end else begin
            ap_rst_n0 <= ~(rst0 | done0);
            ap_rst_n1 <= ~(rst0 | done1);
            
            ap_start0 <= ((cnt_r >= 10'd50 && cnt_r <= 10'd227) ||
                          (cnt_r >= 10'd338 && cnt_r <= 10'd515) ||
                          (cnt_r >= 10'd626 && cnt_r <= 10'd803));
            
            ap_start1 <= ((cnt_r >= 10'd194 && cnt_r <= 10'd371) ||
                          (cnt_r >= 10'd482 && cnt_r <= 10'd659));
        end
    end

    // Data Management and Enable Logic
    always @(posedge clk160M or posedge rst0) begin
        if (rst0) begin
            p_sum <= 32'd0;
            x_sum <= 32'd0;
            y_sum <= 32'd0;
            xmin <= 11'd0;
            ymin <= 11'd0;
            xmax <= 11'd0;
            ymax <= 11'd0;
            en <= 1'b0;
        end else begin
            if (en0) begin
                p_sum <= p_sum0;
                x_sum <= x_sum0;
                y_sum <= y_sum0;
                xmin <= xmin0;
                ymin <= ymin0;
                xmax <= xmax0;
                ymax <= ymax0;
                en <= 1'b1;
            end else if (en1) begin
                p_sum <= p_sum1;
                x_sum <= x_sum1;
                y_sum <= y_sum1;
                xmin <= xmin1;
                ymin <= ymin1;
                xmax <= xmax1;
                ymax <= ymax1;
                en <= 1'b1;
            end else begin
                p_sum <= 32'd0;
                x_sum <= 32'd0;
                y_sum <= 32'd0;
                xmin <= 11'd0;
                ymin <= 11'd0;
                xmax <= 11'd0;
                ymax <= 11'd0;
                en <= 1'b0;
            end
        end
    end

endmodule