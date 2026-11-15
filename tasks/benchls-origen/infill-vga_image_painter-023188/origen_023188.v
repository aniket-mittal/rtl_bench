module origen_023188(
    input wire clock,
    input wire resetn,
    input wire [19199:0] image,
    input wire [2:0] color_background,
    input wire [2:0] color_foreground,
    output wire [7:0] x,
    output wire [6:0] y,
    output wire [2:0] color
);

    painter paint_inst (
        .clock(clock),
        .resetn(resetn),
        .image(image),
        .color_background(color_background),
        .color_foreground(color_foreground),
        .x(x),
        .y(y),
        .color(color)
    );

endmodule

module painter(
    input wire clock,
    input wire resetn,
    input wire [19199:0] image,
    input wire [2:0] color_background,
    input wire [2:0] color_foreground,
    output reg [7:0] x,
    output reg [6:0] y,
    output reg [2:0] color
);

    reg [14:0] count;

    [MASKED]

endmodule