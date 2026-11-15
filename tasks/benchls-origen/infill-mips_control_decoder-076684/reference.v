module origen_076684 (
    input [5:0] opcode,
    output reg [1:0] alu_op,
    output reg reg_dst,
    output reg branch,
    output reg mem_read,
    output reg mem_2_reg,
    output reg mem_write,
    output reg alu_src,
    output reg reg_write,
    output reg jump
);

    // Instruction type parameters
    parameter ALU_R      = 6'b000000;
    parameter ADDI       = 6'b001000;
    parameter BRANCH_EQ  = 6'b000100;
    parameter JUMP       = 6'b000010;
    parameter LOAD_WORD  = 6'b100011;
    parameter STORE_WORD = 6'b101011;

    // ALU operation codes
    parameter ADD_OPCODE    = 2'b00;
    parameter SUB_OPCODE    = 2'b01;
    parameter R_TYPE_OPCODE = 2'b10;

    always @(*) begin
        case (opcode)
            ALU_R: begin
                reg_dst   = 1'b1;
                alu_src   = 1'b0;
                mem_2_reg = 1'b0;
                reg_write = 1'b1;
                mem_read  = 1'b0;
                mem_write = 1'b0;
                branch    = 1'b0;
                alu_op    = R_TYPE_OPCODE;
                jump      = 1'b0;
            end
            ADDI: begin
                reg_dst   = 1'b0;
                alu_src   = 1'b1;
                mem_2_reg = 1'b0;
                reg_write = 1'b1;
                mem_read  = 1'b0;
                mem_write = 1'b0;
                branch    = 1'b0;
                alu_op    = ADD_OPCODE;
                jump      = 1'b0;
            end
            BRANCH_EQ: begin
                reg_dst   = 1'b0;
                alu_src   = 1'b0;
                mem_2_reg = 1'b0;
                reg_write = 1'b0;
                mem_read  = 1'b0;
                mem_write = 1'b0;
                branch    = 1'b1;
                alu_op    = SUB_OPCODE;
                jump      = 1'b0;
            end
            JUMP: begin
                reg_dst   = 1'b0;
                alu_src   = 1'b0;
                mem_2_reg = 1'b0;
                reg_write = 1'b0;
                mem_read  = 1'b0;
                mem_write = 1'b0;
                branch    = 1'b0;
                alu_op    = 2'b00;
                jump      = 1'b1;
            end
            LOAD_WORD: begin
                reg_dst   = 1'b0;
                alu_src   = 1'b1;
                mem_2_reg = 1'b1;
                reg_write = 1'b1;
                mem_read  = 1'b1;
                mem_write = 1'b0;
                branch    = 1'b0;
                alu_op    = ADD_OPCODE;
                jump      = 1'b0;
            end
            STORE_WORD: begin
                reg_dst   = 1'b0;
                alu_src   = 1'b1;
                mem_2_reg = 1'b0;
                reg_write = 1'b0;
                mem_read  = 1'b0;
                mem_write = 1'b1;
                branch    = 1'b0;
                alu_op    = ADD_OPCODE;
                jump      = 1'b0;
            end
            default: begin
                reg_dst   = 1'b0;
                alu_src   = 1'b0;
                mem_2_reg = 1'b0;
                reg_write = 1'b0;
                mem_read  = 1'b0;
                mem_write = 1'b0;
                branch    = 1'b0;
                alu_op    = 2'b00;
                jump      = 1'b0;
            end
        endcase
    end

endmodule