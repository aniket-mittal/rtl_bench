module origen_180490(
    input Reset,
    input [1:0] WB,
    input [1:0] Mem,
    input [6:0] EX,
    input [31:0] PC_id,
    input [31:0] Imm_id,
    input [4:0] rdAddr_id,
    input [4:0] rs1Addr_id,
    input [4:0] rs2Addr_id,
    input [31:0] rs1Data_id,
    input [31:0] rs2Data_id,
    input clk,

    output reg [1:0] WB_out_ID_EX,
    output reg [1:0] Mem_out_ID_EX,
    output reg [6:0] EX_out,
    output reg [31:0] PC_ex,
    output reg [31:0] Imm_ex,
    output reg [4:0] rdAddr_ex,
    output reg [4:0] rs1Addr_ex,
    output reg [4:0] rs2Addr_ex,
    output reg [31:0] rs1Data_ex,
    output reg [31:0] rs2Data_ex
);

    [MASKED]

endmodule