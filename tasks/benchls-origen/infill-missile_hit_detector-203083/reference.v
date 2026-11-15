module origen_203083 (
    input pclk,
    input rst,
    input [9:0] xpos_missile_1,
    input [9:0] ypos_missile_1,
    input [9:0] xpos_missile_2,
    input [9:0] ypos_missile_2,
    input level_change,
    input [9:0] xpos_enemy,
    input [9:0] ypos_enemy,
    output reg on_out
);

parameter HALF_WIDTH_ENEMY = 10'd20;
parameter HEIGHT_ENEMY = 10'd40;

reg on;
reg on_nxt;

always @(posedge pclk) begin
    if (rst) begin
        on <= 1'b1;
        on_out <= 1'b1;
    end
    else begin
        on <= on_nxt;
        on_out <= on;
    end
end

always @(*) begin
    if (on) begin
        if ((xpos_missile_1 >= xpos_enemy - HALF_WIDTH_ENEMY) && (xpos_missile_1 <= xpos_enemy + HALF_WIDTH_ENEMY) && (ypos_missile_1 >= ypos_enemy - HEIGHT_ENEMY) && (ypos_missile_1 <= ypos_enemy + HEIGHT_ENEMY)) begin
            on_nxt = 1'b0;
        end
        else if ((xpos_missile_2 >= xpos_enemy - HALF_WIDTH_ENEMY) && (xpos_missile_2 <= xpos_enemy + HALF_WIDTH_ENEMY) && (ypos_missile_2 >= ypos_enemy - HEIGHT_ENEMY) && (ypos_missile_2 <= ypos_enemy + HEIGHT_ENEMY)) begin
            on_nxt = 1'b0;
        end
        else begin
            on_nxt = 1'b1;
        end
    end
    else begin
        if (rst || level_change) begin
            on_nxt = 1'b1;
        end
        else begin
            on_nxt = 1'b0;
        end
    end
end

endmodule