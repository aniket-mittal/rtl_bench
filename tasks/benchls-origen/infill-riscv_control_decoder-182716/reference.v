module origen_182716(
    input rst_n,
    input [5:0] instr_op_i,
    input [5:0] funct_i,
    output reg RegWrite_o,
    output reg [3:0] ALU_op_o,
    output reg ALUSrc_o,
    output reg RegDst_o,
    output reg Branch_o,
    output reg Jump_o,
    output reg MemRead_o,
    output reg MemWrite_o,
    output reg MemtoReg_o
);

always @(*) begin
    if (~rst_n) begin
        RegWrite_o = 1'b0;
        ALU_op_o = 4'b0000;
        ALUSrc_o = 1'b0;
        RegDst_o = 1'b0;
        Branch_o = 1'b0;
        Jump_o = 1'b0;
        MemRead_o = 1'b0;
        MemWrite_o = 1'b0;
        MemtoReg_o = 1'b0;
    end
    else begin
        case (instr_op_i)
            6'b000000: begin  // R-type instructions
                RegWrite_o = 1'b1;
                ALU_op_o = 4'b0010;
                ALUSrc_o = 1'b0;
                RegDst_o = 1'b1;
                Branch_o = 1'b0;
                Jump_o = 1'b0;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'b1;
            end
            6'b100011: begin  // Load word (lw)
                RegWrite_o = 1'b1;
                ALU_op_o = 4'b0000;
                ALUSrc_o = 1'b1;
                RegDst_o = 1'b0;
                Branch_o = 1'b0;
                Jump_o = 1'b0;
                MemRead_o = 1'b1;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'b0;
            end
            6'b101011: begin  // Store word (sw)
                RegWrite_o = 1'b0;
                ALU_op_o = 4'b0000;
                ALUSrc_o = 1'b1;
                RegDst_o = 1'b0;
                Branch_o = 1'b0;
                Jump_o = 1'b0;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b1;
                MemtoReg_o = 1'bx;
            end
            6'b000100: begin  // Branch on equal (beq)
                RegWrite_o = 1'b0;
                ALU_op_o = 4'b0110;
                ALUSrc_o = 1'b0;
                RegDst_o = 1'b0;
                Branch_o = 1'b1;
                Jump_o = 1'b0;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'bx;
            end
            6'b000101: begin  // Branch on not equal (bne)
                RegWrite_o = 1'b0;
                ALU_op_o = 4'b0110;
                ALUSrc_o = 1'b0;
                RegDst_o = 1'b0;
                Branch_o = 1'b1;
                Jump_o = 1'b0;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'bx;
            end
            6'b000010: begin  // Jump (j)
                RegWrite_o = 1'b0;
                ALU_op_o = 4'bxxxx;
                ALUSrc_o = 1'bx;
                RegDst_o = 1'bx;
                Branch_o = 1'b0;
                Jump_o = 1'b1;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'bx;
            end
            default: begin
                RegWrite_o = 1'b0;
                ALU_op_o = 4'b0000;
                ALUSrc_o = 1'b0;
                RegDst_o = 1'b0;
                Branch_o = 1'b0;
                Jump_o = 1'b0;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'b0;
            end
        endcase
    end
end

endmodule