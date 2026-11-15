module origen_142694(
    input [3:0] A,
    input [3:0] B,
    input C,
    output [3:0] S,
    output Cout
);

    wire [3:0] B_xor;
    wire [4:0] sum;

    // XOR B with C for subtraction
    assign B_xor = B ^ {4{C}};

    // Perform addition
    assign sum = A + B_xor + C;

    // Assign outputs
    assign S = sum[3:0];
    [MASKED]

endmodule

module testbench;
    reg [3:0] A, B;
    reg C;
    wire [3:0] S;
    wire Cout;

    adder_subtractor uut (
        .A(A),
        .B(B),
        .C(C),
        .S(S),
        .Cout(Cout)
    );

    initial begin
        // Test case 1: Addition
        A = 4'b0101; B = 4'b0011; C = 0;
        #10;
        $display("Addition: %b + %b = %b, Cout = %b", A, B, S, Cout);

        // Test case 2: Subtraction
        A = 4'b1000; B = 4'b0011; C = 1;
        #10;
        $display("Subtraction: %b - %b = %b, Cout = %b", A, B, S, Cout);

        // Test case 3: Addition with overflow
        A = 4'b1111; B = 4'b0001; C = 0;
        #10;
        $display("Addition with overflow: %b + %b = %b, Cout = %b", A, B, S, Cout);

        // Test case 4: Subtraction with borrow
        A = 4'b0010; B = 4'b0011; C = 1;
        #10;
        $display("Subtraction with borrow: %b - %b = %b, Cout = %b", A, B, S, Cout);

        ;
    end
endmodule