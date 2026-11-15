module origen_034879(
    input x, y,
    output S, C
);
    assign S = x ^ y;
    assign C = x & y;
endmodule

module full_adder(
    input x, y, z,
    output S, C
);
    wire S1, C1, C2;
    
    half_adder HA1(.x(x), .y(y), .S(S1), .C(C1));
    half_adder HA2(.x(S1), .y(z), .S(S), .C(C2));
    assign C = C1 | C2;
endmodule

module adder_4bit(
    input c,
    input [3:0] A, B,
    output [3:0] S,
    output C
);
    wire [3:0] carry;
    
    full_adder FA0(.x(A[0]), .y(B[0]), .z(c), .S(S[0]), .C(carry[0]));
    full_adder FA1(.x(A[1]), .y(B[1]), .z(carry[0]), .S(S[1]), .C(carry[1]));
    full_adder FA2(.x(A[2]), .y(B[2]), .z(carry[1]), .S(S[2]), .C(carry[2]));
    full_adder FA3(.x(A[3]), .y(B[3]), .z(carry[2]), .S(S[3]), .C(carry[3]));
    
    assign C = carry[3];
endmodule

module addsuber_4bit(
    input M,
    input [3:0] A, B,
    output [3:0] S,
    output C
);
    wire [3:0] B_xor;
    
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : xor_gen
            assign B_xor[i] = B[i] ^ M;
        end
    endgenerate
    
    adder_4bit adder(
        .c(M),
        .A(A),
        .B(B_xor),
        .S(S),
        .C(C)
    );
endmodule