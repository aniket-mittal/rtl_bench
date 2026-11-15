module origen_100056 #(
    parameter WIDTH = 16
)(
    input [WIDTH-1:0] x, y,
    input [5:0] select,
    output [WIDTH-1:0] out,
    output zr, ng
);

    wire [WIDTH-1:0] mux_1_out, mux_2_out, mux_3_out;

    mux_in #(WIDTH) mux_1 (
        .in(x),
        .select(select[5:4]),
        .out(mux_1_out)
    );

    mux_in #(WIDTH) mux_2 (
        .in(y),
        .select(select[3:2]),
        .out(mux_2_out)
    );

    wire [WIDTH-1:0] and_result, add_result;
    assign and_result = mux_1_out & mux_2_out;
    assign add_result = mux_1_out + mux_2_out;

    mux2 #(WIDTH) mux_3 (
        .in0(and_result),
        .in1(add_result),
        .select(select[1]),
        .out(mux_3_out)
    );

    mux2 #(WIDTH) mux_4 (
        .in0(mux_3_out),
        .in1(~mux_3_out),
        .select(select[0]),
        .out(out)
    );

    assign zr = ~|out;
    assign ng = out[WIDTH-1];

endmodule

module mux_in #(
    parameter WIDTH = 16
)(
    input [WIDTH-1:0] in,
    input [1:0] select,
    output reg [WIDTH-1:0] out
);
    always @(*) begin
        case(select)
            2'b00: out = in;
            2'b01: out = ~in;
            2'b10: out = {WIDTH{1'b1}};
            2'b11: out = {WIDTH{1'b0}};
        endcase
    end
endmodule

module mux2 #(
    parameter WIDTH = 16
)(
    input [WIDTH-1:0] in0, in1,
    input select,
    output [WIDTH-1:0] out
);
    assign out = select ? in1 : in0;
endmodule

module mux4 #(
    parameter WIDTH = 16
)(
    input [WIDTH-1:0] in0, in1, in2, in3,
    input [1:0] select,
    output [WIDTH-1:0] out
);
    wire [WIDTH-1:0] mux1_out, mux2_out;

    mux2 #(WIDTH) mux1 (
        .in0(in0),
        .in1(in1),
        .select(select[0]),
        .out(mux1_out)
    );

    mux2 #(WIDTH) mux2 (
        .in0(in2),
        .in1(in3),
        .select(select[0]),
        .out(mux2_out)
    );

    mux2 #(WIDTH) mux3 (
        .in0(mux1_out),
        .in1(mux2_out),
        .select(select[1]),
        .out(out)
    );
endmodule