module origen_008007(
    input [15:0] a, b,
    input cin,
    output [15:0] sum,
    output cout
);
    wire [3:0] c;

    ripple_carry_4_bit rca1(
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .sum(sum[3:0]),
        .cout(c[0])
    );

    carry_select_adder_4bit_slice csa1(
        .a(a[7:4]),
        .b(b[7:4]),
        .cin(c[0]),
        .sum(sum[7:4]),
        .cout(c[1])
    );

    carry_select_adder_4bit_slice csa2(
        .a(a[11:8]),
        .b(b[11:8]),
        .cin(c[1]),
        .sum(sum[11:8]),
        .cout(c[2])
    );

    carry_select_adder_4bit_slice csa3(
        .a(a[15:12]),
        .b(b[15:12]),
        .cin(c[2]),
        .sum(sum[15:12]),
        .cout(cout)
    );
endmodule

module carry_select_adder_4bit_slice(
    input [3:0] a, b,
    input cin,
    output [3:0] sum,
    output cout
);
    wire [3:0] sum0, sum1;
    wire cout0, cout1;

    ripple_carry_4_bit rca0(
        .a(a),
        .b(b),
        .cin(1'b0),
        .sum(sum0),
        .cout(cout0)
    );

    ripple_carry_4_bit rca1(
        .a(a),
        .b(b),
        .cin(1'b1),
        .sum(sum1),
        .cout(cout1)
    );

    mux2X1 #(4) sum_mux(
        .in0(sum0),
        .in1(sum1),
        .sel(cin),
        .out(sum)
    );

    mux2X1 #(1) cout_mux(
        .in0(cout0),
        .in1(cout1),
        .sel(cin),
        .out(cout)
    );
endmodule

module ripple_carry_4_bit(
    input [3:0] a, b,
    input cin,
    output [3:0] sum,
    output cout
);
    wire [3:1] c;

    full_adder fa0(.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c[1]));
    full_adder fa1(.a(a[1]), .b(b[1]), .cin(c[1]), .sum(sum[1]), .cout(c[2]));
    full_adder fa2(.a(a[2]), .b(b[2]), .cin(c[2]), .sum(sum[2]), .cout(c[3]));
    full_adder fa3(.a(a[3]), .b(b[3]), .cin(c[3]), .sum(sum[3]), .cout(cout));
endmodule

module full_adder(
    input a, b, cin,
    output sum, cout
);
    wire sum_temp, cout_temp1, cout_temp2;

    half_adder ha1(.a(a), .b(b), .sum(sum_temp), .cout(cout_temp1));
    half_adder ha2(.a(sum_temp), .b(cin), .sum(sum), .cout(cout_temp2));
    assign cout = cout_temp1 | cout_temp2;
endmodule

module half_adder(
    input a, b,
    output sum, cout
);
    assign sum = a ^ b;
    assign cout = a & b;
endmodule

module mux2X1 #(parameter WIDTH = 1)(
    input [WIDTH-1:0] in0, in1,
    input sel,
    output [WIDTH-1:0] out
);
    assign out = sel ? in1 : in0;
endmodule