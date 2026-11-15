module origen_059136 (
    input wire [3:0] rd_num_passthrough,
    input wire [31:0] md_passthrough,
    input wire [31:0] result,
    input wire [31:0] cpsr_in,
    input wire [31:0] dmem_val_passthrough,
    input wire taken,
    input wire is_alu_op_passthrough,
    input wire is_cmp_op_passthrough,
    input wire is_jmp_op_passthrough,
    input wire is_ld_op_passthrough,
    output reg [3:0] reg_num,
    output reg reg_write_en,
    output reg [31:0] reg_val,
    output reg [31:0] pc_out,
    output reg pc_write_en,
    output reg [31:0] cpsr_out,
    output reg cpsr_write_en
);

[MASKED]

endmodule