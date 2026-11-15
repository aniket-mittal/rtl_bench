module origen_137353(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
);

    wire [3:0] carry;
    
    // Full adder for bit 0
    wire xor0, and0;
    xor(xor0, a[0], b[0]);
    xor(sum[0], xor0, cin);
    and(and0, a[0], b[0]);
    mux2to1 mux0(.a(cin), .b(1'b1), .sel(xor0), .y(carry[0]));
    
    // Full adder for bit 1
    wire xor1, and1;
    xor(xor1, a[1], b[1]);
    xor(sum[1], xor1, carry[0]);
    and(and1, a[1], b[1]);
    mux2to1 mux1(.a(carry[0]), .b(1'b1), .sel(xor1), .y(carry[1]));
    
    // Full adder for bit 2
    wire xor2, and2;
    xor(xor2, a[2], b[2]);
    xor(sum[2], xor2, carry[1]);
    and(and2, a[2], b[2]);
    mux2to1 mux2(.a(carry[1]), .b(1'b1), .sel(xor2), .y(carry[2]));
    
    // Full adder for bit 3
    wire xor3, and3;
    xor(xor3, a[3], b[3]);
    xor(sum[3], xor3, carry[2]);
    and(and3, a[3], b[3]);
    mux2to1 mux3(.a(carry[2]), .b(1'b1), .sel(xor3), .y(carry[3]));
    
    // Final carry out
    assign cout = carry[3];

endmodule

// 2-to-1 multiplexer
module mux2to1(
    input a,
    input b,
    input sel,
    output y
);
    wire not_sel, and1, and2;
    
    not(not_sel, sel);
    and(and1, a, not_sel);
    and(and2, b, sel);
    or(y, and1, and2);
    
endmodule