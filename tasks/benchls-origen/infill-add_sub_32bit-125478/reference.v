module origen_125478 (
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] result
);

    wire [31:0] adder_out, subtractor_out, xor_out;
    wire select;

    // Instantiate the adder
    adder_32bit adder (
        .a(a),
        .b(b),
        .sum(adder_out)
    );

    // Instantiate the subtractor
    subtractor_32bit subtractor (
        .a(a),
        .b(b),
        .diff(subtractor_out)
    );

    // Instantiate the control module
    control ctrl (
        .sub(sub),
        .select(select)
    );

    // XOR gate to invert subtractor output when select is 1
    assign xor_out = subtractor_out ^ {32{select}};

    // Final output selection
    assign result = select ? xor_out : adder_out;

endmodule

module adder_32bit (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    assign sum = a + b;
endmodule

module subtractor_32bit (
    input [31:0] a,
    input [31:0] b,
    output [31:0] diff
);
    assign diff = a - b;
endmodule

module control (
    input sub,
    output select
);
    assign select = sub;
endmodule