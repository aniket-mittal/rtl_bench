module origen_157579 (
    input clk,
    input rst,
    input wr,
    input [31:0] m,
    input [31:0] x,
    input [31:0] b,
    output reg [31:0] y,
    output reg valid
);

reg [31:0] i_m_0;
reg [31:0] i_x_0;
reg [31:0] i_dy;
reg [31:0] cnt;

localparam S_IDLE = 1'b0;
localparam S_CALC = 1'b1;
reg state;

[MASKED]

endmodule