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
    [MASKED]

endmodule