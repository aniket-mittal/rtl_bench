module origen_052269 (
    input [31:0] SrcA,
    input [31:0] SrcB,
    input [3:0] AluCtrl,
    input Alu_en,
    output reg zero,
    output reg positive,
    output reg negative,
    output reg [31:0] AluResult
);

    // Operation macros
    `define Add_alu 4'b0000
    `define Sub_alu 4'b0001
    `define And_alu 4'b0010
    `define Or_alu  4'b0011
    `define Xor_alu 4'b0100
    `define Slt_alu 4'b0101
    `define Lu_alu  4'b0110
    `define Sll_alu 4'b0111
    `define Srl_alu 4'b1000
    `define Sra_alu 4'b1001
    `define Nor_alu 4'b1010

    always @(*) begin
        if (Alu_en) begin
            case (AluCtrl)
                `Add_alu: AluResult = SrcA + SrcB;
                `Sub_alu: AluResult = SrcA - SrcB;
                `And_alu: AluResult = SrcA & SrcB;
                `Or_alu:  AluResult = SrcA | SrcB;
                `Xor_alu: AluResult = SrcA ^ SrcB;
                `Slt_alu: AluResult = (SrcA < SrcB) ? 32'd1 : 32'd0;
                `Lu_alu:  AluResult = {SrcB[15:0], 16'b0};
                `Sll_alu: AluResult = SrcA << SrcB[4:0];
                `Srl_alu: AluResult = SrcA >> SrcB[4:0];
                `Sra_alu: AluResult = $signed(SrcA) >>> SrcB[4:0];
                `Nor_alu: AluResult = ~(SrcA | SrcB);
                default:  AluResult = 32'b0;
            endcase
        end else begin
            AluResult = 32'b0;
        end

        // Set flags
        zero = (AluResult == 32'b0);
        positive = (AluResult[31] == 1'b0) && !zero;
        negative = (AluResult[31] == 1'b1);
    end

endmodule