module origen_109092 (
    input wire clk,
    input wire resetN,
    input wire startOfFrame,
    input wire playerDR,
    input wire missileDR,
    input wire aliensDR,
    input wire bombDR,
    input wire shipDR,
    input wire shieldsDR,
    input wire kavDR,
    
    output wire collision_aliens_missile,
    output reg SingleHitPulse,
    output wire collision_bomb_player,
    output wire collision_ship_missile,
    output wire collision_shields_missile,
    output wire collision_shields_bomb,
    output wire gameover
);

    // Collision detection
    assign collision_aliens_missile = aliensDR & missileDR;
    assign collision_bomb_player = bombDR & playerDR;
    assign collision_ship_missile = shipDR & missileDR;
    assign collision_shields_missile = shieldsDR & missileDR;
    assign collision_shields_bomb = shieldsDR & bombDR;

    // Game over condition
    assign gameover = aliensDR & kavDR;

    // Single hit pulse generation
    reg flag;
    wire any_collision;

    assign any_collision = collision_aliens_missile | collision_bomb_player | 
                           collision_ship_missile | collision_shields_missile | 
                           collision_shields_bomb;

    always @(posedge clk or negedge resetN) begin
        if (!resetN) begin
            flag <= 1'b0;
            SingleHitPulse <= 1'b0;
        end else begin
            if (startOfFrame) begin
                flag <= 1'b0;
            end

            if (any_collision && !flag) begin
                SingleHitPulse <= 1'b1;
                flag <= 1'b1;
            end else begin
                SingleHitPulse <= 1'b0;
            end
        end
    end

endmodule