module origen_069357 #(
    parameter H_RES = 800,
    parameter H_FP = 40,
    parameter H_SYNC = 128,
    parameter H_BP = 88,
    parameter V_RES = 480,
    parameter V_FP = 1,
    parameter V_SYNC = 3,
    parameter V_BP = 21,
    parameter H_POL = 1'b0,
    parameter V_POL = 1'b0
) (
    input wire pixelClock,
    input wire [1:0] sw,
    input wire [3:0] btn,
    input wire [15:0] ppuAddress,
    input wire [23:0] vd,
    output reg [7:0] red,
    output reg [7:0] green,
    output reg [7:0] blue,
    output reg hSync,
    output reg vSync,
    output reg blank,
    output reg [15:0] va
);

    localparam H_TOTAL = H_RES + H_FP + H_SYNC + H_BP;
    localparam V_TOTAL = V_RES + V_FP + V_SYNC + V_BP;

    reg [11:0] x;
    reg [11:0] line;
    reg [7:0] xOffset, yOffset;
    reg [3:0] btnLast, btnDebounced;
    reg [7:0] debounceCounter;

    wire displayEnable;
    wire [7:0] xValid, yValid;

    assign displayEnable = (x < H_RES) && (line < V_RES);
    assign xValid = (x - xOffset) & 8'hFF;
    assign yValid = (line - yOffset) & 8'hFF;

    [MASKED]

endmodule