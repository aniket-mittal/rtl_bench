module origen_142147(
    input [3:0] a,
    input [3:0] b,
    output equal,
    output greater,
    output less
);
    assign equal = (a == b);
    assign greater = (a > b);
    assign less = (a < b);
endmodule

module max_selector(
    input [3:0] a,
    input [3:0] b,
    input equal,
    input greater,
    input less,
    output reg [3:0] max
);
    always @(*) begin
        if (greater || equal)
            max = a;
        else
            max = b;
    end
endmodule

module max_system(
    input [3:0] a,
    input [3:0] b,
    output [3:0] max_out
);
    wire equal, greater, less;

    comparator comp (
        .a(a),
        .b(b),
        .equal(equal),
        .greater(greater),
        .less(less)
    );

    max_selector selector (
        .a(a),
        .b(b),
        .equal(equal),
        .greater(greater),
        .less(less),
        .max(max_out)
    );
endmodule