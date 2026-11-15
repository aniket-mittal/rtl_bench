module origen_185381(
    input [5:0] opcode,
    input [5:0] funct,
    output reg [1:0] RegDst,
    output reg AluSrc,
    output reg MemWrite,
    output reg RegWrite,
    output reg [1:0] wd_sel,
    output reg [2:0] NpcSel,
    output reg [1:0] ExtOp,
    output reg [3:0] AluCtrl,
    output reg lb
);

    parameter R_TYPE = 6'b000000;
    parameter ADDU = 6'b100001;
    parameter SUBU = 6'b100011;
    parameter SLT = 6'b101010;
    parameter JR = 6'b001000;
    parameter ORI = 6'b001101;
    parameter LUI = 6'b001111;
    parameter ADDI = 6'b001000;
    parameter ADDIU = 6'b001001;
    parameter BEQ = 6'b000100;
    parameter SW = 6'b101011;
    parameter LB = 6'b100000;
    parameter JAL = 6'b000011;
    parameter J = 6'b000010;

    always @(*) begin
        case (opcode)
            R_TYPE: begin
                RegDst = 2'b01;
                AluSrc = 1'b0;
                MemWrite = 1'b0;
                RegWrite = 1'b1;
                wd_sel = 2'b00;
                NpcSel = 3'b000;
                ExtOp = 2'b00;
                case (funct)
                    ADDU: AluCtrl = 4'b0000;
                    SUBU: AluCtrl = 4'b0001;
                    SLT: AluCtrl = 4'b0010;
                    JR: begin
                        AluCtrl = 4'b0000;
                        NpcSel = 3'b100;
                    end
                    default: AluCtrl = 4'b0000;
                endcase
                lb = 1'b0;
            end
            ORI: begin
                RegDst = 2'b00;
                AluSrc = 1'b1;
                MemWrite = 1'b0;
                RegWrite = 1'b1;
                wd_sel = 2'b00;
                NpcSel = 3'b000;
                ExtOp = 2'b01;
                AluCtrl = 4'b0100;
                lb = 1'b0;
            end
            LUI: begin
                RegDst = 2'b00;
                AluSrc = 1'b1;
                MemWrite = 1'b0;
                RegWrite = 1'b1;
                wd_sel = 2'b00;
                NpcSel = 3'b000;
                ExtOp = 2'b10;
                AluCtrl = 4'b0101;
                lb = 1'b0;
            end
            ADDI: begin
                RegDst = 2'b00;
                AluSrc = 1'b1;
                MemWrite = 1'b0;
                RegWrite = 1'b1;
                wd_sel = 2'b00;
                NpcSel = 3'b000;
                ExtOp = 2'b00;
                AluCtrl = 4'b0000;
                lb = 1'b0;
            end
            ADDIU: begin
                RegDst = 2'b00;
                AluSrc = 1'b1;
                MemWrite = 1'b0;
                RegWrite = 1'b1;
                wd_sel = 2'b00;
                NpcSel = 3'b000;
                ExtOp = 2'b00;
                AluCtrl = 4'b0000;
                lb = 1'b0;
            end
            BEQ: begin
                RegDst = 2'b00;
                AluSrc = 1'b0;
                MemWrite = 1'b0;
                RegWrite = 1'b0;
                wd_sel = 2'b00;
                NpcSel = 3'b001;
                ExtOp = 2'b00;
                AluCtrl = 4'b0001;
                lb = 1'b0;
            end
            SW: begin
                RegDst = 2'b00;
                AluSrc = 1'b1;
                MemWrite = 1'b1;
                RegWrite = 1'b0;
                wd_sel = 2'b00;
                NpcSel = 3'b000;
                ExtOp = 2'b00;
                AluCtrl = 4'b0000;
                lb = 1'b0;
            end
            LB: begin
                RegDst = 2'b00;
                AluSrc = 1'b1;
                MemWrite = 1'b0;
                RegWrite = 1'b1;
                wd_sel = 2'b01;
                NpcSel = 3'b000;
                ExtOp = 2'b00;
                AluCtrl = 4'b0000;
                lb = 1'b1;
            end
            JAL: begin
                RegDst = 2'b10;
                AluSrc = 1'b0;
                MemWrite = 1'b0;
                RegWrite = 1'b1;
                wd_sel = 2'b10;
                NpcSel = 3'b010;
                ExtOp = 2'b00;
                AluCtrl = 4'b0000;
                lb = 1'b0;
            end
            J: begin
                RegDst = 2'b00;
                AluSrc = 1'b0;
                MemWrite = 1'b0;
                RegWrite = 1'b0;
                wd_sel = 2'b00;
                NpcSel = 3'b011;
                ExtOp = 2'b00;
                AluCtrl = 4'b0000;
                lb = 1'b0;
            end
            default: begin
                RegDst = 2'b00;
                AluSrc = 1'b0;
                MemWrite = 1'b0;
                RegWrite = 1'b0;
                wd_sel = 2'b00;
                NpcSel = 3'b000;
                ExtOp = 2'b00;
                AluCtrl = 4'b0000;
                lb = 1'b0;
            end
        endcase
    end

endmodule