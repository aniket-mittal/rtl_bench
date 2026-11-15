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

    [MASKED]
endmodule