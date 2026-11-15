module origen_132198(
    input a, b,
    output sum, carry
);
    assign sum = a ^ b;
    assign carry = a & b;
endmodule

module control_logic(
    input select,
    output enable_ha1, enable_ha2
);
    assign enable_ha1 = ~select;
    assign enable_ha2 = select;
endmodule

module final_sum(
    input sum, carry,
    output final_sum
);
    assign final_sum = sum | carry;
endmodule

module three_bit_adder(
    input a, b, c,
    input select,
    output sum
);
    wire ha1_sum, ha1_carry, ha2_sum, ha2_carry;
    wire enable_ha1, enable_ha2;

    control_logic ctrl(
        .select(select),
        .enable_ha1(enable_ha1),
        .enable_ha2(enable_ha2)
    );

    half_adder ha1(
        .a(a & enable_ha1),
        .b(b & enable_ha1),
        .sum(ha1_sum),
        .carry(ha1_carry)
    );

    half_adder ha2(
        .a(ha1_sum & enable_ha2),
        .b(c & enable_ha2),
        .sum(ha2_sum),
        .carry(ha2_carry)
    );

    final_sum fs(
        .sum(ha2_sum),
        .carry(ha2_carry),
        .final_sum(sum)
    );
endmodule