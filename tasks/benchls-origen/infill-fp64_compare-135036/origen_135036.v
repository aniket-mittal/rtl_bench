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

    [MASKED]

endmodule