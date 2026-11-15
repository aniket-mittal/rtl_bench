module origen_065097(
    input a, b, c,
    output s, p, g
);
    assign s = a ^ b ^ c;
    assign p = a ^ b;
    assign g = a & b;
endmodule

module CLA_8bit(
    input [7:0] a, b,
    input cin,
    output [7:0] s,
    output cout, P0, G0
);
    wire [7:0] p, g;
    wire [7:0] c;

    CPG cpg[7:0] (
        .a(a),
        .b(b),
        .c({c[6:0], cin}),
        .s(s),
        .p(p),
        .g(g)
    );

    assign c[0] = cin;
    assign c[1] = g[0] | (p[0] & c[0]);
    assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]);
    assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c[0]);
    assign c[4] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & c[0]);
    assign c[5] = g[4] | (p[4] & g[3]) | (p[4] & p[3] & g[2]) | (p[4] & p[3] & p[2] & g[1]) | (p[4] & p[3] & p[2] & p[1] & g[0]) | (p[4] & p[3] & p[2] & p[1] & p[0] & c[0]);
    assign c[6] = g[5] | (p[5] & g[4]) | (p[5] & p[4] & g[3]) | (p[5] & p[4] & p[3] & g[2]) | (p[5] & p[4] & p[3] & p[2] & g[1]) | (p[5] & p[4] & p[3] & p[2] & p[1] & g[0]) | (p[5] & p[4] & p[3] & p[2] & p[1] & p[0] & c[0]);
    assign c[7] = g[6] | (p[6] & g[5]) | (p[6] & p[5] & g[4]) | (p[6] & p[5] & p[4] & g[3]) | (p[6] & p[5] & p[4] & p[3] & g[2]) | (p[6] & p[5] & p[4] & p[3] & p[2] & g[1]) | (p[6] & p[5] & p[4] & p[3] & p[2] & p[1] & g[0]) | (p[6] & p[5] & p[4] & p[3] & p[2] & p[1] & p[0] & c[0]);

    assign cout = g[7] | (p[7] & g[6]) | (p[7] & p[6] & g[5]) | (p[7] & p[6] & p[5] & g[4]) | (p[7] & p[6] & p[5] & p[4] & g[3]) | (p[7] & p[6] & p[5] & p[4] & p[3] & g[2]) | (p[7] & p[6] & p[5] & p[4] & p[3] & p[2] & g[1]) | (p[7] & p[6] & p[5] & p[4] & p[3] & p[2] & p[1] & g[0]) | (p[7] & p[6] & p[5] & p[4] & p[3] & p[2] & p[1] & p[0] & c[0]);

    assign P0 = &p;
    assign G0 = g[7] | (p[7] & g[6]) | (p[7] & p[6] & g[5]) | (p[7] & p[6] & p[5] & g[4]) | (p[7] & p[6] & p[5] & p[4] & g[3]) | (p[7] & p[6] & p[5] & p[4] & p[3] & g[2]) | (p[7] & p[6] & p[5] & p[4] & p[3] & p[2] & g[1]) | (p[7] & p[6] & p[5] & p[4] & p[3] & p[2] & p[1] & g[0]);
endmodule

module CLA_32bit(
    input [31:0] a, b,
    input cin,
    output [31:0] s,
    output cout
);
    wire [3:0] P, G;
    wire [3:0] c;

    CLA_8bit cla0(
        .a(a[7:0]),
        .b(b[7:0]),
        .cin(cin),
        .s(s[7:0]),
        .cout(c[0]),
        .P0(P[0]),
        .G0(G[0])
    );

    CLA_8bit cla1(
        .a(a[15:8]),
        .b(b[15:8]),
        .cin(c[0]),
        .s(s[15:8]),
        .cout(c[1]),
        .P0(P[1]),
        .G0(G[1])
    );

    CLA_8bit cla2(
        .a(a[23:16]),
        .b(b[23:16]),
        .cin(c[1]),
        .s(s[23:16]),
        .cout(c[2]),
        .P0(P[2]),
        .G0(G[2])
    );

    CLA_8bit cla3(
        .a(a[31:24]),
        .b(b[31:24]),
        .cin(c[2]),
        .s(s[31:24]),
        .cout(cout),
        .P0(P[3]),
        .G0(G[3])
    );

    // Block-level carry lookahead logic
    assign c[1] = G[0] | (P[0] & cin);
    assign c[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & cin);
    assign c[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & cin);
    assign cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & cin);
endmodule