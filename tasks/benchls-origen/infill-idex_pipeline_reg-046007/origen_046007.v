module origen_046007 (
    input wire clk, rst, Flush, Freeze,
    input wire [4:0] Dest_in,
    input wire [31:0] Val1_in, Val2_in, Reg2_in, PC_in,
    input wire [3:0] EXE_CMD_in,
    input wire MEM_R_EN_in, MEM_W_EN_in, WB_EN_in,
    input wire [1:0] Branch_Type_in,
    input wire is_imm_in,
    input wire [4:0] src1_in, src2_in,

    output reg [4:0] Dest,
    output reg [31:0] Val1, Val2, Reg2, PC,
    output reg [3:0] EXE_CMD,
    output reg MEM_R_EN, MEM_W_EN, WB_EN,
    output reg [1:0] Branch_Type,
    output reg is_imm,
    output reg [4:0] src1, src2
);

    [MASKED]

endmodule