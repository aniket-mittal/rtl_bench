module origen_003867 (
    input wire [35:0] cout_Multiply, zout_Multiply,
    input wire [31:0] sout_Multiply,
    input wire [49:0] productout_Multiply,
    input wire [1:0] modeout_Multiply, idle_Multiply,
    input wire operationout_Multiply, NatLogFlagout_Multiply,
    input wire [7:0] InsTag_Multiply,
    input wire clock,
    output reg [35:0] cout_Normalise, zout_Normalise,
    output reg [31:0] sout_Normalise,
    output reg [49:0] productout_Normalise,
    output reg [1:0] modeout_Normalise, idle_Normalise,
    output reg operationout_Normalise, NatLogFlagout_Normalise,
    output reg [7:0] InsTag_Normalise
);

    wire sign = zout_Multiply[35];
    wire [7:0] exponent = zout_Multiply[34:27];
    wire [26:0] mantissa = zout_Multiply[26:0];

    [MASKED]

endmodule