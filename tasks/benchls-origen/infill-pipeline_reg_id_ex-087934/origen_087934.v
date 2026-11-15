module origen_087934 (
    input wire clk,
    input wire reset,
    input wire [31:0] IR_D,
    input wire [31:0] MFCMPD1,
    input wire [31:0] MFCMPD2,
    input wire [31:0] Ext_num,
    input wire [4:0] A3,
    input wire [1:0] Res,
    input wire Stall,
    input wire [31:0] PC8_D,
    input wire j_zero,
    output reg [31:0] IR_E,
    output reg [31:0] RS_E,
    output reg [31:0] RT_E,
    output reg [31:0] Ext_num_E,
    output reg [4:0] A3_E,
    output reg [1:0] Res_E,
    output reg [31:0] PC8_E,
    output reg j_zero_E
);

    [MASKED]

endmodule