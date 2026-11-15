module origen_111816(
    input [5:0] op,
    output reg reg_dst,
    output reg reg_write,
    output reg alu_src,
    output reg mem_write,
    output reg mem_to_reg,
    output reg branch,
    output reg jump,
    output reg [1:0] alu_op
);

always @(*) begin
    case(op)
        6'b000000: begin // R-type
            reg_dst = 1'b1;
            reg_write = 1'b1;
            alu_src = 1'b0;
            mem_write = 1'b0;
            mem_to_reg = 1'b0;
            branch = 1'b0;
            jump = 1'b0;
            alu_op = 2'b10;
        end
        6'b100011: begin // Load word
            reg_dst = 1'b0;
            reg_write = 1'b1;
            alu_src = 1'b1;
            mem_write = 1'b0;
            mem_to_reg = 1'b1;
            branch = 1'b0;
            jump = 1'b0;
            alu_op = 2'b00;
        end
        6'b101011: begin // Store word
            reg_dst = 1'b0;
            reg_write = 1'b0;
            alu_src = 1'b1;
            mem_write = 1'b1;
            mem_to_reg = 1'b0;
            branch = 1'b0;
            jump = 1'b0;
            alu_op = 2'b00;
        end
        6'b000100: begin // Branch
            reg_dst = 1'b0;
            reg_write = 1'b0;
            alu_src = 1'b0;
            mem_write = 1'b0;
            mem_to_reg = 1'b0;
            branch = 1'b1;
            jump = 1'b0;
            alu_op = 2'b01;
        end
        6'b001000: begin // Immediate
            reg_dst = 1'b0;
            reg_write = 1'b1;
            alu_src = 1'b1;
            mem_write = 1'b0;
            mem_to_reg = 1'b0;
            branch = 1'b0;
            jump = 1'b0;
            alu_op = 2'b00;
        end
        6'b000010: begin // Jump
            reg_dst = 1'b0;
            reg_write = 1'b0;
            alu_src = 1'b0;
            mem_write = 1'b0;
            mem_to_reg = 1'b0;
            branch = 1'b0;
            jump = 1'b1;
            alu_op = 2'b00;
        end
        default: begin
            reg_dst = 1'b0;
            reg_write = 1'b0;
            alu_src = 1'b0;
            mem_write = 1'b0;
            mem_to_reg = 1'b0;
            branch = 1'b0;
            jump = 1'b0;
            alu_op = 2'b00;
        end
    endcase
end

endmodule