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

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            ALUInPipeOut <= 32'b0;
            PCSrcInPipeOut <= 1'b0;
            WriteData2InPipeOut <= 32'b0;
            PCDataInPipeOut <= 32'b0;
            RegWriteOut <= 1'b0;
            MemReadOut <= 1'b0;
            MemWriteOut <= 1'b0;
            MemToRegOut <= 1'b0;
            WriteRegInPipeOut <= 5'b0;
        end
        else begin
            ALUInPipeOut <= ALUInPipeIn;
            PCSrcInPipeOut <= PCSrcInPipeIn;
            WriteData2InPipeOut <= WriteData2InPipeIn;
            PCDataInPipeOut <= PCDataInPipeIn;
            RegWriteOut <= RegWrite;
            MemReadOut <= MemRead;
            MemWriteOut <= MemWrite;
            MemToRegOut <= MemToReg;
            WriteRegInPipeOut <= WriteRegInPipeIn;
        end
    end

endmodule