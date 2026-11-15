module origen_017731(
    input [3:0] x,
    input [3:0] y,
    output l,
    output g,
    output e
);

    wire l1, g1, e1, l2, g2, e2;

    comp2bit stage0 (
        .x1(x[1]),
        .x0(x[0]),
        .y1(y[1]),
        .y0(y[0]),
        .l(l1),
        .g(g1),
        .e(e1)
    );

    comp2bit stage1 (
        .x1(x[3]),
        .x0(x[2]),
        .y1(y[3]),
        .y0(y[2]),
        .l(l2),
        .g(g2),
        .e(e2)
    );

    assign e = e1 & e2;
    assign g = g2 | (e2 & g1);
    assign l = l2 | (e2 & l1);

endmodule

module comp2bit(
    input x1,
    input x0,
    input y1,
    input y0,
    output l,
    output g,
    output e
);

    wire i1, i0;

    xnor (i1, x1, y1);
    xnor (i0, x0, y0);

    and (e, i1, i0);

    wire t1, t2;
    and (t1, x1, ~y1);
    and (t2, i1, x0, ~y0);
    or (g, t1, t2);

    nor (l, g, e);

endmodule