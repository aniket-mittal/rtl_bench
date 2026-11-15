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

    always @(posedge clock) begin
        if (video_on) begin
            if (icon == 2'b00 && icon2 == 2'b00 && icon4 == 2'b00 && icon5 == 2'b00 && icon6 == 2'b00 && icon7 == 2'b00) begin
                case (world_pixel)
                    2'b00: {red, green, blue} = Icon_colour4;
                    2'b01: {red, green, blue} = Icon_colour1;
                    2'b10: {red, green, blue} = Icon_colour2;
                    2'b11: {red, green, blue} = Icon_colour3;
                endcase
            end else begin
                case ({icon, icon2, icon4, icon5, icon6, icon7})
                    12'b010101010101: {red, green, blue} = blackline;
                    12'b101010101010: {red, green, blue} = Obstruction;
                    12'b111111111111: {red, green, blue} = sprinkler;
                    default: {red, green, blue} = background;
                endcase
            end
        end else begin
            {red, green, blue} = 12'b000000000000;
        end
    end

endmodule