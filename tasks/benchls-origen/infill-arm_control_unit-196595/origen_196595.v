module origen_196595(
    input s,
    input [1:0] mode,
    input [3:0] opCode,
    output reg WB_EN,
    output reg MEM_R_EN,
    output reg MEM_W_EN,
    output reg B,
    output reg S,
    output reg [3:0] EXE_CMD
);

    parameter ARITHMETIC = 2'b00;
    parameter MEMOP = 2'b01;
    parameter BR = 2'b10;

    parameter ALU_MOV = 4'b0000;
    parameter ALU_MVN = 4'b0001;
    parameter ALU_ADD = 4'b0010;
    parameter ALU_ADC = 4'b0011;
    parameter ALU_SUB = 4'b0100;
    parameter ALU_SBC = 4'b0101;
    parameter ALU_AND = 4'b0110;
    parameter ALU_ORR = 4'b0111;
    parameter ALU_EOR = 4'b1000;
    parameter ALU_CMP = 4'b1001;
    parameter ALU_TST = 4'b1010;
    parameter ALU_LDR = 4'b1011;
    parameter ALU_STR = 4'b1100;
    parameter ALU_BRANCH = 4'b1101;

    parameter NOP = 4'b0000;
    parameter MOV = 4'b0001;
    parameter MVN = 4'b0010;
    parameter ADD = 4'b0011;
    parameter ADC = 4'b0100;
    parameter SUB = 4'b0101;
    parameter SBC = 4'b0110;
    parameter AND = 4'b0111;
    parameter ORR = 4'b1000;
    parameter EOR = 4'b1001;
    parameter CMP = 4'b1010;
    parameter TST = 4'b1011;
    parameter LDR = 4'b1100;
    parameter STR = 4'b1101;
    parameter BRANCH = 4'b1110;

    [MASKED]

endmodule