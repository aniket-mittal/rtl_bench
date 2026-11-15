module origen_086067(
    input clk_20Hz,
    input btnU, btnD, btnC, btnL, btnR,
    output reg [3:0] my_grid_r, my_grid_g, my_grid_b,
    output reg [3:0] my_bg_r, my_bg_g, my_bg_b,
    output reg [3:0] my_wave_r, my_wave_g, my_wave_b
);

    reg [2:0] count;

    initial begin
        count = 3'b000;
        my_grid_r = 4'h8; my_grid_g = 4'h8; my_grid_b = 4'h8;
        my_bg_r = 4'h0; my_bg_g = 4'h0; my_bg_b = 4'h0;
        my_wave_r = 4'h0; my_wave_g = 4'h0; my_wave_b = 4'hF;
    end

    [MASKED]

endmodule