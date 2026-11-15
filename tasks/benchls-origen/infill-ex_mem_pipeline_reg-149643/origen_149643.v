module origen_149643(
    input clk,
    input reset,
    
    // Input signals from EX_MEM stage
    input MemEn_EX_MEM,
    input MemWrite_EX_MEM,
    input MemToReg_EX_MEM,
    input [31:0] RegWaddr_EX_MEM,
    input [31:0] ALUResult_EX_MEM,
    input [31:0] MemWdata_EX_MEM,
    input [31:0] PC_EX_MEM,
    input MFHL_EX_MEM,
    
    // Output signals to MEM_WB stage
    output reg MemEn_MEM,
    output reg MemWrite_MEM,
    output reg [31:0] data_sram_addr,
    output reg [31:0] MemWdata_MEM,
    output reg [31:0] RegWaddr_MEM_WB,
    output reg [31:0] ALUResult_MEM_WB,
    output reg [31:0] PC_MEM_WB,
    output reg MFHL_MEM_WB
);

    [MASKED]

endmodule