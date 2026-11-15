module origen_026729 (
    input [5:0] instr_op,
    output reg reg_dst,
    output reg branch,
    output reg mem_read,
    output reg mem_to_reg,
    output reg mem_write,
    output reg alu_src,
    output reg reg_write,
    output reg [1:0] alu_op
);

    reg reg_dst1, branch1, mem_read1, mem_to_reg1, mem_write1, alu_src1, reg_write1;
    reg [1:0] alu_op1;

    always @(*) begin
        case(instr_op)
            6'b000000: begin // R-type
                reg_dst1 = 1'b1;
                branch1 = 1'b0;
                mem_read1 = 1'b0;
                mem_to_reg1 = 1'b0;
                mem_write1 = 1'b0;
                alu_src1 = 1'b0;
                reg_write1 = 1'b1;
                alu_op1 = 2'b10;
            end
            6'b001000: begin // I-type ALU
                reg_dst1 = 1'b0;
                branch1 = 1'b0;
                mem_read1 = 1'b0;
                mem_to_reg1 = 1'b0;
                mem_write1 = 1'b0;
                alu_src1 = 1'b1;
                reg_write1 = 1'b1;
                alu_op1 = 2'b11;
            end
            6'b100011: begin // Load word
                reg_dst1 = 1'b0;
                branch1 = 1'b0;
                mem_read1 = 1'b1;
                mem_to_reg1 = 1'b1;
                mem_write1 = 1'b0;
                alu_src1 = 1'b1;
                reg_write1 = 1'b1;
                alu_op1 = 2'b00;
            end
            6'b101011: begin // Store word
                reg_dst1 = 1'b0;
                branch1 = 1'b0;
                mem_read1 = 1'b0;
                mem_to_reg1 = 1'b0;
                mem_write1 = 1'b1;
                alu_src1 = 1'b1;
                reg_write1 = 1'b0;
                alu_op1 = 2'b00;
            end
            6'b000100: begin // Branch
                reg_dst1 = 1'b0;
                branch1 = 1'b1;
                mem_read1 = 1'b0;
                mem_to_reg1 = 1'b0;
                mem_write1 = 1'b0;
                alu_src1 = 1'b0;
                reg_write1 = 1'b0;
                alu_op1 = 2'b01;
            end
            default: begin
                reg_dst1 = 1'b0;
                branch1 = 1'b0;
                mem_read1 = 1'b0;
                mem_to_reg1 = 1'b0;
                mem_write1 = 1'b0;
                alu_src1 = 1'b0;
                reg_write1 = 1'b0;
                alu_op1 = 2'b00;
            end
        endcase
    end

    always @(*) begin
        reg_dst = reg_dst1;
        branch = branch1;
        mem_read = mem_read1;
        mem_to_reg = mem_to_reg1;
        mem_write = mem_write1;
        alu_src = alu_src1;
        reg_write = reg_write1;
        alu_op = alu_op1;
    end

endmodule