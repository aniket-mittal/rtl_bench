module origen_041289 (
    input wire clk,
    input wire rst,
    input wire [1:0] WBE,
    input wire [4:0] MemE,
    input wire [31:0] PCAdderE,
    input wire zeroE,
    input wire [31:0] ALUResultE,
    input wire [31:0] ReadData2E,
    input wire [4:0] RegDstE,
    
    output reg [1:0] WBM,
    output reg MemWrite,
    output reg MemRead,
    output reg Branch,
    output reg [31:0] PCAdderM,
    output reg zeroM,
    output reg [31:0] ALUResultM,
    output reg [31:0] ReadData2M,
    output reg [4:0] RegDstM,
    output reg [1:0] lbSel
);

    [MASKED]

endmodule