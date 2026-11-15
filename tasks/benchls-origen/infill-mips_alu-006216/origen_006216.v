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

    [MASKED]

endmodule