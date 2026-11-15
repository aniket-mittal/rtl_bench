module origen_118956(
    input [15:0] A, B,
    output [15:0] Sum,
    output CO
);
    wire [3:0] C;
    wire [3:0] PG, GG;

    cla_4 cla0(.A(A[3:0]), .B(B[3:0]), .c_in(1'b0), .Sum(Sum[3:0]), .PG(PG[0]), .GG(GG[0]));
    cla_4 cla1(.A(A[7:4]), .B(B[7:4]), .c_in(C[1]), .Sum(Sum[7:4]), .PG(PG[1]), .GG(GG[1]));
    cla_4 cla2(.A(A[11:8]), .B(B[11:8]), .c_in(C[2]), .Sum(Sum[11:8]), .PG(PG[2]), .GG(GG[2]));
    cla_4 cla3(.A(A[15:12]), .B(B[15:12]), .c_in(C[3]), .Sum(Sum[15:12]), .PG(PG[3]), .GG(GG[3]));

    carry_lookahead_unit_4 clu(.P(PG), .G(GG), .c_in(1'b0), .C(C));

    assign CO = GG[3] | (PG[3] & C[3]);
endmodule

module cla_4(
    input [3:0] A, B,
    input c_in,
    output [3:0] Sum,
    output PG, GG
);
    wire [3:0] P, G;
    wire [3:0] C;

    full_adder_pg fa0(.A(A[0]), .B(B[0]), .c_in(c_in), .S(Sum[0]), .P(P[0]), .G(G[0]));
    full_adder_pg fa1(.A(A[1]), .B(B[1]), .c_in(C[1]), .S(Sum[1]), .P(P[1]), .G(G[1]));
    full_adder_pg fa2(.A(A[2]), .B(B[2]), .c_in(C[2]), .S(Sum[2]), .P(P[2]), .G(G[2]));
    full_adder_pg fa3(.A(A[3]), .B(B[3]), .c_in(C[3]), .S(Sum[3]), .P(P[3]), .G(G[3]));

    carry_lookahead_unit_4 clu(.P(P), .G(G), .c_in(c_in), .C(C));

    assign PG = P[3] & P[2] & P[1] & P[0];
    assign GG = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);
endmodule

module full_adder_pg(
    input A, B, c_in,
    output S, P, G
);
    assign S = A ^ B ^ c_in;
    assign P = A ^ B;
    assign G = A & B;
endmodule

module carry_lookahead_unit_4(
    input [3:0] P, G,
    input c_in,
    output [3:0] C
);
    assign C[0] = c_in;
    assign C[1] = G[0] | (P[0] & c_in);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & c_in);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & c_in);
endmodule