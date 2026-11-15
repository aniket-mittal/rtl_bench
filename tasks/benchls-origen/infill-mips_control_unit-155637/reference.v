`define OP_R_TYPE   6'b000000
`define OP_LW      6'b100011
`define OP_SW      6'b101011
`define OP_BEQ     6'b000100
`define OP_J       6'b000010

`define FUNC_ADD   6'b100000
`define FUNC_SUB   6'b100010
`define FUNC_AND   6'b100100
`define FUNC_OR    6'b100101
`define FUNC_SLT   6'b101010

`define ALU_ADD    3'b000
`define ALU_SUB    3'b001
`define ALU_AND    3'b010
`define ALU_OR     3'b011
`define ALU_SLT    3'b100

module origen_155637(
    input zero,
    input sign,
    input [5:0] opcode,
    input [5:0] func,
    output reg PCWre,
    output reg [1:0] PCSrc,
    output reg ExtSel,
    output reg ALUSrcA,
    output reg ALUSrcB,
    output reg [2:0] ALUOp,
    output reg RegWre,
    output reg RegDst,
    output reg mRD,
    output reg mWR,
    output reg DBDataSrc,
    output reg InsMemRW
);

always @(*) begin
    case (opcode)
        `OP_R_TYPE: begin
            PCWre = 1'b1;
            PCSrc = 2'b00;
            ExtSel = 1'b0;
            ALUSrcA = 1'b0;
            ALUSrcB = 1'b0;
            ALUOp = `ALU_ADD;
            RegWre = 1'b1;
            RegDst = 1'b1;
            mRD = 1'b0;
            mWR = 1'b0;
            DBDataSrc = 1'b0;
            InsMemRW = 1'b0;

            case (func)
                `FUNC_ADD: ALUOp = `ALU_ADD;
                `FUNC_SUB: ALUOp = `ALU_SUB;
                `FUNC_AND: ALUOp = `ALU_AND;
                `FUNC_OR: ALUOp = `ALU_OR;
                `FUNC_SLT: ALUOp = `ALU_SLT;
            endcase
        end

        `OP_LW: begin
            PCWre = 1'b1;
            PCSrc = 2'b00;
            ExtSel = 1'b1;
            ALUSrcA = 1'b0;
            ALUSrcB = 1'b1;
            ALUOp = `ALU_ADD;
            RegWre = 1'b1;
            RegDst = 1'b0;
            mRD = 1'b1;
            mWR = 1'b0;
            DBDataSrc = 1'b1;
            InsMemRW = 1'b0;
        end

        `OP_SW: begin
            PCWre = 1'b1;
            PCSrc = 2'b00;
            ExtSel = 1'b1;
            ALUSrcA = 1'b0;
            ALUSrcB = 1'b1;
            ALUOp = `ALU_ADD;
            RegWre = 1'b0;
            mRD = 1'b0;
            mWR = 1'b1;
            DBDataSrc = 1'b0;
            InsMemRW = 1'b0;
        end

        `OP_BEQ: begin
            PCWre = 1'b1;
            PCSrc = (zero) ? 2'b01 : 2'b00;
            ExtSel = 1'b1;
            ALUSrcA = 1'b0;
            ALUSrcB = 1'b0;
            ALUOp = `ALU_SUB;
            RegWre = 1'b0;
            mRD = 1'b0;
            mWR = 1'b0;
            DBDataSrc = 1'b0;
            InsMemRW = 1'b0;
        end

        `OP_J: begin
            PCWre = 1'b1;
            PCSrc = 2'b10;
            ExtSel = 1'b0;
            ALUSrcA = 1'b0;
            ALUSrcB = 1'b0;
            ALUOp = `ALU_ADD;
            RegWre = 1'b0;
            mRD = 1'b0;
            mWR = 1'b0;
            DBDataSrc = 1'b0;
            InsMemRW = 1'b0;
        end

        default: begin
            PCWre = 1'b0;
            PCSrc = 2'b00;
            ExtSel = 1'b0;
            ALUSrcA = 1'b0;
            ALUSrcB = 1'b0;
            ALUOp = `ALU_ADD;
            RegWre = 1'b0;
            RegDst = 1'b0;
            mRD = 1'b0;
            mWR = 1'b0;
            DBDataSrc = 1'b0;
            InsMemRW = 1'b0;
        end
    endcase
end

endmodule