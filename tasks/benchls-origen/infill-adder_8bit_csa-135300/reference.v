module origen_135300(
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
);

    wire [7:0] sum0, sum1;
    wire carry0, carry1;
    wire [3:0] sel;

    // Lower 4-bit adder
    ripple_carry_adder #(4) rca_low(
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(1'b0),
        .sum(s[3:0]),
        .cout(sel[0])
    );

    // Upper 4-bit adders
    ripple_carry_adder #(4) rca_high0(
        .a(a[7:4]),
        .b(b[7:4]),
        .cin(1'b0),
        .sum(sum0),
        .cout(carry0)
    );

    ripple_carry_adder #(4) rca_high1(
        .a(a[7:4]),
        .b(b[7:4]),
        .cin(1'b1),
        .sum(sum1),
        .cout(carry1)
    );

    // 4-bit 2-to-1 MUX for sum selection
    assign s[7:4] = sel[0] ? sum1 : sum0;

    // Carry select
    assign sel[3:1] = {3{sel[0]}};
    assign sel[0] = sel[0];

    // Overflow detection
    overflow_detector ovf_det(
        .a(a[7]),
        .b(b[7]),
        .s(s[7]),
        .overflow(overflow)
    );

endmodule

module ripple_carry_adder #(
    parameter WIDTH = 4
)(
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    input cin,
    output [WIDTH-1:0] sum,
    output cout
);

    wire [WIDTH:0] carry;
    assign carry[0] = cin;

    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : fa_loop
            full_adder fa(
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate

    assign cout = carry[WIDTH];

endmodule

module full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));

endmodule

module overflow_detector(
    input a,
    input b,
    input s,
    output overflow
);

    assign overflow = (a & b & ~s) | (~a & ~b & s);

endmodule