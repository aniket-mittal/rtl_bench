module origen_160566(
    input  [11:0] D,
    output       S,
    output [2:0] E,
    output [3:0] F
);

    reg [11:0] out;
    reg [2:0] exponent;
    wire [11:0] abs_D = (D[11]) ? -D : D;

    [MASKED]

    assign S = D[11];
    assign E = exponent;
    assign F = (out[5]) ? (out[3:0] + 1'b1) : out[3:0];

endmodule