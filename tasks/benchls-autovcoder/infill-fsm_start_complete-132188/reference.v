module autovcoder_132188 (
    input wire clk,
    input wire reset,
    input wire start,
    input wire complete,
    output reg [1:0] state // 00: IDLE, 01: TRAINING, 10: CONFIGURED
);
    // State encoding
    localparam IDLE = 2'b00;
    localparam TRAINING = 2'b01;
    localparam CONFIGURED = 2'b10;

    // State register
    reg [1:0] current_state, next_state;

    // State transition logic
    always @(*) begin
        case (current_state)
            IDLE: begin
                if (start) 
                    next_state = TRAINING;
                else 
                    next_state = IDLE;
            end
            TRAINING: begin
                if (complete)
                    next_state = CONFIGURED;
                else
                    next_state = TRAINING;
            end
            CONFIGURED: begin
                next_state = CONFIGURED; // Remain in CONFIGURED
            end
            default: next_state = IDLE;
        endcase
    end

    // State update logic
    always @(posedge clk or posedge reset) begin
        if (reset) 
            current_state <= IDLE;
        else 
            current_state <= next_state;
    end

    // Output logic
    always @(posedge clk) begin
        state <= current_state;
    end
endmodule