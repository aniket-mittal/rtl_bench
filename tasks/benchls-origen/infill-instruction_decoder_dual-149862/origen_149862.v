module origen_149862(
    input clock_i,
    input reset_i,
    input enable_i,
    input shouldStalled_i,
    input [4:0] byteAddr_i,
    input [255:0] block_i,
    output reg shouldStalled_o,
    output reg backDisable_o,
    output reg [3:0] nextByteOffset_o,
    output reg [29:0] InstructionA_o,
    output reg [29:0] InstructionB_o,
    output reg InstructionAFormat_o,
    output reg InstructionBFormat_o,
    output reg enableA_o,
    output reg enableB_o
);

    [MASKED]

endmodule