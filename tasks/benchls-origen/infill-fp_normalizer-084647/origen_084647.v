module origen_084647 #(parameter fbw = 63) (
    input [fbw:0] a,
    input [fbw:0] b,
    output reg [fbw:0] delta_1,
    output reg [fbw:0] delta_2
);

    reg [51:0] mantissa_a, mantissa_b;
    reg [10:0] exponent_a, exponent_b;
    reg sign_a, sign_b;
    reg [5:0] leading_zeros_a, leading_zeros_b;

    [MASKED]

endmodule