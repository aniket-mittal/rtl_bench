module origen_123584(
    input a, b,
    output sum, carry
);
    assign sum = a ^ b;
    assign carry = a & b;
endmodule

module byte_reverse(
    input [31:0] in,
    output [31:0] out
);
    assign out = {in[7:0], in[15:8], in[23:16], in[31:24]};
endmodule

module adder_32bit(
    input [31:0] a, b,
    output [31:0] sum,
    output carry_out
);
    wire [32:0] carries;
    assign carries[0] = 1'b0;

    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : adder_loop
            half_adder ha(
                .a(a[i]),
                .b(b[i]),
                .sum(sum[i]),
                .carry(carries[i+1])
            );
        end
    endgenerate

    assign carry_out = carries[32];
endmodule

module reversed_byte_adder(
    input [31:0] a, b,
    output [31:0] sum,
    output carry_out
);
    wire [31:0] a_reversed, b_reversed, sum_reversed;

    byte_reverse br_a(.in(a), .out(a_reversed));
    byte_reverse br_b(.in(b), .out(b_reversed));

    adder_32bit adder(
        .a(a_reversed),
        .b(b_reversed),
        .sum(sum_reversed),
        .carry_out(carry_out)
    );

    byte_reverse br_sum(.in(sum_reversed), .out(sum));
endmodule