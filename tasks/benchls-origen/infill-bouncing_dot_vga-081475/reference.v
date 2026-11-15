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

    always @(posedge CLK) begin
        if (cptTime == 150000) begin
            cptTime <= 0;
            
            if (dotX >= LCD_WIDTH - dotSize - 1)
                dirX <= 1'b1;
            else if (dotX <= 1)
                dirX <= 1'b0;
                
            if (dotY >= LCD_HEIGHT - dotSize - 1)
                dirY <= 1'b1;
            else if (dotY <= 1)
                dirY <= 1'b0;
                
            dotX <= dirX ? dotX - 1 : dotX + 1;
            dotY <= dirY ? dotY - 1 : dotY + 1;
        end else begin
            cptTime <= cptTime + 1;
        end
        
        if (DEN) begin
            if (X == 0 || X == LCD_WIDTH-1 || Y == 0 || Y == LCD_HEIGHT-1)
                color <= 24'hffffff;
            else if (X >= dotX && X < dotX + dotSize && Y >= dotY && Y < dotY + dotSize)
                color <= 24'hffffff;
            else if (X < LCD_WIDTH/3)
                color <= 24'hff0000;
            else if (X < 2*LCD_WIDTH/3)
                color <= 24'h00ff00;
            else
                color <= 24'h0000ff;
        end else begin
            color <= 24'h000000;
        end
        
        R <= color[23:16];
        G <= color[15:8];
        B <= color[7:0];
    end

endmodule