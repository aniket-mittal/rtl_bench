module origen_119271(
    input clk,
    output reg vga_h_sync,
    output reg vga_v_sync,
    output reg inDisplayArea,
    output reg [9:0] HCounterX,
    output reg [9:0] HCounterY
);

    // Horizontal timing constants
    localparam H_DISPLAY = 640;
    localparam H_FRONT_PORCH = 16;
    localparam H_SYNC = 96;
    localparam H_BACK_PORCH = 48;
    localparam H_TOTAL = 800;

    // Vertical timing constants
    localparam V_DISPLAY = 480;
    localparam V_FRONT_PORCH = 10;
    localparam V_SYNC = 2;
    localparam V_BACK_PORCH = 33;
    localparam V_TOTAL = 525;

    [MASKED]

endmodule