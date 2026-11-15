module origen_161540 #(
    parameter CAM_DATA_WIDTH = 12,
    parameter CAM_LINE = 480,
    parameter CAM_PIXEL = 640
)(
    input reset,
    input ov7670_pclk,
    input ov7670_vs,
    input ov7670_hs,
    input [7:0] ov7670_data,

    output reg we,
    output reg [CAM_DATA_WIDTH-1:0] o_data_wr,
    output reg [15:0] o_line,
    output reg [15:0] o_pixel
);

reg [7:0] byte1, byte2, byte3, byte4;
reg [15:0] line_count, pixel_count;

[MASKED]

endmodule