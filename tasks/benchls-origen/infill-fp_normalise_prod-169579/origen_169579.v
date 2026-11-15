module origen_169579(
    input [31:0] cout_Multiply, zout_Multiply, sout_Multiply, productout_Multiply,
    input [1:0] modeout_Multiply, operationout_Multiply,
    input NatLogFlagout_Multiply, InsTag_Multiply,
    input clock, idle_Multiply,
    output reg idle_NormaliseProd,
    output reg [31:0] cout_NormaliseProd, zout_NormaliseProd, sout_NormaliseProd, productout_NormaliseProd,
    output reg [1:0] modeout_NormaliseProd, operationout_NormaliseProd,
    output reg NatLogFlagout_NormaliseProd, InsTag_NormaliseProd
);

    parameter mode_circular = 2'b00, mode_linear = 2'b01, mode_hyperbolic = 2'b10;
    parameter no_idle = 2'b00, allign_idle = 2'b01, put_idle = 2'b10;

    reg [7:0] exponent;
    reg [23:0] mantissa;

    [MASKED]

endmodule