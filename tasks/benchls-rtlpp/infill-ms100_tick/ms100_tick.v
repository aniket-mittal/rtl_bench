module ms100_tick (clk, reset, tick);

input clk, reset;
output reg tick;
reg [18:0] count;

localparam compare_val = 19'b1111010000100011111;

[MASKED]
endmodule