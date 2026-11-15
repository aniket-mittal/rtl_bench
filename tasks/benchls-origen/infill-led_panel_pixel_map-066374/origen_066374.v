module origen_066374(
    input [3:0] currentFrame,
    input [4:0] address0,
    output reg [9:0] startPixel0,
    output reg [9:0] startPixel1,
    output reg [9:0] startPixel2,
    output reg [9:0] rowPixelPanel0,
    output reg [9:0] rowPixelPanel1,
    output reg [9:0] rowPixelPanel2,
    output reg [9:0] rowPixelPanel3,
    output reg [9:0] rowPixelPanel4,
    output reg [9:0] rowPixelPanel5,
    output reg [9:0] rowPixelPanel7
);

    reg [199:0] bottom_left_start;
    reg [199:0] bottom_right_start;
    reg [199:0] top_left_start;
    reg [199:0] top_left_start2;
    reg [199:0] top_right_start;
    reg [109:0] pixels0;
    reg [109:0] pixels1;
    reg [109:0] pixels2;

    [MASKED]

endmodule