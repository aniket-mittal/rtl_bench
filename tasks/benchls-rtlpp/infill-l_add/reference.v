module L_add (
    input [31:0] a, b,
    output overflow,
    output [31:0] sum
);
    assign {overflow, sum} = a + b;
endmodule