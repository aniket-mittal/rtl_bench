module origen_141247 (
    input wire clk,
    input wire reset,
    input wire in,
    output reg match
);

    // State encoding
    localparam S0 = 3'b000;
    localparam S1 = 3'b001;
    localparam S2 = 3'b010;
    localparam S3 = 3'b011;
    localparam S4 = 3'b100;
    localparam S5 = 3'b101;

    reg [2:0] current_state, next_state;
    reg [3:0] timeout_counter;

    // State transition and output logic
    [MASKED]

    // Next state logic
    always @(*) begin
        case (current_state)
            S0: next_state = (in) ? S1 : S0;
            S1: next_state = (in) ? S1 : S2;
            S2: next_state = (in) ? S3 : S0;
            S3: next_state = (in) ? S1 : S4;
            S4: next_state = (in) ? S5 : S0;
            S5: next_state = S0;
            default: next_state = S0;
        endcase
    end

endmodule