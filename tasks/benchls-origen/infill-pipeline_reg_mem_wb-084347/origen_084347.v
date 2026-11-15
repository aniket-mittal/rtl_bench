module origen_084347 (
    input wire clk,
    input wire rst,
    input wire [31:0] ALU_R_in,
    input wire [31:0] ALU_R2_in,
    input wire ALU_equal_in,
    input wire [31:0] instr_in,
    input wire [31:0] ctrl_in,
    input wire [31:0] b_equal_res_in,
    input wire [15:0] PC0_in,
    input wire [31:0] jump_res_in,
    input wire [31:0] RF_R2_in,
    input wire [31:0] RF_R1_in,
    output reg [31:0] ALU_R_out,
    output reg [31:0] ALU_R2_out,
    output reg ALU_equal_out,
    output reg [31:0] instr_out,
    output reg [31:0] ctrl_out,
    output reg [31:0] b_equal_res_out,
    output reg [15:0] PC0_out,
    output reg [31:0] jump_res_out,
    output reg [31:0] RF_R2_out,
    output reg [31:0] RF_R1_out
);

    [MASKED]

endmodule