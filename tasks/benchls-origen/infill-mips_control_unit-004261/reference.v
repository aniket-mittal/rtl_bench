module origen_004261(
    input [5:0] op,
    output reg reg_dst,
    output reg reg_write,
    output reg alu_src,
    output reg mem_to_reg,
    output reg mem_read,
    output reg mem_write,
    output reg branch,
    output reg jump,
    output reg [1:0] alu_op
);

`define R_TYPE 6'd0
`define I_BEQ 6'd4
`define I_LW 6'd35
`define I_SW 6'd43
`define J_J 6'd2

always @(*) begin
    case(op)
        `R_TYPE: begin
            reg_dst = 1'b1;
            reg_write = 1'b1;
            alu_src = 1'b0;
            mem_to_reg = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b0;
            branch = 1'b0;
            jump = 1'b0;
            alu_op = 2'b10;
        end
        `I_BEQ: begin
            reg_dst = 1'b0;
            reg_write = 1'b0;
            alu_src = 1'b0;
            mem_to_reg = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b0;
            branch = 1'b1;
            jump = 1'b0;
            alu_op = 2'b01;
        end
        `I_LW: begin
            reg_dst = 1'b0;
            reg_write = 1'b1;
            alu_src = 1'b1;
            mem_to_reg = 1'b1;
            mem_read = 1'b1;
            mem_write = 1'b0;
            branch = 1'b0;
            jump = 1'b0;
            alu_op = 2'b00;
        end
        `I_SW: begin
            reg_dst = 1'b0;
            reg_write = 1'b0;
            alu_src = 1'b1;
            mem_to_reg = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b1;
            branch = 1'b0;
            jump = 1'b0;
            alu_op = 2'b00;
        end
        `J_J: begin
            reg_dst = 1'b0;
            reg_write = 1'b0;
            alu_src = 1'b0;
            mem_to_reg = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b0;
            branch = 1'b0;
            jump = 1'b1;
            alu_op = 2'b00;
        end
        default: begin
            reg_dst = 1'b0;
            reg_write = 1'b0;
            alu_src = 1'b0;
            mem_to_reg = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b0;
            branch = 1'b0;
            jump = 1'b0;
            alu_op = 2'b00;
        end
    endcase
end

endmodule