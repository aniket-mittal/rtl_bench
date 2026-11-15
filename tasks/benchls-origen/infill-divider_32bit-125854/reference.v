module origen_125854 (
    input wire clk,
    input wire reset,
    input wire start,
    input wire signed_op,
    input wire [31:0] A,
    input wire [31:0] B,
    output reg [31:0] result,
    output reg done
);

reg [31:0] dividend, divisor;
reg [31:0] quotient, remainder;
reg [5:0] count;
reg running;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        result <= 32'b0;
        done <= 1'b0;
        running <= 1'b0;
        count <= 6'b0;
    end else if (start && !running) begin
        dividend <= signed_op ? (A[31] ? -A : A) : A;
        divisor <= signed_op ? (B[31] ? -B : B) : B;
        quotient <= 32'b0;
        remainder <= 32'b0;
        count <= 6'b0;
        running <= 1'b1;
        done <= 1'b0;
    end else if (running) begin
        if (count < 32) begin
            remainder <= {remainder[30:0], dividend[31]};
            dividend <= {dividend[30:0], 1'b0};
            if (remainder >= divisor) begin
                remainder <= remainder - divisor;
                quotient <= {quotient[30:0], 1'b1};
            end else begin
                quotient <= {quotient[30:0], 1'b0};
            end
            count <= count + 1;
        end else begin
            if (signed_op && (A[31] ^ B[31]))
                result <= -quotient;
            else
                result <= quotient;
            done <= 1'b1;
            running <= 1'b0;
        end
    end
end

endmodule