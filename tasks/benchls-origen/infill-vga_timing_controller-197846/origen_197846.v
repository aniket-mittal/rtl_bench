module origen_197846 #(
    parameter H_RESOLUTION = 640,
    parameter V_RESOLUTION = 480,
    parameter H_SYNC_START = 656,
    parameter H_SYNC_END = 752,
    parameter V_SYNC_START = 490,
    parameter V_SYNC_END = 492,
    parameter H_MAX_COUNT = 800,
    parameter V_MAX_COUNT = 525
) (
    input wire pixelClock,
    input wire [1:0] sw,
    input wire [3:0] btn,
    input wire [15:0] ppu_addr,
    input wire [23:0] vd,
    output reg [7:0] red, green, blue,
    output reg hSync, vSync,
    output reg blank,
    output wire [15:0] va
);

    reg [9:0] x, line;
    reg [15:0] px, py;
    reg [15:0] va_reg;

    [MASKED]

    assign va = va_reg;

endmodule