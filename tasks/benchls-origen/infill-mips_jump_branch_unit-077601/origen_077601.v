module origen_077601 (
    input wire rst,
    input wire [5:0] i_op,
    input wire [31:0] i_sign_ext,
    input wire [31:0] i_jump_address,
    input wire [31:0] i_pc,
    input wire [31:0] i_rs_reg,
    input wire [31:0] i_rt_reg,
    input wire is_stall,
    output reg os_taken,
    output reg os_write_pc,
    output reg os_select_addr_reg,
    output reg [31:0] o_jump_address,
    output reg [31:0] o_pc_to_reg
);

    [MASKED]

endmodule