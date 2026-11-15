module origen_155687(
    input clk,
    input initiate,
    input signed [31:0] multiplicand,
    input signed [31:0] multiplier,
    output reg done,
    output reg [6:0] count_add,
    output reg [6:0] count_sub,
    output reg signed [63:0] prod
);

reg [31:0] mult;
reg [31:0] mcand;
reg [5:0] count;
reg prev_bit;

[MASKED]

endmodule