module origen_135872(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Z,
    output Cout
);

    wire [3:0] C;

    full_adder FA0 (.A(A[0]), .B(B[0]), .Cin(Cin), .S(Z[0]), .Cout(C[0]));
    full_adder FA1 (.A(A[1]), .B(B[1]), .Cin(C[0]), .S(Z[1]), .Cout(C[1]));
    full_adder FA2 (.A(A[2]), .B(B[2]), .Cin(C[1]), .S(Z[2]), .Cout(C[2]));
    full_adder FA3 (.A(A[3]), .B(B[3]), .Cin(C[2]), .S(Z[3]), .Cout(Cout));

endmodule

module full_adder(
    input A,
    input B,
    input Cin,
    output S,
    output Cout
);

    wire w1, w2, w3, w4;

    xor(w1, A, B);
    xor(S, w1, Cin);
    and(w2, A, B);
    and(w3, A, Cin);
    and(w4, B, Cin);
    or(Cout, w2, w3, w4);

endmodule

