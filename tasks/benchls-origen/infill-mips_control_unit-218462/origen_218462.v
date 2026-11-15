module origen_218462(
    input wire [5:0] instr_op_i,
    output reg RegWrite_o,
    output reg [1:0] ALU_op_o,
    output reg ALUSrc_o,
    output reg RegDst_o,
    output reg Branch_o,
    output reg MemRead_o,
    output reg MemWrite_o,
    output reg MemtoReg_o
);

    parameter RFormat = 6'b000000;
    parameter addi = 6'b001000;
    parameter slti = 6'b001010;
    parameter beq = 6'b000100;
    parameter lw = 6'b100011;
    parameter sw = 6'b101011;

    [MASKED]

endmodule