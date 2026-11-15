module origen_198211(
    input clk,
    input [31:0] pc_value, pc_plus_imm, alu_result, rd2,
    input [4:0] rd,
    input mem_read, mem_write, memToReg, branch, reg_write, zero,
    input flush, prediction,
    output reg [31:0] pc_value_reg, pc_plus_imm_reg, alu_result_reg, rd2_reg,
    output reg [4:0] rd_reg,
    output reg mem_read_reg, mem_write_reg, memToReg_reg, branch_reg, reg_write_reg, zero_reg,
    output reg prediction_reg
);

    initial begin
        pc_value_reg = 0;
        pc_plus_imm_reg = 0;
        alu_result_reg = 0;
        rd2_reg = 0;
        rd_reg = 0;
        mem_read_reg = 0;
        mem_write_reg = 0;
        memToReg_reg = 0;
        branch_reg = 0;
        reg_write_reg = 0;
        zero_reg = 0;
        prediction_reg = 0;
    end

    always @(posedge clk) begin
        if (flush) begin
            mem_read_reg <= 0;
            mem_write_reg <= 0;
            memToReg_reg <= 0;
            branch_reg <= 0;
            reg_write_reg <= 0;
        end else begin
            mem_read_reg <= mem_read;
            mem_write_reg <= mem_write;
            memToReg_reg <= memToReg;
            branch_reg <= branch;
            reg_write_reg <= reg_write;
        end

        pc_value_reg <= pc_value;
        pc_plus_imm_reg <= pc_plus_imm;
        alu_result_reg <= alu_result;
        rd2_reg <= rd2;
        rd_reg <= rd;
        zero_reg <= zero;
        prediction_reg <= prediction;
    end

endmodule