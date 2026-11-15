module origen_105279(
    input [15:0] A, B,
    output [15:0] Sum,
    output CO
);
    wire [3:0] c;

    four_bit_adder FRA0(.A(A[3:0]), .B(B[3:0]), .Cin(1'b0), .Sum(Sum[3:0]), .Cout(c[0]));
    four_ba_mux FRA1(.A(A[7:4]), .B(B[7:4]), .Cin(c[0]), .Sum(Sum[7:4]), .Cout(c[1]));
    four_ba_mux FRA2(.A(A[11:8]), .B(B[11:8]), .Cin(c[1]), .Sum(Sum[11:8]), .Cout(c[2]));
    four_ba_mux FRA3(.A(A[15:12]), .B(B[15:12]), .Cin(c[2]), .Sum(Sum[15:12]), .Cout(CO));
endmodule

module four_bit_adder(
    input [3:0] A, B,
    input Cin,
    output [3:0] Sum,
    output Cout
);
    wire [3:0] c;
    
    full_adder_csa FA0(.A(A[0]), .B(B[0]), .Cin(Cin), .Sum(Sum[0]), .Cout(c[0]));
    full_adder_csa FA1(.A(A[1]), .B(B[1]), .Cin(c[0]), .Sum(Sum[1]), .Cout(c[1]));
    full_adder_csa FA2(.A(A[2]), .B(B[2]), .Cin(c[1]), .Sum(Sum[2]), .Cout(c[2]));
    full_adder_csa FA3(.A(A[3]), .B(B[3]), .Cin(c[2]), .Sum(Sum[3]), .Cout(Cout));
endmodule

module four_ba_mux(
    input [3:0] A, B,
    input Cin,
    output [3:0] Sum,
    output Cout
);
    wire [3:0] sum0, sum1;
    wire c0, c1;

    four_bit_adder FBA0(.A(A), .B(B), .Cin(1'b0), .Sum(sum0), .Cout(c0));
    four_bit_adder FBA1(.A(A), .B(B), .Cin(1'b1), .Sum(sum1), .Cout(c1));
    
    mux MUX_SUM(.in0(sum0), .in1(sum1), .sel(Cin), .out(Sum));
    assign Cout = (Cin & c0) | c1;
endmodule

module full_adder_csa(
    input A, B, Cin,
    output Sum, Cout
);
    assign Sum = A ^ B ^ Cin;
    assign Cout = (A & B) | (Cin & (A ^ B));
endmodule

module mux(
    input [3:0] in0, in1,
    input sel,
    output [3:0] out
);
    assign out = sel ? in1 : in0;
endmodule