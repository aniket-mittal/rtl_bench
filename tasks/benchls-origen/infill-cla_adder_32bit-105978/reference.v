module origen_105978(
    input [31:0] A,
    input [31:0] B,
    output [31:0] Sum,
    output C
);

    wire [7:0] Cout;
    wire [7:0] Pout, Gout;

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : cla_blocks
            CLA_4bit cla_4bit_inst (
                .A(A[4*i+3:4*i]),
                .B(B[4*i+3:4*i]),
                .Cin(i == 0 ? 1'b0 : Cout[i-1]),
                .Sum(Sum[4*i+3:4*i]),
                .Cout(Cout[i]),
                .Pout(Pout[i]),
                .Gout(Gout[i])
            );
        end
    endgenerate

    assign C = Cout[7];

endmodule

module CLA_4bit(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Sum,
    output Cout,
    output Pout,
    output Gout
);

    wire [3:0] G, P;
    wire [3:0] C;

    // Generate and Propagate
    assign G = A & B;
    assign P = A ^ B;

    // Carry Lookahead
    assign C[0] = Cin;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
    assign Cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & C[0]);

    // Sum
    assign Sum = P ^ {C[3:1], C[0]};

    // Group Propagate and Generate
    assign Pout = &P;
    assign Gout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);

endmodule