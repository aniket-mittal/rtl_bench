module origen_012872(
    input [31:0] a,
    input [31:0] b,
    input [3:0] aluc,
    output reg [31:0] r,
    output reg zero,
    output reg carry,
    output reg negative,
    output reg overflow
);

    reg [32:0] temp;
    wire [31:0] sum, diff;
    wire cout, bout;

    assign {cout, sum} = a + b;
    assign {bout, diff} = a - b;

    [MASKED]

endmodule