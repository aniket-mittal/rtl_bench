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
    assign Cout = sum[4];

endmodule

