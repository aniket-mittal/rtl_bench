module origen_038421(
    input clk,
    input bright,
    input button,
    input [9:0] hCount, vCount,
    output reg [11:0] rgb,
    output reg [15:0] score
);

    // Color definitions
    parameter BLACK = 12'h000;
    parameter WHITE = 12'hFFF;
    parameter RED = 12'hF00;
    parameter GREEN = 12'h0F0;

    // Display zones
    wire whiteZone = (vCount >= 200 && vCount < 280 && hCount >= 200 && hCount < 440);
    reg [9:0] greenMiddleSquareY = 0;
    wire greenMiddleSquare = (vCount >= greenMiddleSquareY && vCount < greenMiddleSquareY + 40 && hCount >= 300 && hCount < 340);

    // Movement and scoring variables
    reg [5:0] greenMiddleSquareSpeed = 1;
    reg reset = 0;
    reg [19:0] counter = 0;

    always @(posedge clk) begin
        // Move green square
        if (counter == 0) begin
            greenMiddleSquareY <= greenMiddleSquareY + greenMiddleSquareSpeed;
            if (greenMiddleSquareY >= 440) greenMiddleSquareY <= 0;
        end
        counter <= counter + 1;

        // Scoring logic
        if (button && greenMiddleSquare && whiteZone && !reset) begin
            score <= score + 1;
            reset <= 1;
        end
        else if (!button) begin
            reset <= 0;
        end

        // Color assignment
        if (~bright)
            rgb <= BLACK;
        else if (greenMiddleSquare)
            rgb <= GREEN;
        else if (whiteZone)
            rgb <= WHITE;
        else
            rgb <= RED;
    end

endmodule