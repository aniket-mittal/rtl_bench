module origen_120399(
    input [3:0] A, B,
    input carryIn,
    output [3:0] Sum,
    output carryOut, PG, GG
);
    wire [3:0] G, P, C;
    
    // Generate and Propagate
    assign G = A & B;
    assign P = A ^ B;
    
    // Carry Look-ahead logic
    assign C[0] = carryIn;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
    assign carryOut = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & C[0]);
    
    // Sum
    assign Sum = P ^ C;
    
    // Group Propagate and Generate
    assign PG = P[3] & P[2] & P[1] & P[0];
    assign GG = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);
endmodule

module CLA8Bit(
    input [7:0] A, B,
    input carryIn,
    output [7:0] Sum,
    output carryOut
);
    wire C3, PG1, GG1, PG2, GG2;
    
    CLA4Bit block1(
        .A(A[3:0]),
        .B(B[3:0]),
        .carryIn(carryIn),
        .Sum(Sum[3:0]),
        .carryOut(C3),
        .PG(PG1),
        .GG(GG1)
    );
    
    CLA4Bit block2(
        .A(A[7:4]),
        .B(B[7:4]),
        .carryIn(C3),
        .Sum(Sum[7:4]),
        .carryOut(carryOut),
        .PG(PG2),
        .GG(GG2)
    );
endmodule