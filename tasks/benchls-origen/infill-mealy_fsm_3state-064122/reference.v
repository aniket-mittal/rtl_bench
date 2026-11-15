module origen_064122 (
    input wire clk,
    input wire reset,
    input wire a,
    input wire b,
    output reg s,
    output reg t,
    output reg u
);

    // State encoding
    localparam S0 = 2'b00;
    localparam S1 = 2'b01;
    localparam S2 = 2'b10;

    // State register
    reg [1:0] current_state, next_state;

    // Sequential logic
    always @(posedge clk) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    // Combinational logic
    always @(*) begin
        // Default values
        next_state = current_state;
        s = 0;
        t = 0;
        u = 0;

        case (current_state)
            S0: begin
                s = 1;
                if (a && b)
                    next_state = S1;
                else if (a && !b)
                    next_state = S2;
            end
            S1: begin
                t = 1;
                if (!b)
                    next_state = S2;
            end
            S2: begin
                u = 1;
                next_state = S0;
            end
            default: next_state = S0;
        endcase
    end

endmodule