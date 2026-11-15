module origen_196664(
    input [31:0] a,
    input [31:0] b,
    input [3:0] aluc,
    output [31:0] r,
    output zero,
    output carry,
    output negative,
    output overflow
);

reg [31:0] result;
reg carry_out, is_zero, is_negative, is_overflow;

[MASKED]

assign r = result;
assign zero = is_zero;
assign carry = carry_out;
assign negative = is_negative;
assign overflow = is_overflow;

endmodule