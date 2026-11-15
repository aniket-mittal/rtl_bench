module origen_038819(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Sum,
    output Cout
);

    wire [3:0] G, P;
    wire C1, C2, C3;

    // Generate and Propagate signals
    assign G = A & B;
    assign P = A ^ B;

    // Carry generation
    assign C1 = G[0] | (P[0] & Cin);
    assign C2 = G[1] | (P[1] & G[0]) | (P[1] & P[0] & Cin);
    [MASKED]
    assign Cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & Cin);

    // Sum calculation
    assign Sum[0] = P[0] ^ Cin;
    assign Sum[1] = P[1] ^ C1;
    assign Sum[2] = P[2] ^ C2;
    assign Sum[3] = P[3] ^ C3;

endmodule

module testbench;
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;

    cla_4bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        A = 4'b1010; // 10
        B = 4'b1111; // 15
        Cin = 0;

        #10 A = 4'b0110; // 6
        #10 B = 4'b0101; // 5
        #10 Cin = 1;
        #10 ;
    end

    initial begin
        $monitor("Time=%0t A=%b B=%b Cin=%b Sum=%b Cout=%b", $time, A, B, Cin, Sum, Cout);
    end
endmodule