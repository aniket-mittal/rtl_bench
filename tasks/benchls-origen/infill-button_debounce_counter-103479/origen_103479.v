module origen_103479 (
    input wire trigger,
    input wire clk,
    input wire rst,
    input wire BTN,
    input wire BTN_pos,
    input wire BTN_neg,
    output reg trigger_out,
    output reg [7:0] output_counter
);

    // Parameters
    parameter OUTPUT_COUNTER_MAX = 60;
    parameter COUNTER_TRIGGER_MAX = 100_000_000;
    parameter COUNTER_BUTTON_PRESS_MAX = 50_000_000;
    parameter COUNTER_HOLD_MAX = 100_000_000;

    // State definitions
    localparam IDLE = 2'b00;
    localparam BUTTON_PRESSED = 2'b01;
    localparam COUNTER_RESET = 2'b10;
    localparam BUTTON_HOLD = 2'b11;

    // Internal registers
    reg [1:0] state, next_state;
    reg [31:0] counter_trigger;
    reg [31:0] button_counter;

    // State machine
    [MASKED]

    // Next state logic
    always @(*) begin
        case (state)
            IDLE:
                next_state = BTN_pos ? BUTTON_PRESSED : IDLE;
            BUTTON_PRESSED:
                if (BTN_neg)
                    next_state = IDLE;
                else if (button_counter == COUNTER_BUTTON_PRESS_MAX - 1)
                    next_state = COUNTER_RESET;
                else
                    next_state = BUTTON_PRESSED;
            COUNTER_RESET:
                next_state = BUTTON_HOLD;
            BUTTON_HOLD:
                if (BTN_neg)
                    next_state = IDLE;
                else if (button_counter == COUNTER_HOLD_MAX - 1)
                    next_state = COUNTER_RESET;
                else
                    next_state = BUTTON_HOLD;
            default:
                next_state = IDLE;
        endcase
    end

endmodule