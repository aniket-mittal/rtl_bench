module origen_112296 (
    input wire clk,
    input wire reset,
    input wire in,
    output reg [2:0] color
);

    // State definition
    typedef enum logic [2:0] {
        WHITE  = 3'b001,
        BLACK  = 3'b010,
        RED    = 3'b011,
        BLUE   = 3'b100,
        YELLOW = 3'b101,
        GREEN  = 3'b110,
        PURPLE = 3'b111,
        ERASE  = 3'b000
    } state_t;

    state_t current_state, next_state;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= WHITE;
        else
            current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        if (in) begin
            case (current_state)
                WHITE:  next_state = BLACK;
                BLACK:  next_state = RED;
                RED:    next_state = BLUE;
                BLUE:   next_state = YELLOW;
                YELLOW: next_state = GREEN;
                GREEN:  next_state = PURPLE;
                PURPLE: next_state = ERASE;
                ERASE:  next_state = WHITE;
                default: next_state = WHITE;
            endcase
        end else begin
            next_state = current_state;
        end
    end

    // Output logic
    always @(*) begin
        color = current_state;
    end

endmodule