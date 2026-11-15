module origen_004959(
    input [15:0] a, b,
    input cin,
    output [15:0] sum,
    output cout
);
    wire c;
    RCA8bit rca1(.a(a[7:0]), .b(b[7:0]), .cin(cin), .sum(sum[7:0]), .cout(c));
    RCA8bit rca2(.a(a[15:8]), .b(b[15:8]), .cin(c), .sum(sum[15:8]), .cout(cout));
endmodule

module RCA8bit(
    input [7:0] a, b,
    input cin,
    output [7:0] sum,
    output cout
);
    wire c;
    RCA4bit rca1(.a(a[3:0]), .b(b[3:0]), .cin(cin), .sum(sum[3:0]), .cout(c));
    RCA4bit rca2(.a(a[7:4]), .b(b[7:4]), .cin(c), .sum(sum[7:4]), .cout(cout));
endmodule

module RCA4bit(
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