module origen_036106(
    input [3:0] f_nibble,
    input [3:0] s_nibble,
    input carry_in,
    output [3:0] sum,
    output carry_out
);

wire [2:0] ripple_carry_sig;

full_adder fa0 (
    .f_bit(f_nibble[0]),
    .s_bit(s_nibble[0]),
    .carry_in(carry_in),
    .s(sum[0]),
    .carry_out(ripple_carry_sig[0])
);

full_adder fa1 (
    .f_bit(f_nibble[1]),
    .s_bit(s_nibble[1]),
    .carry_in(ripple_carry_sig[0]),
    .s(sum[1]),
    .carry_out(ripple_carry_sig[1])
);

full_adder fa2 (
    .f_bit(f_nibble[2]),
    .s_bit(s_nibble[2]),
    .carry_in(ripple_carry_sig[1]),
    .s(sum[2]),
    .carry_out(ripple_carry_sig[2])
);

full_adder fa3 (
    .f_bit(f_nibble[3]),
    .s_bit(s_nibble[3]),
    .carry_in(ripple_carry_sig[2]),
    .s(sum[3]),
    .carry_out(carry_out)
);

endmodule

module full_adder(
    input f_bit,
    input s_bit,
    input carry_in,
    output s,
    output carry_out
);

assign s = f_bit ^ s_bit ^ carry_in;
assign carry_out = (f_bit & s_bit) | (carry_in & (f_bit ^ s_bit));

endmodule