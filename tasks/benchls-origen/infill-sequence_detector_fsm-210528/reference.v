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

    always @(*) begin
        case (state_reg)
            5'b00001: begin // State 0
                if (Din) begin
                    next_state = 5'b00010; // State 3
                end else begin
                    next_state = 5'b00100; // State 2
                end
            end
            5'b00010: begin // State 3
                if (Din) begin
                    next_state = 5'b10000; // State 4
                end else begin
                    next_state = 5'b00001; // State 0
                end
            end
            5'b00100: begin // State 2
                next_state = 5'b00010; // State 3
            end
            5'b10000: begin // State 4
                next_state = 5'b00001; // State 0
            end
            5'b00011: begin // State 1
                next_state = 5'b00001; // State 0
            end
            default: begin
                next_state = 5'b00001; // State 0
            end
        endcase
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state_reg <= 5'b00001; // State 0
        end else begin
            state_reg <= next_state;
        end
    end

endmodule