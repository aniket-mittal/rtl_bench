module origen_176179(
    input [5:0] ALUOp,
    input [5:0] ALUFunction,
    output reg [3:0] ALUOperation,
    output reg JrFlag
);

    parameter R_Type_ADD = 6'b100000;
    parameter R_Type_SUB = 6'b100010;
    parameter R_Type_AND = 6'b100100;
    parameter R_Type_OR = 6'b100101;
    parameter R_Type_NOR = 6'b100111;
    parameter R_Type_SLL = 6'b000000;
    parameter R_Type_SRL = 6'b000010;
    parameter R_Type_JR = 6'b001000;

    parameter I_Type_ADDI = 6'b001000;
    parameter I_Type_ORI = 6'b001101;
    parameter I_Type_LUI = 6'b001111;
    parameter I_Type_LW = 6'b100011;
    parameter I_Type_SW = 6'b101011;
    parameter I_Type_BEQ = 6'b000100;
    parameter I_Type_BNE = 6'b000101;

    reg [4:0] ALUControlValues;

    [MASKED]

endmodule