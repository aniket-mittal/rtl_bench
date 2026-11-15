module origen_092028(
    input [31:0] a, b,
    input cin,
    output [31:0] sum,
    output cout
);

    wire [8:0] c;
    assign c[0] = cin;
    assign cout = c[8];

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : gen_carry_skip
            carry_skip_4bit csa(
                .a(a[4*i+3:4*i]),
                .b(b[4*i+3:4*i]),
                .cin(c[i]),
                .sum(sum[4*i+3:4*i]),
                .cout(c[i+1])
            );
        end
    endgenerate

endmodule

module carry_skip_4bit(
    input [3:0] a, b,
    input cin,
    output [3:0] sum,
    output cout
);

    wire [3:0] p;
    wire c_ripple, P;

    ripple_carry_4_bit rca(
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(c_ripple)
    );

    generate_p gp(
        .a(a),
        .b(b),
        .p(p)
    );

    assign P = &p;

    mux2X1 mux(
        .in0(c_ripple),
        .in1(cin),
        .sel(P),
        .out(cout)
    );

endmodule

module ripple_carry_4_bit(
    input [3:0] a, b,
    input cin,
    output [3:0] sum,
    output cout
);

    wire [3:0] c;

    full_adder fa0(.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c[0]));
    full_adder fa1(.a(a[1]), .b(b[1]), .cin(c[0]), .sum(sum[1]), .cout(c[1]));
    full_adder fa2(.a(a[2]), .b(b[2]), .cin(c[1]), .sum(sum[2]), .cout(c[2]));
    full_adder fa3(.a(a[3]), .b(b[3]), .cin(c[2]), .sum(sum[3]), .cout(cout));

endmodule

module full_adder(
    input a, b, cin,
    output sum, cout
);

    wire sum_temp, c1, c2;

    half_adder ha1(.a(a), .b(b), .sum(sum_temp), .cout(c1));
    half_adder ha2(.a(sum_temp), .b(cin), .sum(sum), .cout(c2));

    assign cout = c1 | c2;

endmodule

module half_adder(
    input a, b,
    output sum, cout
);

    assign sum = a ^ b;
    assign cout = a & b;

endmodule

module generate_p(
    input [3:0] a, b,
    output [3:0] p
);

    assign p = a | b;

endmodule

module mux2X1(
    input in0, in1, sel,
    output out
);

    assign out = sel ? in1 : in0;

endmodule