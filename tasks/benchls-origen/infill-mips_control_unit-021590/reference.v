module origen_021590(
    input [5:0] instr_op_i,
    output reg RegWrite_o,
    output reg [2:0] ALU_op_o,
    output reg ALUSrc_o,
    output reg RegDst_o,
    output reg Branch_o
);

    always @(*) begin
        // Default values
        RegWrite_o = 1'b0;
        ALU_op_o = 3'b000;
        ALUSrc_o = 1'b0;
        RegDst_o = 1'b0;
        Branch_o = 1'b0;

        case(instr_op_i)
            6'b000000: begin // R-type instructions
                RegWrite_o = 1'b1;
                ALU_op_o = 3'b010;
                RegDst_o = 1'b1;
            end
            6'b001000: begin // I-type ADD immediate
                RegWrite_o = 1'b1;
                ALU_op_o = 3'b100;
                ALUSrc_o = 1'b1;
            end
            6'b001010: begin // Set Less Than Immediate
                RegWrite_o = 1'b1;
                ALU_op_o = 3'b101;
                ALUSrc_o = 1'b1;
            end
            6'b000100: begin // Branch on Equal
                ALU_op_o = 3'b001;
                Branch_o = 1'b1;
            end
            default: begin
                // Default case (NOP)
                RegWrite_o = 1'b0;
                ALU_op_o = 3'b000;
                ALUSrc_o = 1'b0;
                RegDst_o = 1'b0;
                Branch_o = 1'b0;
            end
        endcase

        // Debug display
        ;
        ;
    end

endmodule