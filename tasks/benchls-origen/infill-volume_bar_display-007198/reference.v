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

    always @* begin
        if (y_counter < 40) begin
            black2 = 1;
            x2 = 0;
            y2 = 0;
            num2 = 0;
            volum2 = 0;
        end
        else if (x_counter < 40) begin
            black2 = 1;
            x2 = 0;
            y2 = 0;
            num2 = 0;
            volum2 = 0;
        end
        else if (x_counter < caraw2 + 40) begin
            black2 = 0;
            x2 = x_counter - 40;
            y2 = y_counter - 40;
            num2 = channel_sel + 1;
            volum2 = 0;
        end
        else if (x_counter < caraw3 + 40) begin
            black2 = 0;
            x2 = x_counter - caraw2 - 40;
            y2 = y_counter - 40;
            num2 = 4;
            volum2 = 0;
        end
        else if (x_counter < caraw4 + 40) begin
            black2 = 0;
            x2 = x_counter - caraw3 - 40;
            y2 = y_counter - 40;
            num2 = vga_data_volto[15:12] + 5;
            volum2 = 0;
        end
        else if (x_counter < caraw5 + 40) begin
            black2 = 0;
            x2 = x_counter - caraw4 - 40;
            y2 = y_counter - 40;
            num2 = vga_data_volto[11:8] + 5;
            volum2 = 0;
        end
        else if (x_counter < caraw6 + 40) begin
            black2 = 0;
            x2 = x_counter - caraw5 - 40;
            y2 = y_counter - 40;
            num2 = vga_data_volto[7:4] + 5;
            volum2 = 0;
        end
        else if (x_counter < caraw7 + 40) begin
            black2 = 0;
            x2 = x_counter - caraw6 - 40;
            y2 = y_counter - 40;
            num2 = vga_data_volto[3:0] + 5;
            volum2 = 0;
        end
        else if (x_counter < caraw8 + 40) begin
            black2 = 0;
            x2 = x_counter - caraw7 - 40;
            y2 = y_counter - 40;
            num2 = 15;
            volum2 = 0;
        end
        else if (x_counter < caraw9 + 40) begin
            black2 = 0;
            x2 = x_counter - caraw8 - 40;
            y2 = y_counter - 40;
            num2 = 16;
            volum2 = 0;
        end
        else if (x_counter < caraw20 + 40) begin
            black2 = 0;
            x2 = x_counter - caraw9 - 40;
            y2 = y_counter - 40;
            num2 = 0;
            volum2 = (x_counter < (caraw9 + 40 + length_volto)) ? 12'hf00 : 12'h000;
        end
        else begin
            black2 = 1;
            x2 = 0;
            y2 = 0;
            num2 = 0;
            volum2 = 0;
        end
    end

endmodule