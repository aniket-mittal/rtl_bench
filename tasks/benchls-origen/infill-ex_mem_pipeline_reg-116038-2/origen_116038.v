module origen_116038 (
    input wire clk,
    input wire reset,
    input wire Branch,
    input wire MemRead,
    input wire MemWrite,
    input wire RegWrite,
    input wire MemtoReg,
    input wire [63:0] mux_ForwardB,
    input wire [63:0] mux_ALU,
    input wire ALUzero,
    input wire [63:0] adder2out,
    input wire [4:0] rd,
    
    output reg EX_MEM_Branch,
    output reg EX_MEM_MemRead,
    output reg EX_MEM_MemWrite,
    output reg EX_MEM_RegWrite,
    output reg EX_MEM_MemtoReg,
    output reg [63:0] EX_MEM_mux_ForwardB,
    output reg [63:0] EX_MEM_mux_ALU,
    output reg EX_MEM_ALUzero,
    output reg [63:0] EX_MEM_adder2out,
    output reg [4:0] EX_MEM_rd
);

[MASKED]

endmodule