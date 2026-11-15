module origen_056406(
    input [9:0] SW,
    output [9:0] LEDR
);

    wire w1, w2, w3;
    wire [5:0] inv_in, inv_out;
    wire [7:0] and_in, and_out;
    wire [7:0] or_in, or_out;

    assign inv_in = {SW[9], 5'b0};
    assign and_in = {SW[1], inv_out[0], SW[0], SW[9], 4'b0};
    assign or_in = {and_out[1:0], 6'b0};

    inverter inv_inst (
        .in(inv_in),
        .out(inv_out)
    );

    and_2 and_inst (
        .in(and_in),
        .out(and_out)
    );

    or_2 or_inst (
        .in(or_in),
        .out(or_out)
    );

    assign LEDR[0] = or_out[0];
    assign LEDR[9:1] = 9'b0;

endmodule

module inverter(
    input [5:0] in,
    output [5:0] out
);

    assign out = ~in;

endmodule

module and_2(
    input [7:0] in,
    output [3:0] out
);

    assign out[0] = in[0] & in[1];
    assign out[1] = in[2] & in[3];
    assign out[2] = in[4] & in[5];
    assign out[3] = in[6] & in[7];

endmodule

module or_2(
    input [7:0] in,
    output [3:0] out
);

    assign out[0] = in[0] | in[1];
    assign out[1] = in[2] | in[3];
    assign out[2] = in[4] | in[5];
    assign out[3] = in[6] | in[7];

endmodule