module origen_135872(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Z,
    output Cout
);

    wire [3:0] C;

    full_adder FA0 (.A(A[0]), .B(B[0]), .Cin(Cin), .S(Z[0]), .Cout(C[0]));
    full_adder FA1 (.A(A[1]), .B(B[1]), .Cin(C[0]), .S(Z[1]), .Cout(C[1]));
    full_adder FA2 (.A(A[2]), .B(B[2]), .Cin(C[1]), .S(Z[2]), .Cout(C[2]));
    [MASKED]

endmodule

module full_adder(
    input A,
    input B,
    input Cin,
    output S,
    output Cout
);

    wire w1, w2, w3, w4;

    xor(w1, A, B);
    xor(S, w1, Cin);
    and(w2, A, B);
    and(w3, A, Cin);
    and(w4, B, Cin);
    or(Cout, w2, w3, w4);

endmodule

module testbench;
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] Z;
    wire Cout;

    four_bit_adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Z(Z),
        .Cout(Cout)
    );

    initial begin
        A = 4'b0101;
        B = 4'b0011;
        Cin = 1'b0;
        #10;
        $display("A = %b, B = %b, Cin = %b", A, B, Cin);
        $display("Z = %b, Cout = %b", Z, Cout);
        ;
    end
endmodule