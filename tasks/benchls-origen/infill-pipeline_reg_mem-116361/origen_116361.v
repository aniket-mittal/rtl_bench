module origen_116361 (
    input wire clk,
    input wire rst,
    input wire [31:0] ALUInPipeIn,
    input wire PCSrcInPipeIn,
    input wire [31:0] WriteData2InPipeIn,
    input wire [31:0] PCDataInPipeIn,
    input wire RegWrite,
    input wire MemRead,
    input wire MemWrite,
    input wire MemToReg,
    input wire [4:0] WriteRegInPipeIn,
    input wire ControlHazard,

    output reg [31:0] ALUInPipeOut,
    output reg PCSrcInPipeOut,
    output reg [31:0] WriteData2InPipeOut,
    output reg [31:0] PCDataInPipeOut,
    output reg RegWriteOut,
    output reg MemReadOut,
    output reg MemWriteOut,
    output reg MemToRegOut,
    output reg [4:0] WriteRegInPipeOut
);

    [MASKED]

endmodule