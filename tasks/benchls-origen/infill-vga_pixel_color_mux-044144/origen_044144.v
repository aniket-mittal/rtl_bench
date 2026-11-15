module origen_044144(
    input clock,
    input reset,
    input video_on,
    input [1:0] world_pixel,
    input [1:0] icon,
    input [1:0] icon2,
    input [1:0] icon4,
    input [1:0] icon5,
    input [1:0] icon6,
    input [1:0] icon7,
    output reg [3:0] red,
    output reg [3:0] green,
    output reg [3:0] blue
);

    // Color parameters
    parameter background = 12'b111111111111;
    parameter blackline = 12'b000000000000;
    parameter Obstruction = 12'b111100000000;
    parameter Reserved = 12'b111100001111;
    parameter sprinkler = 12'b000000001111;
    parameter Icon_colour1 = 12'b000000000000;
    parameter Icon_colour2 = 12'b111111110000;
    parameter Icon_colour3 = 12'b000011110000;
    parameter Icon_colour4 = 12'b111111111111;

    [MASKED]

endmodule