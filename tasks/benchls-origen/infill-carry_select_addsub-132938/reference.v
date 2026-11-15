module origen_132938 (
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] result,
    output cout
);

    wire [31:0] b_xor;
    wire carry_mid;

    // XOR gate to invert b when sub is 1
    assign b_xor = b ^ {32{sub}};

    // Instantiate two 16-bit carry-select adders
    carry_select_adder_16bit csa_low (
        .a(a[15:0]),
        .b(b_xor[15:0]),
        .cin(sub),
        .sum(result[15:0]),
        .cout(carry_mid)
    );

    carry_select_adder_16bit csa_high (
        .a(a[31:16]),
        .b(b_xor[31:16]),
        .cin(carry_mid),
        .sum(result[31:16]),
        .cout(cout)
    );

endmodule

module carry_select_adder_16bit (
    input [15:0] a,
    input [15:0] b,
    input cin,
    output [15:0] sum,
    output cout
);

    wire [15:0] sum0, sum1;
    wire cout0, cout1;

    // Two 16-bit ripple carry adders
    ripple_carry_adder_16bit rca0 (
        .a(a),
        .b(b),
        .cin(1'b0),
        .sum(sum0),
        .cout(cout0)
    );

    ripple_carry_adder_16bit rca1 (
        .a(a),
        .b(b),
        .cin(1'b1),
        .sum(sum1),
        .cout(cout1)
    );

    // Multiplexer to select the correct sum and cout
    assign sum = cin ? sum1 : sum0;
    assign cout = cin ? cout1 : cout0;

endmodule

module ripple_carry_adder_16bit (
    input [15:0] a,
    input [15:0] b,
    input cin,
    output [15:0] sum,
    output cout
);

    wire [16:0] carry;
    assign carry[0] = cin;

    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : full_adder_gen
            full_adder fa (
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate

    assign cout = carry[16];

endmodule

module full_adder (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));

endmodule