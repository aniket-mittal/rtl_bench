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
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            A_int <= 32'b0;
            B_int <= 32'b0;
            C_int <= 32'b0;
            ext_int <= 32'b0;
            WA3_int <= 4'b0;
            ALUControl_int <= 4'b0;
            flags_int <= 4'b0;
            Cond_int <= 4'b0;
            RegWrite_int <= 1'b0;
            PlusOne_int <= 1'b0;
            Branch_int <= 1'b0;
            PCSource_int <= 1'b0;
            ALUSrc_int <= 1'b0;
            MemtoReg_int <= 1'b0;
            FlagW_int <= 2'b0;
        end else begin
            A_int <= A;
            B_int <= B;
            C_int <= C;
            ext_int <= ext;
            WA3_int <= WA3;
            ALUControl_int <= ALUControl;
            flags_int <= flags;
            Cond_int <= Cond;
            RegWrite_int <= RegWrite;
            PlusOne_int <= PlusOne;
            Branch_int <= Branch;
            PCSource_int <= PCSource;
            ALUSrc_int <= ALUSrc;
            MemtoReg_int <= MemtoReg;
            FlagW_int <= FlagW;
        end
    end

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