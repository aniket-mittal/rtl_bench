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

    always @(*) begin
        // Default values
        is_dp = 0;
        is_branch = 0;
        is_ls = 0;
        o_rn = 4'b0;
        o_rm = 4'b0;
        o_rd = 4'b0;
        o_alu_op = 4'b0;
        o_alu_b_imm = 0;
        cond = i_instr[31:28];
        o_write_nzcv = 0;
        o_branch_offset = 24'b0;
        o_link = 0;
        o_ls_flags = 4'b0;
        o_load = 0;
        o_store = 0;
        o_mrs = 0;
        o_psr_field_mask = 4'b0;
        o_spsr_sel = 0;
        o_invalid_instruction = 0;

        if (i_valid) begin
            case (op)
                2'b00: begin // Data processing
                    is_dp = 1;
                    o_rn = i_instr[19:16];
                    o_rd = i_instr[15:12];
                    o_alu_op = opcode;
                    o_alu_b_imm = i_instr[25];
                    o_write_nzcv = i_instr[20];
                    if (!o_alu_b_imm) o_rm = i_instr[3:0];
                end
                2'b01: begin // Load/Store
                    is_ls = 1;
                    o_rn = i_instr[19:16];
                    o_rd = i_instr[15:12];
                    o_ls_flags = {i_instr[24], i_instr[23], i_instr[22], i_instr[21]};
                    o_load = !i_instr[20];
                    o_store = i_instr[20];
                    if (!i_instr[25]) o_rm = i_instr[3:0];
                end
                2'b10: begin // Branch
                    is_branch = 1;
                    o_branch_offset = i_instr[23:0];
                    o_link = i_instr[24];
                end
                2'b11: begin // Coprocessor or Special
                    if (i_instr[24:23] == 2'b10) begin // MRS
                        o_mrs = 1;
                        o_rd = i_instr[15:12];
                        o_spsr_sel = i_instr[22];
                    end else if (i_instr[24:23] == 2'b11) begin // MSR
                        o_psr_field_mask = i_instr[19:16];
                        o_spsr_sel = i_instr[22];
                    end else begin
                        o_invalid_instruction = 1;
                    end
                end
            endcase
        end
    end

endmodule