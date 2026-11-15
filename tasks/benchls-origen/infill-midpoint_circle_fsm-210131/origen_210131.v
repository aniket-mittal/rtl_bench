module origen_210131 (
    input clk,
    input rst,
    input en,
    input [7:0] central,
    input [3:0] radius,
    output reg busy,
    output reg valid,
    output reg [7:0] candidate
);

reg [7:0] tmpX, tmpY, sX, sY;
reg [7:0] k, h;
reg [7:0] sum, nextSum;
reg [7:0] rSquare, dis;
reg [7:0] i, j, nexti, nextj, nextk;
reg [7:0] nexth;
reg done, nextDone;
reg enable;
reg [7:0] tmpR;

[MASKED]

endmodule