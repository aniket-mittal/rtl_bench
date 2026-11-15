module origen_045147(
    input [3:0] A,
    input [3:0] B,
    output [7:0] product
);

    wire [3:0] a0b, a1b, a2b, a3b;
    wire c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10;
    wire s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11;

    // Generate partial products
    assign a0b = A[0] ? B : 4'b0000;
    assign a1b = A[1] ? B : 4'b0000;
    assign a2b = A[2] ? B : 4'b0000;
    assign a3b = A[3] ? B : 4'b0000;

    // First row
    assign product[0] = a0b[0];
    half_adder HA1(a0b[1], a1b[0], product[1], c0);
    full_adder FA1(a0b[2], a1b[1], a2b[0], s1, c1);
    full_adder FA2(a0b[3], a1b[2], a2b[1], s2, c2);

    // Second row
    half_adder HA2(s1, c0, product[2], c3);
    full_adder FA3(s2, a3b[0], c1, s3, c4);
    full_adder FA4(a1b[3], a2b[2], a3b[1], s4, c5);

    // Third row
    half_adder HA3(s3, c3, product[3], c6);
    full_adder FA5(s4, c2, c4, s5, c7);
    full_adder FA6(a2b[3], a3b[2], c5, s6, c8);

    // Fourth row
    half_adder HA4(s5, c6, product[4], c9);
    full_adder FA7(s6, c7, c9, product[5], c10);
    full_adder FA8(a3b[3], c8, c10, product[6], product[7]);

endmodule

module half_adder(
    input a,
    input b,
    output sum,
    output cout
);
    assign sum = a ^ b;
    assign cout = a & b;
endmodule

module full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule