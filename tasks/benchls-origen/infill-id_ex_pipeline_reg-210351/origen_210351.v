module origen_210351(
    input clk,
    input idex_en,
    
    // Control signals from ID stage
    input memtoreg,
    input reg_write,
    input mem_read,
    input mem_write,
    input reg_dst,
    input alusrc_a,
    input branch,
    input jump,
    input halt,
    input word_en,
    input ld_en,
    
    // Data signals from ID stage
    input [15:0] pc_plus2,
    input [15:0] read_data1,
    input [15:0] read_data2,
    input [15:0] sign_extend,
    input [2:0] instr_rt,
    input [2:0] instr_rd,
    input [2:0] rs,
    
    // ALU control signals from ID stage
    input alusrc_b,
    input [1:0] aluop,
    
    // Branch and jump signals from ID stage
    input [15:0] branch_label,
    input [15:0] jump_addr,
    
    // Control signals to EX stage
    output reg memtoreg_reg,
    output reg reg_write_reg,
    output reg mem_read_reg,
    output reg mem_write_reg,
    output reg reg_dst_reg,
    output reg alusrc_a_reg,
    output reg branch_reg,
    output reg jump_reg,
    output reg halt_reg,
    output reg word_en_reg,
    output reg ld_en_reg,
    
    // Data signals to EX stage
    output reg [15:0] pc_plus2_reg,
    output reg [15:0] read_data1_reg,
    output reg [15:0] read_data2_reg,
    output reg [15:0] sign_extend_reg,
    output reg [2:0] instr_rt_reg,
    output reg [2:0] instr_rd_reg,
    output reg [2:0] rs_reg,
    
    // ALU control signals to EX stage
    output reg alusrc_b_reg,
    output reg [1:0] aluop_reg,
    
    // Branch and jump signals to EX stage
    output reg [15:0] branch_label_reg,
    output reg [15:0] jump_addr_reg
);

[MASKED]

endmodule