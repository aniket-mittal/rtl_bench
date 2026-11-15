module origen_060581 (
    input wire clk,
    input wire rst,
    input wire EX_MWrite,
    input wire EX_MemtoReg,
    input wire EX_RegWrite,
    input wire EX_MemWrite,
    input wire EX_Jal,
    input wire EX_Half,
    input wire [31:0] EX_ALU_result,
    input wire [31:0] EX_Rt_data,
    input wire [17:0] EX_PCplus8,
    input wire [4:0] EX_WR_out,
    
    output reg M_MemtoReg,
    output reg M_RegWrite,
    output reg M_MemWrite,
    output reg M_Jal,
    output reg M_Half,
    output reg [31:0] M_ALU_result,
    output reg [31:0] M_Rt_data,
    output reg [17:0] M_PCplus8,
    output reg [4:0] M_WR_out
);

    [MASKED]

endmodule