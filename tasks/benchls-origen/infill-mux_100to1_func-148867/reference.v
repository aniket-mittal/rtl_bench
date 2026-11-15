module origen_148867(
    input [99:0] inputs,
    input [6:0] select,
    output result
);

    wire and_out, or_out, xor_out;

    mux_100to1 mux_and (
        .inputs(inputs),
        .select(select),
        .output_bit(and_out)
    );

    mux_100to1 mux_or (
        .inputs(inputs),
        .select(select),
        .output_bit(or_out)
    );

    mux_100to1 mux_xor (
        .inputs(inputs),
        .select(select),
        .output_bit(xor_out)
    );

    functional_module func_mod (
        .and_in(and_out),
        .or_in(or_out),
        .xor_in(xor_out),
        .result(result)
    );

endmodule

module mux_100to1(
    input [99:0] inputs,
    input [6:0] select,
    output output_bit
);

    wire [6:0] priority_encoded;
    wire [15:0] level1;
    wire [3:0] level2;

    // Priority encoder
    assign priority_encoded = select;

    // Level 1: 16 6-to-1 muxes
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : mux6to1_gen
            mux6to1 mux_l1 (
                .inputs(inputs[i*6+5:i*6]),
                .select(priority_encoded[2:0]),
                .output_bit(level1[i])
            );
        end
    endgenerate

    // Level 2: 4 4-to-1 muxes
    genvar j;
    generate
        for (j = 0; j < 4; j = j + 1) begin : mux4to1_gen
            mux4to1 mux_l2 (
                .inputs(level1[j*4+3:j*4]),
                .select(priority_encoded[4:3]),
                .output_bit(level2[j])
            );
        end
    endgenerate

    // Final level: 1 4-to-1 mux
    mux4to1 mux_final (
        .inputs(level2),
        .select(priority_encoded[6:5]),
        .output_bit(output_bit)
    );

endmodule

module mux6to1(
    input [5:0] inputs,
    input [2:0] select,
    output output_bit
);

    wire [3:0] level1;

    // Level 1: 4 2-to-1 muxes
    mux2to1 mux0 (.a(inputs[0]), .b(inputs[1]), .select(select[0]), .out(level1[0]));
    mux2to1 mux1 (.a(inputs[2]), .b(inputs[3]), .select(select[0]), .out(level1[1]));
    mux2to1 mux2 (.a(inputs[4]), .b(inputs[5]), .select(select[0]), .out(level1[2]));
    assign level1[3] = 1'b0;

    // Level 2: 2 2-to-1 muxes
    wire [1:0] level2;
    mux2to1 mux3 (.a(level1[0]), .b(level1[1]), .select(select[1]), .out(level2[0]));
    mux2to1 mux4 (.a(level1[2]), .b(level1[3]), .select(select[1]), .out(level2[1]));

    // Final level: 1 2-to-1 mux
    mux2to1 mux5 (.a(level2[0]), .b(level2[1]), .select(select[2]), .out(output_bit));

endmodule

module mux4to1(
    input [3:0] inputs,
    input [1:0] select,
    output output_bit
);

    wire [1:0] level1;

    // Level 1: 2 2-to-1 muxes
    mux2to1 mux0 (.a(inputs[0]), .b(inputs[1]), .select(select[0]), .out(level1[0]));
    mux2to1 mux1 (.a(inputs[2]), .b(inputs[3]), .select(select[0]), .out(level1[1]));

    // Final level: 1 2-to-1 mux
    mux2to1 mux2 (.a(level1[0]), .b(level1[1]), .select(select[1]), .out(output_bit));

endmodule

module mux2to1(
    input a,
    input b,
    input select,
    output out
);

    assign out = select ? b : a;

endmodule

module functional_module(
    input and_in,
    input or_in,
    input xor_in,
    output result
);

    assign result = (and_in & or_in) ^ xor_in;

endmodule