module origen_066502 (
    input wire xclk,
    output reg hsync,
    output reg vsync,
    output reg de,
    output reg [10:0] cnt_x,
    output reg [10:0] cnt_y
);

    // Horizontal timing parameters
    localparam H_FRONT_PORCH = 24;
    localparam H_SYNC_PULSE = 56;
    localparam H_BACK_PORCH = 124;
    localparam H_ACTIVE = 640;
    localparam H_TOTAL = 844;

    // Vertical timing parameters
    localparam V_FRONT_PORCH = 1;
    localparam V_SYNC_PULSE = 3;
    localparam V_BACK_PORCH = 38;
    localparam V_ACTIVE = 1024;
    localparam V_TOTAL = 1066;

    [MASKED]

endmodule