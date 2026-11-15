module origen_125939 (
    input [15:0] in,
    output [15:0] out
);

    wire [7:0] a, b;
    wire cin;
    wire cout_ripple, cout_csa;

    assign a = in[7:0];
    assign b = in[15:8];
    assign cin = 1'b0;

    // Ripple Carry Adder for lower byte
    ripple_carry_adder rca (
        .a(a),
        .b(b[3:0]),
        .cin(cin),
        .sum(out[7:0]),
        .cout(cout_ripple)
    );

    // Carry Select Adder for upper byte
    carry_select_adder csa (
        .a(a),
        .b(b[7:4]),
        .cin(cout_ripple),
        .sum(out[15:8]),
        .cout(cout_csa)
    );

endmodule

module ripple_carry_adder (
    input [7:0] a,
    input [3:0] b,
    input cin,
    output [7:0] sum,
    output cout
);

    wire [8:0] carry;
    assign carry[0] = cin;

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : rca_gen
            full_adder fa (
                .a(a[i]),
                .b(i < 4 ? b[i] : 1'b0),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate

    assign cout = carry[8];

endmodule

module carry_select_adder (
    input [7:0] a,
    input [3:0] b,
    input cin,
    output [7:0] sum,
    output cout
);

    wire [7:0] sum0, sum1;
    wire cout0, cout1;

    ripple_carry_adder rca0 (
        .a(a),
        .b(b),
        .cin(1'b0),
        .sum(sum0),
        .cout(cout0)
    );

    ripple_carry_adder rca1 (
        .a(a),
        .b(b),
        .cin(1'b1),
        .sum(sum1),
        .cout(cout1)
    );

    assign sum = cin ? sum1 : sum0;
    assign cout = cin ? cout1 : cout0;

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