module origen_132085 (
    input wire i_0r,
    input wire reset,
    input wire i_0a,
    output wire o_0r,
    output wire o_1r,
    output wire o_2r,
    output wire o_3r,
    output wire [1:0] o_0a,
    output wire [1:0] o_1a,
    output wire o_4r,
    output wire o_4a
);

    // Internal wires
    wire tech6_int;
    wire [1:0] simp11_0;
    wire o_2a, o_3a;

    // Buffer i_0r to produce o_0r, o_1r, o_2r, o_3r, and o_4r
    assign o_0r = i_0r;
    assign o_1r = i_0r;
    assign o_2r = i_0r;
    assign o_3r = i_0r;
    assign o_4r = i_0r;

    // AO222EHD gate for o_0a and o_1a
    wire ao222ehd_out1;
    AO222EHD ao222ehd_1 (
        .X(ao222ehd_out1),
        .A1(tech6_int),
        .A2(o_0a[0]),
        .B1(tech6_int),
        .B2(o_1a[0]),
        .C1(1'b0),
        .C2(1'b0)
    );

    AO222EHD ao222ehd_2 (
        .X(o_0a[1]),
        .A1(o_0a[0]),
        .A2(o_1a[0]),
        .B1(ao222ehd_out1),
        .B2(1'b1),
        .C1(1'b0),
        .C2(1'b0)
    );

    assign o_1a = o_0a;

    // AO222EHD gate for o_2a
    wire ao222ehd_out2;
    AO222EHD ao222ehd_3 (
        .X(ao222ehd_out2),
        .A1(tech6_int),
        .A2(o_2a),
        .B1(simp11_0[0]),
        .B2(1'b1),
        .C1(1'b0),
        .C2(1'b0)
    );

    AO222EHD ao222ehd_4 (
        .X(simp11_0[1]),
        .A1(o_3a),
        .A2(o_4a),
        .B1(simp11_0[1]),
        .B2(1'b1),
        .C1(1'b0),
        .C2(1'b0)
    );

    AO222EHD ao222ehd_5 (
        .X(o_2a),
        .A1(o_2a),
        .A2(tech6_int),
        .B1(ao222ehd_out2),
        .B2(1'b1),
        .C1(1'b0),
        .C2(1'b0)
    );

    // AO222EHD gate for o_4a
    AO222EHD ao222ehd_6 (
        .X(o_4a),
        .A1(i_0a),
        .A2(simp11_0[0]),
        .B1(simp11_0[1]),
        .B2(1'b1),
        .C1(1'b0),
        .C2(1'b0)
    );

endmodule

module AO222EHD (X, A1, A2, B1, B2, C1, C2);
    output X;
    input A1, A2, B1, B2, C1, C2;
    assign X = (A1 & A2) | (B1 & B2) | (C1 & C2);
endmodule