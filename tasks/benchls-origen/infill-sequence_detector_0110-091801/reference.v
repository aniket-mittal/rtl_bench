module origen_091801(
    input x,
    input clk,
    input reset,
    output reg z
);

    // State encoding
    parameter S0 = 2'b00,
              S1 = 2'b01,
              S2 = 2'b10,
              S3 = 2'b11;

    reg [1:0] state, next_state;

    // State transition logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    // Next state and output logic
    always @(*) begin
        next_state = state;
        z = 1'b0;

        case (state)
            S0: begin
                if (x == 1'b0)
                    next_state = S1;
            end
            S1: begin
                if (x == 1'b1)
                    next_state = S2;
            end
            S2: begin
                if (x == 1'b1)
                    next_state = S3;
                else
                    next_state = S1;
            end
            S3: begin
                if (x == 1'b0) begin
                    next_state = S1;
                    z = 1'b1;
                end
                else
                    next_state = S0;
            end
        endcase
    end

endmodule