module origen_218462(
    input wire [5:0] instr_op_i,
    output reg RegWrite_o,
    output reg [1:0] ALU_op_o,
    output reg ALUSrc_o,
    output reg RegDst_o,
    output reg Branch_o,
    output reg MemRead_o,
    output reg MemWrite_o,
    output reg MemtoReg_o
);

    parameter RFormat = 6'b000000;
    parameter addi = 6'b001000;
    parameter slti = 6'b001010;
    parameter beq = 6'b000100;
    parameter lw = 6'b100011;
    parameter sw = 6'b101011;

    always @(*) begin
        case (instr_op_i)
            RFormat: begin
                RegWrite_o = 1'b1;
                ALU_op_o = 2'b10;
                ALUSrc_o = 1'b0;
                RegDst_o = 1'b1;
                Branch_o = 1'b0;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'b0;
            end
            addi: begin
                RegWrite_o = 1'b1;
                ALU_op_o = 2'b00;
                ALUSrc_o = 1'b1;
                RegDst_o = 1'b0;
                Branch_o = 1'b0;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'b0;
            end
            slti: begin
                RegWrite_o = 1'b1;
                ALU_op_o = 2'b01;
                ALUSrc_o = 1'b1;
                RegDst_o = 1'b0;
                Branch_o = 1'b0;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'b0;
            end
            beq: begin
                RegWrite_o = 1'b0;
                ALU_op_o = 2'b01;
                ALUSrc_o = 1'b0;
                RegDst_o = 1'b0;
                Branch_o = 1'b1;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'b0;
            end
            lw: begin
                RegWrite_o = 1'b1;
                ALU_op_o = 2'b00;
                ALUSrc_o = 1'b1;
                RegDst_o = 1'b0;
                Branch_o = 1'b0;
                MemRead_o = 1'b1;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'b1;
            end
            sw: begin
                RegWrite_o = 1'b0;
                ALU_op_o = 2'b00;
                ALUSrc_o = 1'b1;
                RegDst_o = 1'b0;
                Branch_o = 1'b0;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b1;
                MemtoReg_o = 1'b0;
            end
            default: begin
                RegWrite_o = 1'b0;
                ALU_op_o = 2'b00;
                ALUSrc_o = 1'b0;
                RegDst_o = 1'b0;
                Branch_o = 1'b0;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
                MemtoReg_o = 1'b0;
            end
        endcase
    end

endmodule