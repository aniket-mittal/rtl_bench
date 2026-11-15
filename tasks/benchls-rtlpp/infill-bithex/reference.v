module bithex(c3, c2, c1, c0, h0, h1, h2, h3, h4, h5, h6);
    input c0, c1, c2, c3;
    output h0, h1, h2, h3, h4, h5, h6;

    assign h0 = (~c3 & ~c2 & ~c1 & c0) | (~c3 & c2 & ~c1 & ~c0) | (c3 & ~c2 & c1 & c0) | (c3 & c2 & ~c1 & c0);
    assign h1 = (~c3 & c2 & ~c1 & c0) | (~c3 & c2 & c1 & ~c0) | (c3 & ~c2 & c1 & c0) | (c3 & c2 & ~c1 & ~c0) | (c3 & c2 & c1 & ~c0) | (c3 & c2 & c1 & c0);
    assign h2 = (~c3 & ~c2 & c1 & ~c0) | (c3 & c2 & ~c1 & ~c0) | (c3 & c2 & c1 & ~c0) | (c3 & c2 & c1 & c0);
    assign h3 = (~c3 & ~c2 & ~c1 & c0) | (~c3 & c2 & ~c1 & ~c0) | (~c3 & c2 & c1 & c0) | (c3 & ~c2 & ~c1 & c0) | (c3 & ~c2 & c1 & ~c0) | (c3 & c2 & c1 & c0);
    assign h4 = (~c3 & ~c2 & ~c1 & c0) | (~c3 & ~c2 & c1 & c0) | (~c3 & c2 & ~c1 & ~c0) | (~c3 & c2 & ~c1 & c0) | (~c3 & c2 & c1 & c0) | (c3 & ~c2 & ~c1 & c0);
    assign h5 = (~c3 & ~c2 & ~c1 & c0) | (~c3 & ~c2 & c1 & ~c0) | (~c3 & ~c2 & c1 & c0) | (~c3 & c2 & c1 & c0) | (c3 & c2 & ~c1 & c0);
    assign h6 = (~c3 & ~c2 & ~c1 & ~c0) | (~c3 & ~c2 & ~c1 & c0) | (~c3 & c2 & c1 & c0) | (c3 & c2 & ~c1 & ~c0);
endmodule