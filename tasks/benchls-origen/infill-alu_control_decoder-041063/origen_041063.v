module origen_041063 (
    input [3:0] ALUOp,
    input [5:0] Funct,
    output reg [4:0] ALUCtl,
    output reg Sign
);

    // ALU Operation Codes
    parameter ALU_ADD = 5'b00000;
    parameter ALU_SUB = 5'b00001;
    parameter ALU_AND = 5'b00010;
    parameter ALU_OR  = 5'b00011;
    parameter ALU_XOR = 5'b00100;
    parameter ALU_NOR = 5'b00101;
    parameter ALU_SLT = 5'b00110;
    parameter ALU_SLL = 5'b00111;
    parameter ALU_SRL = 5'b01000;
    parameter ALU_SRA = 5'b01001;

    reg [4:0] aluFunct;

    [MASKED]

endmodule