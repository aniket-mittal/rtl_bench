module origen_078885(
    input [5:0] nfuncao,
    input onOP,
    output reg [3:0] controle
);

    // Instruction type parameters
    parameter ADD  = 6'b000000;
    parameter ADDI = 6'b000001;
    parameter SUB  = 6'b000010;
    parameter SUBI = 6'b000011;
    parameter ADC  = 6'b000100;
    parameter ADCI = 6'b000101;
    parameter NAND = 6'b000110;
    parameter NOR  = 6'b000111;
    parameter XNOR = 6'b001000;
    parameter NOT  = 6'b001001;
    parameter SLL  = 6'b001010;
    parameter SRL  = 6'b001011;
    parameter CMP  = 6'b001100;
    parameter CMPI = 6'b001101;
    parameter JMP  = 6'b001110;
    parameter JMPI = 6'b001111;
    parameter CALL = 6'b010000;
    parameter MUL  = 6'b010001;
    parameter DIV  = 6'b010010;

    [MASKED]

endmodule