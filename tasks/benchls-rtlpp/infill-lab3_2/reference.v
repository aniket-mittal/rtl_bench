module comparator2bit(x, y, xlty, xeqy, xgty);
    input [1:0] x, y;
    output xeqy, xlty, xgty;
    wire i1, i0;

    assign i1 = ~(x[1] ^ y[1]);
    assign i0 = ~(x[0] ^ y[0]);
    assign xeqy = i1 & i0;
    assign xgty = (x[1] & ~y[1]) | (i1 & x[0] & ~y[0]);
    assign xlty = ~(xeqy | xgty);
endmodule

module lab3_2(x, y, xlty, xeqy, xgty);
    input [3:0] x, y;
    output xeqy, xlty, xgty;
    wire e1, e2, g1, g2, l1, l2;

    comparator2bit stage0(.x(x[3:2]), .y(y[3:2]), .xlty(l1), .xeqy(e1), .xgty(g1));
    comparator2bit stage1(.x(x[1:0]), .y(y[1:0]), .xlty(l2), .xeqy(e2), .xgty(g2));

    assign xeqy = e1 & e2;
    assign xgty = g1 | (e1 & g2);
    assign xlty = l1 | (e1 & l2);
endmodule