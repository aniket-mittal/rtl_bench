module origen_077204(SW, LEDR);
    input [9:0] SW;
    output [9:0] LEDR;
    
    wire [3:0] sum;
    wire cout;
    
    four_bit_adder adder(
        .Sub0(SW[0]),
        .Sub1(SW[0]),
        .A(SW[4:1]),
        .B(SW[8:5]),
        .S(sum),
        .cout(cout)
    );
    
    assign LEDR[3:0] = sum;
    assign LEDR[4] = cout;
    assign LEDR[9:5] = 5'b00000;
endmodule

module four_bit_adder(Sub0, Sub1, A, B, S, cout);
    input Sub0, Sub1;
    input [3:0] A, B;
    output [3:0] S;
    output cout;
    
    wire [3:0] carry;
    
    four_bit_adder_piece adder0(.a(A[0]), .b(B[0]), .cin0(Sub0), .cin1(Sub1), .s(S[0]), .cout(carry[0]));
    four_bit_adder_piece adder1(.a(A[1]), .b(B[1]), .cin0(Sub0), .cin1(carry[0]), .s(S[1]), .cout(carry[1]));
    four_bit_adder_piece adder2(.a(A[2]), .b(B[2]), .cin0(Sub0), .cin1(carry[1]), .s(S[2]), .cout(carry[2]));
    four_bit_adder_piece adder3(.a(A[3]), .b(B[3]), .cin0(Sub0), .cin1(carry[2]), .s(S[3]), .cout(carry[3]));
    
    assign cout = carry[3];
endmodule

module four_bit_adder_piece(a, b, cin0, cin1, s, cout);
    input a, b, cin0, cin1;
    output s, cout;
    
    wire b_xor_cin0, sum;
    
    assign b_xor_cin0 = b ^ cin0;
    assign sum = a ^ b_xor_cin0 ^ cin1;
    
    mux2to1 mux(
        .x(b_xor_cin0),
        .y(cin1),
        .sel(a),
        .m(cout)
    );
    
    assign s = sum;
endmodule

module mux2to1(x, y, sel, m);
    input x, y, sel;
    output m;
    
    assign m = (sel) ? y : x;
endmodule