module origen_123342 (
    input [31:0] in,
    output [31:0] out
);

    wire [15:0] split_upper, split_lower;
    wire [15:0] swapped_upper, swapped_lower;

    // Module 1: Split 32-bit input into two 16-bit vectors
    split_32bit splitter (
        .in(in),
        .upper(split_upper),
        .lower(split_lower)
    );

    // Module 2: Swap positions of two 16-bit vectors
    swap_16bit swapper (
        .in1(split_upper),
        .in2(split_lower),
        .out1(swapped_upper),
        .out2(swapped_lower)
    );

    // Additional module: Combine swapped 16-bit vectors into final 32-bit output
    combine_32bit combiner (
        .upper(swapped_upper),
        .lower(swapped_lower),
        .out(out)
    );

endmodule

module split_32bit (
    input [31:0] in,
    output [15:0] upper,
    output [15:0] lower
);

    assign upper = in[31:16];
    assign lower = in[15:0];

endmodule

module swap_16bit (
    input [15:0] in1,
    input [15:0] in2,
    output [15:0] out1,
    output [15:0] out2
);

    assign out1 = in2;
    assign out2 = in1;

endmodule

module combine_32bit (
    input [15:0] upper,
    input [15:0] lower,
    output [31:0] out
);

    assign out = {upper[15:8], lower[15:8], lower[7:0], upper[7:0]};

endmodule