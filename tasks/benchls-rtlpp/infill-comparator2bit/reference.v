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