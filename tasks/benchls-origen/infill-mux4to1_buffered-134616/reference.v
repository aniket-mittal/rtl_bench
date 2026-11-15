module origen_134616(
    input [3:0] A0, A1, A2, A3,
    input S0, S1,
    output X
);

    wire [3:0] mux1_out, mux2_out;
    wire buf_out;

    // First stage: Two 4-to-2 multiplexers
    mux4to2 mux1 (
        .A0(A0),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .S0(S0),
        .S1(S1),
        .X(mux1_out)
    );

    mux4to2 mux2 (
        .A0(A0),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .S0(S0),
        .S1(S1),
        .X(mux2_out)
    );

    // Second stage: Buffer
    buf_gate buffer (
        .A(mux1_out[0]),
        .Y(buf_out)
    );

    // Final output selection
    assign X = (S1) ? mux2_out[0] : buf_out;

endmodule

// 4-to-2 Multiplexer
module mux4to2(
    input [3:0] A0, A1, A2, A3,
    input S0, S1,
    output [3:0] X
);
    assign X = S1 ? (S0 ? A3 : A2) : (S0 ? A1 : A0);
endmodule

// Buffer
module buf_gate(
    input A,
    output Y
);
    assign Y = A;
endmodule