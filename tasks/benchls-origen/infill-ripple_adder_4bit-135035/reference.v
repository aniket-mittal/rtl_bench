module origen_135035(
    input [3:0] A,
    input [3:0] B,
    input Ci,
    output [3:0] S,
    output Co
);

    wire n1;
    wire [3:1] CTMP;

    FA FA0 (
        .A(A[0]),
        .B(B[0]),
        .Ci(Ci),
        .S(S[0]),
        .Co(CTMP[1])
    );

    FA FA1 (
        .A(A[1]),
        .B(B[1]),
        .Ci(CTMP[1]),
        .S(S[1]),
        .Co(CTMP[2])
    );

    FA FA2 (
        .A(A[2]),
        .B(B[2]),
        .Ci(CTMP[2]),
        .S(S[2]),
        .Co(CTMP[3])
    );

    FA FA3 (
        .A(A[3]),
        .B(B[3]),
        .Ci(CTMP[3]),
        .S(S[3]),
        .Co(Co)
    );

endmodule

module FA(
    input A,
    input B,
    input Ci,
    output S,
    output Co
);

    assign S = A ^ B ^ Ci;
    assign Co = (A & B) | (B & Ci) | (A & Ci);

endmodule