module origen_158416(
    input  [5:0] instr_op_i,
    output reg [2:0] ALUOp_o,
    output reg RegDst_o,
    output reg MemtoReg_o,
    output reg ALUSrc_o,
    output reg RegWrite_o,
    output reg Branch_o,
    output reg MemRead_o,
    output reg MemWrite_o
);

    always @(*) begin
        case (instr_op_i)
            6'b000000: begin // R-type
                ALUOp_o    = 3'b100;
                RegDst_o   = 1'b1;
                MemtoReg_o = 1'b0;
                ALUSrc_o   = 1'b0;
                RegWrite_o = 1'b1;
                Branch_o   = 1'b0;
                MemRead_o  = 1'b0;
                MemWrite_o = 1'b0;
            end
            6'b001000: begin // addi
                ALUOp_o    = 3'b000;
                RegDst_o   = 1'b0;
                MemtoReg_o = 1'b0;
                ALUSrc_o   = 1'b1;
                RegWrite_o = 1'b1;
                Branch_o   = 1'b0;
                MemRead_o  = 1'b0;
                MemWrite_o = 1'b0;
            end
            6'b001010: begin // slti
                ALUOp_o    = 3'b010;
                RegDst_o   = 1'b0;
                MemtoReg_o = 1'b0;
                ALUSrc_o   = 1'b1;
                RegWrite_o = 1'b1;
                Branch_o   = 1'b0;
                MemRead_o  = 1'b0;
                MemWrite_o = 1'b0;
            end
            6'b100011: begin // lw
                ALUOp_o    = 3'b000;
                RegDst_o   = 1'b0;
                MemtoReg_o = 1'b1;
                ALUSrc_o   = 1'b1;
                RegWrite_o = 1'b1;
                Branch_o   = 1'b0;
                MemRead_o  = 1'b1;
                MemWrite_o = 1'b0;
            end
            6'b101011: begin // sw
                ALUOp_o    = 3'b000;
                RegDst_o   = 1'b0;
                MemtoReg_o = 1'b0;
                ALUSrc_o   = 1'b1;
                RegWrite_o = 1'b0;
                Branch_o   = 1'b0;
                MemRead_o  = 1'b0;
                MemWrite_o = 1'b1;
            end
            6'b000100: begin // beq
                ALUOp_o    = 3'b001;
                RegDst_o   = 1'b0;
                MemtoReg_o = 1'b0;
                ALUSrc_o   = 1'b0;
                RegWrite_o = 1'b0;
                Branch_o   = 1'b1;
                MemRead_o  = 1'b0;
                MemWrite_o = 1'b0;
            end
            default: begin
                ALUOp_o    = 3'b000;
                RegDst_o   = 1'b0;
                MemtoReg_o = 1'b0;
                ALUSrc_o   = 1'b0;
                RegWrite_o = 1'b0;
                Branch_o   = 1'b0;
                MemRead_o  = 1'b0;
                MemWrite_o = 1'b0;
            end
        endcase
    end

endmodule