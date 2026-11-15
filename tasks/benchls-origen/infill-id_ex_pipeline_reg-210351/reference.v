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

always @(posedge clk) begin
    if (idex_en) begin
        // Control signals
        memtoreg_reg <= memtoreg;
        reg_write_reg <= reg_write;
        mem_read_reg <= mem_read;
        mem_write_reg <= mem_write;
        reg_dst_reg <= reg_dst;
        alusrc_a_reg <= alusrc_a;
        branch_reg <= branch;
        jump_reg <= jump;
        halt_reg <= halt;
        word_en_reg <= word_en;
        ld_en_reg <= ld_en;
        
        // Data signals
        pc_plus2_reg <= pc_plus2;
        read_data1_reg <= read_data1;
        read_data2_reg <= read_data2;
        sign_extend_reg <= sign_extend;
        instr_rt_reg <= instr_rt;
        instr_rd_reg <= instr_rd;
        rs_reg <= rs;
        
        // ALU control signals
        alusrc_b_reg <= alusrc_b;
        aluop_reg <= aluop;
        
        // Branch and jump signals
        branch_label_reg <= branch_label;
        jump_addr_reg <= jump_addr;
    end else begin
        // Maintain current values, except for instr_rt_reg and instr_rd_reg
        memtoreg_reg <= memtoreg_reg;
        reg_write_reg <= reg_write_reg;
        mem_read_reg <= mem_read_reg;
        mem_write_reg <= mem_write_reg;
        reg_dst_reg <= reg_dst_reg;
        alusrc_a_reg <= alusrc_a_reg;
        branch_reg <= branch_reg;
        jump_reg <= jump_reg;
        halt_reg <= halt_reg;
        word_en_reg <= word_en_reg;
        ld_en_reg <= ld_en_reg;
        
        pc_plus2_reg <= pc_plus2_reg;
        read_data1_reg <= read_data1_reg;
        read_data2_reg <= read_data2_reg;
        sign_extend_reg <= sign_extend_reg;
        instr_rt_reg <= 0;
        instr_rd_reg <= 0;
        rs_reg <= rs_reg;
        
        alusrc_b_reg <= alusrc_b_reg;
        aluop_reg <= aluop_reg;
        
        branch_label_reg <= branch_label_reg;
        jump_addr_reg <= jump_addr_reg;
    end
end

endmodule