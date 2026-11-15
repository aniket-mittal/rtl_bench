module origen_045782 (
    input wire CLK,
    input wire RST,
    input wire [31:0] in_a,
    input wire [31:0] in_b,
    output reg [63:0] Product,
    output reg Product_Valid
);

    reg [63:0] Mplicand;
    reg [31:0] Mplier;
    reg [6:0] Counter;
    reg sign;

    [MASKED]

endmodule