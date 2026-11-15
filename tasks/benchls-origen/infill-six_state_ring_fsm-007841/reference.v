module origen_007841(
    input CLK, CLR, RESET,
    output reg S0, S1, S2, S3, S4, S5
);

    reg STATE0, STATE1, STATE2, STATE3, STATE4, STATE5;
    reg next_STATE0, next_STATE1, next_STATE2, next_STATE3, next_STATE4, next_STATE5;
    reg next_S0, next_S1, next_S2, next_S3, next_S4, next_S5;

    // State and output registers
    always @(posedge CLK) begin
        STATE0 <= next_STATE0;
        STATE1 <= next_STATE1;
        STATE2 <= next_STATE2;
        STATE3 <= next_STATE3;
        STATE4 <= next_STATE4;
        STATE5 <= next_STATE5;
        S0 <= next_S0;
        S1 <= next_S1;
        S2 <= next_S2;
        S3 <= next_S3;
        S4 <= next_S4;
        S5 <= next_S5;
    end

    // Next state and output logic
    always @(*) begin
        if (RESET) begin
            next_STATE0 = 1'b1;
            next_STATE1 = 1'b0;
            next_STATE2 = 1'b0;
            next_STATE3 = 1'b0;
            next_STATE4 = 1'b0;
            next_STATE5 = 1'b0;
        end else begin
            next_STATE0 = 1'b0;
            next_STATE1 = STATE0 | STATE5;
            next_STATE2 = STATE1;
            next_STATE3 = STATE2 & ~CLR;
            next_STATE4 = STATE3;
            next_STATE5 = STATE4 | (STATE2 & CLR);
        end

        next_S0 = next_STATE0;
        next_S1 = next_STATE1;
        next_S2 = next_STATE2;
        next_S3 = next_STATE3;
        next_S4 = next_STATE4;
        next_S5 = next_STATE5;
    end

endmodule