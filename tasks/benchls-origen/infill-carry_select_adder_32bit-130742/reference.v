module origen_130742(
    input [31:0] a,
    input [31:0] b,
    input cin,
    output [31:0] sum,
    output cout
);

    wire [3:0] carry;
    
    // 8-bit adder for least significant bits
    ripple_carry_adder_8bit rca0(
        .a(a[7:0]),
        .b(b[7:0]),
        .cin(cin),
        .sum(sum[7:0]),
        .cout(carry[0])
    );

    // 8-bit carry select adders for remaining bits
    carry_select_adder_8bit csa1(
        .a(a[15:8]),
        .b(b[15:8]),
        .cin(carry[0]),
        .sum(sum[15:8]),
        .cout(carry[1])
    );

    carry_select_adder_8bit csa2(
        .a(a[23:16]),
        .b(b[23:16]),
        .cin(carry[1]),
        .sum(sum[23:16]),
        .cout(carry[2])
    );

    carry_select_adder_8bit csa3(
        .a(a[31:24]),
        .b(b[31:24]),
        .cin(carry[2]),
        .sum(sum[31:24]),
        .cout(cout)
    );

endmodule

module ripple_carry_adder_8bit(
    input [7:0] a,
    input [7:0] b,
    input cin,
    output [7:0] sum,
    output cout
);

    wire [8:0] carry;
    assign carry[0] = cin;

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : fa
            full_adder fa(
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate

    assign cout = carry[8];

endmodule

module carry_select_adder_8bit(
    input [7:0] a,
    input [7:0] b,
    input cin,
    output [7:0] sum,
    output cout
);

    wire [7:0] sum0, sum1;
    wire cout0, cout1;

    ripple_carry_adder_8bit rca0(
        .a(a),
        .b(b),
        .cin(1'b0),
        .sum(sum0),
        .cout(cout0)
    );

    ripple_carry_adder_8bit rca1(
        .a(a),
        .b(b),
        .cin(1'b1),
        .sum(sum1),
        .cout(cout1)
    );

    assign sum = cin ? sum1 : sum0;
    assign cout = cin ? cout1 : cout0;

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