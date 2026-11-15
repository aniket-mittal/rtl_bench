module origen_098963 (
    // Path A inputs
    input wire RegWriteA, MemtoRegA, MemWriteA,
    input wire [31:0] ALUOutA, WriteDataA,
    input wire [4:0] WriteRegA,
    
    // Path B inputs
    input wire RegWriteB, MemtoRegB, MemWriteB,
    input wire [31:0] ALUOutB, WriteDataB,
    input wire [4:0] WriteRegB,
    
    // Memory interface
    output wire Wen, Ren,
    output wire [31:0] Addr, WriteData,
    input wire [31:0] ReadData,
    
    // Path A outputs
    output wire RegWriteAOut, MemtoRegAOut, MemWriteAOut,
    output wire [31:0] ALUOutAOut, WriteDataAOut, ReadDataMOutA,
    output wire [4:0] WriteRegAOut,
    
    // Path B outputs
    output wire RegWriteBOut, MemtoRegBOut, MemWriteBOut,
    output wire [31:0] ALUOutBOut, WriteDataBOut, ReadDataMOutB,
    output wire [4:0] WriteRegBOut
);

    // Data path forwarding
    assign RegWriteAOut = RegWriteA;
    assign MemtoRegAOut = MemtoRegA;
    assign MemWriteAOut = MemWriteA;
    assign ALUOutAOut = ALUOutA;
    assign WriteDataAOut = WriteDataA;
    assign WriteRegAOut = WriteRegA;

    assign RegWriteBOut = RegWriteB;
    assign MemtoRegBOut = MemtoRegB;
    assign MemWriteBOut = MemWriteB;
    assign ALUOutBOut = ALUOutB;
    assign WriteDataBOut = WriteDataB;
    assign WriteRegBOut = WriteRegB;

    // Memory access arbitration
    wire MemA = MemWriteA | MemtoRegA;
    wire MemB = MemWriteB | MemtoRegB;

    // Memory control signals
    assign Wen = MemWriteA | MemWriteB;
    assign Ren = MemtoRegA | MemtoRegB;

    // Memory address and data selection
    assign Addr = MemA ? ALUOutA : ALUOutB;
    assign WriteData = MemA ? WriteDataA : WriteDataB;

    // Read data distribution
    assign ReadDataMOutA = ReadData;
    assign ReadDataMOutB = ReadData;

endmodule