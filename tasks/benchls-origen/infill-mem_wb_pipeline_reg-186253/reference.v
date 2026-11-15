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

    always @(negedge clk) begin
        if (reset) begin
            LoadW <= 0;
            BranchW <= 0;
            PCSrcW <= 0;
            CmpW <= 0;
            StoreW <= 0;
            RegWriteW <= 0;
            MemtoRegW <= 0;
            ReadDataW <= 0;
            ALUOutW <= 0;
            WriteAddrW <= 0;
        end else begin
            LoadW <= LoadM;
            BranchW <= BranchM;
            PCSrcW <= PCSrcM;
            CmpW <= CmpM;
            StoreW <= StoreM;
            RegWriteW <= RegWriteM;
            MemtoRegW <= MemtoRegM;
            ReadDataW <= readdata;
            ALUOutW <= ALUResultM;
            WriteAddrW <= WriteAddrM;
        end
    end

endmodule