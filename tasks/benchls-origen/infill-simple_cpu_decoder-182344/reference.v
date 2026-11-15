module origen_182344(
    input [3:0] op_code,
    input [3:0] func_in,
    output reg [3:0] func_out,
    output reg reg_x_reg,
    output reg reg_x_imm,
    output reg beqz,
    output reg bnez,
    output reg lw,
    output reg sw,
    output reg reg_write,
    output reg jump,
    output reg jal,
    output reg jr
);

always @(*) begin
    case (op_code)
        4'b0000: begin // add
            func_out = func_in;
            reg_x_reg = 1'b1;
            reg_x_imm = 1'b0;
            beqz = 1'b0;
            bnez = 1'b0;
            lw = 1'b0;
            sw = 1'b0;
            reg_write = 1'b1;
            jump = 1'b0;
            jal = 1'b0;
            jr = 1'b0;
        end
        4'b0001: begin // addi
            func_out = func_in;
            reg_x_reg = 1'b0;
            reg_x_imm = 1'b1;
            beqz = 1'b0;
            bnez = 1'b0;
            lw = 1'b0;
            sw = 1'b0;
            reg_write = 1'b1;
            jump = 1'b0;
            jal = 1'b0;
            jr = 1'b0;
        end
        4'b0010: begin // beq
            func_out = func_in;
            reg_x_reg = 1'b1;
            reg_x_imm = 1'b0;
            beqz = 1'b1;
            bnez = 1'b0;
            lw = 1'b0;
            sw = 1'b0;
            reg_write = 1'b0;
            jump = 1'b0;
            jal = 1'b0;
            jr = 1'b0;
        end
        4'b0011: begin // bne
            func_out = func_in;
            reg_x_reg = 1'b1;
            reg_x_imm = 1'b0;
            beqz = 1'b0;
            bnez = 1'b1;
            lw = 1'b0;
            sw = 1'b0;
            reg_write = 1'b0;
            jump = 1'b0;
            jal = 1'b0;
            jr = 1'b0;
        end
        4'b0100: begin // lw
            func_out = 4'b0000;
            reg_x_reg = 1'b0;
            reg_x_imm = 1'b1;
            beqz = 1'b0;
            bnez = 1'b0;
            lw = 1'b1;
            sw = 1'b0;
            reg_write = 1'b1;
            jump = 1'b0;
            jal = 1'b0;
            jr = 1'b0;
        end
        4'b0101: begin // sw
            func_out = 4'b0000;
            reg_x_reg = 1'b1;
            reg_x_imm = 1'b1;
            beqz = 1'b0;
            bnez = 1'b0;
            lw = 1'b0;
            sw = 1'b1;
            reg_write = 1'b0;
            jump = 1'b0;
            jal = 1'b0;
            jr = 1'b0;
        end
        4'b0110: begin // jump
            func_out = 4'b0000;
            reg_x_reg = 1'b0;
            reg_x_imm = 1'b0;
            beqz = 1'b0;
            bnez = 1'b0;
            lw = 1'b0;
            sw = 1'b0;
            reg_write = 1'b0;
            jump = 1'b1;
            jal = 1'b0;
            jr = 1'b0;
        end
        4'b0111: begin // jal
            func_out = 4'b0000;
            reg_x_reg = 1'b0;
            reg_x_imm = 1'b0;
            beqz = 1'b0;
            bnez = 1'b0;
            lw = 1'b0;
            sw = 1'b0;
            reg_write = 1'b1;
            jump = 1'b1;
            jal = 1'b1;
            jr = 1'b0;
        end
        4'b1000: begin // jr
            func_out = func_in;
            reg_x_reg = 1'b1;
            reg_x_imm = 1'b0;
            beqz = 1'b0;
            bnez = 1'b0;
            lw = 1'b0;
            sw = 1'b0;
            reg_write = 1'b0;
            jump = 1'b1;
            jal = 1'b0;
            jr = 1'b1;
        end
        default: begin
            func_out = 4'b0000;
            reg_x_reg = 1'b0;
            reg_x_imm = 1'b0;
            beqz = 1'b0;
            bnez = 1'b0;
            lw = 1'b0;
            sw = 1'b0;
            reg_write = 1'b0;
            jump = 1'b0;
            jal = 1'b0;
            jr = 1'b0;
        end
    endcase
end

endmodule