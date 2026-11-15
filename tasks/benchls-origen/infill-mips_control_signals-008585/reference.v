module origen_008585(
    input [5:0] instr_op_i,
    output reg RegWrite_o,
    output reg [2:0] ALU_op_o,
    output reg ALUSrc_o,
    output reg RegDst_o,
    output reg [1:0] Branch_o,
    output reg SignExtend_o,
    output reg MemRead_o,
    output reg MemWrite_o,
    output reg MemtoReg_o
);

    always @(*) begin
        case(instr_op_i)
            6'b000000: begin // R-type instructions
                RegWrite_o = 1'b1;
                ALU_op_o = 3'b010;
                ALUSrc_o = 1'b0;
                RegDst_o = 1'b1;
                Branch_o = 2'b00;
                SignExtend_o = 1'b0;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'b0;
            end
            6'b001000: begin // ADDI
                RegWrite_o = 1'b1;
                ALU_op_o = 3'b000;
                ALUSrc_o = 1'b1;
                RegDst_o = 1'b0;
                Branch_o = 2'b00;
                SignExtend_o = 1'b1;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'b0;
            end
            6'b000100: begin // BEQ
                RegWrite_o = 1'b0;
                ALU_op_o = 3'b001;
                ALUSrc_o = 1'b0;
                RegDst_o = 1'b0;
                Branch_o = 2'b01;
                SignExtend_o = 1'b1;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'b0;
            end
            6'b000101: begin // BNE
                RegWrite_o = 1'b0;
                ALU_op_o = 3'b001;
                ALUSrc_o = 1'b0;
                RegDst_o = 1'b0;
                Branch_o = 2'b10;
                SignExtend_o = 1'b1;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'b0;
            end
            6'b100011: begin // LW
                RegWrite_o = 1'b1;
                ALU_op_o = 3'b000;
                ALUSrc_o = 1'b1;
                RegDst_o = 1'b0;
                Branch_o = 2'b00;
                SignExtend_o = 1'b1;
                MemRead_o = 1'b1;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'b1;
            end
            6'b101011: begin // SW
                RegWrite_o = 1'b0;
                ALU_op_o = 3'b000;
                ALUSrc_o = 1'b1;
                RegDst_o = 1'b0;
                Branch_o = 2'b00;
                SignExtend_o = 1'b1;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b1;
                MemtoReg_o = 1'b0;
            end
            default: begin // Default case (NOP)
                RegWrite_o = 1'b0;
                ALU_op_o = 3'b000;
                ALUSrc_o = 1'b0;
                RegDst_o = 1'b0;
                Branch_o = 2'b00;
                SignExtend_o = 1'b0;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'b0;
            end
        endcase
    end

endmodule