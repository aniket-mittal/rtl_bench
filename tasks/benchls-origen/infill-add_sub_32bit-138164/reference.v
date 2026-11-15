module origen_138164(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] result,
    output cout
);

    wire [31:0] b_xor;
    wire [31:0] sum_add, sum_sub;
    wire cout_add, cout_sub;

    // XOR gate for input B
    assign b_xor = b ^ {32{sub}};

    // Instantiate 32-bit full adder
    full_adder_32bit fa_add (
        .a(a),
        .b(b),
        .cin(1'b0),
        .sum(sum_add),
        .cout(cout_add)
    );

    // Instantiate 32-bit full subtractor
    full_subtractor_32bit fs_sub (
        .a(a),
        .b(b_xor),
        .bin(sub),
        .diff(sum_sub),
        .bout(cout_sub)
    );

    // Select between addition and subtraction
    assign result = sub ? sum_sub : sum_add;
    assign cout = sub ? cout_sub : cout_add;

endmodule

module full_adder_32bit(
    input [31:0] a,
    input [31:0] b,
    input cin,
    output [31:0] sum,
    output cout
);

    assign {cout, sum} = a + b + cin;

endmodule

module full_subtractor_32bit(
    input [31:0] a,
    input [31:0] b,
    input bin,
    output [31:0] diff,
    output bout
);

    assign {bout, diff} = a - b - bin;

endmodule