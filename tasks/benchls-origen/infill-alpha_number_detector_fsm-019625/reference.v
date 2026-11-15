module origen_019625 (
    input [7:0] char,
    input clk,
    output reg out
);

    // State encoding
    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;

    reg [1:0] state, next_state;
    reg isalphabet, isnumber;

    // Determine if input is alphabet or number
    always @(*) begin
        isalphabet = ((char >= 8'h41 && char <= 8'h5A) || (char >= 8'h61 && char <= 8'h7A)) ? 1'b1 : 1'b0;
        isnumber = (char >= 8'h30 && char <= 8'h39) ? 1'b1 : 1'b0;
    end

    // State transition logic
    always @(*) begin
        case(state)
            S0: next_state = isalphabet ? S1 : S0;
            S1: begin
                if (isalphabet)
                    next_state = S1;
                else if (isnumber)
                    next_state = S2;
                else
                    next_state = S0;
            end
            S2: begin
                if (isalphabet)
                    next_state = S1;
                else if (isnumber)
                    next_state = S2;
                else
                    next_state = S0;
            end
            default: next_state = S0;
        endcase
    end

    // State register
    always @(posedge clk) begin
        state <= next_state;
    end

    // Output logic
    always @(*) begin
        out = (state == S2) ? 1'b1 : 1'b0;
    end

endmodule