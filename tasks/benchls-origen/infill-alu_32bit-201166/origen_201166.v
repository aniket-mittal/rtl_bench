module origen_201166(
    input  [31:0] a,
    input  [31:0] b,
    input  [3:0]  aluc,
    output [31:0] r,
    output        zero,
    output        carry,
    output        negative,
    output        overflow
);

    reg [31:0] result;
    reg        c, n, z, v;

    [MASKED]

    assign r = result;
    assign carry = c;
    assign negative = n;
    assign zero = z;
    assign overflow = v;

endmodule