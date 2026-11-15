module origen_007198(
    input [7:0] length_volto,
    input [2:0] channel_sel,
    input [15:0] vga_data_volto,
    input [10:0] x_counter,
    input [10:0] y_counter,
    output reg [6:0] x2,
    output reg [5:0] y2,
    output reg [4:0] num2,
    output reg black2,
    output reg [11:0] volum2
);

    parameter caraw1 = 8;
    parameter caraw2 = 16;
    parameter caraw3 = 24;
    parameter caraw4 = 32;
    parameter caraw5 = 40;
    parameter caraw6 = 48;
    parameter caraw7 = 56;
    parameter caraw8 = 64;
    parameter caraw9 = 72;
    parameter caraw10 = 80;
    parameter caraw11 = 88;
    parameter caraw12 = 96;
    parameter caraw13 = 104;
    parameter caraw14 = 112;
    parameter caraw15 = 120;
    parameter caraw16 = 128;
    parameter caraw17 = 136;
    parameter caraw18 = 144;
    parameter caraw19 = 152;
    parameter caraw20 = 160;

    [MASKED]

endmodule