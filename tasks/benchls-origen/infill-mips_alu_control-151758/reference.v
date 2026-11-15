module origen_151758(
    input [5:0] opcode,
    input [5:0] funct,
    output reg [2:0] alu_op,
    output reg alu_src,
    output reg alu_shift,
    output reg branch,
    output reg mem_to_reg,
    output reg mem_read,
    output reg mem_write,
    output reg reg_dst,
    output reg reg_write
);

    always @(*) begin
        case (opcode)
            6'h0: begin // R-type
                alu_op = 3'b010; // ADD
                alu_src = 1'b0;
                alu_shift = 1'b0;
                branch = 1'b0;
                mem_to_reg = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                reg_dst = 1'b1;
                reg_write = 1'b1;
                case (funct)
                    6'h20: alu_op = 3'b010; // ADD
                    6'h21: alu_op = 3'b010; // ADDU
                    6'h22: alu_op = 3'b110; // SUB
                    6'h23: alu_op = 3'b110; // SUBU
                    6'h24: alu_op = 3'b000; // AND
                    6'h25: alu_op = 3'b001; // OR
                    6'h26: alu_op = 3'b011; // XOR
                    6'h27: alu_op = 3'b100; // NOR
                    6'h2a: alu_op = 3'b101; // SLT
                    6'h00: alu_op = 3'b111; // SLL
                    6'h02: alu_op = 3'b111; // SRL
                    6'h03: alu_op = 3'b111; // SRA
                endcase
            end
            6'h8: begin // ADDI
                alu_op = 3'b010; // ADD
                alu_src = 1'b1;
                alu_shift = 1'b0;
                branch = 1'b0;
                mem_to_reg = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                reg_dst = 1'b0;
                reg_write = 1'b1;
            end
            6'h4: begin // BEQ
                alu_op = 3'b110; // SUB
                alu_src = 1'b0;
                alu_shift = 1'b0;
                branch = 1'b1;
                mem_to_reg = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                reg_dst = 1'b0;
                reg_write = 1'b0;
            end
            6'h23: begin // LW
                alu_op = 3'b010; // ADD
                alu_src = 1'b1;
                alu_shift = 1'b0;
                branch = 1'b0;
                mem_to_reg = 1'b1;
                mem_read = 1'b1;
                mem_write = 1'b0;
                reg_dst = 1'b0;
                reg_write = 1'b1;
            end
            6'h2b: begin // SW
                alu_op = 3'b010; // ADD
                alu_src = 1'b1;
                alu_shift = 1'b0;
                branch = 1'b0;
                mem_to_reg = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b1;
                reg_dst = 1'b0;
                reg_write = 1'b0;
            end
            default: begin
                alu_op = 3'b0;
                alu_src = 1'b0;
                alu_shift = 1'b0;
                branch = 1'b0;
                mem_to_reg = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                reg_dst = 1'b0;
                reg_write = 1'b0;
            end
        endcase
    end

endmodule