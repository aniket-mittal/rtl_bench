module origen_145264(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Sum,
    output Cout
);

    wire [3:0] C;

    FullAdder FA0 (
        .A(A[0]),
        .B(B[0]),
        .Cin(Cin),
        .Sum(Sum[0]),
        .Cout(C[0])
    );

    FullAdder FA1 (
        .A(A[1]),
        .B(B[1]),
        .Cin(C[0]),
        .Sum(Sum[1]),
        .Cout(C[1])
    );

    FullAdder FA2 (
        .A(A[2]),
        .B(B[2]),
        .Cin(C[1]),
        .Sum(Sum[2]),
        .Cout(C[2])
    );

    FullAdder FA3 (
        .A(A[3]),
        .B(B[3]),
        .Cin(C[2]),
        .Sum(Sum[3]),
        .Cout(Cout)
    );

endmodule

module FullAdder(
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);

    wire w1, w2, w3;

    XOR2 xor1 (
        .A(A),
        .B(B),
        .Y(w1)
    );

    XOR2 xor2 (
        .A(w1),
        .B(Cin),
        .Y(Sum)
    );

    AND2 and1 (
        .A(A),
        .B(B),
        .Y(w2)
    );

    AND2 and2 (
        .A(w1),
        .B(Cin),
        .Y(w3)
    );

    OR2 or1 (
        .A(w2),
        .B(w3),
        .Y(Cout)
    );

endmodule

module XOR2(
    input A,
    input B,
    output Y
);

    wire w1, w2, w3, w4;

    NOT not1 (
        .A(A),
        .Y(w1)
    );

    NOT not2 (
        .A(B),
        .Y(w2)
    );

    AND2 and1 (
        .A(A),
        .B(w2),
        .Y(w3)
    );

    AND2 and2 (
        .A(w1),
        .B(B),
        .Y(w4)
    );

    OR2 or1 (
        .A(w3),
        .B(w4),
        .Y(Y)
    );

endmodule

module AND2(
    input A,
    input B,
    output Y
);

    assign Y = A & B;

endmodule

module OR2(
    input A,
    input B,
    output Y
);

    assign Y = A | B;

endmodule

module NOT(
    input A,
    output Y
);

    assign Y = ~A;

endmodule