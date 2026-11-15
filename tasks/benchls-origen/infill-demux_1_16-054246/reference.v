module origen_054246 (
    input [15:0] v,
    input s,
    output [15:0] a0,
    output [15:0] a1
);
    assign a0 = (s == 0) ? v : 16'bx;
    assign a1 = (s == 1) ? v : 16'bx;
endmodule

module DEMUX_1_4 (
    input [15:0] v,
    input [1:0] s,
    output [15:0] a0,
    output [15:0] a1,
    output [15:0] a2,
    output [15:0] a3
);
    wire [15:0] w0, w1;

    DEMUX_1_2 demux_level1 (
        .v(v),
        .s(s[1]),
        .a0(w0),
        .a1(w1)
    );

    DEMUX_1_2 demux_level2_0 (
        .v(w0),
        .s(s[0]),
        .a0(a0),
        .a1(a1)
    );

    DEMUX_1_2 demux_level2_1 (
        .v(w1),
        .s(s[0]),
        .a0(a2),
        .a1(a3)
    );
endmodule

module DEMUX_1_16 (
    input [15:0] v,
    input [3:0] s,
    output [15:0] a0,
    output [15:0] a1,
    output [15:0] a2,
    output [15:0] a3,
    output [15:0] a4,
    output [15:0] a5,
    output [15:0] a6,
    output [15:0] a7,
    output [15:0] a8,
    output [15:0] a9,
    output [15:0] a10,
    output [15:0] a11,
    output [15:0] a12,
    output [15:0] a13,
    output [15:0] a14,
    output [15:0] a15
);
    wire [15:0] w0, w1, w2, w3;

    DEMUX_1_4 demux_master (
        .v(v),
        .s(s[3:2]),
        .a0(w0),
        .a1(w1),
        .a2(w2),
        .a3(w3)
    );

    DEMUX_1_4 demux_branch0 (
        .v(w0),
        .s(s[1:0]),
        .a0(a0),
        .a1(a1),
        .a2(a2),
        .a3(a3)
    );

    DEMUX_1_4 demux_branch1 (
        .v(w1),
        .s(s[1:0]),
        .a0(a4),
        .a1(a5),
        .a2(a6),
        .a3(a7)
    );

    DEMUX_1_4 demux_branch2 (
        .v(w2),
        .s(s[1:0]),
        .a0(a8),
        .a1(a9),
        .a2(a10),
        .a3(a11)
    );

    DEMUX_1_4 demux_branch3 (
        .v(w3),
        .s(s[1:0]),
        .a0(a12),
        .a1(a13),
        .a2(a14),
        .a3(a15)
    );
endmodule