module origen_116070 (
    input wire clk, rst,
    input wire [31:0] A, B, C, ext,
    input wire [3:0] WA3,
    input wire [3:0] ALUControl,
    input wire [3:0] flags,
    input wire [3:0] Cond,
    input wire RegWrite, PlusOne, Branch, PCSource, ALUSrc, MemtoReg,
    input wire [1:0] FlagW,
    
    output reg [31:0] AE, BE, CE, extE,
    output reg [3:0] WA3E,
    output reg [3:0] ALUControlE,
    output reg [3:0] flagsE,
    output reg [3:0] CondE,
    output reg RegWriteE, PlusOneE, BranchE, PCSourceE, ALUSrcE, MemtoRegE,
    output reg [1:0] FlagWE
);

    // Intermediate registers
    reg [31:0] A_int, B_int, C_int, ext_int;
    reg [3:0] WA3_int, ALUControl_int, flags_int, Cond_int;
    reg RegWrite_int, PlusOne_int, Branch_int, PCSource_int, ALUSrc_int, MemtoReg_int;
    reg [1:0] FlagW_int;

    // Positive edge triggered
    [MASKED]

    // Negative edge triggered
    always @(negedge clk or posedge rst) begin
        if (rst) begin
            AE <= 32'b0;
            BE <= 32'b0;
            CE <= 32'b0;
            extE <= 32'b0;
            WA3E <= 4'b0;
            ALUControlE <= 4'b0;
            flagsE <= 4'b0;
            CondE <= 4'b0;
            RegWriteE <= 1'b0;
            PlusOneE <= 1'b0;
            BranchE <= 1'b0;
            PCSourceE <= 1'b0;
            ALUSrcE <= 1'b0;
            MemtoRegE <= 1'b0;
            FlagWE <= 2'b0;
        end else begin
            AE <= A_int;
            BE <= B_int;
            CE <= C_int;
            extE <= ext_int;
            WA3E <= WA3_int;
            ALUControlE <= ALUControl_int;
            flagsE <= flags_int;
            CondE <= Cond_int;
            RegWriteE <= RegWrite_int;
            PlusOneE <= PlusOne_int;
            BranchE <= Branch_int;
            PCSourceE <= PCSource_int;
            ALUSrcE <= ALUSrc_int;
            MemtoRegE <= MemtoReg_int;
            FlagWE <= FlagW_int;
        end
    end

endmodule