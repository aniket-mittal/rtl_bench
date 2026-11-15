module origen_209255 (
    input  wire        clk_i,
    input  wire        rst_i,
    input  wire        halt_i,
    input  wire [1:0]  WB_i,
    input  wire [1:0]  M_i,
    input  wire [3:0]  EX_i,
    input  wire [31:0] data1_i,
    input  wire [31:0] data2_i,
    input  wire [31:0] signextend_i,
    input  wire [4:0]  rs_i,
    input  wire [4:0]  rt_i,
    input  wire [4:0]  rd_i,
    output reg  [1:0]  WB_o,
    output reg  [1:0]  M_o,
    output reg  [3:0]  EX_o,
    output reg  [31:0] data1_o,
    output reg  [31:0] data2_o,
    output reg  [31:0] signextend_o,
    output reg  [4:0]  rs_o,
    output reg  [4:0]  rt_o,
    output reg  [4:0]  rd_o
);

    [MASKED]

endmodule