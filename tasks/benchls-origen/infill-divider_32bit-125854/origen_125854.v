module origen_125854 (
    input wire clk,
    input wire reset,
    input wire start,
    input wire signed_op,
    input wire [31:0] A,
    input wire [31:0] B,
    output reg [31:0] result,
    output reg done
);

reg [31:0] dividend, divisor;
reg [31:0] quotient, remainder;
reg [5:0] count;
reg running;

[MASKED]

endmodule