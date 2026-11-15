module rtlpp_03829(a, b, c, d, e, f, g, h);
    input a, b, c, d, e;
    output f, g, h;
    wire [3:0] m;
    wire [15:0] y;

    // Embedded dec2to4 logic
    assign m[0] = e & ~a & ~b;
    assign m[1] = e & ~a &  b;
    assign m[2] = e &  a & ~b;
    assign m[3] = e &  a &  b;

    assign y[0]  = m[0] & ~c & ~d;
    assign y[1]  = m[0] & ~c &  d;
    assign y[2]  = m[0] &  c & ~d;
    assign y[3]  = m[0] &  c &  d;
    assign y[4]  = m[1] & ~c & ~d;
    assign y[5]  = m[1] & ~c &  d;
    assign y[6]  = m[1] &  c & ~d;
    assign y[7]  = m[1] &  c &  d;
    assign y[8]  = m[2] & ~c & ~d;
    assign y[9]  = m[2] & ~c &  d;
    assign y[10] = m[2] &  c & ~d;
    assign y[11] = m[2] &  c &  d;
    assign y[12] = m[3] & ~c & ~d;
    assign y[13] = m[3] & ~c &  d;
    assign y[14] = m[3] &  c & ~d;
    assign y[15] = m[3] &  c &  d;

    assign f = y[3] | y[6] | y[7] | y[10] | y[11] | y[14];
    assign g = y[2] | y[3] | y[10] | y[14];
    assign h = y[0] | y[1] | y[3] | y[7] | y[14] | y[15];
endmodule