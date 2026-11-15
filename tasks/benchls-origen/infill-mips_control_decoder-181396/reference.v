module origen_181396(
    input [5:0] op,
    input [5:0] func,
    output reg RegWrite_id,
    output reg MemWrite_id,
    output reg ALUSrc_id,
    output reg Branch_id,
    output reg j_id,
    output reg jal_id,
    output reg jr_id,
    output reg [1:0] EXTop_id,
    output reg [1:0] MemtoReg_id,
    output reg [1:0] ALUop_id,
    output reg [1:0] RegDst_id
);

    parameter i_R = 6'b000000;
    parameter i_lw = 6'b100011;
    parameter i_sw = 6'b101011;
    parameter i_addu = 6'b100001;
    parameter i_subu = 6'b100011;
    parameter i_OR = 6'b100101;
    parameter i_ori = 6'b001101;
    parameter i_addiu = 6'b001001;
    parameter i_andi = 6'b001100;
    parameter i_lui = 6'b001111;
    parameter i_jr = 6'b001000;
    parameter i_j = 6'b000010;
    parameter i_jal = 6'b000011;
    parameter i_beq = 6'b000100;

    always @(*) begin
        RegWrite_id = 0;
        MemWrite_id = 0;
        ALUSrc_id = 0;
        Branch_id = 0;
        j_id = 0;
        jal_id = 0;
        jr_id = 0;
        EXTop_id = 2'b00;
        MemtoReg_id = 2'b00;
        ALUop_id = 2'b00;
        RegDst_id = 2'b00;

        case (op)
            i_R: begin
                RegWrite_id = 1;
                EXTop_id = 2'b10;
                ALUop_id = 2'b10;
                RegDst_id = 2'b01;
                case (func)
                    i_addu: begin
                        EXTop_id = 2'b00;
                        ALUop_id = 2'b00;
                    end
                    i_subu: begin
                        EXTop_id = 2'b00;
                        ALUop_id = 2'b01;
                    end
                    i_OR: begin
                        EXTop_id = 2'b00;
                        ALUop_id = 2'b11;
                    end
                    i_jr: begin
                        RegWrite_id = 0;
                        jr_id = 1;
                    end
                endcase
            end
            i_lw: begin
                RegWrite_id = 1;
                ALUSrc_id = 1;
                MemtoReg_id = 2'b01;
            end
            i_sw: begin
                ALUSrc_id = 1;
                MemWrite_id = 1;
            end
            i_ori: begin
                RegWrite_id = 1;
                ALUSrc_id = 1;
                EXTop_id = 2'b00;
                ALUop_id = 2'b11;
            end
            i_addiu: begin
                RegWrite_id = 1;
                ALUSrc_id = 1;
                EXTop_id = 2'b00;
                ALUop_id = 2'b00;
            end
            i_andi: begin
                RegWrite_id = 1;
                ALUSrc_id = 1;
                EXTop_id = 2'b00;
                ALUop_id = 2'b11;
            end
            i_lui: begin
                RegWrite_id = 1;
                ALUSrc_id = 1;
                EXTop_id = 2'b01;
            end
            i_j: begin
                j_id = 1;
            end
            i_jal: begin
                RegWrite_id = 1;
                j_id = 1;
                jal_id = 1;
                RegDst_id = 2'b10;
            end
            i_beq: begin
                Branch_id = 1;
                EXTop_id = 2'b00;
                ALUop_id = 2'b01;
            end
        endcase
    end

endmodule