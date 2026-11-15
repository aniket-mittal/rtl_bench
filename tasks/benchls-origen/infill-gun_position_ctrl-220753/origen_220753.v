module origen_220753(
    input clk,
    input reset,
    input left,
    input right,
    input [10:0] hPos,
    input [10:0] vPos,
    output [10:0] gunPosition,
    output [7:0] color
);

parameter SCREEN_WIDTH = 640;
parameter SCREEN_HEIGHT = 480;
parameter SHIP_WIDTH = 40;
parameter SHIP_HEIGHT = 20;
parameter STEP = 5;
parameter SPACESHIP = 8'hFF;
parameter ALIENS0 = 8'hAA;
parameter LASER = 8'hCC;
parameter RECT_PERCENT = 75;
parameter V_OFFSET = 20;
parameter H_OFFSET = 0;

reg [10:0] positionreg;

[MASKED]

assign gunPosition = positionreg;

reg [7:0] color_reg;
always @(*) begin
    if (hPos >= positionreg - SHIP_WIDTH/2 - H_OFFSET && hPos <= positionreg + SHIP_WIDTH/2 - H_OFFSET
        && vPos >= SCREEN_HEIGHT - SHIP_HEIGHT - V_OFFSET && vPos <= SCREEN_HEIGHT - V_OFFSET) begin
        if (hPos <= positionreg - SHIP_WIDTH/2 + SHIP_WIDTH * RECT_PERCENT/100 - H_OFFSET)
            color_reg = SPACESHIP;
        else
            color_reg = ALIENS0;
    end
    else begin
        color_reg = 8'h00;
    end
end

assign color = color_reg;

endmodule