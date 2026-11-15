module origen_040542 (
    input wire clk,
    input wire RegWriteM,
    input wire MemtoRegM,
    input wire JalM,
    input wire sysM,
    input wire [31:0] ReadDataM,
    input wire [31:0] ALUOutM,
    input wire [4:0] WriteRegM,
    input wire [31:0] PCPlus4M,
    input wire [31:0] regvM,
    input wire [31:0] regaM,

    output reg RegWriteW,
    output reg MemtoRegW,
    output reg JalW,
    output reg sysW,
    output reg [31:0] ReadDataW,
    output reg [31:0] ALUOutW,
    output reg [4:0] WriteRegW,
    output reg [31:0] PCPlus4W,
    output reg [31:0] regvW,
    output reg [31:0] regaW
);

    initial begin
        RegWriteW = 0;
        MemtoRegW = 0;
        JalW = 0;
        sysW = 0;
        ReadDataW = 0;
        ALUOutW = 0;
        WriteRegW = 0;
        PCPlus4W = 0;
        regvW = 0;
        regaW = 0;
    end

    always @(posedge clk) begin
        RegWriteW <= RegWriteM;
        MemtoRegW <= MemtoRegM;
        JalW <= JalM;
        sysW <= sysM;
        ReadDataW <= ReadDataM;
        ALUOutW <= ALUOutM;
        WriteRegW <= WriteRegM;
        PCPlus4W <= PCPlus4M;
        regvW <= regvM;
        regaW <= regaM;
    end

endmodule