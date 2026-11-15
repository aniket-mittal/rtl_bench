module origen_051335 (
    input wire reset,
    input wire enable,
    input wire clk,
    input wire d,
    output reg [31:0] q
);

    wire c;

    assign c = q[31] ^ d;

    [MASKED]

endmodule