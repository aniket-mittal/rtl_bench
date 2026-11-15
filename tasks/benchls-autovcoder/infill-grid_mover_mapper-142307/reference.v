module autovcoder_142307 (
    input clk,
    input rst,
    input start_map,
    input move_cmd,
    output reg [3:0] position, // 4-bit position (2-bit X, 2-bit Y)
    output reg [1:0] state // 2-bit state: 0=IDLE, 1=MOVING, 2=MAPPING
);
    // State encoding
    parameter IDLE = 2'b00, MOVING = 2'b01, MAPPING = 2'b10;
    
    // Position tracking (2-bit x, 2-bit y)
    reg [1:0] x, y;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            position <= 4'b0000; // Reset position
            x <= 2'b00;
            y <= 2'b00;
        end else begin
            case (state)
                IDLE: begin
                    if (start_map) begin
                        state <= MAPPING;
                    end else if (move_cmd) begin
                        state <= MOVING;
                    end
                end
                MOVING: begin
                    // Simple move logic: increment position
                    if (x < 2'b11) begin
                        x <= x + 1;
                    end else if (y < 2'b11) begin
                        x <= 2'b00;
                        y <= y + 1;
                    end
                    position <= {x, y};
                    state <= IDLE; // Go back to IDLE after moving
                end
                MAPPING: begin
                    // In mapping state, just output current position
                    position <= {x, y};
                    if (!start_map) begin
                        state <= IDLE; // Return to IDLE if mapping stopped
                    end
                end
            endcase
        end
    end
endmodule