module origen_056070(
    input wire pressed,
    input wire [3:0] key_value,
    output reg start,
    output reg clear,
    output reg confirm,
    output reg press_num,
    output wire [3:0] value
);

    // Direct connection of key_value to value output
    assign value = key_value;

    // State definitions
    localparam IDLE = 1'b0;
    localparam PRESSED = 1'b1;

    // State register
    reg state;

    // State machine and output logic
    always @(*) begin
        // Default output values
        start = 1'b0;
        clear = 1'b0;
        confirm = 1'b0;
        press_num = 1'b0;

        case (state)
            IDLE: begin
                // No actions in idle state
            end

            PRESSED: begin
                case (key_value)
                    4'b1010: start = 1'b1;
                    4'b1011: clear = 1'b1;
                    4'b1100: confirm = 1'b1;
                    default: begin
                        if (key_value < 4'b1010) begin
                            press_num = 1'b1;
                        end
                    end
                endcase
            end
        endcase
    end

    // State transition logic
    always @(pressed) begin
        if (pressed) begin
            state <= PRESSED;
        end else begin
            state <= IDLE;
        end
    end

endmodule