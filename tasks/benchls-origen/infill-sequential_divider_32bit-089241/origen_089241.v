module origen_089241 (
    input wire clock,
    input wire reset,
    input wire DIVS,
    input wire [31:0] dividend,
    input wire [31:0] divisor,
    input wire start,
    output reg [31:0] q,
    output reg [31:0] r,
    output reg pause,
    output reg busy
);

    reg [4:0] count;
    reg [31:0] dividend_abs, divisor_abs;
    reg [63:0] sub_add;
    reg dividend_sign, divisor_sign;

    [MASKED]

endmodule