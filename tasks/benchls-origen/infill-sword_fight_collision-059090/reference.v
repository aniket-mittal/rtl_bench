module origen_059090 (
    input wire clk,
    input wire reset,
    input wire [11:0] xpos_playerR, ypos_playerR,
    input wire [11:0] xpos_sword_R, ypos_sword_R,
    input wire [11:0] xpos_playerL, ypos_playerL,
    input wire [11:0] xpos_sword_L, ypos_sword_L,
    output reg dead_L,
    output reg dead_R
);

    localparam PLAYER_WIDTH = 64;
    localparam PLAYER_HEIGHT = 128;
    localparam SWORD_EXTEND = 18;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            dead_L <= 1'b0;
            dead_R <= 1'b0;
        end else begin
            if (ypos_sword_L != ypos_sword_R) begin
                // Check for hit on left player
                if ((xpos_sword_R >= xpos_playerL) &&
                    (xpos_sword_R <= xpos_playerL + PLAYER_WIDTH + 40) &&
                    (ypos_sword_R >= ypos_playerL) &&
                    (ypos_sword_R <= ypos_playerL + PLAYER_HEIGHT) &&
                    !dead_R && !dead_L) begin
                    dead_L <= 1'b1;
                    dead_R <= 1'b0;
                end
                // Check for hit on right player
                else if ((xpos_sword_L + SWORD_EXTEND >= xpos_playerR - 40) &&
                         (xpos_sword_L + SWORD_EXTEND <= xpos_playerR + PLAYER_WIDTH) &&
                         (ypos_sword_L >= ypos_playerR) &&
                         (ypos_sword_L <= ypos_playerR + PLAYER_HEIGHT) &&
                         !dead_L && !dead_R) begin
                    dead_R <= 1'b1;
                    dead_L <= 1'b0;
                end
                else begin
                    dead_L <= 1'b0;
                    dead_R <= 1'b0;
                end
            end else begin
                dead_L <= 1'b0;
                dead_R <= 1'b0;
            end
        end
    end

endmodule