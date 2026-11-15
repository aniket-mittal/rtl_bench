module origen_154623(
    input wire send,
    input wire rts,
    input wire all,
    input wire next,
    input wire clock,
    input wire reset,
    output reg busy,
    output reg load,
    output reg set,
    output reg shift,
    output reg increment
);

    // Define the state parameters
    parameter IDLE = 2'b00;
    parameter START = 2'b01;
    parameter WAIT = 2'b10;
    parameter SHIFT = 2'b11;

    // Register to hold the current state
    reg [1:0] current_state, next_state;

    // State transition logic
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            current_state <= IDLE;
        end else begin
            current_state <= next_state;
        end
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            IDLE: begin
                if (rts & send) begin
                    next_state = START;
                end else begin
                    next_state = IDLE;
                end
            end
            START: begin
                next_state = WAIT;
            end
            WAIT: begin
                if (all) begin
                    next_state = IDLE;
                end else if (next) begin
                    next_state = SHIFT;
                end else begin
                    next_state = WAIT;
                end
            end
            SHIFT: begin
                next_state = WAIT;
            end
            default: begin
                next_state = IDLE;
            end
        endcase
    end

    // Output logic
    always @(*) begin
        // Default values for the outputs
        busy = 1'b0;
        load = 1'b0;
        set = 1'b0;
        shift = 1'b0;
        increment = 1'b0;

        case (current_state)
            IDLE: begin
                busy = 1'b0;
            end
            START: begin
                busy = 1'b1;
                load = 1'b1;
                set = 1'b1;
            end
            WAIT: begin
                busy = 1'b1;
            end
            SHIFT: begin
                busy = 1'b1;
                shift = 1'b1;
                increment = 1'b1;
            end
            default: begin
                busy = 1'b0;
            end
        endcase
    end

endmodule