module origen_078292(
    input [63:0] A,
    input [63:0] B,
    input Cin,
    output [63:0] S,
    output Cout
);
    wire [6:0] c;

    kogge_8 k0(.A(A[7:0]), .B(B[7:0]), .Cin(Cin), .S(S[7:0]), .Cout(c[0]));
    kogge_8 k1(.A(A[15:8]), .B(B[15:8]), .Cin(c[0]), .S(S[15:8]), .Cout(c[1]));
    kogge_8 k2(.A(A[23:16]), .B(B[23:16]), .Cin(c[1]), .S(S[23:16]), .Cout(c[2]));
    kogge_8 k3(.A(A[31:24]), .B(B[31:24]), .Cin(c[2]), .S(S[31:24]), .Cout(c[3]));
    kogge_8 k4(.A(A[39:32]), .B(B[39:32]), .Cin(c[3]), .S(S[39:32]), .Cout(c[4]));
    kogge_8 k5(.A(A[47:40]), .B(B[47:40]), .Cin(c[4]), .S(S[47:40]), .Cout(c[5]));
    kogge_8 k6(.A(A[55:48]), .B(B[55:48]), .Cin(c[5]), .S(S[55:48]), .Cout(c[6]));
    kogge_8 k7(.A(A[63:56]), .B(B[63:56]), .Cin(c[6]), .S(S[63:56]), .Cout(Cout));
endmodule

module kogge_8(
    input [7:0] A,
    input [7:0] B,
    input Cin,
    output [7:0] S,
    output Cout
);
    wire c;

    kogge k0(.A(A[3:0]), .B(B[3:0]), .Cin(Cin), .S(S[3:0]), .Cout(c));
    kogge k1(.A(A[7:4]), .B(B[7:4]), .Cin(c), .S(S[7:4]), .Cout(Cout));
endmodule

module kogge(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] S,
    output Cout
);
    wire [3:0] P, G;
    wire [3:0] C;

    // Generate P and G signals
    assign P = A ^ B;
    assign G = A & B;

    // Compute carries
    assign C[0] = Cin;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
    assign Cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & C[0]);

    // Compute sum
    assign S = P ^ {C[3:1], C[0]};
endmodule