module origen_099002 (
    input wire clk,
    input wire enable,
    input wire signed [23:0] Din,
    output reg signed [23:0] Dout
);

reg signed [23:0] Q1, Q2, Q3, Q4, Q5, Q6, Q7;

always @(posedge clk) begin
    if (enable) begin
        Q7 <= Q6;
        Q6 <= Q5;
        Q5 <= Q4;
        Q4 <= Q3;
        Q3 <= Q2;
        Q2 <= Q1;
        Q1 <= Din;
        Dout <= (Din + Q1 + Q2 + Q3 + Q4 + Q5 + Q6 + Q7) >>> 3;
    end
end

endmodule

