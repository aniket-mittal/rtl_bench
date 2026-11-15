module origen_038531 (
    input wire clk,
    input wire reset,
    input wire [8:0] bitsCtr,
    input wire [31:0] newpc,
    input wire [31:0] read1,
    input wire [31:0] read2,
    input wire [31:0] extensor,
    input wire [4:0] instr_2,
    input wire [4:0] instr_1,
    input wire [4:0] rs,
    input wire [4:0] rt,
    output reg [8:0] saidaBitsCtr,
    output reg [31:0] saidaNewPC,
    output reg [31:0] saidaRead1,
    output reg [31:0] saidaRead2,
    output reg [31:0] saidaExtensor,
    output reg [4:0] saidaInst_2,
    output reg [4:0] saidaInst_1,
    output reg [4:0] rsout,
    output reg [4:0] rtout
);

    [MASKED]

endmodule