module origen_118483(
    input [7:0] a,
    input [7:0] b,
    input [4:0] fun,
    input cin,
    output reg [7:0] result,
    output zero,
    output reg cout
);

    reg [8:0] temp;

    [MASKED]

    assign zero = (result == 8'b0);

endmodule