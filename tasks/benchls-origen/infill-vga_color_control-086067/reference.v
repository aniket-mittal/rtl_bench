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

    always @(posedge clk_20Hz) begin
        count <= (count == 3'd4) ? 3'd0 : count + 1;

        if (btnU && btnD) begin
            my_grid_r <= 4'h8; my_grid_g <= 4'h8; my_grid_b <= 4'h8;
            my_bg_r <= 4'h0; my_bg_g <= 4'h0; my_bg_b <= 4'h0;
            my_wave_r <= 4'h0; my_wave_g <= 4'h0; my_wave_b <= 4'hF;
        end else if (btnU) begin
            my_grid_r <= my_grid_r + 1;
            my_grid_g <= my_grid_g + 2;
            my_grid_b <= my_grid_b + 3;
        end else if (btnD) begin
            my_grid_r <= my_grid_r - 1;
            my_grid_g <= my_grid_g - 2;
            my_grid_b <= my_grid_b - 3;
        end

        if (count == 3'd3) begin
            if (btnL) begin
                my_bg_r <= my_bg_r + 2;
                my_bg_g <= my_bg_g + 3;
                my_bg_b <= my_bg_b + 4;
            end
            if (btnR) begin
                my_bg_r <= my_bg_r - 2;
                my_bg_g <= my_bg_g - 3;
                my_bg_b <= my_bg_b - 4;
            end
            if (btnC) begin
                my_wave_r <= my_wave_r + 2;
                my_wave_g <= my_wave_g + 3;
                my_wave_b <= my_wave_b + 4;
            end
        end
    end

endmodule