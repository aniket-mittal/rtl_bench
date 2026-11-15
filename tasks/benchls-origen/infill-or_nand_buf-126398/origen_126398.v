module origen_126398 (
    input A1,
    input A2,
    input A3,
    input B1,
    input C1,
    output Y
);

    wire or0_out, nand0_out;

    or0 or0_inst (
        .A(A1),
        .B(A2),
        .C(A3),
        .X(or0_out)
    );

    [MASKED]

    buf0 buf0_inst (
        .A(nand0_out),
        .X(Y)
    );

endmodule

module or0 (
    input A,
    input B,
    input C,
    output X
);

    assign X = A | B | C;

endmodule

module nand0 (
    input A,
    input B,
    input C,
    output Y
);

    assign Y = ~(A & B & C);

endmodule

module buf0 (
    input A,
    output X
);

    assign X = A;

endmodule