module L_mac (
    input [15:0] a, b,
    input [31:0] c,
    output overflow,
    output [31:0] out
);
    assign {overflow, out} = (c + (a * b));
endmodule