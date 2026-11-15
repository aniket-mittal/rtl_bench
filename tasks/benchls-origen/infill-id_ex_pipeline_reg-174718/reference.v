module origen_174718 (
    input clk,
    input [31:0] inc_pc,
    input [31:0] read_data_1,
    input [31:0] read_data_2,
    input [31:0] sign_extended,
    input [4:0] rt,
    input [4:0] rd,
    input mem_to_reg,
    input reg_write,
    input branch,
    input mem_read,
    input mem_write,
    input reg_dest,
    input alu_src,
    input [2:0] alu_op,

    output reg [31:0] inc_pc_reg,
    output reg [31:0] read_data_1_reg,
    output reg [31:0] read_data_2_reg,
    output reg [31:0] sign_extended_reg,
    output reg [4:0] rt_reg,
    output reg [4:0] rd_reg,
    output reg mem_to_reg_reg,
    output reg reg_write_reg,
    output reg branch_reg,
    output reg mem_read_reg,
    output reg mem_write_reg,
    output reg reg_dest_reg,
    output reg alu_src_reg,
    output reg [2:0] alu_op_reg
);

    always @(posedge clk) begin
        inc_pc_reg <= inc_pc;
        read_data_1_reg <= read_data_1;
        read_data_2_reg <= read_data_2;
        sign_extended_reg <= sign_extended;
        rt_reg <= rt;
        rd_reg <= rd;
        mem_to_reg_reg <= mem_to_reg;
        reg_write_reg <= reg_write;
        branch_reg <= branch;
        mem_read_reg <= mem_read;
        mem_write_reg <= mem_write;
        reg_dest_reg <= reg_dest;
        alu_src_reg <= alu_src;
        alu_op_reg <= alu_op;
    end

endmodule