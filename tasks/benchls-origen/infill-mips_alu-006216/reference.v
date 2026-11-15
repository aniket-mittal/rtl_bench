module origen_006216 (
    input [31:0] src1_i,
    input [31:0] src2_i,
    input [3:0] ctrl_i,
    input [4:0] shamt,
    output reg [31:0] result_o,
    output reg zero_o
);

    // Operation codes
    localparam ADDU  = 4'b0000;
    localparam SUBU  = 4'b0001;
    localparam AND   = 4'b0010;
    localparam OR    = 4'b0011;
    localparam SLT   = 4'b0100;
    localparam SRA   = 4'b0101;
    localparam SRAV  = 4'b0110;
    localparam ADDI  = 4'b0111;
    localparam SLTIU = 4'b1000;
    localparam BEQ   = 4'b1001;
    localparam LUI   = 4'b1010;
    localparam ORI   = 4'b1011;
    localparam BNE   = 4'b1100;

    always @(*) begin
        zero_o = 1'b0;
        case (ctrl_i)
            ADDU, ADDI: result_o = src1_i + src2_i;
            SUBU: result_o = src1_i - src2_i;
            AND: result_o = src1_i & src2_i;
            OR: result_o = src1_i | src2_i;
            SLT: result_o = $signed(src1_i) < $signed(src2_i) ? 32'd1 : 32'd0;
            SRA: result_o = $signed(src2_i) >>> shamt;
            SRAV: result_o = $signed(src2_i) >>> src1_i[4:0];
            SLTIU: result_o = src1_i < src2_i ? 32'd1 : 32'd0;
            BEQ: begin
                result_o = src1_i - src2_i;
                zero_o = (result_o == 32'd0);
            end
            LUI: result_o = {src2_i[15:0], 16'b0};
            ORI: result_o = src1_i | {16'b0, src2_i[15:0]};
            BNE: begin
                result_o = src1_i - src2_i;
                zero_o = (result_o != 32'd0);
            end
            default: result_o = 32'b0;
        endcase
    end

endmodule