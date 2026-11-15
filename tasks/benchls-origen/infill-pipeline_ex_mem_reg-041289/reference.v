module origen_041289 (
    input wire clk,
    input wire rst,
    input wire [1:0] WBE,
    input wire [4:0] MemE,
    input wire [31:0] PCAdderE,
    input wire zeroE,
    input wire [31:0] ALUResultE,
    input wire [31:0] ReadData2E,
    input wire [4:0] RegDstE,
    
    output reg [1:0] WBM,
    output reg MemWrite,
    output reg MemRead,
    output reg Branch,
    output reg [31:0] PCAdderM,
    output reg zeroM,
    output reg [31:0] ALUResultM,
    output reg [31:0] ReadData2M,
    output reg [4:0] RegDstM,
    output reg [1:0] lbSel
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            WBM <= 2'b0;
            MemWrite <= 1'b0;
            MemRead <= 1'b0;
            Branch <= 1'b0;
            PCAdderM <= 32'b0;
            zeroM <= 1'b0;
            ALUResultM <= 32'b0;
            ReadData2M <= 32'b0;
            RegDstM <= 5'b0;
            lbSel <= 2'b0;
        end else begin
            WBM <= WBE;
            MemWrite <= MemE[2];
            MemRead <= MemE[1];
            Branch <= MemE[0];
            PCAdderM <= PCAdderE;
            zeroM <= zeroE;
            ALUResultM <= ALUResultE;
            ReadData2M <= ReadData2E;
            RegDstM <= RegDstE;
            lbSel <= MemE[4:3];
        end
    end

endmodule