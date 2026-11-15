module origen_012197 (
    input wire [31:0] i_instr,
    input wire i_valid,
    output reg is_dp,
    output reg is_branch,
    output reg is_ls,
    output reg [3:0] o_rn,
    output reg [3:0] o_rm,
    output reg [3:0] o_rd,
    output reg [3:0] o_alu_op,
    output reg o_alu_b_imm,
    output reg [3:0] cond,
    output reg o_write_nzcv,
    output reg [23:0] o_branch_offset,
    output reg o_link,
    output reg [3:0] o_ls_flags,
    output reg o_load,
    output reg o_store,
    output reg o_mrs,
    output reg [3:0] o_psr_field_mask,
    output reg o_spsr_sel,
    output reg o_invalid_instruction
);

    wire [3:0] opcode;
    wire [1:0] op;

    assign opcode = i_instr[24:21];
    assign op = i_instr[27:26];

    [MASKED]

endmodule