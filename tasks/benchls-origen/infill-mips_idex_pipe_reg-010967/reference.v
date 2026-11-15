module origen_010967 (
    input wire clk,
    input wire rst,
    input wire en,
    input wire [31:0] IRin,
    input wire [31:0] PCin,
    input wire JRin,
    input wire JMPin,
    input wire LBUin,
    input wire BEQin,
    input wire BNEin,
    input wire BGEZin,
    input wire MemToRegin,
    input wire MemWritein,
    input wire RegWritein,
    input wire [3:0] AluOpin,
    input wire [4:0] R1_numin,
    input wire [4:0] R2_numin,
    input wire [31:0] R1in,
    input wire [31:0] R2in,
    input wire [4:0] W_numin,
    input wire [15:0] imm16in,
    input wire [25:0] imm26in,
    input wire [4:0] shamtin,
    output reg [31:0] IRout,
    output reg [31:0] PCout,
    output reg JRout,
    output reg JMPout,
    output reg LBUout,
    output reg BEQout,
    output reg BNEout,
    output reg BGEZout,
    output reg MemToRegout,
    output reg MemWriteout,
    output reg RegWriteout,
    output reg [3:0] AluOpout,
    output reg [4:0] R1_numout,
    output reg [4:0] R2_numout,
    output reg [31:0] R1out,
    output reg [31:0] R2out,
    output reg [4:0] W_numout,
    output reg [15:0] imm16out,
    output reg [25:0] imm26out,
    output reg [4:0] shamtout
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            IRout <= 32'b0;
            PCout <= 32'b0;
            JRout <= 1'b0;
            JMPout <= 1'b0;
            LBUout <= 1'b0;
            BEQout <= 1'b0;
            BNEout <= 1'b0;
            BGEZout <= 1'b0;
            MemToRegout <= 1'b0;
            MemWriteout <= 1'b0;
            RegWriteout <= 1'b0;
            AluOpout <= 4'b0;
            R1_numout <= 5'b0;
            R2_numout <= 5'b0;
            R1out <= 32'b0;
            R2out <= 32'b0;
            W_numout <= 5'b0;
            imm16out <= 16'b0;
            imm26out <= 26'b0;
            shamtout <= 5'b0;
        end
        else if (!en) begin
            IRout <= IRin;
            PCout <= PCin;
            JRout <= JRin;
            JMPout <= JMPin;
            LBUout <= LBUin;
            BEQout <= BEQin;
            BNEout <= BNEin;
            BGEZout <= BGEZin;
            MemToRegout <= MemToRegin;
            MemWriteout <= MemWritein;
            RegWriteout <= RegWritein;
            AluOpout <= AluOpin;
            R1_numout <= R1_numin;
            R2_numout <= R2_numin;
            R1out <= R1in;
            R2out <= R2in;
            W_numout <= W_numin;
            imm16out <= imm16in;
            imm26out <= imm26in;
            shamtout <= shamtin;
        end
    end

endmodule