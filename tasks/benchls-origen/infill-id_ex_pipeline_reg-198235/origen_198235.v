module origen_198235 (
    input clk,
    input rst,
    input En,
    input Clr,
    input [31:0] RefAddr_i,
    input [31:0] rData1_i,
    input [31:0] rData2_i,
    input [31:0] Offset_i,
    input [4:0] RsAddr_i,
    input [4:0] RtAddr_i,
    input [4:0] RdAddr_i,
    output reg [31:0] RefAddr,
    output reg [31:0] rData1,
    output reg [31:0] rData2,
    output reg [31:0] Offset,
    output reg [4:0] RsAddr,
    output reg [4:0] RtAddr,
    output reg [4:0] RdAddr
);

    [MASKED]

endmodule