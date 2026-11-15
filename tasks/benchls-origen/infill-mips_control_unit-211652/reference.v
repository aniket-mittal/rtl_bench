module origen_211652(
    input  wire [5:0] instr_op_i,
    input  wire [5:0] instr_jr_i,
    output reg        RegWrite_o,
    output reg  [2:0] ALU_op_o,
    output reg        ALUSrc_o,
    output reg        RegDst_o,
    output reg        Branch_o,
    output reg        Jump_o,
    output reg        MemRead_o,
    output reg        MemWrite_o,
    output reg        MemtoReg_o,
    output reg        jr_o,
    output reg        jal_o
);

    always @(*) begin
        case (instr_op_i)
            6'b000000: begin // R-type
                RegWrite_o = 1'b1;
                ALU_op_o = 3'b010;
                ALUSrc_o = 1'b0;
                RegDst_o = 1'b1;
                Branch_o = 1'b0;
                Jump_o = 1'b0;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'b0;
                jr_o = instr_jr_i[0];
                jal_o = 1'b0;
            end
            6'b100011: begin // lw
                RegWrite_o = 1'b1;
                ALU_op_o = 3'b000;
                ALUSrc_o = 1'b1;
                RegDst_o = 1'b0;
                Branch_o = 1'b0;
                Jump_o = 1'b0;
                MemRead_o = 1'b1;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'b1;
                jr_o = 1'b0;
                jal_o = 1'b0;
            end
            6'b101011: begin // sw
                RegWrite_o = 1'b0;
                ALU_op_o = 3'b000;
                ALUSrc_o = 1'b1;
                RegDst_o = 1'b0;
                Branch_o = 1'b0;
                Jump_o = 1'b0;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b1;
                MemtoReg_o = 1'b0;
                jr_o = 1'b0;
                jal_o = 1'b0;
            end
            6'b000100: begin // beq
                RegWrite_o = 1'b0;
                ALU_op_o = 3'b001;
                ALUSrc_o = 1'b0;
                RegDst_o = 1'b0;
                Branch_o = 1'b1;
                Jump_o = 1'b0;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'b0;
                jr_o = 1'b0;
                jal_o = 1'b0;
            end
            6'b001000: begin // addi
                RegWrite_o = 1'b1;
                ALU_op_o = 3'b000;
                ALUSrc_o = 1'b1;
                RegDst_o = 1'b0;
                Branch_o = 1'b0;
                Jump_o = 1'b0;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'b0;
                jr_o = 1'b0;
                jal_o = 1'b0;
            end
            6'b001010: begin // slti
                RegWrite_o = 1'b1;
                ALU_op_o = 3'b100;
                ALUSrc_o = 1'b1;
                RegDst_o = 1'b0;
                Branch_o = 1'b0;
                Jump_o = 1'b0;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'b0;
                jr_o = 1'b0;
                jal_o = 1'b0;
            end
            6'b000010: begin // jump
                RegWrite_o = 1'b0;
                ALU_op_o = 3'b000;
                ALUSrc_o = 1'b0;
                RegDst_o = 1'b0;
                Branch_o = 1'b0;
                Jump_o = 1'b1;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'b0;
                jr_o = 1'b0;
                jal_o = 1'b0;
            end
            6'b000011: begin // jal
                RegWrite_o = 1'b1;
                ALU_op_o = 3'b000;
                ALUSrc_o = 1'b0;
                RegDst_o = 1'b0;
                Branch_o = 1'b0;
                Jump_o = 1'b1;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'b1;
                jr_o = 1'b0;
                jal_o = 1'b1;
            end
            default: begin
                RegWrite_o = 1'b0;
                ALU_op_o = 3'b000;
                ALUSrc_o = 1'b0;
                RegDst_o = 1'b0;
                Branch_o = 1'b0;
                Jump_o = 1'b0;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'b0;
                jr_o = 1'b0;
                jal_o = 1'b0;
            end
        endcase
    end
endmodule