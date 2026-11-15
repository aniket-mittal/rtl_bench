module origen_056401(
    input wire [17:0] ir,
    output reg [4:0] rs1, rs2, rd,
    output reg [17:0] imm,
    output reg imm_s1, imm_s2,
    output reg do_alu, do_shift, do_write, do_readkbd, do_stb, do_jump,
    output reg [3:0] alu_op,
    output reg [1:0] shift_op,
    output reg [11:0] jump_offset,
    output reg [2:0] cond
);

    // ALU operation parameters
    parameter ALU_ADD = 4'b0000;
    parameter ALU_SUB = 4'b0001;
    parameter ALU_AND = 4'b0010;
    parameter ALU_OR  = 4'b0011;
    parameter ALU_XOR = 4'b0100;
    parameter ALU_CMP = 4'b0101;

    // Shift operation parameters
    parameter SHIFT_LEFT  = 2'b00;
    parameter SHIFT_RIGHT = 2'b01;
    parameter ROTATE_LEFT = 2'b10;

    [MASKED]

endmodule