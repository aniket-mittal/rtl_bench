module origen_129426 (
    input [3:0] A,
    input [3:0] B,
    input cin,
    output [3:0] sum,
    output cout
);

    wire [2:0] carry;

    // Instantiate full adder modules
    full_adder FA0 (
        .A(A[0]),
        .B(B[0]),
        .CIN(cin),
        .COUT(carry[0]),
        .SUM(sum[0])
    );

    full_adder FA1 (
        .A(A[1]),
        .B(B[1]),
        .CIN(carry[0]),
        .COUT(carry[1]),
        .SUM(sum[1])
    );

    full_adder FA2 (
        .A(A[2]),
        .B(B[2]),
        .CIN(carry[1]),
        .COUT(carry[2]),
        .SUM(sum[2])
    );

    full_adder FA3 (
        .A(A[3]),
        .B(B[3]),
        .CIN(carry[2]),
        .COUT(cout),
        .SUM(sum[3])
    );

endmodule

// Full adder module definition
module full_adder (
    input A,
    input B,
    input CIN,
    output COUT,
    output SUM
);
    assign {COUT, SUM} = A + B + CIN;
endmodule