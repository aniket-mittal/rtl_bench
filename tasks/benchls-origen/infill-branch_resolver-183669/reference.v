module origen_183669(
    input exmem_branch,
    input [2:0] exmem_condition,
    input [31:0] exmem_target,
    input [31:0] exmem_pc_4,
    input exmem_lf,
    input exmem_zf,
    output reg [31:0] final_target,
    output reg branch_state
);

always @(*) begin
    if (exmem_branch == 1'b0) begin
        final_target = exmem_pc_4;
        branch_state = 1'b0;
    end
    else begin
        case (exmem_condition)
            3'b000: begin
                final_target = exmem_target;
                branch_state = 1'b1;
            end
            3'b001: begin
                if (exmem_zf) begin
                    final_target = exmem_target;
                    branch_state = 1'b1;
                end
                else begin
                    final_target = exmem_pc_4 + 4;
                    branch_state = 1'b0;
                end
            end
            3'b010: begin
                if (~exmem_zf) begin
                    final_target = exmem_target;
                    branch_state = 1'b1;
                end
                else begin
                    final_target = exmem_pc_4 + 4;
                    branch_state = 1'b0;
                end
            end
            3'b011: begin
                if (~exmem_lf) begin
                    final_target = exmem_target;
                    branch_state = 1'b1;
                end
                else begin
                    final_target = exmem_pc_4 + 4;
                    branch_state = 1'b0;
                end
            end
            3'b100: begin
                if (~exmem_zf && ~exmem_lf) begin
                    final_target = exmem_target;
                    branch_state = 1'b1;
                end
                else begin
                    final_target = exmem_pc_4 + 4;
                    branch_state = 1'b0;
                end
            end
            3'b101: begin
                if (exmem_zf || exmem_lf) begin
                    final_target = exmem_target;
                    branch_state = 1'b1;
                end
                else begin
                    final_target = exmem_pc_4 + 4;
                    branch_state = 1'b0;
                end
            end
            3'b110: begin
                if (exmem_lf) begin
                    final_target = exmem_target;
                    branch_state = 1'b1;
                end
                else begin
                    final_target = exmem_pc_4 + 4;
                    branch_state = 1'b0;
                end
            end
            3'b111: begin
                final_target = exmem_target;
                branch_state = 1'b1;
            end
            default: begin
                final_target = exmem_pc_4 + 4;
                branch_state = 1'b0;
            end
        endcase
    end
end

endmodule