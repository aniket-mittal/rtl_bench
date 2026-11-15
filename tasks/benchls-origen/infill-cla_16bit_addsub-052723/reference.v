module origen_052723(
    input [15:0] A, B,
    input C_in,
    output [15:0] S,
    output C_out,
    output OF
);

    wire [15:0] A_l, A_in;
    wire [3:0] C;
    wire [3:0] P, G;

    // Input preprocessing
    assign A_l = ~A;
    assign A_in = C_in ? A_l : A;

    // Instantiate CLG4
    CLG4 clg4(
        .P(P),
        .G(G),
        .C_in(C_in),
        .C(C)
    );

    // Instantiate CLA4 blocks
    CLA4 cla4_0(
        .A(A_in[3:0]),
        .B(B[3:0]),
        .C_in(C_in),
        .S(S[3:0]),
        .P(P[0]),
        .G(G[0])
    );

    CLA4 cla4_1(
        .A(A_in[7:4]),
        .B(B[7:4]),
        .C_in(C[0]),
        .S(S[7:4]),
        .P(P[1]),
        .G(G[1])
    );

    CLA4 cla4_2(
        .A(A_in[11:8]),
        .B(B[11:8]),
        .C_in(C[1]),
        .S(S[11:8]),
        .P(P[2]),
        .G(G[2])
    );

    CLA4 cla4_3(
        .A(A_in[15:12]),
        .B(B[15:12]),
        .C_in(C[2]),
        .S(S[15:12]),
        .P(P[3]),
        .G(G[3]),
        .OF(OF)
    );

    // Final carry output
    assign C_out = C_in ? ~C[3] : C[3];

endmodule

module CLG4(
    input [3:0] P, G,
    input C_in,
    output [3:0] C
);

    assign C[0] = G[0] | (P[0] & C_in);
    assign C[1] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C_in);
    assign C[2] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C_in);
    assign C[3] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & C_in);

endmodule

module CLA4(
    input [3:0] A, B,
    input C_in,
    output [3:0] S,
    output P, G,
    output OF
);

    wire [3:0] p, g;
    wire [3:0] c;

    // Generate and propagate signals
    assign p = A ^ B;
    assign g = A & B;

    // Carry calculations
    assign c[0] = C_in;
    assign c[1] = g[0] | (p[0] & c[0]);
    assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]);
    assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c[0]);

    // Sum calculation
    assign S = p ^ c;

    // Group propagate and generate
    assign P = &p;
    assign G = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);

    // Overflow detection
    assign OF = c[3] ^ c[2];

endmodule