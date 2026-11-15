module autovcoder_142549 (
    input clk,
    input reset,
    input [15:0] x0, 
    input [15:0] x1, 
    input [15:0] x2, 
    input [15:0] x3, 
    output reg [15:0] y0, 
    output reg [15:0] y1, 
    output reg [15:0] y2, 
    output reg [15:0] y3, 
    output reg done
);
    reg [15:0] stage0 [3:0]; 
    reg [15:0] stage1 [3:0]; 
    reg [1:0] state;

    [MASKED]
endmodule