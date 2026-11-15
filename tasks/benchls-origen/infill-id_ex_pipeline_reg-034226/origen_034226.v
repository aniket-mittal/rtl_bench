module origen_034226 (
    input wire clk,
    input wire rst,
    input wire [1:0] WB,
    input wire [1:0] M,
    input wire [4:0] EX,
    input wire [31:0] readData1,
    input wire [31:0] readData2,
    input wire [31:0] S_EXTEND_out_b,
    input wire [4:0] rs,
    input wire [4:0] rt,
    input wire [4:0] rd,
    
    output reg [1:0] EX_WB,
    output reg [1:0] EX_M,
    output reg [4:0] EX_EX,
    output reg [31:0] EX_SRC_A,
    output reg [31:0] EX_SRC_B,
    output reg [31:0] EX_SE,
    output reg [4:0] EX_rs,
    output reg [4:0] EX_rt,
    output reg [4:0] EX_rd
);

    [MASKED]

endmodule