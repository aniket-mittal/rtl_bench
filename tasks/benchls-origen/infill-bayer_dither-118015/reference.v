module origen_118015 (
    input wire clk108MHz,
    input wire performDither,
    input wire [10:0] vidClmn_DitherIn,
    input wire [10:0] vidRow__DitherIn,
    input wire [23:0] pixlRGB_DitherIn,
    output reg [10:0] vidClmn_DitherOut,
    output reg [10:0] vidRow__DitherOut,
    output reg [11:0] pixlRGB_DitherOut
);

    // Dither matrix (4x4 Bayer pattern)
    reg [3:0] th [0:3][0:3];
    initial begin
        th[0][0] = 0;  th[0][1] = 8;  th[0][2] = 2;  th[0][3] = 10;
        th[1][0] = 12; th[1][1] = 4;  th[1][2] = 14; th[1][3] = 6;
        th[2][0] = 3;  th[2][1] = 11; th[2][2] = 1;  th[2][3] = 9;
        th[3][0] = 15; th[3][1] = 7;  th[3][2] = 13; th[3][3] = 5;
    end

    // Internal signals
    wire [7:0] red_in, green_in, blue_in;
    wire [1:0] dither_x, dither_y;
    wire [3:0] threshold;
    reg [3:0] red_out, green_out, blue_out;

    // Separate color channels
    assign red_in = pixlRGB_DitherIn[23:16];
    assign green_in = pixlRGB_DitherIn[15:8];
    assign blue_in = pixlRGB_DitherIn[7:0];

    // Determine dither matrix position
    assign dither_x = vidClmn_DitherIn[1:0];
    assign dither_y = vidRow__DitherIn[1:0];
    assign threshold = th[dither_y][dither_x];

    // Dithering process
    always @(posedge clk108MHz) begin
        // Pass through coordinates
        vidClmn_DitherOut <= vidClmn_DitherIn;
        vidRow__DitherOut <= vidRow__DitherIn;

        // Dither each color channel
        if (performDither) begin
            red_out <= (red_in[3:0] > threshold && red_in[7:4] < 4'b1111) ? red_in[7:4] + 1'b1 : red_in[7:4];
            green_out <= (green_in[3:0] > threshold && green_in[7:4] < 4'b1111) ? green_in[7:4] + 1'b1 : green_in[7:4];
            blue_out <= (blue_in[3:0] > threshold && blue_in[7:4] < 4'b1111) ? blue_in[7:4] + 1'b1 : blue_in[7:4];
        end else begin
            red_out <= red_in[7:4];
            green_out <= green_in[7:4];
            blue_out <= blue_in[7:4];
        end

        // Combine dithered channels
        pixlRGB_DitherOut <= {red_out, green_out, blue_out};
    end

endmodule