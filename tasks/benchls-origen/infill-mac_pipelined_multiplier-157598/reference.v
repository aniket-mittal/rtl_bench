module origen_157598(
    input clock,
    input reset,
    input signed [17:0] A,
    input signed [35:0] B,
    output signed [52:0] MAC_OUT
);

    reg signed [17:0] rA;
    reg signed [35:0] rB;
    reg signed [16:0] rBl;
    reg signed [17:0] rBh;
    reg rBl17;

    wire signed [34:0] mul_low;
    wire signed [35:0] mul_high;
    wire signed [17:0] mul_mid;

    reg signed [52:0] MAC_OUT_low0;
    reg signed [52:0] MAC_OUT_high0;
    reg signed [17:0] mul_mid0;

    always @(posedge clock or negedge reset) begin
        if (~reset) begin
            rA <= 18'b0;
            rB <= 36'b0;
            rBl <= 17'b0;
            rBh <= 18'b0;
            rBl17 <= 1'b0;
            MAC_OUT_low0 <= 53'b0;
            MAC_OUT_high0 <= 53'b0;
            mul_mid0 <= 18'b0;
        end
        else begin
            rA <= A;
            rB <= B;
            rBl <= rB[16:0];
            rBh <= rB[35:18];
            rBl17 <= rB[16];
            MAC_OUT_low0 <= MAC_OUT_low0 + mul_low;
            MAC_OUT_high0 <= MAC_OUT_high0 + mul_high;
            mul_mid0 <= mul_mid;
        end
    end

    assign mul_low = rA * rBl;
    assign mul_high = rA * rBh;
    assign mul_mid = rA * rBl17;

    wire signed [52:0] p1, p2, p3;
    assign p1 = MAC_OUT_high0 << 18;
    assign p2 = MAC_OUT_low0;
    assign p3 = mul_mid0 << 17;
    assign MAC_OUT = p1 + p2 + p3;

endmodule