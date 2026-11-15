module origen_006524(
    input a, b,
    input [2:0] current_state,
    output reg [2:0] next_state
);

    // State definitions
    localparam [2:0] idle = 3'b000,
                     enter1 = 3'b001,
                     enter2 = 3'b010,
                     enter3 = 3'b011,
                     exit1 = 3'b100,
                     exit2 = 3'b101,
                     exit3 = 3'b110;

    // Input combinations
    localparam [1:0] zero = 2'b00,
                     one = 2'b01,
                     two = 2'b10,
                     three = 2'b11;

    always @(*) begin
        case({a, b, current_state})
            // Idle state transitions
            {one, idle}: next_state = exit1;
            {two, idle}: next_state = enter1;

            // Enter sequence
            {one, enter1}: next_state = idle;
            {two, enter1}: next_state = enter2;
            {three, enter1}: next_state = idle;

            {one, enter2}: next_state = enter1;
            {two, enter2}: next_state = enter3;
            {three, enter2}: next_state = idle;

            {one, enter3}: next_state = enter2;
            {two, enter3}: next_state = idle;
            {three, enter3}: next_state = idle;

            // Exit sequence
            {one, exit1}: next_state = exit2;
            {two, exit1}: next_state = idle;
            {three, exit1}: next_state = idle;

            {one, exit2}: next_state = exit3;
            {two, exit2}: next_state = exit1;
            {three, exit2}: next_state = idle;

            {one, exit3}: next_state = idle;
            {two, exit3}: next_state = exit2;
            {three, exit3}: next_state = idle;

            // Default: stay in current state
            default: next_state = current_state;
        endcase
    end

endmodule