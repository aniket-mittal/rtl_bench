module origen_127908(
    input [63:0] a,
    input [63:0] b,
    input cin,
    output [63:0] sum,
    output cout
);

    wire [3:0] carry;
    wire [63:0] sum0, sum1;

    // 16-bit carry select adder modules
    carry_select_16bit csa0(.a(a[15:0]), .b(b[15:0]), .cin(cin), .sum(sum[15:0]), .cout(carry[0]));
    carry_select_16bit csa1(.a(a[31:16]), .b(b[31:16]), .cin(carry[0]), .sum(sum[31:16]), .cout(carry[1]));
    carry_select_16bit csa2(.a(a[47:32]), .b(b[47:32]), .cin(carry[1]), .sum(sum[47:32]), .cout(carry[2]));
    carry_select_16bit csa3(.a(a[63:48]), .b(b[63:48]), .cin(carry[2]), .sum(sum[63:48]), .cout(cout));

endmodule

module carry_select_16bit(
    input [15:0] a,
    input [15:0] b,
    input cin,
    output [15:0] sum,
    output cout
);

    wire [15:0] sum0, sum1;
    wire cout0, cout1;

    // 16-bit adders with cin=0 and cin=1
    ripple_carry_adder_16bit rca0(.a(a), .b(b), .cin(1'b0), .sum(sum0), .cout(cout0));
    ripple_carry_adder_16bit rca1(.a(a), .b(b), .cin(1'b1), .sum(sum1), .cout(cout1));

    // Multiplexers to select the correct sum and cout based on cin
    assign sum = cin ? sum1 : sum0;
    assign cout = cin ? cout1 : cout0;

endmodule

module ripple_carry_adder_16bit(
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
            full_adder fa(
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

module and_output(
    input [63:0] sum,
    input cout,
    output [63:0] final_output
);

    assign final_output = {64{cout}} & sum;

endmodule

module top_module(
    input [63:0] a,
    input [63:0] b,
    input cin,
    output [63:0] final_output
);

    wire [63:0] sum;
    wire cout;

    carry_select_adder_128bit csa(
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    and_output ao(
        .sum(sum),
        .cout(cout),
        .final_output(final_output)
    );

endmodule