module origen_011732(
    input A, B, C,
    output G, P, S
);
    assign G = A & B;
    assign P = A ^ B;
    assign S = P ^ C;
endmodule

module CLA(
    input [3:0] P, G,
    input Cin,
    output [3:0] Cout
);
    assign Cout[0] = G[0] | (P[0] & Cin);
    assign Cout[1] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & Cin);
    assign Cout[2] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & Cin);
    assign Cout[3] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & Cin);
endmodule

module CLAA_4bit(
    input [3:0] A, B,
    input Cin,
    output [3:0] S,
    output Cout, Gg, Pg
);
    wire [3:0] G, P, C;
    
    pfull_adder FA0(A[0], B[0], Cin, G[0], P[0], S[0]);
    pfull_adder FA1(A[1], B[1], C[0], G[1], P[1], S[1]);
    pfull_adder FA2(A[2], B[2], C[1], G[2], P[2], S[2]);
    pfull_adder FA3(A[3], B[3], C[2], G[3], P[3], S[3]);
    
    CLA cla(P, G, Cin, C);
    
    assign Cout = C[3];
    assign Gg = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);
    assign Pg = P[3] & P[2] & P[1] & P[0];
endmodule

module CLAA_16bit(
    input [15:0] A, B,
    input Cin,
    output [15:0] S,
    output Cout
);
    wire [3:0] Gg, Pg, C;
    
    CLAA_4bit CLAA0(A[3:0], B[3:0], Cin, S[3:0], C[0], Gg[0], Pg[0]);
    CLAA_4bit CLAA1(A[7:4], B[7:4], C[0], S[7:4], C[1], Gg[1], Pg[1]);
    CLAA_4bit CLAA2(A[11:8], B[11:8], C[1], S[11:8], C[2], Gg[2], Pg[2]);
    CLAA_4bit CLAA3(A[15:12], B[15:12], C[2], S[15:12], C[3], Gg[3], Pg[3]);
    
    CLA cla(Pg, Gg, Cin, C);
    
    assign Cout = C[3];
endmodule