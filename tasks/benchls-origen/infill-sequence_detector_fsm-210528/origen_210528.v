module origen_210528(
    input Din,
    input clk,
    input reset,
    output error,
    output [4:0] current_state
);

    reg [4:0] state_reg;
    reg [4:0] next_state;

    assign current_state = state_reg;
    assign error = state_reg[4] & Din;

    [MASKED]

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state_reg <= 5'b00001; // State 0
        end else begin
            state_reg <= next_state;
        end
    end

endmodule