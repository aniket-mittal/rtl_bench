module origen_015569(
    input a, b, cin,
    output sum, cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

module n_bit_adder #(
    parameter BS = 4
)(
    input [BS-1:0] a, b,
    output [BS:0] sum
);
    wire [BS:0] carry;
    assign carry[0] = 1'b0;

    genvar i;
    generate
        for (i = 0; i < BS; i = i + 1) begin : adder_loop
            full_adder fa(
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate

    assign sum[BS] = carry[BS];
endmodule

module five_adder(
    input PB1, PB2, PB3, PB4, PB5,
    input [3:0] holder,
    output [6:0] sum
);
    reg [3:0] a, b, c, d, e;
    wire [4:0] sum1, sum2;
    wire [5:0] sum3;

    always @(posedge PB1) a <= holder;
    always @(posedge PB2) b <= holder;
    always @(posedge PB3) c <= holder;
    always @(posedge PB4) d <= holder;
    always @(posedge PB5) e <= holder;

    n_bit_adder #(4) A1(.a(a), .b(b), .sum(sum1));
    n_bit_adder #(4) A2(.a(c), .b(d), .sum(sum2));
    n_bit_adder #(5) A3(.a(sum1), .b(sum2), .sum(sum3));
    n_bit_adder #(6) A4(.a(sum3), .b({2'b00, e}), .sum(sum));
endmodule