module origen_209229 (
    input EX_MEM_Branch,
    input EX_MEM_RegWrite,
    input EX_MEM_MemToReg,
    input EX_MEM_MemRead,
    input EX_MEM_MemWrite,
    input EX_MEM_Zero,
    input clk,
    input reset,
    input [4:0] EX_MEM_Rd,
    input [63:0] EX_MEM_Lower_Forwarding_MUX_out,
    input [63:0] EX_MEM_ALU_result,
    input [63:0] EX_MEM_Adder,

    output reg EX_MEM_output_Branch,
    output reg EX_MEM_output_RegWrite,
    output reg EX_MEM_output_MemToReg,
    output reg EX_MEM_output_MemRead,
    output reg EX_MEM_output_MemWrite,
    output reg EX_MEM_output_zero,
    output reg [63:0] EX_MEM_Adder_output,
    output reg [63:0] EX_MEM_Lower_Forwarding_MUX_output,
    output reg [63:0] EX_MEM_ALU_result_output,
    output reg [4:0] EX_MEM_output_rd
);

    [MASKED]

endmodule