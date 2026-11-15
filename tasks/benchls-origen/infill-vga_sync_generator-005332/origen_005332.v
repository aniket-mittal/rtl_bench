module origen_005332 (
    input wire i_clk,
    input wire i_rst,
    output reg o_hs,
    output reg o_vs,
    output wire dp_en,
    output reg [10:0] line_count,
    output reg [10:0] pixel_count,
    output reg [10:0] px,
    output reg [10:0] py
);

    // Timing parameters
    localparam H_ACTIVE = 1024;
    localparam H_FRONT_PORCH = 24;
    localparam H_SYNC_PULSE = 136;
    localparam H_BACK_PORCH = 160;
    localparam H_TOTAL = H_ACTIVE + H_FRONT_PORCH + H_SYNC_PULSE + H_BACK_PORCH;

    localparam V_ACTIVE = 768;
    localparam V_FRONT_PORCH = 3;
    localparam V_SYNC_PULSE = 6;
    localparam V_BACK_PORCH = 29;
    localparam V_TOTAL = V_ACTIVE + V_FRONT_PORCH + V_SYNC_PULSE + V_BACK_PORCH;

    reg h_en, v_en;
    reg [1:0] px_div;
    reg [1:0] py_div;

    [MASKED]

    assign dp_en = h_en & v_en;

endmodule