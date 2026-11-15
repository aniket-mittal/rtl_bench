module origen_135036 (
    input [63:0] a,
    input [63:0] b,
    input signaling,
    output reg lt,
    output reg eq,
    output reg gt,
    output reg unordered,
    output reg [4:0] exceptionFlags
);

    // Extract sign, exponent, and fraction from input numbers
    wire sign_a = a[63];
    wire sign_b = b[63];
    wire [10:0] exp_a = a[62:52];
    wire [10:0] exp_b = b[62:52];
    wire [51:0] frac_a = a[51:0];
    wire [51:0] frac_b = b[51:0];

    // Check for special cases
    wire is_zero_a = (exp_a == 11'b0) && (frac_a == 52'b0);
    wire is_zero_b = (exp_b == 11'b0) && (frac_b == 52'b0);
    wire is_inf_a = (exp_a == 11'b11111111111) && (frac_a == 52'b0);
    wire is_inf_b = (exp_b == 11'b11111111111) && (frac_b == 52'b0);
    wire is_nan_a = (exp_a == 11'b11111111111) && (frac_a != 52'b0);
    wire is_nan_b = (exp_b == 11'b11111111111) && (frac_b != 52'b0);
    wire is_snan_a = is_nan_a && !frac_a[51];
    wire is_snan_b = is_nan_b && !frac_b[51];
    wire is_subnormal_a = (exp_a == 11'b0) && (frac_a != 52'b0);
    wire is_subnormal_b = (exp_b == 11'b0) && (frac_b != 52'b0);

    always @(*) begin
        // Initialize outputs
        lt = 0;
        eq = 0;
        gt = 0;
        unordered = 0;
        exceptionFlags = 5'b0;

        // Check for NaN cases
        if (is_nan_a || is_nan_b) begin
            unordered = 1;
            exceptionFlags[4] = 1; // Inexact flag
            if ((is_snan_a || is_snan_b) && signaling)
                exceptionFlags[0] = 1; // Invalid operation flag
        end
        // Check for infinity cases
        else if (is_inf_a || is_inf_b) begin
            if (is_inf_a && is_inf_b) begin
                if (sign_a == sign_b)
                    eq = 1;
                else if (sign_a)
                    lt = 1;
                else
                    gt = 1;
            end
            else if (is_inf_a) begin
                if (sign_a)
                    lt = 1;
                else
                    gt = 1;
            end
            else begin
                if (sign_b)
                    gt = 1;
                else
                    lt = 1;
            end
            if (is_zero_a || is_zero_b)
                exceptionFlags[1] = 1; // Division by zero flag
            else if (!is_inf_a || !is_inf_b)
                exceptionFlags[2] = 1; // Overflow flag
            exceptionFlags[4] = 1; // Inexact flag
        end
        // Check for zero cases
        else if (is_zero_a && is_zero_b) begin
            eq = 1;
        end
        // Compare normal and subnormal numbers
        else begin
            if (sign_a != sign_b) begin
                lt = sign_a;
                gt = !sign_a;
            end
            else if (a != b) begin
                if (sign_a) begin
                    lt = (a > b);
                    gt = (a < b);
                end
                else begin
                    lt = (a < b);
                    gt = (a > b);
                end
            end
            else begin
                eq = 1;
            end
            if ((is_subnormal_a && is_zero_b) || (is_subnormal_b && is_zero_a))
                exceptionFlags[3] = 1; // Underflow flag
        end

        exceptionFlags[4] = exceptionFlags[4] | lt | eq | gt | unordered; // Inexact flag
    end

endmodule