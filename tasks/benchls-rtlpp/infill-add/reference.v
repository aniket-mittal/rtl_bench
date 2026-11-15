module add (
    input [15:0] a, b,
    output overflow,
    output [15:0] sum
);
    assign {overflow, sum} = a + b;
endmodule