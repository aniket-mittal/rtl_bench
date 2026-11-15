module origen_061110 (
    input wire clk,
    input wire reset,
    input wire intterupt,
    input wire MemReadEX,
    input wire BranchID,
    input wire JRID,
    input wire MemReadMEM,
    input wire RegWriteEX,
    input wire [4:0] regwriteaddrEX,
    input wire [4:0] rtaddrEX,
    input wire [4:0] rsaddrID,
    input wire [4:0] rtaddrID,
    input wire [4:0] regwriteaddrMEM,
    input wire [2:0] PCSrcID,
    input wire [1:0] MemtoRegMEM,
    output reg stall,
    output reg flush
);

    [MASKED]

endmodule