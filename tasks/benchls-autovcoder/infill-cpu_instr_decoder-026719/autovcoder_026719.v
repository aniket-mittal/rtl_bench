module autovcoder_026719( // @suppress "Design unit name 'decoder_control' does not match file name 'hw8v2'"
    input [31:0] instr,
    input [3:0] flag,
    output reg jmp_en,
    output reg jmp_reg_en,
    output reg flag_en,
    output reg data_w_en,
    output reg data_mem,
    output reg data_mem_en,
    output reg [1:0] op,
    output reg [3:0] cmd,
    output reg [3:0] src_addr,
    output reg [3:0] dest_reg,
    output reg [11:0] imm_instr_mem,
    output reg [23:0] imm_instr
);

  [MASKED]
endmodule

