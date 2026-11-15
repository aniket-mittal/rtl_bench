module origen_082076(
    input [31:0] a,
    input [31:0] b,
    input c_in,
    output [31:0] s
);
    wire g_out, p_out;
    cla_32 cla32_inst(a, b, c_in, s, g_out, p_out);
endmodule

module cla_32(
    input [31:0] a,
    input [31:0] b,
    input c_in,
    output [31:0] s,
    output g_out,
    output p_out
);
    wire [1:0] g, p;
    wire c_mid;

    cla_16 cla16_low(a[15:0], b[15:0], c_in, s[15:0], g[0], p[0]);
    cla_16 cla16_high(a[31:16], b[31:16], c_mid, s[31:16], g[1], p[1]);
    gp gp_inst(g, p, c_in, g_out, p_out, c_mid);
endmodule

module cla_16(
    input [15:0] a,
    input [15:0] b,
    input c_in,
    output [15:0] s,
    output g_out,
    output p_out
);
    wire [1:0] g, p;
    wire c_mid;

    cla_8 cla8_low(a[7:0], b[7:0], c_in, s[7:0], g[0], p[0]);
    cla_8 cla8_high(a[15:8], b[15:8], c_mid, s[15:8], g[1], p[1]);
    gp gp_inst(g, p, c_in, g_out, p_out, c_mid);
endmodule

module cla_8(
    input [7:0] a,
    input [7:0] b,
    input c_in,
    output [7:0] s,
    output g_out,
    output p_out
);
    wire [1:0] g, p;
    wire c_mid;

    cla_4 cla4_low(a[3:0], b[3:0], c_in, s[3:0], g[0], p[0]);
    cla_4 cla4_high(a[7:4], b[7:4], c_mid, s[7:4], g[1], p[1]);
    gp gp_inst(g, p, c_in, g_out, p_out, c_mid);
endmodule

module cla_4(
    input [3:0] a,
    input [3:0] b,
    input c_in,
    output [3:0] s,
    output g_out,
    output p_out
);
    wire [1:0] g, p;
    wire c_mid;

    cla_2 cla2_low(a[1:0], b[1:0], c_in, s[1:0], g[0], p[0]);
    cla_2 cla2_high(a[3:2], b[3:2], c_mid, s[3:2], g[1], p[1]);
    gp gp_inst(g, p, c_in, g_out, p_out, c_mid);
endmodule

module cla_2(
    input [1:0] a,
    input [1:0] b,
    input c_in,
    output [1:0] s,
    output g_out,
    output p_out
);
    wire [1:0] g, p;
    wire c_mid;

    add add_low(a[0], b[0], c_in, g[0], p[0], s[0]);
    add add_high(a[1], b[1], c_mid, g[1], p[1], s[1]);
    gp gp_inst(g, p, c_in, g_out, p_out, c_mid);
endmodule

module gp(
    input [1:0] g,
    input [1:0] p,
    input c_in,
    output g_out,
    output p_out,
    output c_out
);
    assign g_out = g[1] | (p[1] & g[0]);
    assign p_out = p[1] & p[0];
    assign c_out = g[0] | (p[0] & c_in);
endmodule

module add(
    input a,
    input b,
    input c,
    output g,
    output p,
    output s
);
    assign g = a & b;
    assign p = a | b;
    assign s = a ^ b ^ c;
endmodule