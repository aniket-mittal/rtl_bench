module origen_026835 (
    input [31:0] ins,
    output reg store_imm,
    output reg ALU_src,
    output reg mem2reg,
    output reg reg_write,
    output reg mem_read,
    output reg mem_write,
    output reg [1:0] ALU_op0,
    output reg [1:0] ALU_op1
);

    wire [5:0] opcode;
    assign opcode = ins[5:0];

    always @(*) begin
        case(opcode)
            6'b000011: begin // Load instruction
                store_imm = 1'b0;
                ALU_src = 1'b1;
                mem2reg = 1'b1;
                reg_write = 1'b1;
                mem_read = 1'b1;
                mem_write = 1'b0;
                ALU_op0 = 2'b00;
                ALU_op1 = 2'b00;
            end
            6'b100011: begin // Store instruction
                store_imm = 1'b1;
                ALU_src = 1'b1;
                mem2reg = 1'bx;
                reg_write = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b1;
                ALU_op0 = 2'b00;
                ALU_op1 = 2'b00;
            end
            6'b010011: begin // Immediate arithmetic instruction
                store_imm = 1'b0;
                ALU_src = 1'b1;
                mem2reg = 1'b0;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                ALU_op0 = 2'b10;
                ALU_op1 = 2'b00;
            end
            6'b110011: begin // Register-type arithmetic instruction
                store_imm = 1'b0;
                ALU_src = 1'b0;
                mem2reg = 1'b0;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                ALU_op0 = 2'b10;
                ALU_op1 = 2'b00;
            end
            default: begin
                store_imm = 1'bx;
                ALU_src = 1'bx;
                mem2reg = 1'bx;
                reg_write = 1'bx;
                mem_read = 1'bx;
                mem_write = 1'bx;
                ALU_op0 = 2'bxx;
                ALU_op1 = 2'bxx;
            end
        endcase
    end

endmodule

