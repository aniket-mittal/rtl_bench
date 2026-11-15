module origen_198371 #(
    parameter N = 8,
    parameter M = 8
)(
    input clk,
    input reset,
    input mul,
    input [N-1:0] x,
    input [M-1:0] y,
    output reg [N+M-1:0] z_pos,
    output reg done
);

reg [7:0] counter;
reg shift;
reg si;
reg load;

[MASKED]

endmodule