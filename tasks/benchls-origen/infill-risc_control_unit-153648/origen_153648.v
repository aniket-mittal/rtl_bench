module origen_153648(
    input clk,
    input rst,
    input carryout,
    input [7:0] result,
    input [7:0] read1,
    input [7:0] read2,
    input [7:0] instruction,
    input [7:0] data,
    output reg [1:0] ctrl0,
    output reg ctrl1,
    output reg clear,
    output reg reg1,
    output reg reg2,
    output reg write,
    output reg [3:0] opcode,
    output reg [7:0] address,
    output reg [7:0] input1,
    output reg [7:0] input2,
    output reg [7:0] datareg,
    output reg [7:0] out,
    output reg jump,
    output reg [7:0] jumpaddress
);

    reg [1:0] cycle;

    [MASKED]

endmodule