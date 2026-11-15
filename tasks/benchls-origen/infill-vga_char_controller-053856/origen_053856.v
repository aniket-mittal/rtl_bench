module origen_053856 (
    input wire vga_clk,
    input wire reset,
    input wire [15:0] vramstart,
    input wire [15:0] cramstart,
    input wire [7:0] vdata,
    output reg [15:0] vaddr,
    output reg [3:0] color,
    output reg hsync,
    output reg vsync
);

    // Timing parameters
    parameter H_VISIBLE = 512;
    parameter H_SYNC_PULSE = 96;
    parameter H_BACK_PORCH = 48;
    parameter H_FRONT_PORCH = 144;
    parameter H_TOTAL = 800;

    parameter V_VISIBLE = 480;
    parameter V_SYNC_PULSE = 2;
    parameter V_BACK_PORCH = 31;
    parameter V_FRONT_PORCH = 11;
    parameter V_TOTAL = 525;

    // Counters
    reg [9:0] c_hor;
    reg [9:0] c_ver;
    reg [3:0] vstate;
    reg [7:0] char_code;
    reg [7:0] char_color;
    reg [7:0] char_bitmap;

    // Character rendering
    parameter CHAR_WIDTH = 16;
    parameter CHAR_HEIGHT = 8;

    [MASKED]

endmodule