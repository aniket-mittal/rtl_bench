module origen_011425 (
    input [7:0] in,
    input enable,
    output reg [2:0] out
);
    [MASKED]
endmodule

module comparator #(
    parameter WIDTH = 32
) (
    input [WIDTH-1:0] in,
    input [WIDTH-1:0] comp,
    output greater,
    output equal
);
    assign greater = (in > comp);
    assign equal = (in == comp);
endmodule

module adder #(
    parameter WIDTH = 32
) (
    input [WIDTH-1:0] inA,
    input [WIDTH-1:0] inB,
    output [WIDTH-1:0] out
);
    assign out = inA + inB;
endmodule

module mux2 #(
    parameter WIDTH = 32
) (
    input [WIDTH-1:0] in0,
    input [WIDTH-1:0] in1,
    input ctrl,
    output [WIDTH-1:0] out
);
    assign out = ctrl ? in1 : in0;
endmodule

module mux4 #(
    parameter WIDTH = 32
) (
    input [WIDTH-1:0] in0,
    input [WIDTH-1:0] in1,
    input [WIDTH-1:0] in2,
    input [WIDTH-1:0] in3,
    input [1:0] ctrl,
    output [WIDTH-1:0] out
);
    wire [WIDTH-1:0] mux0_out, mux1_out;

    mux2 #(WIDTH) mux0 (.in0(in0), .in1(in1), .ctrl(ctrl[0]), .out(mux0_out));
    mux2 #(WIDTH) mux1 (.in0(in2), .in1(in3), .ctrl(ctrl[0]), .out(mux1_out));
    mux2 #(WIDTH) mux_final (.in0(mux0_out), .in1(mux1_out), .ctrl(ctrl[1]), .out(out));
endmodule

module mux8 #(
    parameter WIDTH = 32
) (
    input [WIDTH-1:0] in0,
    input [WIDTH-1:0] in1,
    input [WIDTH-1:0] in2,
    input [WIDTH-1:0] in3,
    input [WIDTH-1:0] in4,
    input [WIDTH-1:0] in5,
    input [WIDTH-1:0] in6,
    input [WIDTH-1:0] in7,
    input [2:0] ctrl,
    output [WIDTH-1:0] out
);
    wire [WIDTH-1:0] mux0_out, mux1_out;

    mux4 #(WIDTH) mux0 (.in0(in0), .in1(in1), .in2(in2), .in3(in3), .ctrl(ctrl[1:0]), .out(mux0_out));
    mux4 #(WIDTH) mux1 (.in0(in4), .in1(in5), .in2(in6), .in3(in7), .ctrl(ctrl[1:0]), .out(mux1_out));
    mux2 #(WIDTH) mux_final (.in0(mux0_out), .in1(mux1_out), .ctrl(ctrl[2]), .out(out));
endmodule