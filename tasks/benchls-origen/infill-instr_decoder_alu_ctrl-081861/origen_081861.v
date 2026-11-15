module origen_081861 (
    input [3:0] opcode,
    input [7:0] func,
    input zero_flag,
    output reg [2:0] alu_operation,
    output reg next_sel, ld_window, branch_sel, jump_sel, R_sel, imm_sel, mem_sel, alu_sel, reg_write, mem_read, mem_write
);

    // ALU operation parameters
    parameter MOVE = 3'b000;
    parameter ADD  = 3'b001;
    parameter SUB  = 3'b010;
    parameter AND  = 3'b011;
    parameter OR   = 3'b100;
    parameter NOT  = 3'b101;
    parameter NOP  = 3'b111;

    [MASKED]

endmodule