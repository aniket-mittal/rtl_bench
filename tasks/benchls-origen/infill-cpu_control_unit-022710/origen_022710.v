module origen_022710 (
    input [5:0] operationCode,
    input zero,
    output reg ALUSrcB,
    output reg ALUM2Reg,
    output reg RegWre,
    output reg InsMemRW,
    output reg DataMemRW,
    output reg ExtSel,
    output reg PCSrc,
    output reg RegOut,
    output reg PCWre,
    output reg [2:0] ALUFlag
);

    // Instruction opcodes
    localparam ADD  = 6'b000000;
    localparam SUB  = 6'b000001;
    localparam ORI  = 6'b010000;
    localparam AND  = 6'b010001;
    localparam OR   = 6'b010010;
    localparam MOVE = 6'b100000;
    localparam SW   = 6'b110000;
    localparam LW   = 6'b110001;
    localparam BEQ  = 6'b110010;
    localparam HALT = 6'b111111;

    [MASKED]

endmodule