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

    always @(*) begin
        case (state)
            s0: begin
                n_state = (x) ? s1 : s0;
                load = 1'b0;
                twentyToLoad = 1'b0;
                displaySignal = 2'd0;
                hwy = 2'b01;
                cntry = 2'b01;
            end
            s1: begin
                n_state = s2;
                load = 1'b1;
                twentyToLoad = 1'b1;
                displaySignal = 2'd1;
                hwy = 2'b10;
                cntry = 2'b10;
            end
            s2: begin
                n_state = (counterNotZero) ? s2 : s2a;
                load = 1'b0;
                twentyToLoad = 1'b0;
                displaySignal = 2'd2;
                hwy = 2'b11;
                cntry = 2'b00;
            end
            s2a: begin
                n_state = s2b;
                load = 1'b0;
                twentyToLoad = 1'b0;
                displaySignal = 2'd3;
                hwy = 2'b00;
                cntry = 2'b11;
            end
            s2b: begin
                n_state = (counterNotFive) ? s2b : s3;
                load = 1'b0;
                twentyToLoad = 1'b0;
                displaySignal = 2'd2;
                hwy = 2'b11;
                cntry = 2'b00;
            end
            s3: begin
                n_state = (x) ? s4 : s3;
                load = 1'b0;
                twentyToLoad = 1'b0;
                displaySignal = 2'd1;
                hwy = 2'b10;
                cntry = 2'b10;
            end
            s4: begin
                n_state = s0;
                load = 1'b0;
                twentyToLoad = 1'b0;
                displaySignal = 2'd0;
                hwy = 2'b01;
                cntry = 2'b01;
            end
            default: begin
                n_state = s0;
                load = 1'b0;
                twentyToLoad = 1'b0;
                displaySignal = 2'd0;
                hwy = 2'b01;
                cntry = 2'b01;
            end
        endcase
        stateD = state;
    end

endmodule