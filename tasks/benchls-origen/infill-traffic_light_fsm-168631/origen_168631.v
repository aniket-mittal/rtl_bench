module origen_168631(
    input CLOCK_50,
    input reset,
    input x,
    input counterNotZero,
    input counterNotFive,
    output reg load,
    output reg twentyToLoad,
    output reg [2:0] stateD,
    output reg [1:0] displaySignal,
    output reg [1:0] hwy,
    output reg [1:0] cntry
);

    reg [2:0] state, n_state;
    parameter s0 = 3'd0, s1 = 3'd1, s2 = 3'd2, s2a = 3'd3, s2b = 3'd4, s3 = 3'd5, s4 = 3'd6;

    always @(posedge CLOCK_50 or posedge reset) begin
        if (reset)
            state <= s0;
        else
            state <= n_state;
    end

    [MASKED]

endmodule