module cntr_modulus (clk,ena,rst,sload,sdata,sclear,q);

parameter WIDTH = 16;
parameter MOD_VAL = 50223;

input clk,ena,rst,sload,sclear;
input [WIDTH-1:0] sdata;

output [WIDTH-1:0] q;
reg [WIDTH-1:0] q;

wire maxed = (q == MOD_VAL-1) /* synthesis keep */;

[MASKED]

endmodule