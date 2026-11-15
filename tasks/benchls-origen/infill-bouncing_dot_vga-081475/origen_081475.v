module origen_081475 #(
    parameter LCD_HEIGHT = 280,
    parameter LCD_WIDTH = 480
)(
    input wire CLK,
    output reg [7:0] R, G, B,
    input wire DEN,
    input wire [10:0] X, Y
);

    localparam dotSize = 5;
    
    reg [23:0] color;
    reg [31:0] cptTime;
    reg [8:0] dotX, dotY;
    reg dirX, dirY;

    [MASKED]

endmodule