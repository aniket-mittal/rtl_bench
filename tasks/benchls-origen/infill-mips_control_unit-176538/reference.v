module origen_176538(
    input zero,
    input [5:0] OP,
    input [5:0] func,
    input sign,
    output reg PCWre,
    output reg ALUSrcA,
    output reg ALUSrcB,
    output reg DBDataSrc,
    output reg RegWre,
    output reg InsMemRW,
    output reg mRD,
    output reg mWR,
    output reg RegDst,
    output reg ExtSel,
    output reg [2:0] ALUOp,
    output reg [1:0] PCSrc
);

    parameter R_TYPE = 6'b000000;
    parameter ADDIU = 6'b001001;
    parameter ANDI = 6'b001100;
    parameter ORI = 6'b001101;
    parameter SLTI = 6'b001010;
    parameter SW = 6'b101011;
    parameter LW = 6'b100011;
    parameter BEQ = 6'b000100;
    parameter BNE = 6'b000101;
    parameter BLTZ = 6'b000001;
    parameter J = 6'b000010;
    parameter HALT = 6'b111111;

    always @(*) begin
        PCWre = 1'b1;
        ALUSrcA = 1'b0;
        ALUSrcB = 1'b0;
        DBDataSrc = 1'b0;
        RegWre = 1'b1;
        InsMemRW = 1'b0;
        mRD = 1'b0;
        mWR = 1'b0;
        RegDst = 1'b1;
        ExtSel = 1'b0;
        ALUOp = 3'b000;
        PCSrc = 2'b00;

        case (OP)
            R_TYPE: begin
                ALUSrcA = 1'b1;
                ALUOp = func[2:0];
                case (func)
                    6'b000000: // sll
                        ALUSrcB = 1'b1;
                    6'b100000: // add
                        ALUOp = 3'b010;
                    6'b100010: // sub
                        ALUOp = 3'b110;
                    6'b100100: // and
                        ALUOp = 3'b000;
                    6'b100101: // or
                        ALUOp = 3'b001;
                    6'b101010: // slt
                        ALUOp = 3'b111;
                endcase
            end
            ADDIU: begin
                ALUSrcB = 1'b1;
                ExtSel = 1'b1;
                ALUOp = 3'b010;
            end
            ANDI: begin
                ALUSrcB = 1'b1;
                ExtSel = 1'b0;
                ALUOp = 3'b000;
            end
            ORI: begin
                ALUSrcB = 1'b1;
                ExtSel = 1'b0;
                ALUOp = 3'b001;
            end
            SLTI: begin
                ALUSrcB = 1'b1;
                ExtSel = 1'b1;
                ALUOp = 3'b111;
            end
            SW: begin
                ALUSrcB = 1'b1;
                ExtSel = 1'b1;
                mWR = 1'b1;
                RegWre = 1'b0;
            end
            LW: begin
                ALUSrcB = 1'b1;
                ExtSel = 1'b1;
                mRD = 1'b1;
                DBDataSrc = 1'b1;
            end
            BEQ: begin
                if (zero) PCSrc = 2'b01;
            end
            BNE: begin
                if (!zero) PCSrc = 2'b01;
            end
            BLTZ: begin
                if (sign) PCSrc = 2'b01;
            end
            J: begin
                PCSrc = 2'b10;
            end
            HALT: begin
                PCWre = 1'b0;
                RegWre = 1'b0;
                PCSrc = 2'b11;
            end
        endcase
    end

endmodule