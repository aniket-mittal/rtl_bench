module comparator(
    input [55:0] a,
    input [6:0] amask,
    input [55:0] b,
    output match
);
    wire [55:0] masked_b;
    assign masked_b = b & ~amask;
    assign match = (a & ~amask) == masked_b;
endmodule