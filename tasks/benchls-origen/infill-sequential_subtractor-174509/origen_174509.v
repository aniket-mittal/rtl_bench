`define st0 3'b000
`define st1 3'b001
`define st2 3'b010
`define st3 3'b011
`define st4 3'b100
`define st5 3'b101

module origen_174509(
    input [15:0] REGA,
    input clk,
    input rst,
    input en,
    output reg [35:0] REGC,
    output reg done
);

reg [2:0] REGS;
reg [15:0] diff;
reg [4:0] i;
reg [7:0] ai, bi;
reg [35:0] x;
reg E;

[MASKED]

endmodule