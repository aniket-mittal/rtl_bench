module origen_184218(
    input clk,
    input rst_n,
    input [7:0] datain,
    input readyb0,
    output reg [15:0] combbyte,
    output reg [6:0] addrb0,
    output reg finishb0
);

reg [1:0] statecounter;
reg [7:0] lowbyte, highbyte;
reg [15:0] combbyte_r;

[MASKED]

endmodule