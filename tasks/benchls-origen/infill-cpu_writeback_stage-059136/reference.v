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

always @(*) begin
    // Default values
    reg_num = 4'b0000;
    reg_write_en = 1'b0;
    reg_val = 32'b0;
    pc_out = 32'b0;
    pc_write_en = 1'b0;
    cpsr_out = cpsr_in;
    cpsr_write_en = 1'b0;

    if (is_alu_op_passthrough) begin
        reg_num = rd_num_passthrough;
        reg_write_en = 1'b1;
        reg_val = result;
    end
    else if (is_cmp_op_passthrough) begin
        cpsr_out = result;
        cpsr_write_en = 1'b1;
    end
    else if (is_jmp_op_passthrough) begin
        if (taken) begin
            pc_out = result;
            pc_write_en = 1'b1;
        end
    end
    else if (is_ld_op_passthrough) begin
        reg_num = rd_num_passthrough;
        reg_write_en = 1'b1;
        reg_val = dmem_val_passthrough;
    end
end

endmodule