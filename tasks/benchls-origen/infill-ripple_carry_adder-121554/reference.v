module origen_121554 #(parameter N = 32) (
    input [N-1:0] a, b,
    output [N-1:0] s,
    output c
);
    wire [N:0] carry;
    assign carry[0] = 1'b0;
    assign c = carry[N];

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : gen_adder
            if (i == 0)
                half_adder ha (.a(a[0]), .b(b[0]), .s(s[0]), .c(carry[1]));
            else
                full_adder fa (.a(a[i]), .b(b[i]), .cin(carry[i]), .s(s[i]), .cout(carry[i+1]));
        end
    endgenerate
endmodule

module fast_adder #(parameter N = 32) (
    input [N-1:0] a, b,
    output [N-1:0] s,
    output c
);
    localparam BLOCKS = (N + 3) / 4;
    wire [BLOCKS:0] carry;
    assign carry[0] = 1'b0;
    assign c = carry[BLOCKS];

    genvar i;
    generate
        for (i = 0; i < BLOCKS; i = i + 1) begin : gen_fast_adder
            localparam WIDTH = (i == BLOCKS - 1 && N % 4 != 0) ? N % 4 : 4;
            fast_adder_4 #(.WIDTH(WIDTH)) fa4 (
                .a(a[4*i +: WIDTH]),
                .b(b[4*i +: WIDTH]),
                .cin(carry[i]),
                .s(s[4*i +: WIDTH]),
                .cout(carry[i+1])
            );
        end
    endgenerate
endmodule

module fast_adder_4 #(parameter WIDTH = 4) (
    input [WIDTH-1:0] a, b,
    input cin,
    output [WIDTH-1:0] s,
    output cout
);
    wire [WIDTH-1:0] p, g;
    wire [WIDTH:0] c;
    assign c[0] = cin;
    assign cout = c[WIDTH];

    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : gen_fa
            full_adder_propagation fa (
                .a(a[i]), .b(b[i]), .cin(c[i]),
                .s(s[i]), .p(p[i]), .g(g[i])
            );
        end
    endgenerate

    assign c[1] = g[0] | (p[0] & cin);
    assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
    assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
    if (WIDTH == 4)
        assign c[4] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & cin);
endmodule

module half_adder (
    input a, b,
    output s, c
);
    assign s = a ^ b;
    assign c = a & b;
endmodule

module full_adder (
    input a, b, cin,
    output s, cout
);
    assign s = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));
endmodule

module full_adder_propagation (
    input a, b, cin,
    output s, p, g
);
    assign s = a ^ b ^ cin;
    assign p = a ^ b;
    assign g = a & b;
endmodule