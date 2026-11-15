module origen_194502(
    input [5:0] opcode,
    input [5:0] func,
    input zf,
    output reg [1:0] sel_dest,
    output reg [1:0] sel_data,
    output reg [1:0] sel_pc,
    output reg sel_opA,
    output reg sel_opB,
    output reg wr_en,
    output reg data_wr,
    output reg [5:0] alu_op
);

    parameter R_TYPE = 6'b000000;
    parameter ADDI = 6'b001000;
    parameter SLTI = 6'b001010;
    parameter LW = 6'b100011;
    parameter SW = 6'b101011;
    parameter BEQ = 6'b000100;
    parameter BNE = 6'b000101;
    parameter JUMP = 6'b000010;
    parameter JAL = 6'b000011;
    parameter JR = 6'b001000;

    parameter ADD = 6'b100000;
    parameter SUB = 6'b100010;
    parameter SLT = 6'b101010;
    parameter SLL = 6'b000000;
    parameter SRL = 6'b000010;

    always @(*) begin
        case (opcode)
            R_TYPE: begin
                sel_dest = 2'b01;
                sel_data = 2'b00;
                sel_pc = 2'b00;
                sel_opA = 1'b0;
                sel_opB = 1'b0;
                wr_en = 1'b1;
                data_wr = 1'b0;
                case (func)
                    ADD: alu_op = 6'b100000;
                    SUB: alu_op = 6'b100010;
                    SLT: alu_op = 6'b101010;
                    SLL: alu_op = 6'b000000;
                    SRL: alu_op = 6'b000010;
                    JR: begin
                        sel_pc = 2'b11;
                        wr_en = 1'b0;
                    end
                    default: alu_op = 6'b000000;
                endcase
            end
            ADDI: begin
                sel_dest = 2'b01;
                sel_data = 2'b00;
                sel_pc = 2'b00;
                sel_opA = 1'b0;
                sel_opB = 1'b1;
                wr_en = 1'b1;
                data_wr = 1'b0;
                alu_op = 6'b100000;
            end
            SLTI: begin
                sel_dest = 2'b01;
                sel_data = 2'b00;
                sel_pc = 2'b00;
                sel_opA = 1'b0;
                sel_opB = 1'b1;
                wr_en = 1'b1;
                data_wr = 1'b0;
                alu_op = 6'b101010;
            end
            LW: begin
                sel_dest = 2'b01;
                sel_data = 2'b01;
                sel_pc = 2'b00;
                sel_opA = 1'b0;
                sel_opB = 1'b1;
                wr_en = 1'b1;
                data_wr = 1'b0;
                alu_op = 6'b100000;
            end
            SW: begin
                sel_dest = 2'b00;
                sel_data = 2'b00;
                sel_pc = 2'b00;
                sel_opA = 1'b0;
                sel_opB = 1'b1;
                wr_en = 1'b0;
                data_wr = 1'b1;
                alu_op = 6'b100000;
            end
            BEQ: begin
                sel_dest = 2'b00;
                sel_data = 2'b00;
                sel_pc = (zf) ? 2'b01 : 2'b00;
                sel_opA = 1'b0;
                sel_opB = 1'b0;
                wr_en = 1'b0;
                data_wr = 1'b0;
                alu_op = 6'b100010;
            end
            BNE: begin
                sel_dest = 2'b00;
                sel_data = 2'b00;
                sel_pc = (zf) ? 2'b00 : 2'b01;
                sel_opA = 1'b0;
                sel_opB = 1'b0;
                wr_en = 1'b0;
                data_wr = 1'b0;
                alu_op = 6'b100010;
            end
            JUMP: begin
                sel_dest = 2'b00;
                sel_data = 2'b00;
                sel_pc = 2'b10;
                sel_opA = 1'b0;
                sel_opB = 1'b0;
                wr_en = 1'b0;
                data_wr = 1'b0;
                alu_op = 6'b000000;
            end
            JAL: begin
                sel_dest = 2'b10;
                sel_data = 2'b11;
                sel_pc = 2'b10;
                sel_opA = 1'b0;
                sel_opB = 1'b0;
                wr_en = 1'b1;
                data_wr = 1'b0;
                alu_op = 6'b000000;
            end
            default: begin
                sel_dest = 2'b00;
                sel_data = 2'b00;
                sel_pc = 2'b00;
                sel_opA = 1'b0;
                sel_opB = 1'b0;
                wr_en = 1'b0;
                data_wr = 1'b0;
                alu_op = 6'b000000;
            end
        endcase
    end

endmodule