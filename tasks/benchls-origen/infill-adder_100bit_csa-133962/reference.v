module origen_133962(
    input [99:0] a,
    input [99:0] b,
    input cin,
    output [99:0] sum,
    output cout
);

    wire [3:0] carry;
    wire [99:0] sum0, sum1;

    // 25-bit ripple carry adder for the least significant bits
    ripple_carry_adder #(25) rca0 (
        .a(a[24:0]),
        .b(b[24:0]),
        .cin(cin),
        .sum(sum[24:0]),
        .cout(carry[0])
    );

    // 25-bit carry select adders for the remaining bits
    genvar i;
    generate
        for (i = 1; i < 4; i = i + 1) begin : csa_block
            carry_select_adder #(25) csa (
                .a(a[25*i+24:25*i]),
                .b(b[25*i+24:25*i]),
                .cin(carry[i-1]),
                .sum(sum[25*i+24:25*i]),
                .cout(carry[i])
            );
        end
    endgenerate

    assign cout = carry[3];

endmodule

module ripple_carry_adder #(
    parameter WIDTH = 25
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
            full_adder fa (
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

module carry_select_adder #(
    parameter WIDTH = 25
)(
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    input cin,
    output [WIDTH-1:0] sum,
    output cout
);

    wire [WIDTH-1:0] sum0, sum1;
    wire cout0, cout1;

    ripple_carry_adder #(WIDTH) rca0 (
        .a(a),
        .b(b),
        .cin(1'b0),
        .sum(sum0),
        .cout(cout0)
    );

    ripple_carry_adder #(WIDTH) rca1 (
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