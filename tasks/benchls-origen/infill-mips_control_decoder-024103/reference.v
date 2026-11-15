module origen_024103 (
    input [5:0] opcode,
    output reg reg_wr_en,
    output reg reg_dest,
    output reg mem_wr_en,
    output reg mem_to_reg,
    output reg mem_read_en,
    output reg [1:0] alu_opcode,
    output reg alu_in_sel,
    output reg jump_en,
    output reg branch_en
);

always @(*) begin
    case (opcode)
        6'b000000: begin // R-type instruction
            reg_wr_en = 1'b1;
            reg_dest = 1'b1;
            mem_wr_en = 1'b0;
            mem_to_reg = 1'b0;
            mem_read_en = 1'b0;
            alu_opcode = 2'b10;
            alu_in_sel = 1'b0;
            jump_en = 1'b0;
            branch_en = 1'b0;
        end
        6'b001000: begin // I-type arithmetic instruction
            reg_wr_en = 1'b1;
            reg_dest = 1'b0;
            mem_wr_en = 1'b0;
            mem_to_reg = 1'b0;
            mem_read_en = 1'b0;
            alu_opcode = 2'b00;
            alu_in_sel = 1'b1;
            jump_en = 1'b0;
            branch_en = 1'b0;
        end
        6'b100011: begin // Load word instruction
            reg_wr_en = 1'b1;
            reg_dest = 1'b0;
            mem_wr_en = 1'b0;
            mem_to_reg = 1'b1;
            mem_read_en = 1'b1;
            alu_opcode = 2'b00;
            alu_in_sel = 1'b1;
            jump_en = 1'b0;
            branch_en = 1'b0;
        end
        6'b101011: begin // Store word instruction
            reg_wr_en = 1'b0;
            reg_dest = 1'bx;
            mem_wr_en = 1'b1;
            mem_to_reg = 1'bx;
            mem_read_en = 1'b0;
            alu_opcode = 2'b00;
            alu_in_sel = 1'b1;
            jump_en = 1'b0;
            branch_en = 1'b0;
        end
        6'b000100: begin // Branch instruction
            reg_wr_en = 1'b0;
            reg_dest = 1'bx;
            mem_wr_en = 1'b0;
            mem_to_reg = 1'bx;
            mem_read_en = 1'b0;
            alu_opcode = 2'b01;
            alu_in_sel = 1'b0;
            jump_en = 1'b0;
            branch_en = 1'b1;
        end
        6'b000010: begin // Jump instruction
            reg_wr_en = 1'b0;
            reg_dest = 1'bx;
            mem_wr_en = 1'b0;
            mem_to_reg = 1'bx;
            mem_read_en = 1'b0;
            alu_opcode = 2'bxx;
            alu_in_sel = 1'bx;
            jump_en = 1'b1;
            branch_en = 1'b0;
        end
        6'b111111: begin // Special case
            reg_wr_en = 1'b0;
            reg_dest = 1'b0;
            mem_wr_en = 1'b0;
            mem_to_reg = 1'b0;
            mem_read_en = 1'b0;
            alu_opcode = 2'b11;
            alu_in_sel = 1'b0;
            jump_en = 1'b0;
            branch_en = 1'b0;
        end
        default: begin // Default case
            reg_wr_en = 1'bx;
            reg_dest = 1'bx;
            mem_wr_en = 1'bx;
            mem_to_reg = 1'bx;
            mem_read_en = 1'bx;
            alu_opcode = 2'bxx;
            alu_in_sel = 1'bx;
            jump_en = 1'bx;
            branch_en = 1'bx;
        end
    endcase
end

endmodule