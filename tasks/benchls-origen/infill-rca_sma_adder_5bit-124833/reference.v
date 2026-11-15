module origen_124833(
    input [3:0] A,
    input [3:0] B,
    input sign,
    output [4:0] sum
);

wire [3:0] rca_out;
wire [3:0] sma_out;
wire [4:0] final_out;

ripple_carry_adder rca (
    .A(A),
    .B(B),
    .Cin(1'b0),
    .Sum(rca_out),
    .Cout()
);

signed_magnitude_adder sma (
    .A(A),
    .B(B),
    .Sum(sma_out)
);

mux_2to1 #(4) output_select (
    .in0(rca_out),
    .in1(sma_out),
    .sel(sign),
    .out(final_out[3:0])
);

assign final_out[4] = (sign) ? 1'b1 : 1'b0;

adder_5bit final_adder (
    .A(final_out),
    .B({1'b0, A}),
    .C({1'b0, B}),
    .Sum(sum)
);

endmodule

module ripple_carry_adder(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Sum,
    output Cout
);

wire [3:0] carry;

full_adder fa0 (.A(A[0]), .B(B[0]), .Cin(Cin),     .Sum(Sum[0]), .Cout(carry[0]));
full_adder fa1 (.A(A[1]), .B(B[1]), .Cin(carry[0]), .Sum(Sum[1]), .Cout(carry[1]));
full_adder fa2 (.A(A[2]), .B(B[2]), .Cin(carry[1]), .Sum(Sum[2]), .Cout(carry[2]));
full_adder fa3 (.A(A[3]), .B(B[3]), .Cin(carry[2]), .Sum(Sum[3]), .Cout(Cout));

endmodule

module full_adder(
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);

assign Sum = A ^ B ^ Cin;
assign Cout = (A & B) | (Cin & (A ^ B));

endmodule

module signed_magnitude_adder(
    input [3:0] A,
    input [3:0] B,
    output [3:0] Sum
);

wire [3:0] A_comp, B_comp, larger, smaller;
wire [3:0] diff;

assign A_comp = ~A + 1;
assign B_comp = ~B + 1;

assign larger = (A > B) ? A : B;
assign smaller = (A > B) ? B : A;

assign diff = larger - smaller;
assign Sum = diff;

endmodule

module mux_2to1 #(parameter WIDTH=1) (
    input [WIDTH-1:0] in0,
    input [WIDTH-1:0] in1,
    input sel,
    output [WIDTH-1:0] out
);

assign out = sel ? in1 : in0;

endmodule

module adder_5bit(
    input [4:0] A,
    input [4:0] B,
    input [4:0] C,
    output [4:0] Sum
);

assign Sum = A + B + C;

endmodule