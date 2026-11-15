module origen_001782(
    input clk,
    input clk_25mHz,
    input reset,
    input border0,
    input border2,
    input [9:0] xCount,
    input [9:0] yCount,
    input [7:0] data_in,
    output reg draw_bar
);

    parameter BAR_WIDTH = 6;
    parameter BAR_HEIGHT = 71;
    parameter VELOCITY = 4;

    reg [9:0] currentstate, nextstate;
    reg [7:0] data_out;
    wire redraw_animation;

    // State update on 25MHz clock
    always @(posedge clk_25mHz or posedge reset) begin
        if (reset)
            currentstate <= 10'd300; // Initial position
        else
            currentstate <= nextstate;
    end

    // Data sampling on main clock
    always @(posedge clk) begin
        data_out <= data_in;
    end

    // Redraw animation signal (assuming it's derived from clk_25mHz)
    assign redraw_animation = (xCount == 0 && yCount == 0);

    // Next state logic
    always @(*) begin
        nextstate = currentstate;
        if (redraw_animation) begin
            if (data_out == 8'b00011101 && currentstate > VELOCITY)
                nextstate = currentstate - VELOCITY;
            else if (data_out == 8'b00011011 && currentstate < 10'd480 - BAR_HEIGHT - VELOCITY)
                nextstate = currentstate + VELOCITY;
        end
    end

    // Drawing logic
    always @(*) begin
        draw_bar = 0;
        if (!border0 && !border2 &&
            xCount >= 10'd317 && xCount < 10'd317 + BAR_WIDTH &&
            yCount >= currentstate && yCount < currentstate + BAR_HEIGHT)
            draw_bar = 1;
    end

endmodule