module origen_060729(
    input a, b, cin,
    output sum, cout
);
    wire w1, w2, w3;
    
    xor #(2) g1(w1, a, b);
    xor #(2) g2(sum, w1, cin);
    and #(1) g3(w2, a, b);
    and #(1) g4(w3, w1, cin);
    or  #(1) g5(cout, w2, w3);
endmodule

module add16_rc(
    input [15:0] a16, b16,
    input cin,
    output [15:0] sum16,
    output cout
);
    wire [16:0] c;
    assign c[0] = cin;
    
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : fa_loop
            full_adder fa(
                .a(a16[i]),
                .b(b16[i]),
                .cin(c[i]),
                .sum(sum16[i]),
                .cout(c[i+1])
            );
        end
    endgenerate
    
    assign cout = c[16];
endmodule

module full_adder_pg(
    input a, b, cin,
    output sum, cout, p, g
);
    assign p = a ^ b;
    assign g = a & b;
    assign sum = p ^ cin;
    assign cout = g | (p & cin);
endmodule

module carry_generator(
    input [3:0] p, g,
    input cin,
    output [3:0] cout
);
    wire [3:0] c;
    
    assign #(1) c[0] = cin;
    assign #(2) c[1] = g[0] | (p[0] & c[0]);
    assign #(3) c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]);
    assign #(4) c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c[0]);
    
    assign cout = c;
endmodule

module add4_cla(
    input [3:0] a4, b4,
    input cin,
    output [3:0] sum4,
    output cout
);
    wire [3:0] p, g, c;
    
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : fa_pg_loop
            full_adder_pg fa_pg(
                .a(a4[i]),
                .b(b4[i]),
                .cin(c[i]),
                .sum(),
                .cout(),
                .p(p[i]),
                .g(g[i])
            );
        end
    endgenerate
    
    carry_generator cg(
        .p(p),
        .g(g),
        .cin(cin),
        .cout(c)
    );
    
    assign #(2) sum4[0] = p[0] ^ cin;
    assign #(2) sum4[1] = p[1] ^ c[0];
    assign #(2) sum4[2] = p[2] ^ c[1];
    assign #(2) sum4[3] = p[3] ^ c[2];
    assign cout = c[3];
endmodule

module add16_cla(
    input [15:0] a16, b16,
    input cin,
    output [15:0] sum16,
    output cout
);
    wire [4:0] c;
    assign c[0] = cin;
    
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : cla4_loop
            add4_cla cla4(
                .a4(a16[4*i+3:4*i]),
                .b4(b16[4*i+3:4*i]),
                .cin(c[i]),
                .sum4(sum16[4*i+3:4*i]),
                .cout(c[i+1])
            );
        end
    endgenerate
    
    assign cout = c[4];
endmodule