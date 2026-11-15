module origen_162764(
    input reset,
    input [5:0] opcode,
    output reg reg_dst,
    output reg mem_to_reg,
    output reg [1:0] alu_op,
    output reg mem_read,
    output reg mem_write,
    output reg alu_src,
    output reg reg_write,
    output reg branch,
    output reg jump
);

    always @(*) begin
        if (reset) begin
            reg_dst = 0;
            mem_to_reg = 0;
            alu_op = 2'b10;
            mem_read = 0;
            mem_write = 1;
            alu_src = 0;
            reg_write = 0;
            branch = 0;
            jump = 0;
        end
        else begin
            case (opcode)
                6'b000000: begin // R-type
                    reg_dst = 1;
                    mem_to_reg = 0;
                    alu_op = 2'b10;
                    mem_read = 0;
                    mem_write = 0;
                    alu_src = 0;
                    reg_write = 1;
                    branch = 0;
                    jump = 0;
                end
                6'b100011: begin // Load Word (lw)
                    reg_dst = 0;
                    mem_to_reg = 1;
                    alu_op = 2'b00;
                    mem_read = 1;
                    mem_write = 0;
                    alu_src = 1;
                    reg_write = 1;
                    branch = 0;
                    jump = 0;
                end
                6'b101011: begin // Store Word (sw)
                    reg_dst = 0;
                    mem_to_reg = 0;
                    alu_op = 2'b00;
                    mem_read = 0;
                    mem_write = 1;
                    alu_src = 1;
                    reg_write = 0;
                    branch = 0;
                    jump = 0;
                end
                6'b000100: begin // Branch Equal (beq)
                    reg_dst = 0;
                    mem_to_reg = 0;
                    alu_op = 2'b01;
                    mem_read = 0;
                    mem_write = 0;
                    alu_src = 0;
                    reg_write = 0;
                    branch = 1;
                    jump = 0;
                end
                6'b000010: begin // Jump (j)
                    reg_dst = 0;
                    mem_to_reg = 0;
                    alu_op = 2'b00;
                    mem_read = 0;
                    mem_write = 0;
                    alu_src = 0;
                    reg_write = 0;
                    branch = 0;
                    jump = 1;
                end
                default: begin
                    reg_dst = 0;
                    mem_to_reg = 0;
                    alu_op = 2'b00;
                    mem_read = 0;
                    mem_write = 0;
                    alu_src = 0;
                    reg_write = 0;
                    branch = 0;
                    jump = 0;
                end
            endcase
        end
    end

endmodule