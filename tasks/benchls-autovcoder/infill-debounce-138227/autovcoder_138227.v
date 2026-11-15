module autovcoder_138227(
    input clk,
    input rst,
    input noisy_signal,
    output reg clean_signal
);
    parameter IDLE = 1'b0, ACTIVE = 1'b1;
    reg state, next_state;
    reg [3:0] stable_count; // Counter for stability detection

    [MASKED]

    always @(*) begin
        case (state)
            IDLE: begin
                if (stable_count >= 4) begin // Stable for 4 cycles
                    next_state = ACTIVE;
                    clean_signal = noisy_signal;
                end else begin
                    next_state = IDLE;
                end
            end
            ACTIVE: begin
                if (stable_count >= 4) begin
                    clean_signal = noisy_signal;
                end
                next_state = ACTIVE;
            end
            default: next_state = IDLE;
        endcase
    end
endmodule