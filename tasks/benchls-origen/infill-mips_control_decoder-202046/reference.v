module origen_202046(
    input [5:0] instr_op_i,
    output reg RegWrite_o,
    output reg [2:0] ALUOp_o,
    output reg ALUSrc_o,
    output reg RegDst_o,
    output reg Branch_o,
    output reg BranchType_o,
    output reg Jump_o,
    output reg MemRead_o,
    output reg MemWrite_o,
    output reg MemtoReg_o
);

    always @(*) begin
        case (instr_op_i)
            6'b000000: begin // R-type instructions
                RegWrite_o = 1'b1;
                ALUOp_o = 3'b010;
                ALUSrc_o = 1'b0;
                RegDst_o = 1'b1;
                Branch_o = 1'b0;
                BranchType_o = 1'b0;
                Jump_o = 1'b0;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'b0;
            end
            6'b100011: begin // Load (LW)
                RegWrite_o = 1'b1;
                ALUOp_o = 3'b000;
                ALUSrc_o = 1'b1;
                RegDst_o = 1'b0;
                Branch_o = 1'b0;
                BranchType_o = 1'b0;
                Jump_o = 1'b0;
                MemRead_o = 1'b1;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'b1;
            end
            6'b101011: begin // Store (SW)
                RegWrite_o = 1'b0;
                ALUOp_o = 3'b000;
                ALUSrc_o = 1'b1;
                RegDst_o = 1'b0;
                Branch_o = 1'b0;
                BranchType_o = 1'b0;
                Jump_o = 1'b0;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b1;
                MemtoReg_o = 1'b0;
            end
            6'b000100: begin // Branch equal (BEQ)
                RegWrite_o = 1'b0;
                ALUOp_o = 3'b001;
                ALUSrc_o = 1'b0;
                RegDst_o = 1'b0;
                Branch_o = 1'b1;
                BranchType_o = 1'b0;
                Jump_o = 1'b0;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'b0;
            end
            6'b000101: begin // Branch not equal (BNE)
                RegWrite_o = 1'b0;
                ALUOp_o = 3'b001;
                ALUSrc_o = 1'b0;
                RegDst_o = 1'b0;
                Branch_o = 1'b1;
                BranchType_o = 1'b1;
                Jump_o = 1'b0;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'b0;
            end
            6'b000010: begin // Jump (J)
                RegWrite_o = 1'b0;
                ALUOp_o = 3'b000;
                ALUSrc_o = 1'b0;
                RegDst_o = 1'b0;
                Branch_o = 1'b0;
                BranchType_o = 1'b0;
                Jump_o = 1'b1;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'b0;
            end
            6'b000011: begin // Jump and link (JAL)
                RegWrite_o = 1'b1;
                ALUOp_o = 3'b000;
                ALUSrc_o = 1'b0;
                RegDst_o = 1'b0;
                Branch_o = 1'b0;
                BranchType_o = 1'b0;
                Jump_o = 1'b1;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'b0;
            end
            default: begin
                RegWrite_o = 1'b0;
                ALUOp_o = 3'b000;
                ALUSrc_o = 1'b0;
                RegDst_o = 1'b0;
                Branch_o = 1'b0;
                BranchType_o = 1'b0;
                Jump_o = 1'b0;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'b0;
            end
        endcase
    end

endmodule