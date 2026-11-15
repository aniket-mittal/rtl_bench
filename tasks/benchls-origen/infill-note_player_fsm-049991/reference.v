module origen_049991 (
    input wire clk,
    input wire reset,
    input wire play,
    input wire note_done,
    output reg new_note
);

    // State encoding
    localparam [1:0] RESET     = 2'b00,
                     NEW_NOTE  = 2'b01,
                     WAIT      = 2'b10,
                     NEXT_NOTE = 2'b11;

    reg [1:0] current_state, next_state;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= RESET;
        else
            current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            RESET: next_state = play ? NEW_NOTE : RESET;
            NEW_NOTE: next_state = WAIT;
            WAIT: begin
                if (!play)
                    next_state = RESET;
                else if (note_done)
                    next_state = NEXT_NOTE;
                else
                    next_state = WAIT;
            end
            NEXT_NOTE: next_state = NEW_NOTE;
            default: next_state = RESET;
        endcase
    end

    // Output logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            new_note <= 1'b0;
        else if (current_state == RESET && play)
            new_note <= 1'b1;
        else if (current_state == NEXT_NOTE)
            new_note <= 1'b1;
        else
            new_note <= 1'b0;
    end

endmodule