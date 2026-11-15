module origen_136471 (
    Y,
    A,
    B,
    S
);

    output Y;
    input  A;
    input  B;
    input  S;

    assign Y = (S == 1'b0) ? A : B;

endmodule

module mux4to1 (
    Y,
    A,
    B,
    C,
    D,
    S0,
    S1
);

    output Y;
    input  A;
    input  B;
    input  C;
    input  D;
    input  S0;
    input  S1;

    wire mux1_out, mux2_out;

    mux2to1 mux1 (
        .Y(mux1_out),
        .A(A),
        .B(B),
        .S(S0)
    );

    mux2to1 mux2 (
        .Y(mux2_out),
        .A(C),
        .B(D),
        .S(S0)
    );

    mux2to1 mux3 (
        .Y(Y),
        .A(mux1_out),
        .B(mux2_out),
        .S(S1)
    );

endmodule