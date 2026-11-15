module autovcoder_005580 #(
    parameter WbSize = 2,
    MemSize = 9,
    flagSize = 4
) (
    input rst,
    input clk,
    enable,
    input [MemSize-1:0] i_Mem,
    input [WbSize-1 : 0] i_WB,
    input [31:0] i_pc,
    input [2:0] i_Rdst,
    input [15:0] i_alu,
    i_read_data1,
    input [flagSize-1:0] i_flag,

    output reg [WbSize-1 : 0] o_WB,
    output reg [MemSize-1:0] o_Mem,
    output reg [31:0] o_pc,
    output reg [2:0] o_Rdst,
    output reg [15:0] o_alu,
    o_read_data1,
    output reg [flagSize-1:0] o_flag
);
  [MASKED]
endmodule

