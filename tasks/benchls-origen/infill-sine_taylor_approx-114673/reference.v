module origen_114673(
    input signed [31:0] X,
    output reg signed [31:0] SIN
);

// Helper function for factorial calculation
function automatic [31:0] fac;
    input [31:0] k;
    integer i;
    begin
        fac = 1;
        for (i = 2; i <= k; i = i + 1) begin
            fac = fac * i;
        end
    end
endfunction

// Helper function for power calculation with fixed-point arithmetic
function automatic signed [63:0] pow;
    input signed [31:0] x;
    input [31:0] k;
    integer i;
    begin
        pow = 65536; // 1.0 in fixed-point
        for (i = 0; i < k; i = i + 1) begin
            pow = (pow * x) >>> 16;
        end
    end
endfunction

always @(X) begin
    reg signed [31:0] x_norm;
    reg sign;
    reg [2:0] quadrant;
    reg signed [63:0] term, sum;
    integer i;

    // Angle normalization
    x_norm = X % 205887; // 205887 ≈ π/2 * 2^16
    quadrant = X / 205887;
    sign = (quadrant == 1 || quadrant == 2) ? -1 : 1;

    if (quadrant == 1 || quadrant == 3)
        x_norm = 205887 - x_norm;

    // Taylor series approximation
    sum = 0;
    for (i = 0; i < 5; i = i + 1) begin
        term = pow(x_norm, 2*i + 1) / fac(2*i + 1);
        sum = sum + ((i[0] == 0) ? term : -term);
    end

    // Final result
    SIN = sign * (sum >>> 16);
end

endmodule