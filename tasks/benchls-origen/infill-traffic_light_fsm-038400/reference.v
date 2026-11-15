module origen_038400(
    input wire clock,
    input wire reset,
    input wire TA,
    input wire TB,
    output reg [1:0] LA,
    output reg [1:0] LB,
    output wire [1:0] state_out
);

    // State and light definitions
    parameter [1:0] S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
    parameter [1:0] GREEN = 2'b00, YELLOW = 2'b01, RED = 2'b10;

    reg [1:0] current_state, next_state;

    // Combinational logic block
    always @(*) begin
        // Default values
        LA = RED;
        LB = RED;
        next_state = current_state;

        case (current_state)
            S0: begin
                LA = GREEN;
                if (!TA) next_state = S1;
            end
            S1: begin
                LA = YELLOW;
                next_state = S2;
            end
            S2: begin
                LB = GREEN;
                if (!TB) next_state = S3;
            end
            S3: begin
                LB = YELLOW;
                if (!TB) next_state = S0;
            end
        endcase
    end

    // Sequential logic block
    always @(posedge clock or posedge reset) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    // Output current state
    assign state_out = current_state;

endmodule