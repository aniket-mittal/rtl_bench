module origen_058581(
    input [3:0] a,
    input [3:0] b,
    input carryin,
    output [3:0] sum,
    output cout
);
    wire [3:0] c;
    
    fa fa0(.a(a[0]), .b(b[0]), .c(carryin), .su(sum[0]), .cout(c[0]));
    fa fa1(.a(a[1]), .b(b[1]), .c(c[0]), .su(sum[1]), .cout(c[1]));
    fa fa2(.a(a[2]), .b(b[2]), .c(c[1]), .su(sum[2]), .cout(c[2]));
    fa fa3(.a(a[3]), .b(b[3]), .c(c[2]), .su(sum[3]), .cout(cout));
endmodule

module fa(
    input a,
    input b,
    input c,
    output su,
    output cout
);
    assign su = a ^ b ^ c;
    assign cout = (a & b) | (b & c) | (c & a);
endmodule

