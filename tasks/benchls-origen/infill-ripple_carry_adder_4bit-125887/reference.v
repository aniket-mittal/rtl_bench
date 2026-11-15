module origen_125887 (
    input A_i,
    input B_i,
    input Cin_i,
    output S_i,
    output Cout_i
);

    assign S_i = A_i ^ B_i ^ Cin_i;
    assign Cout_i = (A_i & B_i) | (Cin_i & (A_i ^ B_i));

endmodule

module ripple_carry_adder (
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] S,
    output Cout
);

    wire [3:0] carry;

    full_adder FA0 (
        .A_i(A[0]),
        .B_i(B[0]),
        .Cin_i(Cin),
        .S_i(S[0]),
        .Cout_i(carry[0])
    );

    full_adder FA1 (
        .A_i(A[1]),
        .B_i(B[1]),
        .Cin_i(carry[0]),
        .S_i(S[1]),
        .Cout_i(carry[1])
    );

    full_adder FA2 (
        .A_i(A[2]),
        .B_i(B[2]),
        .Cin_i(carry[1]),
        .S_i(S[2]),
        .Cout_i(carry[2])
    );

    full_adder FA3 (
        .A_i(A[3]),
        .B_i(B[3]),
        .Cin_i(carry[2]),
        .S_i(S[3]),
        .Cout_i(carry[3])
    );

    assign Cout = carry[3];

endmodule