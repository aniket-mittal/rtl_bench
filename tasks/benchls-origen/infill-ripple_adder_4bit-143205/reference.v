module origen_143205(
    input wire [3:0] A,
    input wire [3:0] B,
    input wire Cin,
    input wire reset,
    output reg [3:0] Sum,
    output reg Cout
);

    wire [3:0] carry;
    wire [3:0] sum_temp;

    // Full adder for bit 0
    wire fa0_sum, fa0_cout;
    full_adder fa0(
        .a(A[0]),
        .b(B[0]),
        .cin(Cin),
        .sum(fa0_sum),
        .cout(fa0_cout)
    );

    // Full adder for bit 1
    wire fa1_sum, fa1_cout;
    full_adder fa1(
        .a(A[1]),
        .b(B[1]),
        .cin(fa0_cout),
        .sum(fa1_sum),
        .cout(fa1_cout)
    );

    // Full adder for bit 2
    wire fa2_sum, fa2_cout;
    full_adder fa2(
        .a(A[2]),
        .b(B[2]),
        .cin(fa1_cout),
        .sum(fa2_sum),
        .cout(fa2_cout)
    );

    // Full adder for bit 3
    wire fa3_sum, fa3_cout;
    full_adder fa3(
        .a(A[3]),
        .b(B[3]),
        .cin(fa2_cout),
        .sum(fa3_sum),
        .cout(fa3_cout)
    );

    assign sum_temp = {fa3_sum, fa2_sum, fa1_sum, fa0_sum};
    assign carry = {fa3_cout, fa2_cout, fa1_cout, fa0_cout};

    always @(*) begin
        if (reset) begin
            Sum <= 4'b0000;
            Cout <= 1'b0;
        end else begin
            Sum <= sum_temp;
            Cout <= carry[3];
        end
    end

endmodule

module full_adder(
    input wire a,
    input wire b,
    input wire cin,
    output wire sum,
    output wire cout
);
    wire w1, w2, w3;

    // sum = a XOR b XOR cin
    xor_gate xor1(a, b, w1);
    xor_gate xor2(w1, cin, sum);

    // cout = (a AND b) OR (cin AND (a XOR b))
    and_gate and1(a, b, w2);
    and_gate and2(cin, w1, w3);
    or_gate or1(w2, w3, cout);

endmodule

module xor_gate(
    input wire a,
    input wire b,
    output wire out
);
    assign out = (a & ~b) | (~a & b);
endmodule

module and_gate(
    input wire a,
    input wire b,
    output wire out
);
    assign out = a & b;
endmodule

module or_gate(
    input wire a,
    input wire b,
    output wire out
);
    assign out = a | b;
endmodule