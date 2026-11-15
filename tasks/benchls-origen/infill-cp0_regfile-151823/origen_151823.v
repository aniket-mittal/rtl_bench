module origen_151823 (
    input clk,
    input reset,
    input we,
    input ExcEnter,
    input [31:0] Din,
    input [4:0] CP0Index,
    input [4:0] ExcCode,
    input [7:0] HWInt,
    output [31:0] DOut,
    output [31:0] EPC,
    output [7:0] SR_IM,
    output SR_IE
);

    reg [31:0] SR;
    reg [31:0] Cause;
    reg [31:0] EPC_reg;
    reg [31:0] PRId;

    [MASKED]

    assign DOut = (CP0Index == 5'd12) ? SR :
                  (CP0Index == 5'd13) ? Cause :
                  (CP0Index == 5'd14) ? EPC_reg :
                  (CP0Index == 5'd15) ? PRId : 32'b0;
    assign EPC = EPC_reg;
    assign SR_IM = SR[15:8];
    assign SR_IE = SR[0];

endmodule