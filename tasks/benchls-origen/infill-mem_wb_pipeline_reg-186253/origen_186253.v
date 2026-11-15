module origen_186253(
    input clk,
    input reset,
    input RegWriteM,
    input MemtoRegM,
    input [31:0] readdata,
    input [31:0] ALUResultM,
    input [3:0] WriteAddrM,
    input StoreM,
    input CmpM,
    input PCSrcM,
    input BranchM,
    input LoadM,
    output reg LoadW,
    output reg BranchW,
    output reg PCSrcW,
    output reg CmpW,
    output reg StoreW,
    output reg RegWriteW,
    output reg MemtoRegW,
    output reg [31:0] ReadDataW,
    output reg [31:0] ALUOutW,
    output reg [3:0] WriteAddrW
);

    [MASKED]

endmodule