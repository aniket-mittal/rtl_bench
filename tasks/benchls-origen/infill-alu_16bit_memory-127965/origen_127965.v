module origen_127965 (
    input wire clk,
    input wire clk_ram,
    input wire rst,
    output reg [15:0] ALU_F,
    output reg FR_ZF,
    output reg FR_OF,
    input wire [15:0] A,
    input wire [15:0] B,
    output reg [15:0] Mem_R_Data,
    input wire [3:0] MW,
    input wire [7:0] PC
);

    reg [15:0] memory [0:255];

    always @(posedge clk_ram) begin
        Mem_R_Data <= memory[PC];
    end

    [MASKED]

endmodule