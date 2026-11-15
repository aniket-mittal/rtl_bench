module origen_034547 (
    input [31:0] In_A,
    input [31:0] In_B,
    input valid_in,
    output reg [31:0] Out,
    output reg valid_out
);

    reg sign;
    reg [7:0] exponent;
    reg [22:0] fraction;
    reg [47:0] dividend, divisor;
    reg [47:0] quotient;

    [MASKED]

endmodule